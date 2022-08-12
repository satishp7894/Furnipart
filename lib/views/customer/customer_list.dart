import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnipart_sales/constants/asset_constants.dart';
import 'package:furnipart_sales/constants/colors.dart';
import 'package:furnipart_sales/model/customer.dart';
import 'package:furnipart_sales/model/product.dart';
import 'package:furnipart_sales/shared/styles.dart';
import 'package:furnipart_sales/utils/common_method.dart';
import 'package:furnipart_sales/views/customer/customer_profile.dart';
import 'package:furnipart_sales/views/product/product_grid_list.dart';
import 'package:furnipart_sales/views/quotation/quotation_list.dart';
import 'package:furnipart_sales/widgets/authentication_field.dart';
import 'package:furnipart_sales/widgets/customized_app_bar.dart';
import 'package:furnipart_sales/widgets/validation_message.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class CustomertList extends StatefulWidget {
  const CustomertList({Key? key}) : super(key: key);

  @override
  State<CustomertList> createState() => _CustomertListState();
}

class _CustomertListState extends State<CustomertList> {
  List<Customer> searchResult = [];
  List<Customer>? myCustomerList;
  List<Customer>? myCustomerFilterList = [];
  TextEditingController? searchView;
  bool search = false;
  bool isFilter = true;

  Customer customer1 = Customer(
      name: "Sanjay",
      status: "Active",
      dateTime: DateTime.parse("2022-05-01 00:00:00"));
  Customer customer2 = Customer(
      name: "Vinay",
      status: "Active",
      dateTime: DateTime.parse("2022-05-02 00:00:00"));
  Customer customer3 = Customer(
      name: "Rohit",
      status: "Active",
      dateTime: DateTime.parse("2022-05-10 00:00:00"));
  Customer customer4 = Customer(
      name: "Mohan",
      status: "Active",
      dateTime: DateTime.parse("2022-05-04 00:00:00"));
  Customer customer5 = Customer(
      name: "Vinod",
      status: "Active",
      dateTime: DateTime.parse("2022-05-05 00:00:00"));
  Customer customer6 = Customer(
      name: "Khusi",
      status: "Active",
      dateTime: DateTime.parse("2022-05-06 00:00:00"));
  Customer customer7 = Customer(
      name: "Jignesh",
      status: "Active",
      dateTime: DateTime.parse("2022-05-07 00:00:00"));
  Customer customer8 = Customer(
      name: "Rahul",
      status: "Active",
      dateTime: DateTime.parse("2022-05-09 00:00:00"));
  Customer customer9 = Customer(
      name: "Shivani",
      status: "Active",
      dateTime: DateTime.parse("2022-05-12 00:00:00"));

  TextEditingController startDate = TextEditingController();
  FocusNode startDateFocus = FocusNode();
  TextEditingController endDate = TextEditingController();
  FocusNode endDateFocus = FocusNode();

  DateTime? start;
  DateTime? end;

  bool formStartDateHasError = false;
  bool formEndDateHasError = false;

  String formStartDate = '';
  String? formStartDateError = 'Field cannot be empty';
  String formEndDate = '';
  String? formEndDateError = 'Field cannot be empty';

  void validateStartDateField() {
    if (formStartDate.isEmpty) {
      formStartDateError = 'Field cannot be empty';
      formStartDateHasError = true;
    } else if (start!.isBefore(end!)) {
      formStartDateError = 'Enter a valid date';
      formStartDateHasError = true;
    } else {
      formStartDateHasError = false;
    }
    setState(() {});
  }

  void validateEndDateField() {
    if (formEndDate.isEmpty) {
      formEndDateError = 'Field cannot be empty';
      formEndDateHasError = true;
    } else if (formEndDate.length < 3) {
      formEndDateError = 'Enter a valid address';
      formEndDateHasError = true;
    } else {
      formEndDateHasError = false;
    }
    setState(() {});
  }

  final pdf = pw.Document();

  @override
  void initState() {
    searchView = TextEditingController();
    myCustomerList = [
      customer1,
      customer2,
      customer3,
      customer4,
      customer5,
      customer6,
      customer7,
      customer8,
      customer9
    ];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchView!.dispose();
  }

