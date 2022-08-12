import 'package:flutter/material.dart';
import 'package:furnipart_sales/views/splash/splash_view.dart';
// import 'package:toast/toast.dart';
//
// void main() => runApp( const MaterialApp(debugShowCheckedModeBanner: false, home: SplashView()));
void main() => runApp( const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // ToastContext().init(context);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:  ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const SplashView(),
    );
  }
}