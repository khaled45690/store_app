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

    final Product product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);
    Widget image_carousel = Container(
      height: 200,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          NetworkImage(
              'https://ae01.alicdn.com/kf/HTB1FNX1SpXXXXXZXXXXq6xXFXXXs/Hot-Sale-Spring-Autumn-New-Fashion-Brand-Men-Jacket-Coats-Thin-Overcoat-Cotton-Jackets-Mens-Outerwear.jpg_960x960.jpg'),
          NetworkImage(
              'https://i.pinimg.com/originals/c8/c8/f6/c8c8f6a67b4f3402de8c43739a158683.jpg'),
          NetworkImage(
              'https://ph-test-11.slatic.net/p/c1184852190620363e075fd428ee315e.jpg_340x340q80.jpg_.webp'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 100),
        indicatorBgPadding: 15.0,
        dotColor: Colors.white,
        dotBgColor: Colors.black87,
        dotSpacing: 80,
      ),
    );

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
            //   '\$${loadedProduct.price}',
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
//            cart.addItem(loadedProduct.id, loadedProduct.price,
//                loadedProduct.name, loadedProduct.imageUrl,loadedProduct.quantity);
            cart.addItemToCart(loadedProduct);

//            Navigator.of(context).pushNamed(
//              CartWidget.routeName,
//            );
          },
        ),
        // ),
      ]),
    );
  }
}