  // Future savePdf() async {
  //   Directory documentDirectory = await getApplicationDocumentsDirectory();
  //   String documentPath = documentDirectory.path;
  //   File file = File("$documentPath/customer.pdf");
  //   if (await file.exists()) {
  //     // file.delete();
  //     print("already file exist");
  //   } else {
  //     print(" file not exist");
  //     file.writeAsBytesSync(List.from(await pdf.save()));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
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
          title: const Text("Customer List"),
          actions: [
            PopupMenuButton(
                child: Container(
                  height: 26,
                  width: 40,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 17.41),
                  child: Image.asset(
                    AssetConstants.menuIcon,
                    color: appWhiteColor,
                    width: 23,
                    fit: BoxFit.contain,
                  ),
                ),
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: const Text("Generate PDF.."),
                        value: 1,
                        onTap: () async {
                          CommonMethod.writeOnPdf(
                              pdf, myCustomerList, "Customer List");
                          await CommonMethod.savePdf(pdf, "Customer");
                          File file =
                              await CommonMethod.getFullPath(pdf, "Customer");

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => PdfPreviewScreen(
                          //             title: "Customer List",
                          //             file: file,
                          //             myQuotationList: myCustomerList!)));
                        },
                      ),
                    ])
          ],
        ),
        backgroundColor: appBlackColor,
        //floatingActionButton: const FloatingCartButton(),
        // drawer: const CustomHomeDrawer(),
        body: Column(
          children: [
            // CustomizedAppBar(
            //   title: 'Customer List',
            //   leading: AssetConstants.backArrowBlack,
            //   leadingOnTap: () {
            //     Navigator.of(context).pop();
            //   },
            // ),
            Row(
              children: [
                Expanded(child: _searchView()),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFilter = !isFilter;
                        startDate.clear();
                        start = null;
                        end = null;
                        endDate.clear();
                        myCustomerFilterList!.clear();
                        formStartDateHasError = false;
                        formEndDateHasError = false;
                        myCustomerList = [
                          customer1,
                          customer2,
                          customer3,
                          customer4,
                          customer5,
                          customer6,
                          customer7
                        ];
                        print("isFilter $isFilter");
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 70,
                      decoration: BoxDecoration(
                        color: appWhiteColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset(
                          AssetConstants.filterIcon,
                          width: 19,
                          height: 17,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    isFilter ? Container() : filterContainer(),
                    searchResult.length == 0
                        ?
                        // model.hasError
                        //     ? const PageErrorIndicator()
                        //     : model.isLoading
                        //     ? const LoadingIndicator()
                        //     :

                        ListView.builder(
                            padding:
                                EdgeInsets.only(left: 10, right: 10, top: 0),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            //reverse: true,
                            itemCount: myCustomerList!.length,
                            itemBuilder: (c, i) {
                              return InkWell(
                                onTap: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (_)=>  CustomerProfile(customerObj : myCustomerList![i])));
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Details()));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: appWhiteColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  height: 89.5,
                                  padding: EdgeInsets.only(right: 7),
                                  margin: const EdgeInsets.only(
                                    bottom: 10,
                                  ),
                                  // color: Colors.white,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 90,
                                        padding: EdgeInsets.all(12),
                                        //  color: Colors.transparent,
                                        child: Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            // Container(
                                            //   margin: const EdgeInsets.only(bottom: 18),
                                            //   child: FittedBox(
                                            //     child: Container(
                                            //       height: 10,
                                            //       width: 10,
                                            //       decoration: BoxDecoration(
                                            //         color: Color(
                                            //           int.parse(
                                            //             '0xFF' +
                                            //                 viewModel.cart[index].color
                                            //                     .toString()
                                            //                     .substring(1),
                                            //           ),
                                            //         ).withOpacity(0.3),
                                            //         shape: BoxShape.circle,
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(height: 2),
                                          // Text(
                                          //   '\$' +
                                          //       (viewModel.cart[index].price ?? 0)
                                          //           .toString()
                                          //           .padRight(4, '0') +
                                          //       ' x ' +
                                          //       (viewModel.cart[index].qty ?? 0).toString(),
                                          //   style: paragraph6.copyWith(color: appGreenColor),
                                          // ),
                                          Text(
                                            myCustomerList![i].name ?? '',
                                            style: heading7.copyWith(
                                                color: appBlackColor),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            myCustomerList![i].status ?? '',
                                            style: paragraph6,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            DateFormat('dd-MM-yyyy').format(
                                                myCustomerList![i].dateTime ??
                                                    DateTime.now()),
                                            //myCustomerList![i].dateTime.toString(),
                                            style: paragraph6,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : ListView.builder(
                            padding:
                                EdgeInsets.only(left: 10, right: 10, top: 0),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            //reverse: true,
                            itemCount: searchResult.length,
                            itemBuilder: (c, i) {
                              return InkWell(
                                onTap: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (_)=>  CustomerProfile(customerObj : searchResult[i])));
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Details()));
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
                                      Container(
                                        width: 90,
                                        padding: EdgeInsets.all(12),
                                        //  color: Colors.transparent,
                                        child: Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            // Container(
                                            //   margin: const EdgeInsets.only(bottom: 18),
                                            //   child: FittedBox(
                                            //     child: Container(
                                            //       height: 10,
                                            //       width: 10,
                                            //       decoration: BoxDecoration(
                                            //         color: Color(
                                            //           int.parse(
                                            //             '0xFF' +
                                            //                 viewModel.cart[index].color
                                            //                     .toString()
                                            //                     .substring(1),
                                            //           ),
                                            //         ).withOpacity(0.3),
                                            //         shape: BoxShape.circle,
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(height: 2),
                                          // Text(
                                          //   '\$' +
                                          //       (viewModel.cart[index].price ?? 0)
                                          //           .toString()
                                          //           .padRight(4, '0') +
                                          //       ' x ' +
                                          //       (viewModel.cart[index].qty ?? 0).toString(),
                                          //   style: paragraph6.copyWith(color: appGreenColor),
                                          // ),
                                          Text(
                                            searchResult[i].name ?? '',
                                            style: heading7.copyWith(
                                                color: appBlackColor),
                                          ),
                                          Text(
                                            searchResult[i].status ?? '',
                                            style: paragraph6,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            DateFormat('dd-MM-yyyy').format(
                                                searchResult[i].dateTime ??
                                                    DateTime.now()),
                                            //myCustomerList![i].dateTime.toString(),
                                            style: paragraph6,
                                          ),
                                        ],
                                      ),
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

  Widget _searchView() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 15, top: 0),
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
              // suffixIcon: Padding(
              //   padding: const EdgeInsets.only(right: 3),
              //   child: Container(
              //     width: 49,
              //     alignment: Alignment.center,
              //     child: Image.asset(
              //       AssetConstants.filterIcon,
              //       width: 19,
              //       height: 17,
              //     ),
              //   ),
              // ),
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

    for (var exp in myCustomerList!) {
      if (exp.name!.toLowerCase().contains(text.toLowerCase())) {
        setState(() {
          searchResult.add(exp);
          print("exp  ${exp.name!}");
        });
      }
    }
    //print("search objects ${_searchResult.first}");
    // print("search result length ${searchResult.length}");
    // setState(() {});
  }

  filterContainer() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: Duration(
                        milliseconds: formStartDateError == true ? 300 : 200),
                    alignment: Alignment.center,
                    height: 62,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: appWhiteColor,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 2,
                        color: formStartDateHasError == true
                            ? Colors.red
                            : Colors.transparent,
                      ),
                    ),
                    child: TextFormField(
                      //enabled: false,
                      readOnly: true,
                      style: heading3.copyWith(
                          letterSpacing: 15 * (3 / 100),
                          color: appGreyColor,
                          fontSize: 15),
                      controller: startDate,
                      focusNode: startDateFocus,
                      textInputAction: TextInputAction.done,
                      maxLines: 1,
                      textAlignVertical: TextAlignVertical.center,
                      onChanged: (text) {
                        formStartDate = text;
                        formStartDateHasError = false;
                        validateStartDateField();
                      },
                      //onFieldSubmitted: onSubmit,
                      onTap: () {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1999, 1),
                            lastDate: DateTime(2050, 12),
                            builder: (context, picker) {
                              return picker!;
                            }).then((selectedDate) {
                          //TODO: handle selected date
                          if (selectedDate != null) {
                            start = selectedDate;
                            startDate.text =
                                DateFormat('dd-MM-yyyy ').format(selectedDate);
                            ;
                          }
                        });
                      },
                      // onEditingComplete: onEditingComplete,
                      //obscureText: obscureText,
                      obscuringCharacter: '•',
                      decoration: InputDecoration(
                        isCollapsed: true,
                        border: InputBorder.none,
                        label: const Text("Start Date"),
                        labelStyle:
                            heading3.copyWith(letterSpacing: 15 * (3 / 100)),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        prefixIcon: Container(
                          margin: const EdgeInsets.only(right: 2),
                          width: 60,
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.today,
                            color: appGreyColor,
                            size: 30,
                          ),
                        ),
                        // suffixIcon: suffixIcon
                      ),
                    ),
                  ),
                  ValidationMessage(
                    hasError: formStartDateHasError,
                    errorMessage: formStartDateError,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: Duration(
                        milliseconds: formEndDateHasError == true ? 300 : 200),
                    alignment: Alignment.center,
                    height: 62,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: appWhiteColor,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 2,
                        color: formEndDateHasError == true
                            ? Colors.red
                            : Colors.transparent,
                      ),
                    ),
                    child: TextFormField(
                      //enabled: false,
                      readOnly: true,
                      style: heading3.copyWith(
                          letterSpacing: 15 * (3 / 100),
                          color: appGreyColor,
                          fontSize: 15),
                      controller: endDate,
                      focusNode: endDateFocus,
                      textInputAction: TextInputAction.done,
                      maxLines: 1,
                      textAlignVertical: TextAlignVertical.center,
                      onChanged: (text) {
                        formEndDate = text;
                        formEndDateHasError = false;
                        validateEndDateField();
                      },
                      //onFieldSubmitted: onSubmit,
                      onTap: () {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1999, 1),
                            lastDate: DateTime(2050, 12),
                            builder: (context, picker) {
                              return picker!;
                            }).then((selectedDate) {
                          //TODO: handle selected date
                          if (selectedDate != null) {
                            end = selectedDate;
                            endDate.text =
                                DateFormat('dd-MM-yyyy ').format(selectedDate);
                          }
                        });
                      },
                      // onEditingComplete: onEditingComplete,
                      //obscureText: obscureText,
                      obscuringCharacter: '•',
                      decoration: InputDecoration(
                        isCollapsed: true,
                        border: InputBorder.none,
                        label: Text("End Date"),
                        labelStyle:
                            heading3.copyWith(letterSpacing: 15 * (3 / 100)),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        prefixIcon: Container(
                          margin: const EdgeInsets.only(right: 2),
                          width: 60,
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.today,
                            color: appGreyColor,
                            size: 30,
                          ),
                        ),
                        // suffixIcon: suffixIcon
                      ),
                    ),
                  ),
                  ValidationMessage(
                    hasError: formEndDateHasError,
                    errorMessage: formEndDateError,
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (startDate.text.isEmpty) {
                  print("startDate is Empty");
                  formStartDateError = 'Please enter a start date';
                  formStartDateHasError = true;
                  formEndDateHasError = false;
                } else if (endDate.text.isEmpty) {
                  print("endDate is Empty");
                  formEndDateError = 'Please enter a end date';
                  formEndDateHasError = true;
                  formStartDateHasError = false;
                } else if (start!.isAfter(end!)) {
                  formStartDateError =
                      'Please enter start date less then end date';
                  formStartDateHasError = true;
                  formEndDateHasError = false;
                  print("Please enter start date less then end date");
                } else {
                  formEndDateHasError = false;
                  formStartDateHasError = false;
                  for (var i = 0; i < myCustomerList!.length; i += 1) {
                    DateTime? date = myCustomerList![i].dateTime;
                    if (date!.compareTo(start!) >= 0 &&
                        date.compareTo(end!) <= 0) {
                      myCustomerFilterList!.add(myCustomerList![i]);
                    }
                  }

                  for (var j = 0; j < myCustomerFilterList!.length; j += 1) {
                    print(
                        "myCustomerFilterList ${myCustomerFilterList![j].dateTime}");
                  }
                  setState(() {
                    myCustomerList = myCustomerFilterList;
                    isFilter = !isFilter;
                  });
                }
                setState(() {});
              },
              child: Padding(
                padding:
                    const EdgeInsets.only(bottom: 10.0, right: 15.0, top: 5),
                child: Container(
                  // margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  alignment: Alignment.center,
                  height: 45,
                  width: 100,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        appRedColor,
                        appRedColor,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: appGreenColor.withOpacity(0.25),
                        offset: const Offset(0, 10),
                        blurRadius: 9,
                      ),
                    ],
                  ),
                  child: Text(
                    "Filter",
                    style: const TextStyle(
                        color: appWhiteColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                startDate.clear();
                start = null;
                end = null;
                endDate.clear();
                myCustomerFilterList!.clear();
                formEndDateHasError = false;
                formStartDateHasError = false;
                myCustomerList = [
                  customer1,
                  customer2,
                  customer3,
                  customer4,
                  customer5,
                  customer6,
                  customer7
                ];
                setState(() {});
              },
              child: Padding(
                padding:
                    const EdgeInsets.only(bottom: 10.0, left: 15.0, top: 5),
                child: Container(
                  //  margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  alignment: Alignment.center,
                  height: 45,
                  width: 100,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        appRedColor,
                        appRedColor,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: appGreenColor.withOpacity(0.25),
                        offset: const Offset(0, 10),
                        blurRadius: 9,
                      ),
                    ],
                  ),
                  child: Text(
                    "Clear All",
                    style: const TextStyle(
                        color: appWhiteColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
