import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../cart/data/model/product_image_cache.dart';

class HiveCacheConfig {

  Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(FreeProductHiveImagesAdapter());
    Hive.registerAdapter(DiscountProductHiveAdapter());
    Hive.registerAdapter(PromotionDetailsHiveAdapter());
    Hive.registerAdapter(PromotionHiveAdapter());
    Hive.registerAdapter(ProductHiveImagesAdapter());
    Hive.registerAdapter(CartHiveProductsAdapter());
    Hive.registerAdapter(CartListHiveModelAdapter());
  }

}