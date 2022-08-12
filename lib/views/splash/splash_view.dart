
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furnipart_sales/constants/asset_constants.dart';
import 'package:furnipart_sales/constants/string_constants.dart';
import 'package:furnipart_sales/views/home/home_page.dart';
import 'package:furnipart_sales/views/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'background.dart';

class SplashView extends StatefulWidget {
   const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin{

  AnimationController? animationController;
  Animation<double>? animation;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration:  const Duration(seconds: 2));
    animation = CurvedAnimation(parent: animationController!,curve: Curves.easeOut);
    animation!.addListener( (){
      setState(() {

      });
    });
    animationController!.forward();
    initializeApp();
    super.initState();
  }

  void initializeApp() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    // if (true) {
     // navigationPage();
    // } else {
    //navigationHomePage();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFlag = prefs.getBool(isLogged);
    if(isFlag != null){
      isFlag ? navigationHomePage():navigationLoginPage();
    }else{
      navigationLoginPage();
    }
  // }
  }

  void navigationHomePage() async{
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (builder) => const Home()), (route) => false);
  }

  void navigationLoginPage() async{
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (builder) =>  const LoginPage()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
    );

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children:  [
          Center(
            child: Image.asset(
              AssetConstants.appLogo,
              width: animation!.value * 350,
              height: animation!.value * 350,
            ),
          ),
        ],
      ),
    );
  }
}
