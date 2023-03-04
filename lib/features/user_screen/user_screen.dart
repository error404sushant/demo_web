import 'package:auto_size_text/auto_size_text.dart';
import 'package:demo_web/features/user_screen/user_bloc.dart';
import 'package:demo_web/util/app_common_methords.dart';
import 'package:demo_web/util/app_constants.dart';
import 'package:flutter/material.dart';


//region Home Screen
class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}
//endregion

class _UserScreenState extends State<UserScreen> {
  //region Build
  late UserBloc userBloc;
  //endregion
  //region Init
  @override
  void initState() {
    userBloc = UserBloc(context: context);
    super.initState();
  }
  //endregion
  @override
  Widget build(BuildContext context) {
    AppConstants.isDesktop = AppCommonMethods.isDesktop(context: context);
    print(AppConstants.isDesktop );

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText("User screen"),
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
        crossAxisCount: AppConstants.isDesktop?10:4,
        // childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.5),
        mainAxisSpacing: 17,
        crossAxisSpacing: 15,
        // mainAxisExtent: 100,
      ),
      // physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {

        
        return Container(color: Colors.green,);
      },
    );
  }
//endregion



}
