import 'dart:math';

import 'package:get/get.dart';
import 'package:readyplates/models/foog_item_model.dart';
import 'package:readyplates/models/restaurant_list.dart';
import 'package:readyplates/src/home/home_sevices.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';

class HomeController extends GetxController {
  final SharedPreferenceHelper sfHelper = Get.find();
  final HomeServices homeService = HomeServices();

  RxList<RestaurantModel> restaurants = <RestaurantModel>[
    RestaurantModel(id: -1, resName: "", address: null, bio: [])
  ].obs;

  RxInt currentIndex = 0.obs;
  final List<FoodItemModel> foodItems = List.generate(
      20,
      (index) => FoodItemModel(
          id: Random().nextInt(20),
          name: "Food ${index + 1}",
          description: "Food Description ${index + 1}",
          image1: "",
          image2: "",
          diet_type: index.isEven ? "Veg" : "Non Veg",
          category: "",
          std_serving_size: "",
          other_serving_size: "",
          other_serving_cost: "",
          spice_level: Random().nextInt(5).toString(),
          cost: Random().nextInt(1000).toString(),
          restaurant: ""));
  List<String> bottomBarIcons = List.generate(5,
      (index) => "assets/images/BottomBar" + (index + 1).toString() + ".png");

  List<String> monthDate = List.generate(31, (index) => "${index + 1}");

  @override
  void onInit() {
    getRestaurants();
    super.onInit();
  }

  List<String> label = [
    "Home",
    "Location",
    "Orders",
    "Tell a Friend",
    "Profile"
  ];

  get homeServices => null;

  Future<void> getRestaurants() async {
    try {
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
