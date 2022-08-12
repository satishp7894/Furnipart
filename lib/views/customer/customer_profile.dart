// import 'package:flutter/material.dart';
// import 'package:furnipart_sales/constants/asset_constants.dart';
// import 'package:furnipart_sales/model/customer.dart';
// import 'package:furnipart_sales/shared/styles.dart';
//
// class CustomerProfile extends StatefulWidget {
// final Customer customerObj;
// const CustomerProfile({Key? key, required this.customerObj}) : super(key: key);
//
//   @override
//   State<CustomerProfile> createState() => _CustomerProfileState();
// }
//
// class _CustomerProfileState extends State<CustomerProfile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: appBlackColor,
//       ),
//       body: Stack(
//
//         children: [
//           Column(
//             children: [
//               Container(
//                 height: 230,
//                 width: MediaQuery.of(context).size.width,
//                 color: appBlackColor,
//                 child: Column(
//                   children: [
//                     Container(
//                       width: 120,
//                       child: FittedBox(child: Image.asset(AssetConstants.manIcon)),
//                     ),
//                     SizedBox(height: 15,),
//                     Text("Testing",style: TextStyle(color: appWhiteColor,fontSize: 20,fontWeight: FontWeight.bold),),
//                     Text("test@gmail.com",style: TextStyle(color: appWhiteColor,fontSize: 18,fontWeight: FontWeight.bold),)
//                   ],
//                 ),
//               ),
//               SizedBox(height: 40,),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // SizedBox(height: 20,),
//                         const Text("Customer Information",style: TextStyle(color: appBlackColor,fontSize: 25,fontWeight: FontWeight.bold),),
//                         SizedBox(height: 10,),
//                         Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Row(
//
//                             children: [
//                               Image.asset(AssetConstants.personIcon,height: 40,width: 40,),
//                               SizedBox(width: 10,),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("Name",style: TextStyle(color: appBlackColor,fontSize: 18,fontWeight: FontWeight.bold),),
//                                   // SizedBox(height: 3,),
//                                   Text("${widget.customerObj.name}",style: TextStyle(color: appGreyColor,fontSize: 16),),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Row(
//
//                             children: [
//                               Image.asset(AssetConstants.phoneIcon2,height: 40,width: 40,),
//                               SizedBox(width: 10,),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("Mobile",style: TextStyle(color: appBlackColor,fontSize: 18,fontWeight: FontWeight.bold),),
//                                   // SizedBox(height: 3,),
//                                   Text("+91 9909940394",style: TextStyle(color: appGreyColor,fontSize: 16),),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Row(
//
//                             children: [
//                               Image.asset(AssetConstants.emailIcon2,height: 40,width: 40,),
//                               SizedBox(width: 10,),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("Email",style: TextStyle(color: appBlackColor,fontSize: 18,fontWeight: FontWeight.bold),),
//                                   // SizedBox(height: 3,),
//                                   Text("testing@gmail.com",style: TextStyle(color: appGreyColor,fontSize: 16),),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Row(
//
//                             children: [
//                               Image.asset(AssetConstants.emailIcon2,height: 40,width: 40,),
//                               SizedBox(width: 10,),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("Email",style: TextStyle(color: appBlackColor,fontSize: 18,fontWeight: FontWeight.bold),),
//                                   // SizedBox(height: 3,),
//                                   Text("testing@gmail.com",style: TextStyle(color: appGreyColor,fontSize: 16),),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Row(
//
//                             children: [
//                               Image.asset(AssetConstants.emailIcon2,height: 40,width: 40,),
//                               SizedBox(width: 10,),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("Email",style: TextStyle(color: appBlackColor,fontSize: 18,fontWeight: FontWeight.bold),),
//                                   // SizedBox(height: 3,),
//                                   Text("testing@gmail.com",style: TextStyle(color: appGreyColor,fontSize: 16),),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Row(
//
//                             children: [
//                               Image.asset(AssetConstants.emailIcon2,height: 40,width: 40,),
//                               SizedBox(width: 10,),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("Email",style: TextStyle(color: appBlackColor,fontSize: 18,fontWeight: FontWeight.bold),),
//                                   // SizedBox(height: 3,),
//                                   Text("testing@gmail.com",style: TextStyle(color: appGreyColor,fontSize: 16),),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Row(
//
//                             children: [
//                               Image.asset(AssetConstants.emailIcon2,height: 40,width: 40,),
//                               SizedBox(width: 10,),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("Email",style: TextStyle(color: appBlackColor,fontSize: 18,fontWeight: FontWeight.bold),),
//                                   // SizedBox(height: 3,),
//                                   Text("testing@gmail.com",style: TextStyle(color: appGreyColor,fontSize: 16),),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Row(
//
//                             children: [
//                               Image.asset(AssetConstants.emailIcon2,height: 40,width: 40,),
//                               SizedBox(width: 10,),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("Email",style: TextStyle(color: appBlackColor,fontSize: 18,fontWeight: FontWeight.bold),),
//                                   // SizedBox(height: 3,),
//                                   Text("testing@gmail.com",style: TextStyle(color: appGreyColor,fontSize: 16),),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Row(
//
//                             children: [
//                               Image.asset(AssetConstants.emailIcon2,height: 40,width: 40,),
//                               SizedBox(width: 10,),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("Email",style: TextStyle(color: appBlackColor,fontSize: 18,fontWeight: FontWeight.bold),),
//                                   // SizedBox(height: 3,),
//                                   Text("testing@gmail.com",style: TextStyle(color: appGreyColor,fontSize: 16),),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Row(
//
//                             children: [
//                               Image.asset(AssetConstants.emailIcon2,height: 40,width: 40,),
//                               SizedBox(width: 10,),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("Email",style: TextStyle(color: appBlackColor,fontSize: 18,fontWeight: FontWeight.bold),),
//                                   // SizedBox(height: 3,),
//                                   Text("testing@gmail.com",style: TextStyle(color: appGreyColor,fontSize: 16),),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//           Positioned(
//             left: 138.0,
//             top: 205,
//             child:
//             SizedBox(
//               //width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//
//                 },
//                 style: ButtonStyle(
//                   foregroundColor:
//                   MaterialStateProperty.all<Color>(appWhiteColor),
//                   backgroundColor:
//                   MaterialStateProperty.all<Color>(appRedColor),
//                   shape:
//                   MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(40.0),
//                     ),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//
//                     children:  [
//                       Container(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Image.asset(AssetConstants.backArrow,color: appWhiteColor,height: 20,width: 20,),
//                         ),
//                         decoration: BoxDecoration(
//                             color: appBlackColor,
//                             borderRadius: BorderRadius.circular(100)),
//                       ),
//                       SizedBox(width: 15.0,),
//                       Text(
//                         'Back',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:furnipart_sales/constants/asset_constants.dart';
import 'package:furnipart_sales/shared/styles.dart';

