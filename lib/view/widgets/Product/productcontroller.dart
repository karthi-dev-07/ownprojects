import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:product_api_task/allimport.dart';


class ProductController extends GetxController {
  var isLoading = false.obs;
  var productList = <Product>[].obs;
  var currentPage = 1.obs;
  var totalPages = 1.obs;
  var itemsPerPage = 5.obs;
  var isSelected = 0.obs;
  var isSelectedLabel = "Dashboard".obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }


  void fetchProducts() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;

        int startIndex = (currentPage.value - 1) * itemsPerPage.value;

        var pageData = data.sublist(startIndex, startIndex + itemsPerPage.value);

        productList.value = pageData.map((product) => Product.fromJson(product)).toList(); // product list updation

        totalPages((data.length / itemsPerPage.value).ceil()); //dynamically set based total numbers of product
      } else {
        Get.snackbar('Error', 'Failed to fetch products');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

  void goToPage(int page) {
    currentPage(page);
    fetchProducts();
  }
}