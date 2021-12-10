import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';
import 'package:readyplates/models/food_item_model.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/src/home/home_sevices.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';

class HomeController extends GetxController {
  final SharedPreferenceHelper sfHelper = Get.find();
  final HomeServices homeService = HomeServices();
  RxString selectedCategory = "".obs;
  RxDouble lat = 0.0.obs;
  RxDouble lon = 0.0.obs;

  double getDistanceFromLatLonInKm(double lat2, double lon2) {
    var R = 6371;
    var dLat = deg2rad(lat2 - lat.value);
    var dLon = deg2rad(lon2 - lon.value);
    var a = sin(dLat / 2) * sin(dLat / 2) +
        cos(deg2rad(lat.value)) *
            cos(deg2rad(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));
    var d = R * c;
    return d;
  }

  double deg2rad(deg) {
    return deg * (pi / 180);
  }

  Timer? timer;

  RxString address = "".obs;
  RxList<RestaurantModel> restaurants = <RestaurantModel>[
    RestaurantModel(
        id: -1,
        resName: "",
        address2: "",
        overall_experience: "",
        address: "",
        bio: [],
        completed_till: 0,
        end_time: "",
        fssai_expiry: "",
        fssai_image: "",
        fssai_status: "",
        gstin_num: "",
        gstin_image: "",
        gstin_present: "",
        kyc_image: "",
        latitude: "",
        longitude: "",
        open_days: [],
        own_mobile: "",
        own_name: "",
        poc: "",
        poc_number: "",
        postal_code: "",
        res_city: "",
        start_time: "",
        type_of_estd: "",
        types_of_cusine: [],
        user: 0)
  ].obs;

  RxInt currentIndex = 0.obs;

  List<String> bottomBarIcons = List.generate(5,
      (index) => "assets/images/BottomBar" + (index + 1).toString() + ".png");

  List<String> monthDate = List.generate(31, (index) => "${index + 1}");

  RxList<FoodItemModel> foodItems = <FoodItemModel>[
    FoodItemModel(
        id: -1,
        name: "name",
        description: "description",
        image1: "image1",
        dietType: "diet_type",
        category: "category",
        stdServingSize: "std_serving_size",
        otherServingSize: "other_serving_size",
        otherServingCost: "other_serving_cost",
        spiceLevel: "spice_level",
        cost: "cost",
        restaurant: 0)
  ].obs;

  final FoodItemModel defaultItem = FoodItemModel(
      id: -1,
      name: "name",
      description: "description",
      image1: "image1",
      dietType: "diet_type",
      category: "category",
      stdServingSize: "std_serving_size",
      otherServingSize: "other_serving_size",
      otherServingCost: "other_serving_cost",
      spiceLevel: "spice_level",
      cost: "cost",
      restaurant: 0);

  @override
  void onInit() {
    getAddress();
    Get.put(OrderController());
    getRestaurants();
    restaurants.addListener(GetStream(
      onListen: () {
        if (restaurants.isEmpty) {
          print('Empty');
        } else {
          if (restaurants.first.id == -1) {
            print(
                "--------------------------------------1-------------------------------");
          } else {
            print('Successs');
            print(restaurants);
          }
        }
      },
    ));
    super.onInit();
  }

  void clear() {
    address.value = '';
    lat.value = 0;
    lon.value = 0;
    restaurants.clear();
    foodItems.clear();
  }

  void getAddress() async {
    address.value = await sfHelper.getAddress();
    lat.value = await sfHelper.getLat();
    lon.value = await sfHelper.getLon();
  }

  void search(String q) async {
    await getRestaurants();
    restaurants.value = restaurants
        .where((p0) =>
            p0.resName.toLowerCase().contains(q.toLowerCase()) ||
            p0.address.toLowerCase().contains(q.toLowerCase()) ||
            p0.types_of_cusine.join().toLowerCase().contains(q.toLowerCase()))
        .toList();
  }

  void searchFoor(String q, String id) async {
    await getFoodItems(id);
    foodItems.value = foodItems
        .where((p0) => p0.name.toLowerCase().contains(q.toLowerCase()))
        .toList();
  }

  Future<void> getFoodItems(String id) async {
    try {
      foodItems.value = await homeService.getMenu(id);
    } catch (e) {
      if (foodItems.isNotEmpty && foodItems.first.id == -1) {
        foodItems.clear();
      }
      Get.snackbar("Error", e.toString());
    }
  }

  List<String> label = [
    "Home",
    "Location",
    "Orders",
    "Tell a Friend",
    "Profile"
  ];

  Future<void> getRestaurants() async {
    try {
      getAddress();
      lat.value = await sfHelper.getLat();
      print("Get Lat");
      lon.value = await sfHelper.getLon();
      print("Get Lon");
      List<RestaurantModel> res =
          await homeService.getRestaurantWithSort(lat.value, lon.value);
      print("Got res");
      ;
      if (res.isNotEmpty) {
        print("Res Not Empty");
        restaurants.value = res;
      }
      print("Sorting res");
      restaurants.sort((a, b) => getDistanceFromLatLonInKm(
              double.parse(a.latitude), double.parse(a.longitude))
          .compareTo(getDistanceFromLatLonInKm(
              double.parse(b.latitude), double.parse(b.longitude))));
      print("Res Sorted");
      if (timer == null && currentIndex == 0) {
        timer = Timer.periodic(Duration(seconds: 3), (timer) async {
          await getRestaurants();
          print("Restaurant Fetch");
          this.timer = timer;
        });
      }
      update();
    } catch (e) {
      if (restaurants.isNotEmpty && restaurants.first.id == -1) {
        restaurants.clear();
      }
      timer?.cancel();
      Get.showSnackbar(GetBar(
        title: "Server Error",
        message: "Something went wrong",
        duration: Duration(seconds: 1),
      ));
    }
  }

  void onPageChange(int index) {
    timer?.cancel();
    if (index == 0) {
      timer = Timer.periodic(Duration(seconds: 3), (timer) async {
        await getRestaurants();
        print("Restaurant Fetch");
        this.timer = timer;
      });
    } else if (index == 2) {
      timer = Timer.periodic(Duration(seconds: 3), (timer) async {
        await Get.find<OrderController>().getorder();
        print("Order Get");
        this.timer = timer;
      });
    }
    currentIndex.value = index;
  }
}
