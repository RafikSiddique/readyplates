import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:readyplates/modals/foog_item_model.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';



class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;
  bool isEditing = false;
  final pageController = PageController();
  FoodItemModel? foodItemModel;

  final SharedPreferenceHelper sfHelper = Get.find();
  
  void setEditing() {
    nameController.text = foodItemModel!.name;
    descController.text = foodItemModel!.description;
    cost.text = foodItemModel!.cost;
    spiceSlider.value = double.parse(foodItemModel!.spice_level);
  }

  RxList<FoodItemModel> foodItems = <FoodItemModel>[
    FoodItemModel(
        id: -1,
        name: "name",
        description: "description",
        image1: "image1",
        image2: "image2",
        diet_type: "diet_type",
        category: "category",
        std_serving_size: "std_serving_size",
        other_serving_size: "other_serving_size",
        other_serving_cost: "other_serving_cost",
        spice_level: "spice_level",
        cost: "cost",
        restaurant: "'restaurant'"),
  ].obs;
  void onChanged(int i) {
    selectedIndex.value = i;
    pageController.animateToPage(i,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
    title.value = getTitle(i);
  }

  RxString title = "Menu".obs;

  String getTitle(int page) {
    switch (page) {
      case 0:
        return "Menu";
      case 1:
        return "Performance";
      case 2:
        return "Orders";
      case 3:
        return "Profile";
      default:
        return "";
    }
  }

  @override
  void onInit() {
    // getFoodItems();
    super.onInit();
  }

  void clearController() {
    nameController.clear();
    descController.clear();
    cost.clear();
    spiceSlider.value = 1;
  }

  RxDouble spiceSlider = 1.0.obs;

  final nameController = TextEditingController();
  final descController = TextEditingController();

  File image1 = File("");
  File image2 = File("");
  RxString dietType = "".obs;
  final cost = TextEditingController();
  RxString category = "".obs;
  String servingSize = "";

  // Future<void> addFoodItem() async {
  //   try {
  //     String resname = await sfHelper.getRestaurantName();
  //     await homeServices.addfooditem(
  //         resname,
  //         nameController.text,
  //         descController.text,
  //         image1,
  //         image2,
  //         dietType.value,
  //         category.value,
  //         servingSize,
  //         "other_cost",
  //         "other_serving_size",
  //         spiceSlider.value.toString(),
  //         cost.text);
  //     await getFoodItems();
  //     clearController();
  //     Get.back();
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString());
  //   }
  // }

  // Future<void> editFoodItem(int id) async {
  //   try {
  //     String resname = await sfHelper.getRestaurantName();
  //     await homeServices.addfooditem(
  //         resname,
  //         nameController.text,
  //         descController.text,
  //         image1,
  //         image2,
  //         dietType.value,
  //         category.value,
  //         servingSize,
  //         "other_cost",
  //         "other_serving_size",
  //         spiceSlider.value.toString(),
  //         cost.text);
  //     await getFoodItems();
  //     Get.back();
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString());
  //   }
  // }

  // Future<void> getFoodItems() async {
  //   try {
  //     String id = await sfHelper.getUserId();
  //     foodItems.value = await homeServices.getMenu(id);
  //   } catch (e) {
  //     foodItems.value = foodItems.length == 0
  //         ? foodItems.first.id == -1
  //             ? []
  //             : foodItems
  //         : [];
  //     Get.snackbar("Error", e.toString());
  //   }
  }
