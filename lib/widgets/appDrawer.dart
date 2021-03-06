import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/constants/kConstants.dart';
import 'package:store_app/constants/kSaveImageFunction.dart';
import 'package:store_app/models/UserData.dart';
import 'package:store_app/screens/CartScreen.dart';
import 'package:store_app/screens/Deals_screen.dart';
import 'package:store_app/screens/FavoriteScreen.dart';
import 'package:store_app/screens/LoginNew.dart';
import 'package:store_app/screens/admin/AddItem.dart';
import 'package:store_app/screens/admin/ShowProduct.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store_app/screens/admin/neumorphic_expenses/monthly_expenses_view.dart';
import 'package:store_app/shared/globals.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override

  Widget build(BuildContext context) {
    final UserData userData = Provider.of<UserData>(context, listen: false);
    if (userData.userData != null) {
      print(userData.userData["profileImage"]);
      return Drawer(
          child: ListView(children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(userData.userData["name"]),
          accountEmail: Text(userData.userData["email"]),
          currentAccountPicture: GestureDetector(
            onTap: () async {
              Map userDataClone = userData.userData;
                final picked =
                    await ImagePicker.pickImage(source: ImageSource.gallery);
                if (picked != null) {
                  saveImage(picked , userDataClone["_id"]  , userDataClone);
                  print(userData.userData);
                }else {
                  print("something happened");
                }
              }
          ,
            child: userData.userData["profileImage"] == null
                ? CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Global.mediumBlue,
                    ))
                : CircleAvatar(
                    backgroundImage: Image.network(userData.userData["profileImage"]).image,
                  ),
          ),
          decoration: BoxDecoration(
            color: Global.mediumBlue,
          ),
        ),
        userData.userData["isAdmin"]
            ? Column(
                children: [
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .popAndPushNamed(ShowProducts.routeName);
                      },
                      child: ListTile(
                        title: Text("ManageProduct"),
                        leading: Icon(
                          FontAwesomeIcons.edit,
                          color: Global.mediumBlue,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .popAndPushNamed(AddItem.routeName);
                      },
                      child: ListTile(
                        title: Text("addProduct"),
                        leading: Icon(
                          FontAwesomeIcons.plus,
                          color: Global.mediumBlue,
                        ),
                      ),
                    ),
                  ),
                   Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .popAndPushNamed(MontlyExpensesView.routeName);
                      },
                      child: ListTile(
                        title: Text("ShowProfit"),
                        leading: Icon(
                          FontAwesomeIcons.chartLine,
                          color: Global.mediumBlue,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
        InkWell(
          onTap: () {
            Navigator.of(context).popAndPushNamed(CartWidget.routeName);
          },
          child: ListTile(
            title: Text("ShopCart"),
            leading: Icon(
              FontAwesomeIcons.shoppingCart,
              color: Global.mediumBlue,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).popAndPushNamed(FavoriteScreen.routeName);
          },
          child: ListTile(
            title: Text("MyFavorite"),
            leading: Icon(
              FontAwesomeIcons.heart,
              color: Global.mediumBlue,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).popAndPushNamed(DealsScreen.routeName);
          },
          child: ListTile(
            title: Text("DealsToday"),
            leading: Icon(
              FontAwesomeIcons.moneyBillWave,
              color: Global.mediumBlue,
            ),
          ),
        ),
            InkWell(
          onTap: () {
            Navigator.of(context).popAndPushNamed(DealsScreen.routeName);
          },
          child: ListTile(
            title: Text("Terms of Service"),
            leading: Icon(
              FontAwesomeIcons.question,
              color: Global.mediumBlue,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
            _prefs.then((SharedPreferences prefs) {
              prefs.remove("userData");
            });
            userData.userData = null;
            userData.isUserDataLoaded = false;
            Navigator.of(context).pop();
          },
          child: ListTile(
            title: Text("Logout"),
            leading: Icon(
              FontAwesomeIcons.signOutAlt,
              color: Global.mediumBlue,
            ),
          ),
        ),
      ]));
    } else {
      return Drawer(
          child: ListView(children: <Widget>[
        UserAccountsDrawerHeader(
            accountName: Text("Welcome"),
            accountEmail: FlatButton(
              child: Text(
                "log in / Sign up",
              ),
              onPressed: () {
                Navigator.of(context).popAndPushNamed(LoginPage.routeName);
              },
            ),
            decoration: BoxDecoration(
              color: Global.mediumBlue,
            ),
            currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  FontAwesomeIcons.userAlt,
                  size: 50,
                  color: Global.mediumBlue,
                ))),
        InkWell(
          onTap: () {
            //  Navigator.of(context).popAndPushNamed(CartWidget.routeName);
          },
          child: ListTile(
            title: Text("ShopCart"),
            leading: Icon(
              FontAwesomeIcons.cartArrowDown,
              color: Global.mediumBlue,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).popAndPushNamed(FavoriteScreen.routeName);
            //   productsContainer.showFavoritesOnly();
            // Navigator.of(context).pushNamed(MainProductScreen.routeName);
          },
          child: ListTile(
            title: Text("MyFavorite"),
            leading: Icon(
              Icons.favorite_border,
              color: Global.mediumBlue,
            ),
          ),
        ),
      ]));
    }
  }
}
