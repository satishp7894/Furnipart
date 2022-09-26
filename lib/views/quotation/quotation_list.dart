import 'dart:typed_data';

import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_share/flutter_share.dart';

// import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:furnipart_sales/constants/asset_constants.dart';
import 'package:furnipart_sales/constants/colors.dart';
import 'package:furnipart_sales/main.dart';
import 'package:furnipart_sales/model/customer.dart';
import 'package:furnipart_sales/model/product.dart';
import 'package:furnipart_sales/shared/styles.dart';
import 'package:furnipart_sales/utils/common_method.dart';
import 'package:furnipart_sales/views/product/product_grid_list.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:furnipart_sales/widgets/customized_app_bar.dart';
import 'package:furnipart_sales/widgets/pdf_printing.dart';
import 'package:furnipart_sales/widgets/validation_message.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
// import 'package:share_plus/share_plus.dart';

// import 'package:simple_pdf_viewer/simple_pdf_viewer.dart';
// import 'package:pdf_demo/pdf_preview_screen.dart';

class QuotationList extends StatefulWidget {
  const QuotationList({Key? key}) : super(key: key);

  @override
  State<QuotationList> createState() => _QuotationListState();
}

class _QuotationListState extends State<QuotationList> {
  List<Customer> searchResult = [];
  List<Customer>? myQuotationList;
  List<Customer>? myQuotationFilterList = [];
  TextEditingController? searchView;
  bool search = false;
  bool isFilter = true;

  Customer customer1 = Customer(
      name: "Sunjay",
      status: "Active",
      dateTime: DateTime.parse("2022-05-01 00:00:00"),
      number: "9978254868");
  Customer customer2 = Customer(
      name: "Vinay",
      status: "Active",
      dateTime: DateTime.parse("2022-05-02 00:00:00"),
      number: "9912857496");
  Customer customer3 = Customer(
      name: "Rohit",
      status: "Active",
      dateTime: DateTime.parse("2022-05-05 00:00:00"),
      number: "9988112756");
  Customer customer4 = Customer(
      name: "Mohan",
      status: "Active",
      dateTime: DateTime.parse("2022-05-10 00:00:00"),
      number: "9933445784");
  Customer customer5 = Customer(
      name: "Vinod",
      status: "Active",
      dateTime: DateTime.parse("2022-05-13 00:00:00"),
      number: "990048726");
  Customer customer6 = Customer(
      name: "Khusi",
      status: "Active",
      dateTime: DateTime.parse("2022-05-20 00:00:00"),
      number: "9934567890");
  Customer customer7 = Customer(
      name: "jignesh",
      status: "Active",
      dateTime: DateTime.parse("2022-05-25 00:00:00"),
      number: "9978942356");
  Customer customer8 = Customer(
      name: "Rahul",
      status: "Active",
      dateTime: DateTime.parse("2022-05-09 00:00:00"));
  Customer customer9 = Customer(
      name: "Shivani",
      status: "Active",
      dateTime: DateTime.parse("2022-05-12 00:00:00"));

  final pdf = pw.Document();


  TextEditingController startDate = TextEditingController();
  FocusNode startDateFocus = FocusNode();
  TextEditingController endDate = TextEditingController();
  FocusNode endDateFocus = FocusNode();

  DateTime? start;
  DateTime? end;


