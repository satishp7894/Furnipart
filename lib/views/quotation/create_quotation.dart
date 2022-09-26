import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:switcher_button/switcher_button.dart';
import 'package:flutter/services.dart';
import 'package:furnipart_sales/constants/asset_constants.dart';
import 'package:furnipart_sales/model/customer.dart';
import 'package:furnipart_sales/model/product.dart';
import 'package:furnipart_sales/shared/styles.dart';
import 'package:furnipart_sales/utils/common_method.dart';
import 'package:furnipart_sales/views/customer/create_customer.dart';
import 'package:furnipart_sales/views/otp/number_register.dart';
import 'package:furnipart_sales/views/product/create_prodct.dart';
import 'package:furnipart_sales/views/product/product_detail.dart';
import 'package:furnipart_sales/views/product/product_list.dart';
import 'package:furnipart_sales/views/quotation/quotation_list.dart';
import 'package:furnipart_sales/widgets/app_main_button.dart';
import 'package:furnipart_sales/widgets/customized_app_bar.dart';
import 'package:pdf/widgets.dart' as pw;

class CreateQuotation extends StatefulWidget {
  const CreateQuotation({Key? key}) : super(key: key);

  @override
  State<CreateQuotation> createState() => _CreateQuotationState();
}

class _CreateQuotationState extends State<CreateQuotation> {
  List<Customer> searchResult = [];
  List<Customer> searchResultList = [];
  List<String> searchResultListString = [];
  List<Customer>? myCustomerList;
  TextEditingController? searchView;

  List<Product> searchResultProduct = [];
  List<Product> searchResultProductList = [];
  List<String> searchResultStringProductList = [];
  List<Product>? myProductList = [];
  TextEditingController? searchViewProduct;

  bool search = false;
  bool searchProduct = false;
  bool isSwitched = false;

  Customer customer1 =
      Customer(name: "Sunjay", status: "Active", number: "9978254868");
  Customer customer2 =
      Customer(name: "Vinay", status: "Active", number: "9912857496");
  Customer customer3 =
      Customer(name: "Rohit", status: "Active", number: "9988112756");
  Customer customer4 =
      Customer(name: "Mohan", status: "Active", number: "9933445784");
  Customer customer5 =
      Customer(name: "Vinod", status: "Active", number: "990048726");
  Customer customer6 =
      Customer(name: "Khusi", status: "Active", number: "9934567890");
  Customer customer7 =
      Customer(name: "jignesh", status: "Active", number: "9978942356");
  bool isLoading = false;

