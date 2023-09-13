sealed class Apis {
  static const baseUrl = "https://fakestoreapi.com";
  static const products = "/products";
  static const productsCategory = "/products/category/";


  static Map<String, String> query({int page = 1, int limit = 10}) => {
    "page": page.toString(),
    "limit": limit.toString() ,
  };
}