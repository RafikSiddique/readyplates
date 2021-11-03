import 'package:get/get.dart';
import 'package:readyplates/models/foog_item_model.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/src/home/home_sevices.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';

class HomeController extends GetxController {
  final SharedPreferenceHelper sfHelper = Get.find();
  final HomeServices homeService = HomeServices();

  double lat = 0;
  double lon = 0;
  RxString address = "".obs;
  RxList<RestaurantModel> restaurants = <RestaurantModel>[
    RestaurantModel(id: -1, resName: "", address: null, bio: [])
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
        image2: "image2",
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
      image2: "image2",
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
    getRestaurants();
    Get.put(OrderController());
    super.onInit();
  }

  void getAddress() {
    sfHelper.getAddress().then((value) => address.value = value);
    sfHelper.getLat().then((value) => lat = value);
    sfHelper.getLon().then((value) => lon = value);
  }

  void search(String q) async {
    await getRestaurants();
    restaurants.value = restaurants
        .where((p0) => p0.resName.toLowerCase().contains(q.toLowerCase()))
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
      if (lat != 0 && lon != 0) {
        homeService.getRestaurantWithSort(lat, lon);
      }
      restaurants.value = await homeService.getResDetail();
    } catch (e) {
      restaurants.value = restaurants.isEmpty
          ? []
          : restaurants.first.id == -1
              ? []
              : restaurants;
    }
  }

  void onPageChange(int index) {
    currentIndex.value = index;
  }
}