  Product product1 =
      Product(name: "Fresh Peach", description: "dozen", qty: 0, price: 50);
  Product product2 =
      Product(name: "Avacado", description: "2.0 lbs", qty: 0, price: 100);
  Product product3 =
      Product(name: "Pineapple", description: "1.2 lbs", qty: 0, price: 80);
  Product product4 =
      Product(name: "Black Grapes", description: "dozen", qty: 0, price: 75);
  Product product5 =
  Product(name: "Fresh Peach1", description: "dozen", qty: 0, price: 50);
  Product product6 =
  Product(name: "Avacado1", description: "2.0 lbs", qty: 0, price: 100);
  Product product7 =
  Product(name: "Pineapple1", description: "1.2 lbs", qty: 0, price: 80);
  Product product8 =
  Product(name: "Black Grapes1", description: "dozen", qty: 0, price: 75);
  Product product9 =
  Product(name: "Fresh Peach2", description: "dozen", qty: 0, price: 50);
  Product product10 =
  Product(name: "Avacado2", description: "2.0 lbs", qty: 0, price: 100);
  Product product11 =
  Product(name: "Pineapple2", description: "1.2 lbs", qty: 0, price: 80);
  Product product12 =
  Product(name: "Black Grapes2", description: "dozen", qty: 0, price: 75);
  Product product13 =
  Product(name: "Fresh Peach4", description: "dozen", qty: 0, price: 50);
  Product product14 =
  Product(name: "Avacado4", description: "2.0 lbs", qty: 0, price: 100);
  Product product15 =
  Product(name: "Pineapple4", description: "1.2 lbs", qty: 0, price: 80);
  Product product16 =
  Product(name: "Black Grapes4", description: "dozen", qty: 0, price: 75);
  Product product17 =
  Product(name: "Fresh Peach5", description: "dozen", qty: 0, price: 50);
  Product product18 =
  Product(name: "Avacado5", description: "2.0 lbs", qty: 0, price: 100);
  Product product19 =
  Product(name: "Pineapple5", description: "1.2 lbs", qty: 0, price: 80);
  Product product20 =
  Product(name: "Black Grapes5", description: "dozen", qty: 0, price: 75);
  Product product21 =
  Product(name: "Fresh Peach6", description: "dozen", qty: 0, price: 50);
  Product product22 =
  Product(name: "Avacado6", description: "2.0 lbs", qty: 0, price: 100);
  Product product23 =
  Product(name: "Pineapple6", description: "1.2 lbs", qty: 0, price: 80);
  Product product24 =
  Product(name: "Black Grapes6", description: "dozen", qty: 0, price: 75);
  Product product25 =
  Product(name: "Fresh Peach7", description: "dozen", qty: 0, price: 50);
  Product product26 =
  Product(name: "Avacado7", description: "2.0 lbs", qty: 0, price: 100);
  Product product27 =
  Product(name: "Pineapple7", description: "1.2 lbs", qty: 0, price: 80);
  Product product28 =
  Product(name: "Black Grapes7", description: "dozen", qty: 0, price: 75);
  Product product29 =
  Product(name: "Fresh Peach8", description: "dozen", qty: 0, price: 50);
  Product product30 =
  Product(name: "Avacado8", description: "2.0 lbs", qty: 0, price: 100);
  Product product31 =
  Product(name: "Pineapple8", description: "1.2 lbs", qty: 0, price: 80);
  Product product32 =
  Product(name: "Black Grapes8", description: "dozen", qty: 0, price: 75);


