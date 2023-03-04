import 'package:auto_size_text/auto_size_text.dart';
import 'package:demo_web/features/user_screen/user_screen.dart';
import 'package:demo_web/util/app_common_methords.dart';
import 'package:demo_web/util/app_constants.dart';
import 'package:flutter/material.dart';

import 'home_bloc.dart';

//region Home Screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
//endregion

class _HomeScreenState extends State<HomeScreen> {
  //region Check device size
  bool isDesktop(BuildContext context){
    return MediaQuery.of(context).size.width >600;
  }
  //region Build
  late HomeBloc homeBloc;
  //endregion
  //region Init
  @override
  void initState() {
    homeBloc = HomeBloc(context: context);
    super.initState();
  }
  //endregion
  @override
  Widget build(BuildContext context) {
    AppConstants.isDesktop = isDesktop(context);

    // print(AppConstants.isDesktop );
    // bool isDesktop = AppCommonMethods.isDesktop(context: context);

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText("Demo app"),
      ),
      body: body(),
    );
  }


  //region Body
Widget body(){
    return boxes();
}
//endregion
//region Greed

Widget boxes(){
    return GridView.builder(
      shrinkWrap: true,
      //itemCount: buyerHomeBloc.recentlyVisitedItemCount,
      itemCount: 20,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        // childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.5),
        mainAxisSpacing: 17,
        crossAxisSpacing: 15,
        // mainAxisExtent: 100,
      ),
      // physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
            onTap: (){
              var screen = UserScreen();
              var route = MaterialPageRoute(builder: (context) => screen);
              Navigator.push(context, route);
              // homeBloc.goToUserScreen();
            },
            child: Container(color: Colors.green,));
      },
    );
}
//endregion



}
