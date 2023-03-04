import 'package:flutter/cupertino.dart';

class AppCommonMethods{

  static bool isDesktop({required BuildContext context}){
   return MediaQuery.of(context).size.width >= 600;
  }

}