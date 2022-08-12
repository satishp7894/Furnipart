import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnipart_sales/constants/string_constants.dart';
import 'package:furnipart_sales/views/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowAlertDialog  {

 static showAlertPdf(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150,
          width: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30)),
          child: CupertinoAlertDialog(
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  message,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      child: const Text(
                        "Okay",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text(
                        "Show",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        //OpenFile.open(filePath);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

 static showAlertLogoutConfirm(BuildContext context, String title, String message) {
   showDialog(
     context: context,
     builder: (BuildContext context) {
       return Container(
         height: 150,
         width: 80,
         alignment: Alignment.center,
         decoration: BoxDecoration(
             color: Colors.transparent,
             borderRadius: BorderRadius.circular(30)),
         child: CupertinoAlertDialog(
           content: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Text(
                 title,
                 style: const TextStyle(
                     color: Colors.black,
                     fontSize: 20,
                     fontWeight: FontWeight.bold),
               ),
               const SizedBox(
                 height: 10,
               ),
               Text(
                 message,
                 style: const TextStyle(
                     color: Colors.black,
                     fontSize: 18,
                     fontWeight: FontWeight.normal),
               ),
               const Divider(
                 thickness: 1,
                 color: Colors.grey,
               ),
               const SizedBox(
                 height: 10,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   TextButton(
                     child: const Text(
                       "No",
                       style: TextStyle(color: Colors.red),
                     ),
                     onPressed: () {
                       Navigator.of(context).pop();
                     },
                   ),
                   TextButton(
                     child: const Text(
                       "Yes",
                       style: TextStyle(color: Colors.red),
                     ),
                     onPressed: () async {
                       SharedPreferences prefs = await SharedPreferences.getInstance();
                       prefs.setBool(isLogged, false);
                       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (builder) =>  const LoginPage()), (route) => false);
                     },
                   ),
                 ],
               )
             ],
           ),
         ),
       );
     },
   );
 }
}
