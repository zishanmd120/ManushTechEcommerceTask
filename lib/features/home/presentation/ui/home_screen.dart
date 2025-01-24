import 'package:ecom_zishan/features/home/presentation/widget/cart_bottom_sheet.dart';
import 'package:ecom_zishan/main/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../cart/data/model/product_image_cache.dart';
import '../controller/home_controller.dart';
import '../widget/custom_search.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        margin: EdgeInsets.only(right: 5),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https://www.shutterstock.com/image-vector/default-avatar-profile-icon-social-600nw-2409187029.jpg',
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.userDataInteractor.getUserName(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            controller.userDataInteractor.getUserPhone(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange
                    ),
                    child: Stack(
                      children: [
                        IconButton(onPressed: () {
                          Get.toNamed(AppRoutes.cart)?.then((value){
                            controller.fetchProducts("");
                            controller.getCartProductList();
                          });
                        }, icon: Icon(Icons.shopping_bag_outlined, size: 30, color: Colors.white,),),
                          Positioned(
                            right: 0,
                            top: -5,
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                              child: Obx(()=> controller.isGettingCartData.value
                                  ? SizedBox()
                                  : Text("${controller.cartListHiveModel?.cartProducts?.length ?? 0}",
                                    style: TextStyle(color: Colors.white,),
                                  ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              CustomSearchWidget(
                hintText: "Search your product",
                onChanged: (value) => controller.onSearchChanged(value),
                focusNode: controller.searchFocusNode,
                controller: controller.searchEditingController,
                suffixIcon: const SizedBox(),
              ),
              SizedBox(height: 20),
              Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                return Expanded(
                  child: GridView.builder(
                    itemCount: controller.productList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1 / 2,
                    ),
                    itemBuilder: (context, index) {
                      final product = controller.productList[index];
                      int existingQuantity = controller.cartListHiveModel?.cartProducts
                          ?.firstWhere((cartProduct) => cartProduct.id == product?.id,
                          orElse: () => CartHiveProducts(quantitySelected: 0)).quantitySelected ?? 0;
                      return Container(
                        height: 330,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(product?.prouductImages?[0].image ?? ''),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product?.title ?? '',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        "${product?.weight ?? ''} ${product?.weightUnit ?? ''}",
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 12.5,
                                            color: Colors.grey
                                        ),
                                      ),
                                      Text(
                                        "৳ ${product?.mrp ?? ''}",
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      if(existingQuantity > 0){
                                        const snackdemo = SnackBar(
                                          content: Text("Product already added"),
                                          duration: Duration(seconds: 1),
                                        );
                                        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
                                      } else {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                                          ),
                                          builder: (BuildContext context) {
                                            return CartBottomSheet(product: product);
                                          },
                                        );
                                      }
                                    },
                                    icon: Icon(
                                      Icons.shopping_bag_outlined,
                                      size: 35,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
