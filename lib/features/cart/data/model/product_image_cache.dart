import 'package:hive/hive.dart';

part 'product_image_cache.g.dart';

@HiveType(typeId: 0)
class CartListHiveModel {
  @HiveField(0)
  List<CartHiveProducts>? cartProducts;

  @HiveField(1)
  String? message;

  CartListHiveModel({this.message, this.cartProducts});
}

@HiveType(typeId: 1)
class CartHiveProducts {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? uid;

  @HiveField(2)
  String? title;

  @HiveField(3)
  String? sku;

  @HiveField(4)
  dynamic weight;

  @HiveField(5)
  String? weightUnit;

  @HiveField(6)
  int? minimumOrderQuantity;

  @HiveField(7)
  dynamic mrp;

  @HiveField(8)
  int? stock;

  @HiveField(9)
  List<ProductHiveImages>? prouductImages;

  @HiveField(10)
  PromotionHive? promotion;

  @HiveField(11)
  int? quantitySelected;

  CartHiveProducts(
      {this.id,
        this.uid,
        this.title,
        this.sku,
        this.weight,
        this.weightUnit,
        this.minimumOrderQuantity,
        this.mrp,
        this.stock,
        this.prouductImages,
        this.promotion,
        this.quantitySelected,
      });
}

@HiveType(typeId: 2)
class ProductHiveImages {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? image;

  ProductHiveImages({this.id, this.image});
}

@HiveType(typeId: 3)
class PromotionHive {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? createdAt;

  @HiveField(2)
  String? title;

  @HiveField(3)
  String? type;

  @HiveField(4)
  String? description;

  @HiveField(5)
  String? startDate;

  @HiveField(6)
  String? endDate;

  @HiveField(7)
  List<PromotionDetailsHive>? promotionDetails;

  PromotionHive(
      {this.id,
        this.createdAt,
        this.title,
        this.type,
        this.description,
        this.startDate,
        this.endDate,
        this.promotionDetails});
}

@HiveType(typeId: 4)
class PromotionDetailsHive {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? uid;

  @HiveField(2)
  String? discountType;

  @HiveField(3)
  int? amount;

  @HiveField(4)
  int? percentage;

  @HiveField(5)
  int? ruleWeight;

  @HiveField(6)
  int? minWeight;

  @HiveField(7)
  int? maxWeight;

  @HiveField(8)
  String? weightUnit;

  @HiveField(9)
  DiscountProductHive? discountProduct;

  PromotionDetailsHive(
      {this.id,
        this.uid,
        this.discountType,
        this.amount,
        this.percentage,
        this.ruleWeight,
        this.minWeight,
        this.maxWeight,
        this.weightUnit,
        this.discountProduct});
}

@HiveType(typeId: 5)
class DiscountProductHive {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  List<FreeProductHiveImages>? freeProductImages;

  DiscountProductHive({this.id, this.title, this.freeProductImages});
}

@HiveType(typeId: 6)
class FreeProductHiveImages {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? image;

  FreeProductHiveImages({this.id, this.image});
}