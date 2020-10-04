import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/MainProductModel.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/models/producttt.dart';
import 'package:store_app/widgets/CustomButton.dart';
import 'package:store_app/widgets/appBarContainer.dart';
import 'package:store_app/widgets/cartConnection.dart';

import 'CartScreen.dart';

class ProductDetails extends StatelessWidget {
  static const routeName = '/Product-details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;

    final loadedProduct = Provider.of<MainProductModel>(context)
        .products
        .firstWhere((productMap) => productMap["_id"] == productId);

    List images = loadedProduct["images"];

    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          loadedProduct["nameOfProduct"],
        ),
        flexibleSpace: AppBarContainer(),
        actions: <Widget>[
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.items.length.toString(),
            ),
            child: IconButton(
              color: Colors.white,
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartWidget.routeName);
              },
            ),
          )
        ],
      ),
      body: ListView(children: <Widget>[
        Container(
          height: 300,
          width: double.infinity,
          child: Carousel(
            boxFit: BoxFit.cover,
            images:
              List.generate(images.length,(index){
                var image = images[index];
                return NetworkImage(image["url"]);
              }),
            autoplay: false,
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: Duration(milliseconds: 100),
            indicatorBgPadding: 5.0,


            dotColor: Colors.white,
            // dotBgColor: Colors.black87,
            dotSpacing: 15,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            loadedProduct["price"] + "€",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            loadedProduct['description'],
            style: TextStyle(color: Colors.black, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 60.0),
        //  DetailsWidget()
        //ChangeNotifierProvider.value(
        // value: product,
        //   child:
        CustomButton(
          text: "add to cart",
          fontSize: 15,
          onClick: () {
            cart.addItemToCart(loadedProduct);
          },
        ),
        // ),
      ]),
    );
  }
}