// import 'package:provider/provider.dart';
// import 'package:random_users/states/userState.dart';
//
// import '../commonFunctions.dart' as CommonFunctions;

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Widget _spacing(BuildContext context) {
    final responsive = MediaQuery.of(context).size.height;
    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: responsive * 0.01,
            width: 500.0,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double responsive = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBlackColor,
        title: const Text("Customer Detail"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: [
                Container(
                  color: appBlackColor,
                  padding: EdgeInsets.all(0.0),
                  height: responsive * 0.2,
                  // decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       image:
                  //       NetworkImage("https://picsum.photos/200"),
                  //       fit: BoxFit.cover,
                  //       alignment: Alignment.center,
                  //       repeat: ImageRepeat.noRepeat,
                  //     )),
                ),
                Container(
                  // color: appRedColor,
                 // padding: EdgeInsets.only(top: 50.0),
                  //height: MediaQuery.of(context).size.height - responsive * 0.2,
                  // decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       image:
                  //       NetworkImage("https://picsum.photos/200"),
                  //       fit: BoxFit.cover,
                  //       alignment: Alignment.center,
                  //       repeat: ImageRepeat.noRepeat,
                  //     )),

                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 25.0, bottom: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         SizedBox(height: 240,),
                        const Text(
                          "Customer Information",
                          style: TextStyle(
                              color: appBlackColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        _customerInfoContainer(AssetConstants.personIcon, "Name", "Test User"),
                        _customerInfoContainer(AssetConstants.phoneIcon2, "Mobile", "+91 9909940394"),
                        _customerInfoContainer(AssetConstants.emailIcon2, "Email", "testing@gmail.com"),
                        _customerInfoContainer(AssetConstants.emailIcon2, "Email", "testing@gmail.com"),
                        _customerInfoContainer(AssetConstants.emailIcon2, "Email", "testing@gmail.com"),





                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Container(
                padding: EdgeInsets.only(top: responsive * 0.15),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: responsive * 0.12, bottom: responsive * 0.05),
                    child: Column(
                      children: <Widget>[
                        const Center(
                          child: Text(
                            "Test User",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                                color: appRedColor),
                          ),
                        ),
                        _spacing(context),
                        const Text(
                          "testing@gmail.com",
                          style: TextStyle(color: Colors.grey),
                        ),
                        // _spacing(context),
                        // const Text("+91 9977884584"),
                        // _spacing(context),
                        // const Text(
                        //   "01 Jan 2022",
                        // ),
                        _spacing(context),
                        _spacing(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            InkWell(
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Image.asset(
                                  AssetConstants.facebookIcon,
                                  width: 30.0,
                                ),
                              ),
                              onTap: () {},
                            ),
                            InkWell(
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Image.asset(
                                  AssetConstants.instagramIcon,
                                  width: 30.0,
                                ),
                              ),
                              onTap: () {},
                            ),
                            InkWell(
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Image.asset(
                                  AssetConstants.websiteIcon,
                                  width: 30.0,
                                ),
                              ),
                              onTap: () {},
                            ),
                            InkWell(
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Image.asset(
                                  AssetConstants.linkedinIcon,
                                  width: 30.0,
                                ),
                              ),
                              onTap: () {},
                            ),
                            InkWell(
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Image.asset(
                                  AssetConstants.twitterIcon,
                                  width: 30.0,
                                ),
                              ),
                              onTap: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  elevation: 10.0,
                ),
              ),
            ),
            Card(
              elevation: 10.0,

                shape: const CircleBorder(),
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Center(
                  child: Container(
                    height: 180,
                    width: 180,
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(100)),
                    //padding: EdgeInsets.only(top: responsive * 0.02),
                    child: Center(
                        child:
                            // Hero(
                            //   tag: "image${1}",
                            //   child: CircleAvatar(
                            //     radius: 100.0,
                            //     backgroundImage:  Image.asset(AssetConstants.personIcon),
                            //   ),
                            // ),
                            ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Center(
                        child: Image.asset(AssetConstants.personImage,
                            height: 180, width: 180, fit: BoxFit.cover),
                      ),
                    )),
                  ),
                ),
              ),
            ),
            // Container(
            //   padding: EdgeInsets.only(
            //       top: responsive * 0.2,
            //       left: MediaQuery.of(context).size.width * 0.85),
            //   child: Image.asset(
            //     AssetConstants.personIcon,
            //     height: 20,
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  _customerInfoContainer(String icon, title, description){
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Image.asset(
            icon,
            height: 35,
            width: 35,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: appBlackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              // SizedBox(height: 3,),
              Text(
                description,
                style: TextStyle(
                    color: appGreyColor, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
