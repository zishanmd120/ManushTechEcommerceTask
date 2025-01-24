// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_image_cache.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartListHiveModelAdapter extends TypeAdapter<CartListHiveModel> {
  @override
  final int typeId = 0;

  @override
  CartListHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartListHiveModel(
      message: fields[1] as String?,
      cartProducts: (fields[0] as List?)?.cast<CartHiveProducts>(),
    );
  }

  @override
  void write(BinaryWriter writer, CartListHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.cartProducts)
      ..writeByte(1)
      ..write(obj.message);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartListHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CartHiveProductsAdapter extends TypeAdapter<CartHiveProducts> {
  @override
  final int typeId = 1;

  @override
  CartHiveProducts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartHiveProducts(
      id: fields[0] as int?,
      uid: fields[1] as String?,
      title: fields[2] as String?,
      sku: fields[3] as String?,
      weight: fields[4] as dynamic,
      weightUnit: fields[5] as String?,
      minimumOrderQuantity: fields[6] as int?,
      mrp: fields[7] as dynamic,
      stock: fields[8] as int?,
      prouductImages: (fields[9] as List?)?.cast<ProductHiveImages>(),
      promotion: fields[10] as PromotionHive?,
      quantitySelected: fields[11] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CartHiveProducts obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.uid)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.sku)
      ..writeByte(4)
      ..write(obj.weight)
      ..writeByte(5)
      ..write(obj.weightUnit)
      ..writeByte(6)
      ..write(obj.minimumOrderQuantity)
      ..writeByte(7)
      ..write(obj.mrp)
      ..writeByte(8)
      ..write(obj.stock)
      ..writeByte(9)
      ..write(obj.prouductImages)
      ..writeByte(10)
      ..write(obj.promotion)
      ..writeByte(11)
      ..write(obj.quantitySelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartHiveProductsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductHiveImagesAdapter extends TypeAdapter<ProductHiveImages> {
  @override
  final int typeId = 2;

  @override
  ProductHiveImages read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductHiveImages(
      id: fields[0] as int?,
      image: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductHiveImages obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductHiveImagesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PromotionHiveAdapter extends TypeAdapter<PromotionHive> {
  @override
  final int typeId = 3;

  @override
  PromotionHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PromotionHive(
      id: fields[0] as int?,
      createdAt: fields[1] as String?,
      title: fields[2] as String?,
      type: fields[3] as String?,
      description: fields[4] as String?,
      startDate: fields[5] as String?,
      endDate: fields[6] as String?,
      promotionDetails: (fields[7] as List?)?.cast<PromotionDetailsHive>(),
    );
  }

  @override
  void write(BinaryWriter writer, PromotionHive obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.startDate)
      ..writeByte(6)
      ..write(obj.endDate)
      ..writeByte(7)
      ..write(obj.promotionDetails);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PromotionHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PromotionDetailsHiveAdapter extends TypeAdapter<PromotionDetailsHive> {
  @override
  final int typeId = 4;

  @override
  PromotionDetailsHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PromotionDetailsHive(
      id: fields[0] as int?,
      uid: fields[1] as String?,
      discountType: fields[2] as String?,
      amount: fields[3] as int?,
      percentage: fields[4] as int?,
      ruleWeight: fields[5] as int?,
      minWeight: fields[6] as int?,
      maxWeight: fields[7] as int?,
      weightUnit: fields[8] as String?,
      discountProduct: fields[9] as DiscountProductHive?,
    );
  }

  @override
  void write(BinaryWriter writer, PromotionDetailsHive obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.uid)
      ..writeByte(2)
      ..write(obj.discountType)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.percentage)
      ..writeByte(5)
      ..write(obj.ruleWeight)
      ..writeByte(6)
      ..write(obj.minWeight)
      ..writeByte(7)
      ..write(obj.maxWeight)
      ..writeByte(8)
      ..write(obj.weightUnit)
      ..writeByte(9)
      ..write(obj.discountProduct);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PromotionDetailsHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DiscountProductHiveAdapter extends TypeAdapter<DiscountProductHive> {
  @override
  final int typeId = 5;

  @override
  DiscountProductHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DiscountProductHive(
      id: fields[0] as int?,
      title: fields[1] as String?,
      freeProductImages: (fields[2] as List?)?.cast<FreeProductHiveImages>(),
    );
  }

  @override
  void write(BinaryWriter writer, DiscountProductHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.freeProductImages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiscountProductHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FreeProductHiveImagesAdapter extends TypeAdapter<FreeProductHiveImages> {
  @override
  final int typeId = 6;

  @override
  FreeProductHiveImages read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FreeProductHiveImages(
      id: fields[0] as int?,
      image: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FreeProductHiveImages obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FreeProductHiveImagesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
