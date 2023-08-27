class ApiEndPoints{
  static const String baseUrl='https://ubfactory.onrender.com/api/v1';
  static _AuthEndPoints authEndPoints=_AuthEndPoints();
}

class _AuthEndPoints {

  final String registerUser= '/register-customer';
  final String loginUser= '/login-customer';
  final String getDiscount ='/get-discount';
  final String getProduct ='/get-product';
  final String bestSelling ='/get-best-saling-products';
  final String category ='/get-category';
  final String productById ='/get-product-by-id';
  final String addWishList='/add-to-wishlist';
  final String addToCart='/add-to-cart';
  final String getCart='/get-cart';
}

//https://ubfactory.onrender.com/api/v1/register-user