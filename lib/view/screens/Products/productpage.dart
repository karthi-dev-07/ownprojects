import 'package:product_api_task/allimport.dart';


class ProductPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (productController.isLoading.value && productController.productList.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else if (productController.productList.isEmpty) {
          return Center(child: Text('No products available'));
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Products List",style: TextStyle(color: Colors.indigo,fontSize: 30,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Expanded(
                  child: ListView.builder(
                    itemCount: productController.productList.length,
                    itemBuilder: (context, index) {
                      final product = productController.productList[index];
                      return Card(
                        margin: EdgeInsets.all(15),
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                child:Image.network(product.image,  fit: BoxFit.scaleDown),
                              ),
                              SizedBox(width: 5,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(product.title,style: TextStyle(overflow: TextOverflow.ellipsis,color: Colors.black,fontWeight: FontWeight.w600),),
                                    SizedBox(height: 5,),
                                    Text('\$${product.price.toString()}',style: TextStyle(overflow: TextOverflow.ellipsis,fontWeight: FontWeight.normal,color: Colors.grey),),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                                  onPressed: (){
                                    Get.to(() => ProductDetailPage(product: product));
                                  },
                                  child: Text("Details",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),)),
                              SizedBox(width: 5,),

                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Page Navigation Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    productController.totalPages.value,
                        (index) => GestureDetector(
                      onTap: () {
                        productController.goToPage(index + 1);  // Page numbers start from 1
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                        decoration: BoxDecoration(
                          color: productController.currentPage.value == (index + 1)
                              ? Colors.blue
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          (index + 1).toString(),
                          style: TextStyle(
                            color: productController.currentPage.value == (index + 1)
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}