  @override
  void initState() {
    searchView = TextEditingController();
    searchViewProduct = TextEditingController();
    for(int i=0;i<70;i++){
      myProductList!.add(Product(name: "Black Grapes${i}", description: "dozen", qty: 5, price: 10));

    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchView!.dispose();
    searchViewProduct!.dispose();
  }

  @override
  Widget build(BuildContext context) {

    myCustomerList = [
      customer1,
      customer2,
      customer3,
      customer4,
      customer5,
      customer6,
      customer7
    ];



    // myProductList = [product1, product2, product3, product4,product5,product6,product7,product8,product9,product10,product11,product12,product13,product14,product15,product16,
    //   product17, product18, product19, product20,product21,product22,product23,product24,product25,product26,product27,product28,product29,product30,product31,product32];

    return Scaffold(
      backgroundColor: appBlackColor,
      appBar: AppBar(
        backgroundColor: appBlackColor,
        title: const Text("Create Quotation"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15,bottom: 15,right: 13.0),
            child: Container(
              height: 25,
              child: SwitcherButton(
                value: isSwitched,
                size: 48,
                onColor: appGreenColor,
                offColor: appWhiteColor,
                onChange: (value) {
                 setState(() {
                    isSwitched = value;
                  });
                  // print(value);
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar:
      AppMainButton(
          onTap: () async {
            FocusScope.of(context).unfocus();
            final pdf = pw.Document();
            List<dynamic>.from(searchResultProductList.map((x) {
              print("searchResultProductList ${x.toJson()}");
            }));

            List<dynamic>.from(searchResultList.map((x) {
              print("searchResultList ${x.toJson()}");
            }));

            print("isSwitched $isSwitched");
            final iconImage = (await rootBundle.load(AssetConstants.appLogo)).buffer.asUint8List();
            // CommonMethod.writeOnProductPdf(
            //     pdf, searchResultProductList, "Quotation Invoice",iconImage,context);

            if(isSwitched){
              CommonMethod.writeOnProductPdf(
                  pdf, searchResultProductList, "Quotation Invoice",iconImage,context);
            }else{
              CommonMethod.writeOnProductWithPdf(
                  pdf, searchResultProductList, "Quotation Invoice",iconImage,context);
            }


            await CommonMethod.savePdf(pdf, "Quotation Invoice");
            File file =
                await CommonMethod.getFullPath(pdf, "Quotation Invoice");

            print("filePath ${file}");

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PdfPreviewScreen(
                        title: "Quotation Invoice",
                        file: file,
                        myQuotationList: searchResultProductList,isSwitched: isSwitched)));
          },
          text: 'Submit'),
      body: Column(
        children: [
          // CustomizedAppBar(
          //   title: 'Create Quotation',
          //   leading: AssetConstants.backArrowBlack,
          //   leadingOnTap: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: _searchView("Search number..."),
                      )),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: appWhiteColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (builder) =>
                                        const NumberRegister(isFlag:  true,)));
                              },
                              icon: const Icon(
                                Icons.add,
                                color: appGreyColor,
                              )),
                        ),
                      )
                    ],
                  ),
                  searchResult.isEmpty
                      ? searchResultList.isEmpty
                          ? const SizedBox(
                              height: 10,
                            )
                          : ListView.builder(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: searchResultList.length,
                              itemBuilder: (c, i) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: appWhiteColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  height: 93,
                                  margin: const EdgeInsets.only(
                                    bottom: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 90,
                                        padding: const EdgeInsets.all(12),
                                        color: Colors.transparent,
                                        child: Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            FittedBox(
                                                child: Image.asset(
                                                    AssetConstants.manIcon))
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(height: 2),
                                          Text(
                                            searchResultList[i].name ?? '',
                                            style: heading7.copyWith(
                                                color: appBlackColor),
                                          ),
                                          Text(
                                            searchResultList[i].status ?? '',
                                            style: paragraph6,
                                          ),
                                          Text(
                                            searchResultList[i].number ?? '',
                                            style: paragraph6,
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            searchResultList.removeAt(i);
                                            print(
                                                "searchResultList ${searchResultList}");
                                            searchResultListString.removeAt(i);
                                            print(
                                                "searchResultListString ${searchResultListString}");
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 12.0),
                                          child: Container(
                                            //color: Colors.transparent,
                                            height: 31,
                                            alignment: Alignment.center,
                                            child:
                                                // SvgPicture.asset(
                                                //   AssetConstants.subtractIcon,
                                                //   width: 25,
                                                //   color: appRedColor,
                                                // ),
                                                Image.asset(
                                              AssetConstants.removeCustomerIcon,
                                              width: 25,
                                              color: appRedColor,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            )
                      : ListView.builder(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          //reverse: true,
                          itemCount: searchResult.length,
                          itemBuilder: (c, i) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: appWhiteColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 93,
                              // padding: const EdgeInsets.only(right: 7),
                              margin: const EdgeInsets.only(
                                bottom: 10,
                              ),
                              // color: Colors.white,
                              child: Row(
                                children: [
                                  Container(
                                    width: 90,
                                    padding: const EdgeInsets.all(12),
                                    //color: Colors.transparent,
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        Container(
                                          child: FittedBox(
                                              child: Image.asset(
                                                  AssetConstants.manIcon)),
                                        )
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(height: 2),
                                      Text(
                                        searchResult[i].name ?? '',
                                        style: heading7.copyWith(
                                            color: appBlackColor),
                                      ),
                                      Text(
                                        searchResult[i].status ?? '',
                                        style: paragraph6,
                                      ),
                                      Text(
                                        searchResult[i].number ?? '',
                                        style: paragraph6,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  searchResultListString.contains(
                                          searchResult[i].name.toString())
                                      ? InkWell(
                                          onTap: () {
                                            setState(() {
                                              searchResultList.removeWhere(
                                                  (item) =>
                                                      item.name ==
                                                      searchResult[i]
                                                          .name
                                                          .toString());
                                              searchResultListString.remove(
                                                  searchResult[i]
                                                      .name
                                                      .toString());
                                              print(
                                                  "searchResultList ${searchResultList}");
                                              print(
                                                  "searchResultListString ${searchResultListString}");
                                            });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12.0),
                                            child: Container(
                                             // color: Colors.transparent,
                                              height: 31,
                                              alignment: Alignment.center,
                                              child:
                                                  // SvgPicture.asset(
                                                  //   AssetConstants.subtractIcon,
                                                  //   width: 25,
                                                  //   color: appRedColor,
                                                  // ),
                                                  Image.asset(
                                                AssetConstants
                                                    .removeCustomerIcon,
                                                width: 25,
                                                color: appRedColor,
                                              ),
                                            ),
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            setState(() {
                                              searchResultList.add(Customer(
                                                  name: searchResult[i].name,
                                                  status:
                                                      searchResult[i].status,
                                                  number:
                                                      searchResult[i].number));
                                              searchResultListString.add(
                                                  searchResult[i]
                                                      .name
                                                      .toString());
                                              print(
                                                  "searchResultList ${searchResultList}");
                                              print(
                                                  "searchResultListString ${searchResultListString}");
                                            });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12.0),
                                            child: Container(
                                              //color: Colors.transparent,
                                              height: 31,
                                              alignment: Alignment.center,
                                              child:
                                                  // TextButton(child: const Text("Add",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 17),),onPressed: (){
                                                  //
                                                  // },)
                                                  Image.asset(
                                                AssetConstants.addCustomerIcon,
                                                width: 25,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            );
                          },
                        ),



                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                            child: _searchViewProduct("Search funipart code..."),
                          )),
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 10.0,left: 10.0),
                      //   child: Container(
                      //     height: 25,
                      //     child: SwitcherButton(
                      //       value: true,
                      //       size: 48,
                      //       onColor: appGreyColor,
                      //       offColor: appWhiteColor,
                      //       onChange: (value) {
                      //         setState(() {
                      //           isSwitched = value;
                      //         });
                      //         print(value);
                      //       },
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                  searchResultProduct.isEmpty
                      ? searchResultProductList.isEmpty
                      ? const SizedBox(
                    height: 10,
                  )
                      :
                  ListView.builder(
                    padding:
                    EdgeInsets.only(left: 10, right: 10, top: 10),
                    physics: NeverScrollableScrollPhysics(),

                    shrinkWrap: true,
                    //reverse: true,
                    itemCount: searchResultProductList.length,
                    itemBuilder: (c, i) {
                      return InkWell(
                        onTap: (){
                          FocusScope.of(context).unfocus();
                          Navigator.of(context).push(MaterialPageRoute(builder: (builder) =>  ProductDetail(product: myProductList![i])));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: appWhiteColor,
                              borderRadius: BorderRadius.circular(5)),
                          height: 89.5,
                          padding: const EdgeInsets.only(right: 7),
                          margin: const EdgeInsets.only(
                            bottom: 10,
                          ),
                          // color: Colors.white,
                          child: Row(
                            children: [
                              // Container(
                              //   width: 104,
                              //   padding: const EdgeInsets.all(12),
                              //  // color: Colors.transparent,
                              //   child: Stack(
                              //     fit: StackFit.expand,
                              //     children: [
                              //       Container(
                              //         child: FittedBox(
                              //             child: Image.asset(
                              //                 AssetConstants.manIcon)),
                              //       )
                              //     ],
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 2),
                                    Text(
                                      searchResultProductList[i].name ??
                                          '',
                                      style: heading7.copyWith(
                                          color: appBlackColor),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      searchResultProductList[i]
                                          .description ??
                                          '',
                                      style: paragraph6,
                                    ),
                                    const SizedBox(height: 2),
                                    Text("₹ "+
                                        searchResultProductList[i]
                                            .price.toString()
                                      ,
                                      style: priceStyle,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (searchResultProductList[i]
                                          .qty! >
                                          0) {
                                        searchResultProductList[i].qty =
                                            searchResultProductList[i]
                                                .qty! -
                                                1;
                                        for (var exp
                                        in myProductList!) {
                                          if (exp.name ==
                                              searchResultStringProductList[
                                              i]) {
                                            exp.qty = exp.qty! - 1;
                                          }
                                        }
                                        print(
                                            "searchResultProductList -------${searchResultProductList[i].qty}");
                                      }
                                    });
                                  },
                                  child: _addAndRemoveButton("-")),
                              // _addAndRemoveButton("-"),
                              Text(
                                searchResultProductList[i]
                                    .qty
                                    .toString(),
                                style: const TextStyle(
                                    color: appBlackColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                  onTap: () {
                                    // setState(() {
                                    //   searchResultProductList[i].qty =
                                    //       searchResultProductList[i]
                                    //           .qty! +
                                    //           1;
                                    //   for (var exp in myProductList!) {
                                    //     if (exp.name ==
                                    //         searchResultStringProductList[
                                    //         i]) {
                                    //       exp.qty = exp.qty! + 1;
                                    //     }
                                    //   }
                                    //   print(
                                    //       "searchResultProductList +++++${searchResultProductList[i].qty}");
                                    // });
                                  },
                                  child: _addAndRemoveButton("+")),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    searchResultProductList.removeAt(i);
                                    //myProductList!.firstWhere((element) => element.name == searchResultStringProductList[i]);
                                    for (var exp in myProductList!) {
                                      if (exp.name ==
                                          searchResultStringProductList[
                                          i]) {
                                        exp.qty = 0;
                                        print("exp.qty ${exp.qty}");
                                        print("exp.name ${exp.name}");
                                      }
                                    }
                                    // searchResultProduct[searchResultProductList[i].index!].qty = 0;
                                    // searchResultProductList[i].qty = 0 ;
                                    print(
                                        "searchResultProductList ${searchResultProductList}");
                                    searchResultStringProductList
                                        .removeAt(i);
                                    print(
                                        "searchResultStringProductList ${searchResultStringProductList}");
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 12.0),
                                  child: Container(
                                    // color: Colors.transparent,
                                    height: 31,
                                    alignment: Alignment.center,
                                    child:
                                    // SvgPicture.asset(
                                    //   AssetConstants.subtractIcon,
                                    //   width: 25,
                                    //   color: appRedColor,
                                    // ),
                                    Image.asset(
                                      AssetConstants.removeProductIcon,
                                      width: 25,
                                      color: appRedColor,
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),
                      );
                    },
                  )
                      :
                  ListView.builder(
                    padding:
                    const EdgeInsets.only(left: 10, right: 10, top: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    //reverse: true,
                    itemCount: searchResultProduct.length,
                    itemBuilder: (c, i) {
                      return InkWell(
                        onTap: (){
                          FocusScope.of(context).unfocus();
                         // Navigator.of(context).push(MaterialPageRoute(builder: (builder) =>  ProductDetail(product: searchResult[i])));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: appWhiteColor,
                              borderRadius: BorderRadius.circular(5)),
                          height: 89.5,
                          padding: const EdgeInsets.only(right: 7),
                          margin: const EdgeInsets.only(
                            bottom: 10,
                          ),
                          // color: Colors.white,
                          child: Row(
                            children: [
                              // Container(
                              //   width: 104,
                              //   padding: const EdgeInsets.all(12),
                              //  // color: Colors.transparent,
                              //   child: Stack(
                              //     fit: StackFit.expand,
                              //     children: [
                              //       Container(
                              //         child: FittedBox(
                              //             child: Image.asset(
                              //                 AssetConstants.manIcon)),
                              //       )
                              //     ],
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 2),
                                    Text(
                                      searchResultProduct[i].name ??
                                          '',
                                      style: heading7.copyWith(
                                          color: appBlackColor),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      searchResultProduct[i]
                                          .description ??
                                          '',
                                      style: paragraph6,
                                    ),
                                    const SizedBox(height: 2),
                                    Text("₹ "+
                                        searchResultProduct[i]
                                            .price.toString()
                                      ,
                                      style: priceStyle,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                  onTap: () {
                                    // setState(() {
                                    //   if (searchResultProductList[i]
                                    //       .qty! >
                                    //       0) {
                                    //     searchResultProductList[i].qty =
                                    //         searchResultProductList[i]
                                    //             .qty! -
                                    //             1;
                                    //     for (var exp
                                    //     in myProductList!) {
                                    //       if (exp.name ==
                                    //           searchResultStringProductList[
                                    //           i]) {
                                    //         exp.qty = exp.qty! - 1;
                                    //       }
                                    //     }
                                    //     print(
                                    //         "searchResultProductList -------${searchResultProductList[i].qty}");
                                    //   }
                                    // });
                                  },
                                  child: _addAndRemoveButton("-")),
                              // _addAndRemoveButton("-"),
                              Text(
                                searchResultProduct[i]
                                    .qty
                                    .toString(),
                                style: const TextStyle(
                                    color: appBlackColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                  onTap: () {
                                    // setState(() {
                                    //   searchResultProductList[i].qty =
                                    //       searchResultProductList[i]
                                    //           .qty! +
                                    //           1;
                                    //   for (var exp in myProductList!) {
                                    //     if (exp.name ==
                                    //         searchResultStringProductList[
                                    //         i]) {
                                    //       exp.qty = exp.qty! + 1;
                                    //     }
                                    //   }
                                    //   print(
                                    //       "searchResultProductList +++++${searchResultProductList[i].qty}");
                                    // });
                                  },
                                  child: _addAndRemoveButton("+")),
                              searchResultStringProductList.contains(
                                  searchResultProduct[i].name.toString())?
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    searchResultProductList.removeWhere(
                                            (item) =>
                                        item.name ==
                                            searchResultProduct[i]
                                                .name
                                                .toString());
                                    searchResultStringProductList.remove(
                                        searchResultProduct[i]
                                            .name
                                            .toString());
                                    print(
                                        "searchResultProductList ${searchResultProductList}");
                                    print(
                                        "searchResultStringProductList ${searchResultStringProductList}");
                                  });
                                  // setState(() {
                                  //   searchResultProductList.add(Product(
                                  //       name: searchResultProduct[i].name,
                                  //       description:
                                  //       searchResultProduct[i].description,
                                  //       price:
                                  //       searchResultProduct[i].price,
                                  //   ));
                                  //   searchResultStringProductList.add(
                                  //       searchResultProduct[i]
                                  //           .name
                                  //           .toString());
                                  //   print(
                                  //       "searchResultList $searchResultProduct");
                                  //   print(
                                  //       "searchResultListString $searchResultStringProductList");
                                  // });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 12.0),
                                  child: Container(
                                    // color: Colors.transparent,
                                    height: 31,
                                    alignment: Alignment.center,
                                    child:
                                    // SvgPicture.asset(
                                    //   AssetConstants.subtractIcon,
                                    //   width: 25,
                                    //   color: appRedColor,
                                    // ),
                                    Image.asset(
                                      AssetConstants.removeProductIcon,
                                      width: 25,
                                      color: appRedColor,
                                    ),
                                  ),
                                ),
                              ):InkWell(
                                onTap: () {
                                  setState(() {
                                    searchResultProductList.add(Product(
                                      name: searchResultProduct[i].name,
                                      description:
                                      searchResultProduct[i].description,
                                      price:
                                      searchResultProduct[i].price,
                                      qty: searchResultProduct[i].qty
                                    ));
                                    searchResultStringProductList.add(
                                        searchResultProduct[i]
                                            .name
                                            .toString());
                                    print(
                                        "searchResultProductList $searchResultProductList");
                                    print(
                                        "searchResultStringProductList $searchResultStringProductList");
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 12.0),
                                  child: Container(
                                    // color: Colors.transparent,
                                    height: 31,
                                    alignment: Alignment.center,
                                    child:
                                    // SvgPicture.asset(
                                    //   AssetConstants.subtractIcon,
                                    //   width: 25,
                                    //   color: appRedColor,
                                    // ),
                                    Image.asset(
                                      AssetConstants.addProductIcon,
                                      width: 25,
                                      color: appGreenColor,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  //Text("ewfewfewfew",style: TextStyle(color: Colors.red),),


























                  // _searchView(),

                  // Country Dropdown Box
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchView(String string) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: appWhiteColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: TextField(
          controller: searchView,
          style: const TextStyle(
              color: appGreyColor, fontWeight: FontWeight.w500, fontSize: 15),
          textInputAction: TextInputAction.search,
          maxLines: 1,
          textAlignVertical: TextAlignVertical.center,
          cursorColor: appGreyColor,
          onChanged: (value) {
            setState(() {
              search = true;
              onSearchTextChangedICD(value);
            });
          },
          decoration: InputDecoration(
              isCollapsed: true,
              border: InputBorder.none,
              label: Padding(
                padding: EdgeInsets.only(top: 3),
                child: Text(
                  '$string',
                  style: TextStyle(
                      color: appGreyColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
              labelStyle: paragraph4,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              prefixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(start: 4),
                child: Container(
                  width: 48,
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetConstants.searchIcon,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(start: 4),
                child: Container(
                  width: 48,
                  alignment: Alignment.center,
                  child:
                  InkWell(
                    onTap: () {
                      searchView!.clear();
                      setState(() {
                        searchResult.clear();
                      });
                    },
                    child: const Icon(
                      Icons.close,
                      color: appGreyColor,
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }

  Widget _searchViewProduct(String string) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color:  appWhiteColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: TextField(
          controller: searchViewProduct,
          style: const TextStyle(
              color: appGreyColor, fontWeight: FontWeight.w500, fontSize: 15),
          textInputAction: TextInputAction.search,
          maxLines: 1,
          textAlignVertical: TextAlignVertical.center,
          cursorColor: appGreyColor,
          //keyboardType: TextInputType.text,
          //textAlign: TextAlign.left,
          onChanged: (value) {
            setState(() {
              searchProduct = true;
              onSearchTextChangedICDProduct(value);
            });
          },
          decoration: InputDecoration(
              isCollapsed: true,
              border: InputBorder.none,
              label: Padding(
                padding: EdgeInsets.only(top: 3),
                child: Text(
                  '$string',
                  style: TextStyle(
                      color: appGreyColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
              labelStyle: paragraph4,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              prefixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(start: 4),
                child: Container(
                  width: 48,
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetConstants.searchIcon,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(start: 4),
                child: Container(
                  width: 48,
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      searchViewProduct!.clear();
                      setState(() {
                        searchResultProduct.clear();
                      });
                    },
                    child: const Icon(
                      Icons.close,
                      color: appGreyColor,
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }

  onSearchTextChangedICD(String text) async {
    searchResult.clear();
    print("$text value from search");
    if (text.isEmpty) {
      setState(() {
        search = false;
      });
      return;
    }

    for (var exp in myCustomerList!) {
      if (exp.number!.toLowerCase().contains(text.toLowerCase())) {
        searchResult.add(exp);
        print("number  ${exp.number!}");
      }
    }
  }

  onSearchTextChangedICDProduct(String text) async {
    searchResultProduct.clear();
    print("$text value from search");
    if (text.isEmpty) {
      setState(() {
        searchProduct = false;
      });
      return;
    }

    for (var exp in myProductList!) {
      if (exp.name!.toLowerCase().contains(text.toLowerCase())) {
        searchResultProduct.add(exp);
        print("exp  ${exp.name!}");
      }
    }
  }

  _addAndRemoveButton(String iconText) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: appRedColor,
          borderRadius: BorderRadius.circular(5),
        ),
        height: 25,
        width: 25,
        alignment: Alignment.center,
        child: Text(iconText,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: appWhiteColor,
            )),
        // Image.asset(
        //   AssetConstants.removeProductIcon,
        //   width: 25,
        //   color: appRedColor,
        // ),
      ),
    );
  }
}
class SwitchScreen extends StatefulWidget {
  const SwitchScreen({Key? key}) : super(key: key);

  @override
  SwitchClass createState() => SwitchClass();
}

class SwitchClass extends State {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }
  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[ Transform.scale(
            scale: 1.2,
            child: Switch(
              onChanged: toggleSwitch,
              value: isSwitched,
              activeColor: Colors.blue,
              activeTrackColor: Colors.yellow,
              inactiveThumbColor: Colors.redAccent,
              inactiveTrackColor: Colors.orange,
            )
        ),
        ]);
  }
}