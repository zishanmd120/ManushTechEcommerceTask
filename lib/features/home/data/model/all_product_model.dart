class AllProductModel {
  int? status;
  String? message;
  Data? data;

  AllProductModel({this.status, this.message, this.data});

  AllProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Products>? products;
  int? total;

  Data({this.products, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    return data;
  }
}

class Products {
  int? id;
  String? uid;
  String? title;
  String? sku;
  dynamic weight;
  String? weightUnit;
  int? minimumOrderQuantity;
  dynamic mrp;
  int? stock;
  List<ProductImages>? prouductImages;
  Promotion? promotion;
  int? quantitySelected;

  Products(
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

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    title = json['title'];
    sku = json['sku'];
    weight = json['weight'];
    weightUnit = json['weightUnit'];
    minimumOrderQuantity = json['minimumOrderQuantity'];
    mrp = json['mrp'];
    stock = json['stock'];
    quantitySelected = json['quantitySelected'];
    if (json['prouductImages'] != null) {
      prouductImages = <ProductImages>[];
      json['prouductImages'].forEach((v) {
        prouductImages!.add(ProductImages.fromJson(v));
      });
    }
    promotion = json['promotion'] != null
        ? Promotion.fromJson(json['promotion'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['title'] = title;
    data['sku'] = sku;
    data['weight'] = weight;
    data['weightUnit'] = weightUnit;
    data['minimumOrderQuantity'] = minimumOrderQuantity;
    data['mrp'] = mrp;
    data['stock'] = quantitySelected;
    data['quantitySelected'] = stock;
    if (prouductImages != null) {
      data['prouductImages'] =
          prouductImages!.map((v) => v.toJson()).toList();
    }
    if (promotion != null) {
      data['promotion'] = promotion!.toJson();
    }
    return data;
  }
}

class ProductImages {
  int? id;
  String? image;

  ProductImages({this.id, this.image});

  ProductImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    return data;
  }
}

class Promotion {
  int? id;
  String? createdAt;
  String? title;
  String? type;
  String? description;
  String? startDate;
  String? endDate;
  List<PromotionDetails>? promotionDetails;

  Promotion(
      {this.id,
        this.createdAt,
        this.title,
        this.type,
        this.description,
        this.startDate,
        this.endDate,
        this.promotionDetails});

  Promotion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    title = json['title'];
    type = json['type'];
    description = json['description'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    if (json['promotionDetails'] != null) {
      promotionDetails = <PromotionDetails>[];
      json['promotionDetails'].forEach((v) {
        promotionDetails!.add(PromotionDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['title'] = title;
    data['type'] = type;
    data['description'] = description;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    if (promotionDetails != null) {
      data['promotionDetails'] =
          promotionDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PromotionDetails {
  int? id;
  String? uid;
  String? discountType;
  int? amount;
  int? percentage;
  int? ruleWeight;
  int? minWeight;
  int? maxWeight;
  String? weightUnit;
  DiscountProduct? discountProduct;

  PromotionDetails(
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

  PromotionDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    discountType = json['discountType'];
    amount = json['amount'];
    percentage = json['percentage'];
    ruleWeight = json['ruleWeight'];
    minWeight = json['minWeight'];
    maxWeight = json['maxWeight'];
    weightUnit = json['weightUnit'];
    discountProduct = json['discountProduct'] != null
        ? DiscountProduct.fromJson(json['discountProduct'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['discountType'] = discountType;
    data['amount'] = amount;
    data['percentage'] = percentage;
    data['ruleWeight'] = ruleWeight;
    data['minWeight'] = minWeight;
    data['maxWeight'] = maxWeight;
    data['weightUnit'] = weightUnit;
    if (discountProduct != null) {
      data['discountProduct'] = discountProduct!.toJson();
    }
    return data;
  }
}

class DiscountProduct {
  int? id;
  String? title;
  List<FreeProductImages>? productImages;

  DiscountProduct({this.id, this.title, this.productImages});

  DiscountProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['productImages'] != null) {
      productImages = <FreeProductImages>[];
      json['productImages'].forEach((v) {
        productImages!.add(FreeProductImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (productImages != null) {
      data['productImages'] =
          productImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FreeProductImages {
  int? id;
  String? image;

  FreeProductImages({this.id, this.image});

  FreeProductImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    return data;
  }
}
