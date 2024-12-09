import 'package:product_api_task/allimport.dart';

class ProductDetailPage extends StatelessWidget {

  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(product.category.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Card(
                  child: Image.network(product.image, height: 200, fit: BoxFit.cover)),
            ),
            SizedBox(height: 20),
            GetPlatform.isWeb
                ? Text(
              product.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            )
                : Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.title,
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            Text(
              '\$${product.price}',
              style: TextStyle(fontSize: 20, color: Colors.green,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Category: ${product.category}',
              style: TextStyle(fontSize: 16, color: Colors.grey,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              product.description,
              style: TextStyle(overflow:TextOverflow.clip,fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
