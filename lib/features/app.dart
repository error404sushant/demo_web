import 'package:demo_web/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:demo_web/features/home/home_screen.dart';


class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  //endregion
  @override
  Widget build(BuildContext context) {

    print(AppConstants.isDesktop);
    return   MaterialApp(
      theme: ThemeData(
          fontFamily: "LatoRegular",
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      // scrollBehavior: MyCustomScrollBehavior(),
      home: HomeScreen(),
    );
    //endregion

  }
}

//region Over scroll blue color remove
// class MyCustomScrollBehavior extends MaterialScrollBehavior {
//
//   @override
//   Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
//     return child;
//   }
// }
//endregion