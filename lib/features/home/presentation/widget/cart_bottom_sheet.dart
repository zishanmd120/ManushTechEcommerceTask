import 'package:ecom_zishan/features/home/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/all_product_model.dart';

class CartBottomSheet extends GetView<HomeController> {
  final Products product;

  const CartBottomSheet({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    controller.initialQuantitySet(product);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 16.0)
            .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.title ?? '',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Obx(
                  () => Row(
                    children: [
                      Text(
                        "${product.mrp}  ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          decoration: controller.discount.value > 0
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          color: controller.discount.value > 0
                              ? Colors.red
                              : Colors.black,
                          decorationColor: controller.discount.value > 0
                              ? Colors.red
                              : Colors.black,
                        ),
                      ),
                      if (controller.discount.value > 0)
                        Text(
                          "${(product.mrp - controller.discount.value) ?? ''}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      Text(
                        " Tk.",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            if (product.promotion != null)
              Text(
                "Special Offer: ${product.promotion!.description}",
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 16),
            Text(
              "Qty.",
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {
                      controller.decrementQuantity(product);
                    },
                    icon: const Icon(Icons.remove),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                    controller: controller.quantityEditingController,
                    focusNode: controller.quantityFocusNode,
                    keyboardType: TextInputType.number,
                    onTapOutside: (value) {},
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      controller.updateQuantity(product, value);
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: const OutlineInputBorder(),
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                      focusedBorder: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(),
                      errorBorder: const OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {
                      controller.incrementQuantity(product);
                    },
                    icon: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.43,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "Close",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
                GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.43,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  onTap: () {
                    controller.addToCartProduct(product);
                    Get.back();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
