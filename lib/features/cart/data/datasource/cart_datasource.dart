import 'package:hive/hive.dart';
import '../model/product_image_cache.dart';

class CartLocalDataSource {
  final String boxName = 'cartBox';

  Future<CartListHiveModel?> getCartData() async {
    final box = await Hive.openBox<CartListHiveModel>(boxName);
    return box.get('cartData');
  }

  Future<void> updateCartData(CartListHiveModel cart) async {
    final box = await Hive.openBox<CartListHiveModel>(boxName);
    await box.put('cartData', cart);
  }
}
