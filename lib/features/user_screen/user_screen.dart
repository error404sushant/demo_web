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
    print(AppConstants.isDesktop);

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText("User screen"),
      ),
      body: body(),
    );
  }

  //region Body
  Widget body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          //boxes(),
          TextField(),
          SizedBox(height: 200,),
          search()
        ],
      ),
    );
  }

//endregion
//region Greed

  Widget boxes() {
    return GridView.builder(
      shrinkWrap: true,
      //itemCount: buyerHomeBloc.recentlyVisitedItemCount,
      itemCount: 20,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: AppConstants.isDesktop ? 10 : 4,
        // childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.5),
        mainAxisSpacing: 17,
        crossAxisSpacing: 15,
        // mainAxisExtent: 100,
      ),
      // physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.green,
        );
      },
    );
  }

//endregion

//region Search
  Widget search() {
    return RawAutocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        return userBloc.userName.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        return commonSearch(
          textEditingController: textEditingController,
          focusNode: focusNode,
          onFieldSubmit: (String value) {
            onFieldSubmitted();
          },
        );
      },
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            // elevation: 4.0,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Card(

                margin: EdgeInsets.all(10),
                // height: 200.0,
                child: ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: options.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final String option = options.elementAt(index);
                    return GestureDetector(
                      onTap: () {
                        onSelected(option);
                      },
                      child: ListTile(
                        title: Text(option),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
//endregion


//region Common text field
Widget commonSearch({required FocusNode focusNode,required TextEditingController textEditingController,required dynamic onFieldSubmit }){
    return TextField(
      focusNode: focusNode,
      controller: textEditingController,
      onSubmitted:(value){
        onFieldSubmit();
      } ,
      decoration: InputDecoration(
      ),
    );
}

//endregion

}
