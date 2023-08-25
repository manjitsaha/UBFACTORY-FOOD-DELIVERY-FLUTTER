import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FavoritesController extends GetxController {
  final _favorites = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get favorites => _favorites;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getString('favorites');
    if (favoritesJson != null) {
      final favoritesData = jsonDecode(favoritesJson) as List<dynamic>;
      _favorites.assignAll(favoritesData.cast<Map<String, dynamic>>());
    }
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = jsonEncode(_favorites);
    await prefs.setString('favorites', favoritesJson);
  }

  void addToFavorites(Map<String, dynamic> product) {
    _favorites.add(product);
    saveFavorites();
    update();
  }

  void removeFromFavorites(String productId) {
    _favorites.removeWhere((product) => product['id'] == productId);
    saveFavorites();
    update();
  }

  bool isProductFavorite(String productId) {
    return _favorites.any((product) => product['id'] == productId);
  }
}
