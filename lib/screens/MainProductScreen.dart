import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/cartConnection.dart';
import 'package:store_app/widgets/InputWidget.dart';
import 'package:store_app/widgets/appDrawer.dart';
import 'package:store_app/widgets/appBarContainer.dart';
import 'package:store_app/widgets/productWidget.dart';

import 'CartScreen.dart';

//enum FilterOption { Favorites, All }

class MainProductScreen extends StatelessWidget {
  static const routeName = '/Main';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final product = productData.items;
    //     final productsContainer =Provider.of<Products>(context,listen: false);

    return Scaffold(
      backgroundColor: Color(0xFFEAE8FF),
      appBar: AppBar(
        
        flexibleSpace: AppBarContainer(),
        actions: <Widget>[
          InputWidget(),
       Consumer<Cart>(builder: (_,cart,ch)=>Badge(
              child: ch,
             value: cart.itemCount.toString(),
          ),
          child: IconButton(
              color: Colors.black,
              
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                  Navigator.of(context).pushNamed(CartWidget.routeName);

              },
             ),
          )   
          // PopupMenuButton(
          //   onSelected: (FilterOption seletedValue) {
          //       if(seletedValue ==FilterOption.Favorites){
          //             productData.showFavoritesOnly();
          //       }else{
          //           productData.showAll();
          //       }
          //   },
          //   icon: Icon(Icons.more_vert),
          //   itemBuilder: (_) => [
          //     PopupMenuItem(
          //         child: Text('Only Favotite'), value: FilterOption.Favorites),
          //     PopupMenuItem(child: Text('Show All'), value: FilterOption.All)
          //   ],
          // )
        ],
      ),
      drawer: AppDrawer(),
      body: GridView.builder(
        itemCount: product.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
       //   builder: (c) => product[i],
       value: product[i],
          child: ProductWidget(
              // product[i].id,
              // product[i].name,
              // product[i].imageUrl
              ),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (2 / 3),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
