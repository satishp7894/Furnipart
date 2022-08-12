import 'package:flutter/material.dart';
import 'package:furnipart_sales/constants/asset_constants.dart';
import 'package:furnipart_sales/constants/string_constants.dart';
import 'package:furnipart_sales/shared/styles.dart';
import 'package:furnipart_sales/views/home/griddashboard.dart';
import 'package:furnipart_sales/views/login/login_page.dart';
import 'package:furnipart_sales/views/product/cart.dart';
import 'package:furnipart_sales/widgets/loading_indicator.dart';
import 'package:furnipart_sales/utils/show_alert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  bool isLoading = true;

  @override
  void initState() {
    initializeLoader();
    super.initState();
  }

  void initializeLoader() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
   setState(() {
     isLoading = false;
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff392850),
      backgroundColor: appBlackColor,
      body: isLoading ? const Center(child: LoadingIndicator()):
      Column(
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
         // Background(),

          // Container(
          //    // alignment: Alignment.topLeft,
          //     child: Image.asset(AssetConstants.appLogo,height: 100,width: 200,)),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 16),
            child: Row(
             // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.asset(AssetConstants.appLogo,height: 85,),
                const Spacer(),
                Row(
                  children: [
                    // IconButton(
                    //   alignment: Alignment.topCenter,
                    //   icon: Image.asset(
                    //     AssetConstants.logoutIcon,
                    //   ),
                    //   onPressed: ()  {
                    //      ShowAlertDialog.showAlertLogoutConfirm(context,"Logout?","Are you sure you want to logout from this App?");
                    //     // SharedPreferences prefs = await SharedPreferences.getInstance();
                    //     // prefs.setBool(isLogged, false);
                    //     // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (builder) =>  LoginPage()), (route) => false);
                    //   },
                    // ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: appRedColor,
                          borderRadius: BorderRadius.circular(50.0)),
                      child: IconButton(
                        alignment: Alignment.center,
                        icon: Image.asset(
                          AssetConstants.logoutIcon,
                          color: appWhiteColor,

                          height: 33,
                          width: 33,
                        ),
                        onPressed: ()  async {
                          ShowAlertDialog.showAlertLogoutConfirm(context,"Logout?","Are you sure you want to logout from this App?");
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setBool(isLogged, false);
                         // Navigator.of(context).push(MaterialPageRoute(builder: (builder) =>  const CartPage()));
                        },
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: appRedColor,
                          borderRadius: BorderRadius.circular(50.0)),
                      child: IconButton(
                        alignment: Alignment.center,
                        icon: Image.asset(
                          AssetConstants.cartIcon,
                          color: appWhiteColor,
                          height: 33,
                          width: 33,
                        ),
                        onPressed: ()  {
                          //ShowAlertDialog.showAlertLogoutConfirm(context,"Logout?","Are you sure you want to logout from this App?");
                          // SharedPreferences prefs = await SharedPreferences.getInstance();
                          // prefs.setBool(isLogged, false);
                           Navigator.of(context).push(MaterialPageRoute(builder: (builder) =>  const CartPage()));
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,

          ),
          GridDashboard()
        ],
      ),
    );
  }
}
