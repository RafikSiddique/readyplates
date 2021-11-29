import 'dart:async';
import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readyplates/models/food_item_model.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/src/home/home_sevices.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';

class HomeController extends GetxController {
  final SharedPreferenceHelper sfHelper = Get.find();
  final HomeServices homeService = HomeServices();

  double lat = 0;
  double lon = 0;

  Rx<LatLng> position = LatLng(0, 0).obs;

  double getDistanceFromLatLonInKm(double lat2, double lon2) {
    var R = 6371; // Radius of the earth in km
    var dLat = deg2rad(lat2 - lat); // deg2rad below
    var dLon = deg2rad(lon2 - lon);
    var a = sin(dLat / 2) * sin(dLat / 2) +
        cos(deg2rad(lat)) * cos(deg2rad(lat2)) * sin(dLon / 2) * sin(dLon / 2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));
    var d = R * c; // Distance in km
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
        open_days: "",
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
    super.onInit();
  }

  void clear() {
    address.value = '';
    lat = 0;
    lon = 0;
    restaurants.clear();
    foodItems.clear();
  }

  void getAddress() async {
    address.value = await sfHelper.getAddress();
    lat = await sfHelper.getLat();
    lon = await sfHelper.getLon();
  }

  void search(String q) async {
    await getRestaurants();
    restaurants.value = restaurants
        .where((p0) =>
            p0.resName.toLowerCase().contains(q.toLowerCase()) ||
            p0.address.toLowerCase().contains(q.toLowerCase()) ||
            p0.types_of_cusine.join().contains(q.toLowerCase()))
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
      foodItems.value = foodItems.length != 0
          ? foodItems.first.id == -1
              ? []
              : foodItems
          : [];
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
      lat = await sfHelper.getLat();
      lon = await sfHelper.getLon();
      //if (lat != 0 && lon != 0) {
      restaurants.value = await homeService.getRestaurantWithSort(lat, lon);
      restaurants.sort((a, b) => getDistanceFromLatLonInKm(
              double.parse(a.latitude), double.parse(a.longitude))
          .compareTo(getDistanceFromLatLonInKm(
              double.parse(b.latitude), double.parse(b.longitude))));
      /* } else {
        restaurants.value = await homeService.getResDetail();
      } */
    } catch (e) {
      //restaurants.value = await homeService.getResDetail();
      restaurants.value = restaurants.isEmpty
          ? []
          : restaurants.first.id == -1
              ? []
              : restaurants;

      Get.snackbar("", e.toString());
    }
  }

  void onPageChange(int index) {
    if (index == 0) {
      timer?.cancel();
      timer = Timer.periodic(Duration(seconds: 3), (timer) async {
        await getRestaurants();
        print("Restaurant Fetch");
        this.timer = timer;
      });
    } else if (index == 2) {
      timer?.cancel();

      timer = Timer.periodic(Duration(seconds: 3), (timer) async {
        await Get.find<OrderController>().getorder();
        print("Order Get");
        this.timer = timer;
      });
    } else {
      timer?.cancel();
    }
    currentIndex.value = index;
  }
}
