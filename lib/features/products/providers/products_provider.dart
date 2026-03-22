import 'package:flutter_riverpod/flutter_riverpod.dart ';
import '../data/product_model.dart';
import '../data/product_service.dart';

final productsProvider = FutureProvider<List<Product>>((ref) async {
  return ProductService.fetchProducts();
});