  bool formStartDateHasError = false;
  bool formEndDateHasError = false;
  // bool formCountryHasError = false;

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
    }else{
      formStartDateHasError = false;
    }
    setState(() {

    });
  }



  void validateEndDateField() {
    if (formEndDate.isEmpty) {
      formEndDateError = 'Field cannot be empty';
      formEndDateHasError = true;
    } else if (formEndDate.length < 3) {
      formEndDateError = 'Enter a valid address';
      formEndDateHasError = true;
    }else{
      formEndDateHasError = false;
    }
    setState(() {

    });
  }

  writeOnPdf() {
    // pdf.addPage(pw.MultiPage(
    //   pageFormat: PdfPageFormat.a4,
    //   margin: pw.EdgeInsets.all(32),
    //   build: (pw.Context context) {
    //     return <pw.Widget>[
    //     pw.Header(
    //     level: 0,
    //     child: pw.Row(
    //     mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    //     children: <pw.Widget>[
    //     pw.Text('Geeksforgeeks', textScaleFactor: 2),
    //     ])),
    //     pw.Header(level: 1, text: 'What is Lorem Ipsum?'),
    //
    //     // Write All the paragraph in one line.
    //     // For clear understanding
    //     // here there are line breaks.
    //     pw.Paragraph(
    //     text:
    //     'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod'),
    //     pw.Paragraph(
    //     text:
    //     'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec. Nibh cras pulvinar mattis nunc sed blandit libero'),
    //     pw.Header(level: 1, text: 'This is Header'),
    //     pw.Paragraph(
    //     text:
    //     'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec. Nibh cras pulvinar mattis nunc sed blandit liber'),
    //     pw.Paragraph(
    //     text:
    //     'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus'),
    //     pw.Padding(padding: const pw.EdgeInsets.all(10)),
    //     pw.Table.fromTextArray(context: context, data: const <List<String>>[
    //     <String>['Year', 'Sample'],
    //     <String>['SN0', 'GFG1'],
    //     <String>['SN1', 'GFG2'],
    //     <String>['SN2', 'GFG3'],
    //     <String>['SN3', 'GFG4'],
    //     ]),
    //     ];
    //   },
    // ));

    pdf.addPage(pw.MultiPage(
      //margin: pw.EdgeInsets.all(20),
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      mainAxisAlignment: pw.MainAxisAlignment.center,
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return <pw.Widget>[
          pw.Header(
              //level: 0,
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                // pw.Image(image,height: 100, width: 100, alignment: pw.Alignment.centerLeft),
                pw.SizedBox(width: 20),
                pw.Text("Quotation List",
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      fontSize: 40,
                      color: PdfColor.fromHex('#4684C2'),
                      fontWeight: pw.FontWeight.bold,
                    )),
                pw.SizedBox(width: 20),
              ])),
          //pw.Divider(color: PdfColor.fromHex('#4684C2'),thickness: 3),
          pw.GridView(crossAxisCount: 2, childAspectRatio: 1, children: [
            for (int i = 0; i < myQuotationList!.length; i++)
              pw.Container(
                  margin: const pw.EdgeInsets.only(top: 10),
                  alignment: pw.Alignment.centerLeft,
                  //height: 300,
                  child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        //pw.Image(imageN[i],alignment: pw.Alignment.centerLeft,height: 100, width: 200),
                        pw.Text("Customer Name: ${myQuotationList![i].name}",
                            textAlign: pw.TextAlign.left,
                            style: const pw.TextStyle(
                              fontSize: 15,
                            )),
                        pw.Text("Mobile No.: ${myQuotationList![i].number}",
                            textAlign: pw.TextAlign.left,
                            style: const pw.TextStyle(
                              fontSize: 15,
                            )),
                        pw.Text("Date: ${myQuotationList![i].dateTime}",
                            textAlign: pw.TextAlign.left,
                            style: const pw.TextStyle(
                              fontSize: 15,
                            )),
                        pw.Text("Status: ${myQuotationList![i].status}",
                            textAlign: pw.TextAlign.left,
                            style: const pw.TextStyle(
                              fontSize: 15,
                            )),
                      ])),
          ]),
        ];
      },
    ));
  }

  Future savePdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    File file = File("$documentPath/example.pdf");
    if (await file.exists()) {
      // file.delete();
      print("already file exist");
    } else {
      print(" file not exist");
      file.writeAsBytesSync(List.from(await pdf.save()));
    }
  }

  @override
  void initState() {
    myQuotationList = [
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
    // WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    //   SystemChrome.setSystemUIOverlayStyle(
    //     const SystemUiOverlayStyle(
    //         statusBarColor: Colors.transparent,
    //         statusBarIconBrightness: Brightness.dark),
    //   );
    // });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBlackColor,
        title: const Text("Quotation List"),
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
                        CommonMethod.writeOnPdf(pdf,myQuotationList,"Quotation List");
                        await CommonMethod.savePdf(pdf,"Quotation");
                        File file = await CommonMethod.getFullPath(pdf, "Quotation");
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => PdfPreviewScreen(title : "Quotation List",
                        //         file: file,myQuotationList : myQuotationList!)));
                      },
                    ),
                  ])
        ],
      ),

      backgroundColor: Colors.black,
      //floatingActionButton: const FloatingCartButton(),
      // drawer: const CustomHomeDrawer(),
      body: Column(
        children: [
          // CustomizedAppBar(
          //   title: 'Quotation List',
          //   leading: AssetConstants.backArrowBlack,
          //   leadingOnTap: () {
          //     Navigator.of(context).pop();
          //   },
          //     trailing: AssetConstants.menuIcon,
          //     trailingOnTap : (){
          //     //  Navigator.of(context).pop();
          //       PopupMenuButton(
          //           itemBuilder: (context) => [
          //             PopupMenuItem(
          //               child: Text("First"),
          //               value: 1,
          //             ),
          //             PopupMenuItem(
          //               child: Text("Second"),
          //               value: 2,
          //             )
          //           ]
          //       );
          //     }
          // ),

          Row(
            children: [
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: _searchView(),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFilter =  !isFilter;
                      startDate.clear();
                      start = null;
                      end = null;
                      endDate.clear();
                      myQuotationFilterList!.clear();
                      formStartDateHasError = false;
                      formEndDateHasError = false;
                      myQuotationList = [
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
          // SizedBox(
          //   height: 10,
          // ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // SizedBox(
                  //   width: 200,
                  //   child: RaisedButton(
                  //     color: Colors.blueGrey,
                  //     child: Text(
                  //       'Preview PDF',
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 18,
                  //           color: Colors.white),
                  //     ),
                  //     onPressed: () async {
                  //       writeOnPdf();
                  //       await savePdf();
                  //
                  //       Directory documentDirectory =
                  //       await getApplicationDocumentsDirectory();
                  //
                  //       String documentPath = documentDirectory.path;
                  //
                  //       String fullPath = "$documentPath/example.pdf";
                  //       print(fullPath);
                  //
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => PdfPreviewScreen(
                  //                 path: fullPath,
                  //               )));
                  //     },
                  //   ),
                  // ),

                  isFilter ? Container():
                  filterContainer(),
                  searchResult.length == 0
                      ?
                      // model.hasError
                      //     ? const PageErrorIndicator()
                      //     : model.isLoading
                      //     ? const LoadingIndicator()
                      //     :

                      ListView.builder(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 0),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          //reverse: true,
                          itemCount: myQuotationList!.length,
                          itemBuilder: (c, i) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: appWhiteColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 89.5,
                              margin: const EdgeInsets.only(
                                bottom: 10,
                              ),
                              // color: Colors.white,
                              child: Row(
                                children: [
                                  Container(
                                    width: 90,
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 8),
                                    //color: Colors.transparent,
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
                                          margin: const EdgeInsets.only(
                                              bottom: 0, top: 0),
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
                                        myQuotationList![i].name ?? '',
                                        style: heading7.copyWith(
                                            color: appBlackColor),
                                      ),
                                      Text(
                                        myQuotationList![i].status ?? '',
                                        style: paragraph6,
                                      ),
                                      Text(
                                        myQuotationList![i].number ?? '',
                                        style: paragraph6,
                                      ),
                                      Text(
                                        myQuotationList![i].dateTime.toString(),
                                        style: paragraph6,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 0),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          //reverse: true,
                          itemCount: searchResult.length,
                          itemBuilder: (c, i) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: appWhiteColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 89.5,
                              margin: const EdgeInsets.only(
                                bottom: 10,
                              ),
                              // color: Colors.white,
                              child: Row(
                                children: [
                                  Container(
                                    width: 90,
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 8),
                                    //color: Colors.transparent,
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
                                          margin: const EdgeInsets.only(
                                              bottom: 0, top: 0),
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
                                      Text(
                                        searchResult[i].number ?? '',
                                        style: paragraph6,
                                      ),
                                      Text(
                                        searchResult[i].dateTime.toString(),
                                        style: paragraph6,
                                      ),
                                    ],
                                  ),
                                ],
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
    );
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
                    duration: Duration(milliseconds: formStartDateError == true ? 300 : 200),
                    alignment: Alignment.center,
                    height: 62,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: appWhiteColor,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 2,
                        color: formStartDateHasError == true ? Colors.red : Colors.transparent,
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
                      onChanged: (text){
                        formStartDate = text;
                        formStartDateHasError = false;
                        validateStartDateField();
                      },
                      //onFieldSubmitted: onSubmit,
                      onTap: (){
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1999, 1),
                            lastDate: DateTime(2050,12),
                            builder: (context,picker){
                              return picker!;
                            })
                            .then((selectedDate) {
                          //TODO: handle selected date
                          if(selectedDate!=null){
                            start = selectedDate;
                            startDate.text = DateFormat('dd-MM-yyyy ').format(selectedDate);;
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
                        labelStyle: heading3.copyWith(letterSpacing: 15 * (3 / 100)),
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
                    duration: Duration(milliseconds: formEndDateHasError == true ? 300 : 200),
                    alignment: Alignment.center,
                    height: 62,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: appWhiteColor,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 2,
                        color: formEndDateHasError == true ? Colors.red : Colors.transparent,
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
                      onChanged: (text){
                        formEndDate = text;
                        formEndDateHasError = false;
                        validateEndDateField();
                      },
                      //onFieldSubmitted: onSubmit,
                      onTap: (){
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1999, 1),
                            lastDate: DateTime(2050,12),
                            builder: (context,picker){
                              return picker!;
                            })
                            .then((selectedDate) {
                          //TODO: handle selected date
                          if(selectedDate!=null){
                            end = selectedDate;
                            endDate.text = DateFormat('dd-MM-yyyy ').format(selectedDate);
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
                        labelStyle: heading3.copyWith(letterSpacing: 15 * (3 / 100)),
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
              onTap: (){

                if(startDate.text.isEmpty){
                  print("startDate is Empty");
                  formStartDateError = 'Please enter a start date';
                  formStartDateHasError = true;
                  formEndDateHasError = false;
                }else if (endDate.text.isEmpty){
                  print("endDate is Empty");
                  formEndDateError = 'Please enter a end date';
                  formEndDateHasError = true;
                  formStartDateHasError = false;
                }else if(start!.isAfter(end!)){
                  formStartDateError = 'Please enter start date less then end date';
                  formStartDateHasError = true;
                  formEndDateHasError = false;
                  print("Please enter start date less then end date");
                }else{
                  formEndDateHasError = false;
                  formStartDateHasError = false;
                  for (var i = 0; i < myQuotationList!.length; i += 1) {
                    DateTime? date = myQuotationList![i].dateTime;
                    if (date!.compareTo(start!) >= 0 && date.compareTo(end!) <= 0) {
                      myQuotationFilterList!.add(myQuotationList![i]);
                    }
                  }

                  for (var j = 0; j < myQuotationFilterList!.length; j += 1) {
                    print("myCustomerFilterList ${myQuotationFilterList![j].dateTime}");
                  }
                  setState(() {
                    myQuotationList = myQuotationFilterList;
                    isFilter =  !isFilter;
                  });



                }
                setState(() {

                });
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0, right: 15.0,top: 5),
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
                  child:  Text(
                    "Filter",
                    style: const TextStyle(color: appWhiteColor,fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                startDate.clear();
                start = null;
                end = null;
                endDate.clear();
                myQuotationFilterList!.clear();
                formEndDateHasError = false;
                formStartDateHasError = false;
                myQuotationList = [
                  customer1,
                  customer2,
                  customer3,
                  customer4,
                  customer5,
                  customer6,
                  customer7
                ];
                setState(() {

                });
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0, left: 15.0, top: 5),
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
                  child:  Text(
                    "Clear All",
                    style: const TextStyle(color: appWhiteColor,fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _searchView() {
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

    for (var exp in myQuotationList!) {
      if (exp.name!.toLowerCase().contains(text.toLowerCase())) {
        searchResult.add(exp);
        print("exp  ${exp.name!}");
      }
    }
    //print("search objects ${_searchResult.first}");
    // print("search result length ${searchResult.length}");
    // setState(() {});
  }
}

class PdfPreviewScreen extends StatefulWidget {
  final String title;
  final bool isSwitched;
  final File file;
  final List<Product> myQuotationList;

  const PdfPreviewScreen({required this.title, required this.file, required this.myQuotationList,required this.isSwitched});

  @override
  State<PdfPreviewScreen> createState() => _PdfPreviewScreenState();
}

class _PdfPreviewScreenState extends State<PdfPreviewScreen> {
  bool _isLoading = true;
  PDFDocument? doc;

  @override
  void initState() {
    _pdfInit();
    CommonMethod.getDownloadPath(widget.title);
    print("QuotationList ${widget.myQuotationList.length.toString()} ");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBlackColor,
        title:  Text("${widget.title}"),
        actions: [
          InkWell(
            onTap: ()async{
              await Navigator.of(context).push(MaterialPageRoute(
                  builder: (builder) =>  PrintingPage(myQuotationList : widget.myQuotationList,title : widget.title,isSwitched: widget.isSwitched,)));
            },
            child: Container(
              height: 26,
              width: 40,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 17.41),
              child: Image.asset(
                AssetConstants.printingIcon,
                color: appWhiteColor,
                width: 23,
                fit: BoxFit.contain,
              ),
            ),
          ),
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
                      child: Row(
                        children: const [
                          // Container(
                          //   height: 26,
                          //   width: 40,
                          //   alignment: Alignment.centerRight,
                          //   padding: const EdgeInsets.only(right: 17.41),
                          //   child: Image.asset(
                          //     AssetConstants.downloadIcon,
                          //     color: appBlackColor,
                          //     width: 23,
                          //     fit: BoxFit.contain,
                          //   ),
                          // ),
                          Text("Download PDF.."),
                        ],
                      ),
                      value: 1,
                      onTap: () async {
                        File file = await CommonMethod.getDownloadPath(widget.title);
                        if (await file.exists()) {
                          print("this pdf already exits");
                          showAlertPdf(context, '${widget.title}',
                              'PDF Download Successfully');
                        } else {
                          file.writeAsBytesSync(
                              List.from(widget.file.readAsBytesSync()));
                          showAlertPdf(context, '${widget.title}',
                              'PDF Download Successfully');
                        }
                      },
                    ),
                    PopupMenuItem(
                      child: const Text("Send Email.."),
                      value: 2,
                      onTap: () async {
                        File file = await CommonMethod.getDownloadPath(widget.title);
                        final Email email = Email(
                          body: 'Email body',
                          subject: 'Email subject',
                          recipients: ['example@example.com'],
                          cc: ['cc@example.com'],
                          bcc: ['bcc@example.com'],
                          attachmentPaths: [file.path],
                          isHTML: false,
                        );

                        await FlutterEmailSender.send(email);
                      },
                    ),
                    PopupMenuItem(
                      child: const Text("Share PDf.."),
                      value: 3,
                      onTap: () async {
                        File file = await CommonMethod.getDownloadPath(widget.title);
                        await FlutterShare.shareFile(
                          title: 'Example share',
                          text: 'Example share text',
                          filePath: file.path,
                        );
                        // Share.shareFiles(['${file.path}'], text: 'Great picture');
                      },
                    ),
                  ])
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          :  Theme(
        data: ThemeData(bottomAppBarTheme: BottomAppBarTheme(color: Colors.amber)),
            child: PDFViewer(
                document: doc!,
                // indicatorBackground : appRedColor,
                showNavigation : false,
                // showIndicator : false,
                showPicker: false,
                pickerButtonColor : appRedColor
              ),
          ),
    );
  }

  Future<void> _pdfInit() async {
   // File file = File(widget.path);
    doc = await PDFDocument.fromFile(widget.file);
    setState(() => _isLoading = false);
  }

  showAlertPdf(BuildContext context, String title, String message) {
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

  // Future<File> _getDownloadPath() async {
  //   var dir = await DownloadsPathProvider.downloadsDirectory;
  //   print("object directory path ${dir!.path + "/${widget.title}.pdf"}");
  //   return File(dir.path + "/${widget.title}.pdf");
  // }
}


