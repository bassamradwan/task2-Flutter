// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ProductList extends StatefulWidget {
//   @override
//   _ProductListState createState() => _ProductListState();
// }

// class _ProductListState extends State<ProductList> {
//   List<dynamic> products = [];
//   List<dynamic> cartItems = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchProducts();
//   }

//   Future<void> fetchProducts() async {
//     final response =
//         await http.get(Uri.parse('https://dummyjson.com/products'));

//     if (response.statusCode == 200) {
//       final List<dynamic> productsData = json.decode(response.body)['products'];
//       setState(() {
//         products = productsData;
//       });
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }

//   void addToCart(dynamic product) {
//     setState(() {
//       cartItems = [...cartItems, product];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product List'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Products',
//               style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: products.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   dynamic product = products[index];
//                   return Card(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Image.network(
//                           product['images'][0],
//                           fit: BoxFit.cover,
//                           height: 200.0,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 product['title'],
//                                 style: TextStyle(
//                                     fontSize: 20.0,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(height: 8.0),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     '\$${product['price']}',
//                                     style: TextStyle(
//                                         fontSize: 24.0,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   ElevatedButton(
//                                     onPressed: () => addToCart(product),
//                                     child: Row(
//                                       children: [
//                                         Icon(Icons.shopping_cart),
//                                         SizedBox(width: 8.0),
//                                         Text('Add to Cart'),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      final List<dynamic> productsData = json.decode(response.body)['products'];
      setState(() {
        products = productsData;
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth / 2 - 16;
    final cardHeight = cardWidth * 1.25;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Products',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  dynamic product = products[index];
                  return SizedBox(
                    width: screenWidth,
                    height: 350,
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 230,
                            height: 80,
                            child: Image.network(
                              product['images'][0],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product['title'],
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${product['price']}',
                                      style: TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 8.0),
                                    IconButton(
                                      icon: Icon(Icons.shopping_cart),
                                      onPressed: () {
                                        // اضف هنا الى عربه الشراء
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
