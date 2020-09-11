import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/constants/kConstants.dart';
import 'package:store_app/core/viewmodels/home_model.dart';
import 'package:store_app/models/UserData.dart';
import 'package:store_app/shared/globals.dart';
import 'package:store_app/widgets/button_widget.dart';
import 'package:store_app/widgets/textfield_widget.dart';
import 'package:store_app/widgets/wave_widget.dart';
import 'package:http/http.dart' as http;
import 'SignUpNew.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/LoginPage';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password , errorMessage = "";
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  submitForm(String email, String password, context) async {
    Future<SharedPreferences> _prefs =  SharedPreferences.getInstance();
    UserData userDataContext = Provider.of<UserData>(context, listen: false);
    print("${kUrl}Signin");
    final response = await http.post(
        "${kUrl}Signin",
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "email": email,
          "password": password,
        })
    );
    final Map responseJson = json.decode(response.body);
    print(responseJson);
    if (responseJson["msg"] != null) {
      print(responseJson);
      setState(() {
        errorMessage = responseJson["msg"];
      });
    } else {
      userDataContext.userData = responseJson;
      _prefs.then((SharedPreferences prefs) {
        prefs.setString("userData", jsonEncode(responseJson));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    UserData userDataContext = Provider.of<UserData>(context);
    print(userDataContext.isUserDataLoaded);
    if (userDataContext.isUserDataLoaded) {
      Timer(const Duration(milliseconds: 200), () {
        Navigator.of(context).pop();
        userDataContext.isUserDataLoaded = false;
      });
    }
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final model = Provider.of<HomeModel>(context);

    return Scaffold(
      backgroundColor: Global.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height - 200,
            color: Global.mediumBlue,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOutQuad,
            top: keyboardOpen ? -size.height / 3.7 : 0.0,
            child: WaveWidget(
              size: size,
              yOffset: size.height / 3.0,
              color: Global.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Login',
                  style: TextStyle(
                    color: Global.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Form(
            key: _key,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextFieldWidget(
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (x) {
                      if (x.isEmpty) return "please enter x";
                      return null;
                    },
                    hintText: 'Email',
                    obscureText: false,
                    prefixIconData: Icons.mail_outline,
                    suffixIconData: model.isValid ? Icons.check : null,
                    // onChanged: (value) {
                    //   model.isValidEmail(value);
                    // },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      TextFieldWidget(
                        onChanged: (value) {
                          password = value;
                        },
                        validator: (x) {
                          if (x.isEmpty) return "please enter x";
                          return null;
                        },
                        hintText: 'Password',

                        obscureText: model.isVisible ? false : true,
                        prefixIconData: Icons.lock_outline,
                        suffixIconData: model.isVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      Text(
                        errorMessage,
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Global.mediumBlue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ButtonWidget(
                    title: 'Login',
                    hasBorder: false,
                    onClick: () {
                      if (_key.currentState.validate()) {
                        submitForm(email, password, context);
                        // Navigator.of(context).popAndPushNamed(MainProductScreen.routeName);
                      }
                      //  Navigator.of(context).popAndPushNamed(MainProductScreen.routeName);
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ButtonWidget(
                    title: 'Sign Up',
                    hasBorder: true,
                    onClick: () {
                      Navigator.of(context)
                          .popAndPushNamed(SignUpNew.routeName);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

