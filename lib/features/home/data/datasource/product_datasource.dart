import 'dart:convert';
import 'package:ecom_zishan/features/base/util/end_points.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/all_product_model.dart';

class RemoteDataSource {
  final SharedPreferences _sharedPreferences;

  RemoteDataSource(
    this._sharedPreferences,
  );

  Future<AllProductModel> fetchProducts(String title) async {

    final url = "${EndPoints.allProducts}$title";
    final token = _sharedPreferences.getString('authorization');

    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      return AllProductModel.fromJson(data);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
