import 'package:demo_web/features/user_screen/user_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBloc{
  //region Common variable
  late BuildContext context;
  //endregion

//region Text Editing Controller
//endregion

//region Controller
//endregion
  //region Constructor
  HomeBloc({required context});
  //endregion
//region Init
void init(){

}
//endregion

//region Go to user screen
void goToUserScreen(){
  var screen = UserScreen();
  var route = MaterialPageRoute(builder: (context) => screen);
  Navigator.push(context, route);
}
//endregion
}