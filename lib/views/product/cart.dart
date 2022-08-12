import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnipart_sales/constants/asset_constants.dart';
import 'package:furnipart_sales/constants/colors.dart';
import 'package:furnipart_sales/model/product.dart';
import 'package:furnipart_sales/shared/styles.dart';
import 'package:furnipart_sales/views/product/product_detail.dart';
import 'package:furnipart_sales/views/product/product_grid_list.dart';
import 'package:furnipart_sales/widgets/app_main_button.dart';
import 'package:furnipart_sales/widgets/customized_app_bar.dart';

import 'search_bar.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Product> searchResult = [];
  List<Product> searchResultProductList = [];
  List<Product>? myProductList;
  TextEditingController? searchView;
  bool search = false;

  Product product1 =
      Product(name: "Fresh Peach", description: "dozen", qty: 0, price: 50);
  Product product2 =
      Product(name: "Avacado", description: "2.0 lbs", qty: 0, price: 100);
  Product product3 =
      Product(name: "Pineapple", description: "1.2 lbs", qty: 0, price: 80);
  Product product4 =
      Product(name: "Black Grapes", description: "dozen", qty: 0, price: 75);
  Product product5 =
  Product(name: "Fresh Peach", description: "dozen", qty: 0, price: 50);
  Product product6 =
  Product(name: "Avacado", description: "2.0 lbs", qty: 0, price: 100);
  Product product7 =
  Product(name: "Pineapple", description: "1.2 lbs", qty: 0, price: 80);
  Product product8 =
  Product(name: "Black Grapes", description: "dozen", qty: 0, price: 75);

  @override
  void initState() {
    searchView = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchView!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    myProductList = [product1, product2, product3, product4, product5, product6, product7, product8];
    // WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    //   SystemChrome.setSystemUIOverlayStyle(
    //     const SystemUiOverlayStyle(
    //         statusBarColor: Colors.transparent,
    //         statusBarIconBrightness: Brightness.dark),
    //   );
    // });
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appBlackColor,
          title: const Text("Cart"),
          centerTitle: true,

        ),
        backgroundColor: Colors.black,
        //floatingActionButton: const FloatingCartButton(),
        // drawer: const CustomHomeDrawer(),
        bottomNavigationBar: Container(
          height: 215,
          margin: const EdgeInsets.only(top: 13),
          constraints: const BoxConstraints(minHeight: 100),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 22),
              _titleWithCost("SubTitle",paragraph6),
              const SizedBox(height: 7),
              _titleWithCost("Charges", paragraph6),
              const SizedBox(height: 10),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                height: 1,
                color: appGreySecondary,
              ),
              _titleWithCost("Total", paragraph5),
              const SizedBox(height: 10),
              AppMainButton(
                  onTap: () {
                    // viewModel.moveToCheckout();
                  },
                  text: 'Checkout'),
              const SizedBox(height: 10),
            ],
          ),
        ),
        body: Column(
          children: [
            // CustomizedAppBar(
            //   title: 'Cart',
            //   leading: AssetConstants.backArrowBlack,
            //   leadingOnTap: () {
            //     Navigator.of(context).pop();
            //   },
            // ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //_searchView(),
                    searchResult.isEmpty
                        ? ListView.builder(
                            padding:
                                EdgeInsets.only(left: 10, right: 10, top: 10),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            //reverse: true,
                            itemCount: myProductList!.length,
                            itemBuilder: (c, i) {
                              return InkWell(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (builder) => ProductDetail(
                                          product: myProductList![i])));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: appWhiteColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  height: 95,
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
                                        padding:
                                            const EdgeInsets.only(left: 25.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(height: 2),
                                            Text(
                                              myProductList![i].name ?? '',
                                              style: heading7.copyWith(
                                                  color: appBlackColor),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              myProductList![i].description ??
                                                  '',
                                              style: paragraph6,
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              "₹ " +
                                                  myProductList![i]
                                                      .price
                                                      .toString(),
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
                                        myProductList![i].qty.toString(),
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
                                          // setState(() {
                                          //   searchResultProductList.removeAt(i);
                                          //   //myProductList!.firstWhere((element) => element.name == searchResultStringProductList[i]);
                                          //   for (var exp in myProductList!) {
                                          //     if (exp.name ==
                                          //         searchResultStringProductList[
                                          //         i]) {
                                          //       exp.qty = 0;
                                          //       print("exp.qty ${exp.qty}");
                                          //       print("exp.name ${exp.name}");
                                          //     }
                                          //   }
                                          //   // searchResultProduct[searchResultProductList[i].index!].qty = 0;
                                          //   // searchResultProductList[i].qty = 0 ;
                                          //   print(
                                          //       "searchResultProductList ${searchResultProductList}");
                                          //   searchResultStringProductList
                                          //       .removeAt(i);
                                          //   print(
                                          //       "searchResultStringProductList ${searchResultStringProductList}");
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
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : ListView.builder(
                            padding:
                                EdgeInsets.only(left: 10, right: 10, top: 10),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            //reverse: true,
                            itemCount: searchResult.length,
                            itemBuilder: (c, i) {
                              return InkWell(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (builder) => ProductDetail(
                                          product: searchResult[i])));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: appWhiteColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  height: 100,
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
                                        padding:
                                            const EdgeInsets.only(left: 25.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(height: 2),
                                            Text(
                                              searchResult[i].name ?? '',
                                              style: heading7.copyWith(
                                                  color: appBlackColor),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              searchResult[i].description ?? '',
                                              style: paragraph6,
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              "₹ " +
                                                  searchResult[i]
                                                      .price
                                                      .toString(),
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
                                        searchResult[i].qty.toString(),
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
                                          // setState(() {
                                          //   searchResultProductList.removeAt(i);
                                          //   //myProductList!.firstWhere((element) => element.name == searchResultStringProductList[i]);
                                          //   for (var exp in myProductList!) {
                                          //     if (exp.name ==
                                          //         searchResultStringProductList[
                                          //         i]) {
                                          //       exp.qty = 0;
                                          //       print("exp.qty ${exp.qty}");
                                          //       print("exp.name ${exp.name}");
                                          //     }
                                          //   }
                                          //   // searchResultProduct[searchResultProductList[i].index!].qty = 0;
                                          //   // searchResultProductList[i].qty = 0 ;
                                          //   print(
                                          //       "searchResultProductList ${searchResultProductList}");
                                          //   searchResultStringProductList
                                          //       .removeAt(i);
                                          //   print(
                                          //       "searchResultStringProductList ${searchResultStringProductList}");
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
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _titleWithCost(String title, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title",
            style: style,
          ),
          Text(
            '\$' + 10.toStringAsFixed(1),
            style: style,
          ),
        ],
      ),
    );
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

  Widget _searchView() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 00),
      child: Container(
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
            //keyboardType: TextInputType.text,
            //textAlign: TextAlign.left,
            onChanged: (value) {
              setState(() {
                search = true;
                onSearchTextChangedICD(value);
              });
            },
            decoration: InputDecoration(
              isCollapsed: true,
              border: InputBorder.none,
              label: const Padding(
                padding: EdgeInsets.only(top: 3),
                child: Text(
                  'Search keywords...',
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
                padding: const EdgeInsets.only(right: 3),
                child: Container(
                  width: 49,
                  alignment: Alignment.center,
                  child: InkWell(
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
              ),
            ),
          ),
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

    for (var exp in myProductList!) {
      if (exp.name!.toLowerCase().contains(text.toLowerCase())) {
        searchResult.add(exp);
        print("exp  ${exp.description!}");
      }
    }
    //print("search objects ${_searchResult.first}");
    // print("search result length ${searchResult.length}");
    // setState(() {});
  }
}
