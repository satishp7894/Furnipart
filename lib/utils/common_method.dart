import 'dart:io';
import 'dart:typed_data';

import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:furnipart_sales/model/customer.dart';
import 'package:furnipart_sales/model/product.dart';
import 'package:furnipart_sales/model/total.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/src/widgets/document.dart';
import 'package:pdf/widgets.dart' as pw;

class CommonMethod {
  static totalContainer(List<Product> myProductList) {
    // print("myProductList.length ${myProductList.length}");

    int j = 1;
    int k = 26;
    for (int i = 0; i < 10; i++) {
      print("myProductList.length $j ");
      print("myProductList.length $k ");
      print("myProductList.length $i ${myProductList.length >= j}");
      print("myProductList.length $i ${myProductList.length <= k}");

      if (myProductList.length >= j && myProductList.length <= k) {
        int qty = 0;
        for (int m = 0; m < k; m++) {
          qty = qty + 5;
        }
        print("myProductList.length $qty ");
        return pw.Container(
            child: pw.Column(
          //mainAxisSize: pw.MainAxisSize.min,
          children: [
            pw.Container(
                decoration: pw.BoxDecoration(border: pw.Border.all()),
                // padding: pw.EdgeInsets.all(8.0),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Text("$qty", style: pw.TextStyle(fontSize: 9)),
                      pw.SizedBox(width: 20),
                      pw.Container(
                        decoration: pw.BoxDecoration(border: pw.Border.all()),
                        padding: pw.EdgeInsets.only(
                            top: 5.0, bottom: 5.0, left: 16.5, right: 16),
                        child:
                            pw.Text('800.00', style: pw.TextStyle(fontSize: 9)),
                      )
                    ])),
            pw.Container(
              decoration: pw.BoxDecoration(border: pw.Border.all()),
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Container(
                      padding: pw.EdgeInsets.only(top: 5.0, left: 5.0),
                      child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text('Eight Thousand Only',
                                style: pw.TextStyle(fontSize: 9)),
                          ]),
                    ),
                    pw.Spacer(),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Container(
                            padding: pw.EdgeInsets.only(top: 5.0),
                            child: pw.Text('Grand Total -',
                                style: pw.TextStyle(fontSize: 9)),
                          ),
                          pw.SizedBox(width: 10),
                          pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            padding: pw.EdgeInsets.only(
                                top: 5.0, bottom: 5.0, left: 16.5, right: 16),
                            child: pw.Text('800.00',
                                style: pw.TextStyle(fontSize: 9)),
                          )
                        ]),
                  ]),
            ),
            pw.Container(
              padding: pw.EdgeInsets.only(
                top: 7,
                bottom: 5.0,
                left: 5.0,
                right: 5.0,
              ),
              decoration: pw.BoxDecoration(border: pw.Border.all()),
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    //width: MediaQuery.of(context).size.width,

                    pw.Text(
                      'Your total saving : 1079.49',
                      style: const pw.TextStyle(
                        fontSize: 10.0,
                        color: PdfColors.red,
                      ),
                    ),

                    //  width: MediaQuery.of(context).size.width,

                    pw.Text(
                      'Your total saving : 1079.49',
                      style: const pw.TextStyle(
                        fontSize: 10.0,
                        color: PdfColors.white,
                      ),
                    ),
                  ]),
            ),
            pw.Container(
              decoration: pw.BoxDecoration(border: pw.Border.all()),
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    //width: MediaQuery.of(context).size.width,
                    pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            child: pw.Column(
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Container(
                                    padding: const pw.EdgeInsets.only(
                                        left: 5.0, top: 5),
                                    // decoration: pw.BoxDecoration(border: pw.Border.all()),
                                    child: pw.Text(
                                      'Term & Cond',
                                      style: const pw.TextStyle(
                                        decoration: pw.TextDecoration.underline,
                                        fontSize: 8.0,
                                      ),
                                    ),
                                  ),
                                  pw.Container(
                                    padding: const pw.EdgeInsets.only(
                                        left: 5.0, top: 5.0),
                                    // decoration: pw.BoxDecoration(border: pw.Border.all()),
                                    child: pw.Text(
                                      'E.& O.E',
                                      style: const pw.TextStyle(fontSize: 9.0),
                                    ),
                                  ),
                                  pw.Container(
                                    padding:
                                        const pw.EdgeInsets.only(left: 5.0),
                                    // decoration: pw.BoxDecoration(border: pw.Border.all()),
                                    child: pw.Text(
                                      '1. Rate given above :',
                                      style: const pw.TextStyle(
                                        fontSize: 9.0,
                                      ),
                                    ),
                                  ),
                                  pw.Container(
                                    padding:
                                        const pw.EdgeInsets.only(left: 5.0),
                                    // decoration: pw.BoxDecoration(border: pw.Border.all()),
                                    child: pw.Text(
                                      '2. Quot Valid for 2 days Only ',
                                      style: const pw.TextStyle(
                                        fontSize: 9.0,
                                        color: PdfColors.red,
                                      ),
                                    ),
                                  ),
                                  pw.Container(
                                    padding:
                                        const pw.EdgeInsets.only(left: 5.0),
                                    // decoration: pw.BoxDecoration(border: pw.Border.all()),
                                    child: pw.Text(
                                      '3. GST Tax Applicable ',
                                      style: const pw.TextStyle(
                                        fontSize: 9.0,
                                        color: PdfColors.red,
                                      ),
                                    ),
                                  ),
                                ]))),
                  ]),
            ),
            pw.Container(
              alignment: pw.Alignment.center,
              padding: const pw.EdgeInsets.all(5),
              decoration: pw.BoxDecoration(border: pw.Border.all()),
              child: pw.Text(
                'Bank name : Bank of India : A/c No : 64654657445564 Branch : Vapi ',
                style: const pw.TextStyle(
                  fontSize: 9.0,
                ),
              ),
            )
          ],
        ));
      }
      j = j + 26;
      k = k + 26;
      // else{
      //   return  pw.Container();
      // }
    }
  }

  static totalContainer11(
      List<Product> myProductList, int totalQty, int totalPrice) {
    // for(int i = 0; i<totalList.length; i++){
    //   print("pageNumber  ${context.pageNumber}");
    //   if(totalList[i].index == context.pageNumber){
    //     totalQty = (totalQty + totalList[i].qty!);
    //     totalPrice = (totalPrice + totalList[i].price!);
    //   }
    //
    //
    // }

    return pw.Container(
        child: pw.Column(
      //mainAxisSize: pw.MainAxisSize.min,
      children: [
        pw.Container(
            decoration: pw.BoxDecoration(border: pw.Border.all()),
            // padding: pw.EdgeInsets.all(8.0),
            child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  // pw.Container(
                  //   //decoration: pw.BoxDecoration(border: pw.Border.all()),
                  //   padding: const pw.EdgeInsets.only(
                  //       top: 5.0, bottom: 5.0, left: 10, right: 10),
                  //   child: pw.Text('$totalQty.00', style: pw.TextStyle(fontSize: 9)),
                  // ),
                  pw.Text("$totalQty.00", style: pw.TextStyle(fontSize: 9)),
                  pw.SizedBox(width: 10),
                  pw.Container(
                    width: 50,
                    decoration: pw.BoxDecoration(border: pw.Border.all()),
                    padding: const pw.EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: pw.Text('$totalPrice.00',
                        textAlign: pw.TextAlign.center,
                        style: const pw.TextStyle(fontSize: 9)),
                  )
                ])),
        pw.Container(
          decoration: pw.BoxDecoration(border: pw.Border.all()),
          child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Container(
                  padding: pw.EdgeInsets.only(top: 5.0, left: 5.0),
                  child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Eight Thousand Only',
                            style: pw.TextStyle(fontSize: 9)),
                      ]),
                ),
                pw.Spacer(),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Container(
                        padding: const pw.EdgeInsets.only(top: 5.0),
                        child: pw.Text('Grand Total -',
                            style: const pw.TextStyle(fontSize: 9)),
                      ),
                      pw.SizedBox(width: 10),
                      pw.Container(
                        width: 50,
                        decoration: pw.BoxDecoration(border: pw.Border.all()),
                        padding:
                            const pw.EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: pw.Text('800.00',
                            textAlign: pw.TextAlign.center,
                            style: const pw.TextStyle(fontSize: 9)),
                      )
                    ]),
              ]),
        ),
        pw.Container(
          padding: pw.EdgeInsets.only(
            top: 7,
            bottom: 5.0,
            left: 5.0,
            right: 5.0,
          ),
          decoration: pw.BoxDecoration(border: pw.Border.all()),
          child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                //width: MediaQuery.of(context).size.width,

                pw.Text(
                  'Your total saving : 1079.49',
                  style: const pw.TextStyle(
                    fontSize: 10.0,
                    color: PdfColors.red,
                  ),
                ),

                //  width: MediaQuery.of(context).size.width,

                pw.Text(
                  'Your total saving : 1079.49',
                  style: const pw.TextStyle(
                    fontSize: 10.0,
                    color: PdfColors.white,
                  ),
                ),
              ]),
        ),
        pw.Container(
          decoration: pw.BoxDecoration(border: pw.Border.all()),
          child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                //width: MediaQuery.of(context).size.width,
                pw.Expanded(
                    flex: 1,
                    child: pw.Container(
                        decoration: pw.BoxDecoration(border: pw.Border.all()),
                        child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Container(
                                padding:
                                    const pw.EdgeInsets.only(left: 5.0, top: 5),
                                // decoration: pw.BoxDecoration(border: pw.Border.all()),
                                child: pw.Text(
                                  'Term & Cond',
                                  style: const pw.TextStyle(
                                    decoration: pw.TextDecoration.underline,
                                    fontSize: 8.0,
                                  ),
                                ),
                              ),
                              pw.Container(
                                padding: const pw.EdgeInsets.only(
                                    left: 5.0, top: 5.0),
                                // decoration: pw.BoxDecoration(border: pw.Border.all()),
                                child: pw.Text(
                                  'E.& O.E',
                                  style: const pw.TextStyle(fontSize: 9.0),
                                ),
                              ),
                              pw.Container(
                                padding: const pw.EdgeInsets.only(left: 5.0),
                                // decoration: pw.BoxDecoration(border: pw.Border.all()),
                                child: pw.Text(
                                  '1. Rate given above :',
                                  style: const pw.TextStyle(
                                    fontSize: 9.0,
                                  ),
                                ),
                              ),
                              pw.Container(
                                padding: const pw.EdgeInsets.only(left: 5.0),
                                // decoration: pw.BoxDecoration(border: pw.Border.all()),
                                child: pw.Text(
                                  '2. Quot Valid for 2 days Only ',
                                  style: const pw.TextStyle(
                                    fontSize: 9.0,
                                    color: PdfColors.red,
                                  ),
                                ),
                              ),
                              pw.Container(
                                padding: const pw.EdgeInsets.only(left: 5.0),
                                // decoration: pw.BoxDecoration(border: pw.Border.all()),
                                child: pw.Text(
                                  '3. GST Tax Applicable ',
                                  style: const pw.TextStyle(
                                    fontSize: 9.0,
                                    color: PdfColors.red,
                                  ),
                                ),
                              ),
                            ]))),
              ]),
        ),
        pw.Container(
          alignment: pw.Alignment.center,
          padding: const pw.EdgeInsets.all(5),
          decoration: pw.BoxDecoration(border: pw.Border.all()),
          child: pw.Text(
            'Bank name : Bank of India : A/c No : 64654657445564 Branch : Vapi',
            style: const pw.TextStyle(
              fontSize: 9.0,
            ),
          ),
        )
      ],
    ));
  }

  static nextPageExpended(List<Product> myProductList, BuildContext context) {
    int j = 25;
    int k = 33;
    if (myProductList.length == 25) {
      return pw.Container(
        height: MediaQuery.of(context).size.width * 0.040 * 8,
        alignment: pw.Alignment.center,
        padding: const pw.EdgeInsets.all(5),
        decoration: pw.BoxDecoration(
            border: pw.Border(right: pw.BorderSide(width: 1.0))),
        child: pw.Text(
          "${""}",
          style: const pw.TextStyle(fontSize: 9.0, color: PdfColors.white),
        ),
      );
    } else if (myProductList.length == 27) {
      return pw.Container(
        height: 150,
        alignment: pw.Alignment.center,
        padding: const pw.EdgeInsets.all(5),
        decoration: pw.BoxDecoration(
            border: pw.Border(right: pw.BorderSide(width: 1.0))),
        child: pw.Text(
          "${""}",
          style: const pw.TextStyle(fontSize: 9.0, color: PdfColors.white),
        ),
      );
    } else if (myProductList.length == 28) {
      return pw.Container(
        height: 200,
        alignment: pw.Alignment.center,
        padding: const pw.EdgeInsets.all(5),
        decoration: pw.BoxDecoration(
            border: pw.Border(right: pw.BorderSide(width: 1.0))),
        child: pw.Text(
          "${""}",
          style: const pw.TextStyle(fontSize: 9.0, color: PdfColors.white),
        ),
      );
    } else {
      return pw.Container();
    }
    // int j = 25;
    // int k = 33;
    //
    // for(int i=0 ; i<10; i++){
    //   print("jjjjj $i ${j}");
    //   print("kkkkk $i ${k}");
    //   print("myProductList.length nextPageExpended $i ${myProductList.length >= j}");
    //   print("myProductList.length nextPageExpended $i ${myProductList.length <= k}");
    //   if(myProductList.length >= j && myProductList.length <= k){
    //
    //   return totalContainer11(myProductList,j,k);
    //   }
    //   // else{
    //   //   j=j+25;
    //   //   k=k+33;
    //   //  return pw.Container();
    //   // }
    //
    //   j=j+25;
    //   k=k+33;
    // }
  }

  static expendedWidget(List<Product> myProductList) {
    //print("myProductList.length ${myProductList.length }");
    // if(myProductList.length == 26){
    //   return pw.Container();
    // }else{
    return pw.Expanded(
        // height:double.infinity,
        child: pw.Row(children: [
      pw.Container(
        width: 35,
        alignment: pw.Alignment.center,
        padding: const pw.EdgeInsets.all(5),
        decoration: pw.BoxDecoration(
            border: pw.Border(
                right: pw.BorderSide(width: 1.0),
                left: const pw.BorderSide(width: 1.0))),
        child: pw.Text(
          "${""}",
          style: const pw.TextStyle(fontSize: 9.0, color: PdfColors.white),
        ),
      ),
      pw.Expanded(
        child: expendedContainer(0.0),
      ),
      expendedContainer(40),
      expendedContainer(40),
      expendedContainer(45),
      expendedContainer(40),
      expendedContainer(40),
      expendedContainer(50),
    ]));
    //  }
  }

  static expendedContainer(double width) {
    return pw.Container(
      width: width,
      alignment: pw.Alignment.center,
      padding: const pw.EdgeInsets.all(5),
      decoration:
          pw.BoxDecoration(border: pw.Border(right: pw.BorderSide(width: 1.0))),
      child: pw.Text(
        "${""}",
        style: const pw.TextStyle(fontSize: 9.0, color: PdfColors.white),
      ),
    );
  }

  static tableDataContainer(String data, double width, BuildContext context) {
    return pw.Container(
        height: MediaQuery.of(context).size.width * 0.040,
        // height: 186.2,
        width: width,
        alignment: pw.Alignment.center,
        padding: const pw.EdgeInsets.all(5),
        decoration: pw.BoxDecoration(
            border: pw.Border(right: pw.BorderSide(width: 1.0))),
        child: pw.Text(
          "${data}",
          style: const pw.TextStyle(
            fontSize: 9.0,
          ),
        ));
  }

  static tableHeaderContainer(
      String title, double width, BuildContext context) {
    return pw.Container(
      height: 30,
      // height: MediaQuery.of(context).size.height * 0.03,
      width: width,
      alignment: pw.Alignment.center,
      padding: const pw.EdgeInsets.all(5),
      decoration:
          pw.BoxDecoration(color: PdfColors.grey100, border: pw.Border.all()),
      child: pw.Text(
        "${title}",
        style: pw.TextStyle(
          fontSize: 9.0,
          fontWeight: pw.FontWeight.bold,
        ),
      ),
    );
  }

  static writeOnPdf(
      Document pdf, List<Customer>? myCustomerList, String title) {
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
                pw.Text("$title",
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
            for (int i = 0; i < myCustomerList!.length; i++)
              pw.Container(
                  margin: const pw.EdgeInsets.only(top: 10),
                  alignment: pw.Alignment.centerLeft,
                  //height: 300,
                  child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        //pw.Image(imageN[i],alignment: pw.Alignment.centerLeft,height: 100, width: 200),
                        pw.Text("Customer Name: ${myCustomerList[i].name}",
                            textAlign: pw.TextAlign.left,
                            style: const pw.TextStyle(
                              fontSize: 15,
                            )),
                        pw.Text("Mobile No.: ${myCustomerList[i].number}",
                            textAlign: pw.TextAlign.left,
                            style: const pw.TextStyle(
                              fontSize: 15,
                            )),
                        pw.Text("Date: ${myCustomerList[i].dateTime}",
                            textAlign: pw.TextAlign.left,
                            style: const pw.TextStyle(
                              fontSize: 15,
                            )),
                        pw.Text("Status: ${myCustomerList[i].status}",
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

  static writeOnProductPdf(Document pdf, List<Product>? myProductList,
      String title, Uint8List iconImage, BuildContext context) {
    // pdf.addPage(pw.MultiPage(
    //   //margin: pw.EdgeInsets.all(20),
    //   crossAxisAlignment: pw.CrossAxisAlignment.center,
    //   mainAxisAlignment: pw.MainAxisAlignment.center,
    //   pageFormat: PdfPageFormat.a4,
    //   build: (context) {
    //     return <pw.Widget>[
    //       pw.Header(
    //         //level: 0,
    //           child: pw.Row(
    //               mainAxisAlignment: pw.MainAxisAlignment.center,
    //               crossAxisAlignment: pw.CrossAxisAlignment.center,
    //               children: [
    //                 // pw.Image(image,height: 100, width: 100, alignment: pw.Alignment.centerLeft),
    //                 pw.SizedBox(width: 20),
    //                 pw.Text("$title",
    //                     textAlign: pw.TextAlign.center,
    //                     style: pw.TextStyle(
    //                       fontSize: 40,
    //                       color: PdfColor.fromHex('#4684C2'),
    //                       fontWeight: pw.FontWeight.bold,
    //                     )),
    //                 pw.SizedBox(width: 20),
    //               ])),
    //       //pw.Divider(color: PdfColor.fromHex('#4684C2'),thickness: 3),
    //       pw.GridView(crossAxisCount: 2, childAspectRatio: 1, children: [
    //         for (int i = 0; i < myProductList!.length; i++)
    //           pw.Container(
    //               margin: const pw.EdgeInsets.only(top: 10),
    //               alignment: pw.Alignment.centerLeft,
    //               //height: 300,
    //               child: pw.Column(
    //                   mainAxisAlignment: pw.MainAxisAlignment.start,
    //                   crossAxisAlignment: pw.CrossAxisAlignment.start,
    //                   children: [
    //                     //pw.Image(imageN[i],alignment: pw.Alignment.centerLeft,height: 100, width: 200),
    //                     pw.Text("Product Name: ${myProductList[i].name}",
    //                         textAlign: pw.TextAlign.left,
    //                         style: const pw.TextStyle(
    //                           fontSize: 15,
    //                         )),
    //                     pw.Text("Description: ${myProductList[i].description}",
    //                         textAlign: pw.TextAlign.left,
    //                         style: const pw.TextStyle(
    //                           fontSize: 15,
    //                         )),
    //                     pw.Text("Quantity: ${myProductList[i].qty}",
    //                         textAlign: pw.TextAlign.left,
    //                         style: const pw.TextStyle(
    //                           fontSize: 15,
    //                         )),
    //
    //                   ])),
    //       ]),
    //     ];
    //   },
    // ));

    final tableHeaders = [
      'S.N',
      'Code',
      'Description of Goods',
      'HSN',
      'GST',
      'Unit',
      'MRP',
      'Disc',
      'Price',
      'Qty',
      'Amount',
    ];
    List<dynamic>? list = [];

    // }

    final tableData = [
      [
        '1.',
        'GSHS2',
        'Hettich TSD',
        '1248',
        '2.00',
        'Pair',
        '1000',
        '15.00 %',
        '270',
        '9.00',
        '800',
      ],
      [
        '2.',
        'GSHS2',
        'Hettich TSD',
        '1248',
        '2.00',
        'Pair',
        '1000',
        '15.00 %',
        '270',
        '9.00',
        '800',
      ],
      [
        '3.',
        'GSHS2',
        'Hettich TSD',
        '1248',
        '2.00',
        'Pair',
        '1000',
        '15.00 %',
        '270',
        '9.00',
        '800',
      ]
    ];

    for (int i = 0; i < myProductList!.length; i++) {
      list.add([
        '${i + 1}.',
        'GSHS2',
        'Hettich TSD Hettich TSD',
        '1248',
        '2.00',
        'Pair',
        '1000',
        '15.00 %',
        '270',
        '${myProductList[i].qty}.00',
        '800.oo',
      ]);
    }
    print("list.length ${list.length}");
    // final tableDatas;
    //for(int i = 0 ; i<myProductList!.length;i++){
    List<List<dynamic>> tableDatas = [];
    for (int i = 0; i < list.length; i++) {
      tableDatas.add(list[i]);
    }
    //tableDatas.addAll(list);

    // }
    List<dynamic> emptyList = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];

    for (int i = 1; i < 6; i++) {
      print("first ii$i");
      if (myProductList.length == i) {
        for (int j = 0; j < 6 - i; j++) {
          print("first jj$j");
          tableDatas.add(emptyList);
        }
      }
    }

    // if(myProductList.length == 1){
    //   tableDatas.add(emptyList);
    //   tableDatas.add(emptyList);
    //   tableDatas.add(emptyList);
    //   tableDatas.add(emptyList);
    //   tableDatas.add(emptyList);
    // }else if(myProductList.length == 2){
    //   tableDatas.add(emptyList);
    //   tableDatas.add(emptyList);
    //   tableDatas.add(emptyList);
    //   tableDatas.add(emptyList);
    //   // tableDatas.add(emptyList);
    //   // tableDatas.add(emptyList);
    //   // tableDatas.add(emptyList);
    //   // tableDatas.add(emptyList);
    // }else if(myProductList.length == 3){
    //   tableDatas.add(emptyList);
    //   tableDatas.add(emptyList);
    //   tableDatas.add(emptyList);
    //   // tableDatas.add(emptyList);
    //   // tableDatas.add(emptyList);
    //   // tableDatas.add(emptyList);
    //   // tableDatas.add(emptyList);
    // }
    // else if(myProductList.length == 4){
    //   tableDatas.add(emptyList);
    //   tableDatas.add(emptyList);
    //   // tableDatas.add(emptyList);
    //   // tableDatas.add(emptyList);
    //   // tableDatas.add(emptyList);
    //   // tableDatas.add(emptyList);
    // }else if(myProductList.length == 5){
    //   tableDatas.add(emptyList);
    //   // tableDatas.add(emptyList);
    //   // tableDatas.add(emptyList);
    //   // tableDatas.add(emptyList);
    //   // tableDatas.add(emptyList);
    // }
    // else if(myProductList.length == 6){
    //   tableDatas.add(emptyList);
    //   tableDatas.add(emptyList);
    //   tableDatas.add(emptyList);
    //   tableDatas.add(emptyList);
    // }else if(myProductList.length == 7){
    //   tableDatas.add(emptyList);
    //   tableDatas.add(emptyList);
    //   tableDatas.add(emptyList);
    // }else if(myProductList.length == 8){
    //   tableDatas.add(emptyList);
    //   tableDatas.add(emptyList);
    // }else if(myProductList.length == 9){
    //   tableDatas.add(emptyList);
    // }

    pdf.addPage(
      pw.MultiPage(
        // header: (context) {
        //   return pw.Text(
        //     'Flutter Approach',
        //     style: pw.TextStyle(
        //       fontWeight: pw.FontWeight.bold,
        //       fontSize: 15.0,
        //     ),
        //   );
        // },
        build: (contx) {
          return [
            pw.Container(
              alignment: pw.Alignment.center,
              decoration: pw.BoxDecoration(border: pw.Border.all()),
              padding: pw.EdgeInsets.all(8.0),
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Text(
                    '|| Shree Ganeshay Namah ||',
                    style: const pw.TextStyle(
                      fontSize: 13.0,
                      color: PdfColors.grey700,
                    ),
                  ),
                  pw.SizedBox(height: 1 * PdfPageFormat.mm),
                  pw.Text(
                    'Quotation / Performa invoice',
                    style: pw.TextStyle(
                      fontSize: 15.0,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                  pw.SizedBox(height: 1 * PdfPageFormat.mm),
                  pw.SizedBox(height: 1 * PdfPageFormat.mm),
                  pw.Image(
                    pw.MemoryImage(iconImage),
                    height: 72,
                    width: 72,
                  ),
                  pw.SizedBox(height: 1 * PdfPageFormat.mm),
                  pw.SizedBox(height: 1 * PdfPageFormat.mm),
                  pw.Text(
                    ' Imaran Namgar, Daman-Silvasa Road ,Vapi 396195 (Gujarat)',
                    style: pw.TextStyle(
                      fontSize: 13.0,
                      color: PdfColors.grey700,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(height: 1 * PdfPageFormat.mm),
                  pw.Text(
                    ' Tel. : 0260-2410824 Email : info@furnipart.co.in',
                    style: const pw.TextStyle(
                      fontSize: 10.0,
                      color: PdfColors.grey700,
                    ),
                  ),
                ],
              ),
            ),

            pw.Container(
              decoration: pw.BoxDecoration(border: pw.Border.all()),
              //padding: pw.EdgeInsets.all(8.0),
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Expanded(
                      flex: 1,
                      child: pw.Container(
                        padding: pw.EdgeInsets.all(8.0),
                        decoration: pw.BoxDecoration(border: pw.Border.all()),
                        child: pw.Column(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('Party Detail',
                                  style: pw.TextStyle(
                                    color: PdfColors.grey700,
                                    fontSize: 12.0,
                                  )),
                              pw.Text('Kamlesh Bhai Rana ',
                                  style: pw.TextStyle(
                                    fontSize: 12.0,
                                  )),
                              pw.SizedBox(height: 20),
                              pw.Text('Party Gst No :',
                                  style: pw.TextStyle(
                                    fontSize: 12.0,
                                  )),
                              pw.Text('Mobile No.     : 99857487544',
                                  style: pw.TextStyle(
                                    fontSize: 12.0,
                                  )),
                              pw.Text('Tel No.          :',
                                  style: pw.TextStyle(
                                    fontSize: 12.0,
                                  )),
                            ]),
                      ),
                    ),

                    pw.Expanded(
                      flex: 1,
                      child: pw.Container(
                        padding: pw.EdgeInsets.all(8.0),
                        // decoration: pw.BoxDecoration(border: pw.Border.all()),
                        child: pw.Column(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('Quotation No    : GST-1952',
                                  style: pw.TextStyle(
                                    fontSize: 12.0,
                                  )),
                              pw.Text('Date                  : 29-10-2022',
                                  style: pw.TextStyle(
                                    fontSize: 12.0,
                                  )),
                              pw.SizedBox(height: 10),
                              pw.Text('Sales Incharge. : Surat (95747774477)',
                                  style: pw.TextStyle(
                                    fontSize: 12.0,
                                  )),
                            ]),
                      ),
                    ),

                    // pw.Column(
                    //     mainAxisAlignment: pw.MainAxisAlignment.start,
                    //     crossAxisAlignment: pw.CrossAxisAlignment.start,
                    //     children: [
                    //       pw.Text(
                    //         'Quotation No    : GST-1952',
                    //         textAlign: pw.TextAlign.justify,
                    //       ),
                    //       pw.Text(
                    //         'Date                 : 29-10-2022',
                    //         textAlign: pw.TextAlign.justify,
                    //       ),
                    //       pw.SizedBox(height: 10),
                    //       pw.Text(
                    //         'Sales Incharge. : Surat (95747774477)',
                    //         textAlign: pw.TextAlign.justify,
                    //       ),
                    //     ]),
                  ]),
            ),

            //
            //
            //
            // pw.Text(
            //   'Dear John,\nLorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit, tenetur error',
            //   textAlign: pw.TextAlign.justify,
            // ),
            // pw.SizedBox(height: 5 * PdfPageFormat.mm),

            ///
            /// PDF Table Create
            ///
            ///
            ///

            pw.Container(
              alignment: pw.Alignment.topCenter,
              //height: 200,
              padding:
                  const pw.EdgeInsets.only(left: 1.0, right: 1.0, top: 1.0),
              decoration: pw.BoxDecoration(border: pw.Border.all()),
              child: pw.Table.fromTextArray(
                headers: tableHeaders,
                data: tableDatas,
                border: pw.TableBorder(verticalInside: pw.BorderSide(width: 1)),
                headerStyle:
                    pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 9.0),
                cellStyle: pw.TextStyle(fontSize: 9.0),
                headerDecoration:
                    const pw.BoxDecoration(color: PdfColors.grey300),
                cellHeight: 30.0,
                cellAlignments: {
                  0: pw.Alignment.centerRight,
                  1: pw.Alignment.center,
                  2: pw.Alignment.center,
                  3: pw.Alignment.center,
                  4: pw.Alignment.center,
                  5: pw.Alignment.center,
                  6: pw.Alignment.center,
                  7: pw.Alignment.center,
                  8: pw.Alignment.center,
                  9: pw.Alignment.center,
                  10: pw.Alignment.center,
                },
              ),
            ),

            pw.Container(
                decoration: pw.BoxDecoration(border: pw.Border.all()),
                padding: pw.EdgeInsets.all(8.0),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Text("8.00",
                          style: pw.TextStyle(
                            fontSize: 9.0,
                          )),
                      pw.SizedBox(width: 17),
                      pw.Text("800.00",
                          style: pw.TextStyle(
                            fontSize: 9.0,
                          ))
                    ])),

            pw.Container(
              decoration: pw.BoxDecoration(border: pw.Border.all()),
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Container(
                      padding: pw.EdgeInsets.only(top: 8.0, left: 8.0),
                      child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text('Eight Thousand Only',
                                style: pw.TextStyle(
                                  fontSize: 9.0,
                                )),
                            pw.Text('Gst No :',
                                style: pw.TextStyle(
                                  fontSize: 9.0,
                                )),
                            pw.Text('Sale ',
                                style: pw.TextStyle(
                                  fontSize: 9.0,
                                )),
                            pw.SizedBox(height: 25),
                          ]),
                    ),
                    pw.Spacer(),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Container(
                            padding: pw.EdgeInsets.only(top: 8.0),
                            child: pw.Text('Grand Total',
                                style: pw.TextStyle(
                                  fontSize: 9.0,
                                )),
                          ),
                          pw.SizedBox(width: 10),
                          pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            padding: pw.EdgeInsets.all(9.0),
                            child: pw.Text('800.00',
                                style: pw.TextStyle(
                                  fontSize: 9.0,
                                )),
                          )
                        ]),
                  ]),
            ),
            pw.Container(
              padding: pw.EdgeInsets.all(8.0),
              decoration: pw.BoxDecoration(border: pw.Border.all()),
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    //width: MediaQuery.of(context).size.width,

                    pw.Text(
                      'Your total saving :',
                      style: const pw.TextStyle(
                        fontSize: 13.0,
                        color: PdfColors.red,
                      ),
                    ),

                    //  width: MediaQuery.of(context).size.width,

                    pw.Text(
                      'Your total saving :',
                      style: const pw.TextStyle(
                        fontSize: 13.0,
                        color: PdfColors.white,
                      ),
                    ),
                  ]),
            ),
            pw.Container(
              decoration: pw.BoxDecoration(border: pw.Border.all()),
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    //width: MediaQuery.of(context).size.width,
                    pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            child: pw.Column(
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Container(
                                    padding: const pw.EdgeInsets.only(
                                        left: 8.0, top: 2),
                                    // decoration: pw.BoxDecoration(border: pw.Border.all()),
                                    child: pw.Text(
                                      'Term & Cond',
                                      style: const pw.TextStyle(
                                        decoration: pw.TextDecoration.underline,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                  pw.Container(
                                    padding: const pw.EdgeInsets.only(
                                        left: 8.0, top: 8.0),
                                    // decoration: pw.BoxDecoration(border: pw.Border.all()),
                                    child: pw.Text(
                                      'E.& O.E',
                                      style: const pw.TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  pw.Container(
                                    padding:
                                        const pw.EdgeInsets.only(left: 8.0),
                                    // decoration: pw.BoxDecoration(border: pw.Border.all()),
                                    child: pw.Text(
                                      '1. Rate given above :',
                                      style: const pw.TextStyle(
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                  pw.Container(
                                    padding:
                                        const pw.EdgeInsets.only(left: 8.0),
                                    // decoration: pw.BoxDecoration(border: pw.Border.all()),
                                    child: pw.Text(
                                      '2. Quot Valid for 2 days Only ',
                                      style: const pw.TextStyle(
                                        fontSize: 10.0,
                                        color: PdfColors.red,
                                      ),
                                    ),
                                  ),
                                  pw.Container(
                                    padding:
                                        const pw.EdgeInsets.only(left: 8.0),
                                    // decoration: pw.BoxDecoration(border: pw.Border.all()),
                                    child: pw.Text(
                                      '3. GST Tax Applicable ',
                                      style: const pw.TextStyle(
                                        fontSize: 10.0,
                                        color: PdfColors.red,
                                      ),
                                    ),
                                  ),
                                  pw.Container(
                                    padding:
                                        const pw.EdgeInsets.only(left: 8.0),
                                    // decoration: pw.BoxDecoration(border: pw.Border.all()),
                                    child: pw.Text(
                                      '4. Advance Payment',
                                      style: const pw.TextStyle(
                                        fontSize: 10.0,
                                        color: PdfColors.red,
                                      ),
                                    ),
                                  ),
                                  pw.Container(
                                    padding: const pw.EdgeInsets.only(
                                        left: 8.0, top: 8),
                                    // decoration: pw.BoxDecoration(border: pw.Border.all()),
                                    child: pw.Text(
                                      'Prepared By : Dhruti',
                                      style: const pw.TextStyle(
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  )
                                ]))),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Container(

                          //decoration: pw.BoxDecoration(border: pw.Border.all()),
                          child: pw.Column(children: [
                        pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              //width: MediaQuery.of(context).size.width,
                              pw.Expanded(
                                  flex: 1,
                                  child: pw.Container(
                                    padding: const pw.EdgeInsets.only(
                                        bottom: 30.0, top: 2, left: 2),
                                    decoration: pw.BoxDecoration(
                                        border: pw.Border.all()),
                                    child: pw.Text(
                                      "Receiver's Sign ",
                                      style: const pw.TextStyle(
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  )),
                              pw.Expanded(
                                  flex: 1,
                                  child: pw.Container(
                                    padding: const pw.EdgeInsets.only(
                                        bottom: 30.0, top: 2, left: 2),
                                    decoration: pw.BoxDecoration(
                                        border: pw.Border.all()),
                                    child: pw.Text(
                                      'Checked By',
                                      style: const pw.TextStyle(
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  )),
                            ]),
                        pw.Container(
                          alignment: pw.Alignment.bottomRight,
                          padding: const pw.EdgeInsets.only(
                              top: 40.5, right: 8, bottom: 2),
                          //  decoration: pw.BoxDecoration(border: pw.Border.all()),
                          child: pw.Text(
                            'Authorised Signatory',
                            style: const pw.TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                        )
                      ])),
                    ),
                  ]),
            ),
            pw.Container(
              alignment: pw.Alignment.center,
              padding: const pw.EdgeInsets.all(8),
              decoration: pw.BoxDecoration(border: pw.Border.all()),
              child: pw.Text(
                'Bank name : Bank of India : A/c No : 64654657445564 Branch : Vapi ',
                style: const pw.TextStyle(
                  fontSize: 10.0,
                ),
              ),
            )

            // pw.Divider(),
            //  pw.Container(
            //    alignment: pw.Alignment.centerRight,
            //    child: pw.Row(
            //      children: [
            //        pw.Spacer(flex: 6),
            //        pw.Expanded(
            //          flex: 4,
            //          child: pw.Column(
            //            crossAxisAlignment: pw.CrossAxisAlignment.start,
            //            children: [
            //              pw.Row(
            //                children: [
            //                  pw.Expanded(
            //                    child: pw.Text(
            //                      'Net total',
            //                      style: pw.TextStyle(
            //                        fontWeight: pw.FontWeight.bold,
            //                      ),
            //                    ),
            //                  ),
            //                  pw.Text(
            //                    '\$ 464',
            //                    style: pw.TextStyle(
            //                      fontWeight: pw.FontWeight.bold,
            //                    ),
            //                  ),
            //                ],
            //              ),
            //              pw.Row(
            //                children: [
            //                  pw.Expanded(
            //                    child: pw.Text(
            //                      'Vat 19.5 %',
            //                      style: pw.TextStyle(
            //                        fontWeight: pw.FontWeight.bold,
            //                      ),
            //                    ),
            //                  ),
            //                  pw.Text(
            //                    '\$ 90.48',
            //                    style: pw.TextStyle(
            //                      fontWeight: pw.FontWeight.bold,
            //                    ),
            //                  ),
            //                ],
            //              ),
            //              pw.Divider(),
            //              pw.Row(
            //                children: [
            //                  pw.Expanded(
            //                    child: pw.Text(
            //                      'Total amount due',
            //                      style: pw.TextStyle(
            //                        fontSize: 14.0,
            //                        fontWeight: pw.FontWeight.bold,
            //                      ),
            //                    ),
            //                  ),
            //                  pw.Text(
            //                    '\$ 554.48',
            //                    style: pw.TextStyle(
            //                      fontWeight: pw.FontWeight.bold,
            //                    ),
            //                  ),
            //                ],
            //              ),
            //              pw.SizedBox(height: 2 * PdfPageFormat.mm),
            //              pw.Container(height: 1, color: PdfColors.grey400),
            //              pw.SizedBox(height: 0.5 * PdfPageFormat.mm),
            //              pw.Container(height: 1, color: PdfColors.grey400),
            //            ],
            //          ),
            //        ),
            //      ],
            //    ),
            //  ),
          ];
        },
        // footer: (context) {
        //   return pw.Column(
        //     mainAxisSize: pw.MainAxisSize.min,
        //     children: [
        //       pw.Divider(),
        //       pw.SizedBox(height: 2 * PdfPageFormat.mm),
        //       pw.Text(
        //         'Flutter Approach',
        //         style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        //       ),
        //       pw.SizedBox(height: 1 * PdfPageFormat.mm),
        //       pw.Row(
        //         mainAxisAlignment: pw.MainAxisAlignment.center,
        //         children: [
        //           pw.Text(
        //             'Address: ',
        //             style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        //           ),
        //           pw.Text(
        //             'Merul Badda, Anandanagor, Dhaka 1212',
        //           ),
        //         ],
        //       ),
        //       pw.SizedBox(height: 1 * PdfPageFormat.mm),
        //       pw.Row(
        //         mainAxisAlignment: pw.MainAxisAlignment.center,
        //         children: [
        //           pw.Text(
        //             'Email: ',
        //             style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        //           ),
        //           pw.Text(
        //             'flutterapproach@gmail.com',
        //           ),
        //         ],
        //       ),
        //     ],
        //   );
        // },
      ),
    );
  }

  static writeOnProductWithPdf(Document pdf, List<Product>? myProductList,
      String title, Uint8List iconImage, BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    List<List<Product>> finalList = [];
    List<int> finalQtyList = [];
    List<int> finalPriceList = [];

    int len = myProductList!.length;
    int size = 25;
    var chunks = [];

    for (var i = 0; i < len; i += size) {
      var end = (i + size < len) ? i + size : len;
      chunks.add(myProductList.sublist(i, end));
    }

    print("chunkschunkschunkschunkschunks ${chunks}");
    print("screenWidth ${screenWidth}");
    print("screenHeight ${screenHeight}");

    int devide = 0;

    int j = 1;
    int k = 25;
    for (int i = 0; i < 10; i++) {
      print("myProductList.length $j ");
      print("myProductList.length $k ");
      print("myProductList.length $i ${myProductList.length >= j}");
      print("myProductList.length $i ${myProductList.length <= k}");

      if (myProductList.length >= j && myProductList.length <= k) {
        devide = i + 1;
      }
      j = j + 25;
      k = k + 25;
    }

    print("devide  devide  devide  ${devide}");
    for (int i = 0; i < devide; i++) {
      List<Product>? list = [];
      int totalQty = 0;
      int totalPrice = 0;

      for (int j = 0; j < chunks[i].length; j++) {
        list.add(chunks[i][j]);
        totalQty = (totalQty + chunks[i][j].qty) as int;
        totalPrice = (totalPrice + chunks[i][j].price) as int;
      }
      finalList.add(list);
      finalQtyList.add(totalQty);
      finalPriceList.add(totalPrice);
      print("finalList finalList ${finalList}");
      print("finalQtyList finalQtyList ${finalQtyList}");
      print("finalPriceList finalPriceList ${finalList}");
      print("finalList finalList ${finalList}");
    }

    final tableHeaders = [
      'S.N',
      'Description of Goods',
      'Unit',
      'MRP',
      'Disc',
      'Price',
      'Qty',
      'Amount',
    ];
    List<dynamic>? list = [];

    for (int i = 0; i < myProductList.length; i++) {
      list.add([
        '${i + 1}.',
        'Hettich TSD ',
        'Pair',
        '1000',
        '15.00 %',
        '270',
        '${myProductList[i].qty}',
        '800',
      ]);
    }
    print("list.length ${list.length}");

    List<List<dynamic>> tableDatas = [];
    for (int i = 0; i < list.length; i++) {
      tableDatas.add(list[i]);
    }
    List<dynamic> emptyList = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];

    List<List<dynamic>> tableData = [
      [
        '1.',
        '2.00',
        'Pair',
        '1000',
        '15.00 %',
        '270',
        '9.00',
        '800',
      ],
      [
        '2.',
        '2.00',
        'Pair',
        '1000',
        '15.00 %',
        '270',
        '9.00',
        '800',
      ],
      [
        '3.',
        '2.00',
        'Pair',
        '1000',
        '15.00 %',
        '270',
        '9.00',
        '800',
      ]
    ];

    for (int i = 1; i < 21; i++) {
      //  print("first ii$i");
      if (myProductList.length == i) {
        for (int j = 0; j < 21 - i; j++) {
          print("first jj$j");
          tableDatas.add(emptyList);
        }
      }
    }

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(0.0),
        header: (contx) {
          return pw.Column(children: [
            pw.Container(
              height: 50,
              margin: pw.EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
              //height: MediaQuery.of(context).size.height * 0.05,
              alignment: pw.Alignment.center,
              decoration: pw.BoxDecoration(border: pw.Border.all()),
              padding: pw.EdgeInsets.all(5.0),
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Text(
                    '|| Shree Ganeshay Namah ||',
                    style: const pw.TextStyle(
                      fontSize: 9.0,
                      color: PdfColors.grey700,
                    ),
                  ),
                  pw.SizedBox(height: 1 * PdfPageFormat.mm),
                  pw.Text(
                    'Quotation / Performa invoice',
                    style: pw.TextStyle(
                      fontSize: 11.0,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            pw.Container(
              height: 110,
              margin: pw.EdgeInsets.only(left: 30.0, right: 30.0),
              //height: MediaQuery.of(context).size.height * 0.10,
              decoration: pw.BoxDecoration(border: pw.Border.all()),
              //padding: pw.EdgeInsets.all(8.0),
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Expanded(
                      flex: 1,
                      child: pw.Container(
                        padding: pw.EdgeInsets.all(5.0),
                        decoration: pw.BoxDecoration(border: pw.Border.all()),
                        child: pw.Column(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('Party Detail',
                                  style: pw.TextStyle(
                                      color: PdfColors.grey700,
                                      fontSize: 10.0)),
                              pw.Text('Kamlesh Bhai Rana ',
                                  style: pw.TextStyle(fontSize: 10.0)),
                              pw.SizedBox(height: 15.0),
                              pw.Text('Party Gst No :',
                                  style: pw.TextStyle(fontSize: 10.0)),
                              pw.Text('Mobile No.     : 99857487544',
                                  style: pw.TextStyle(fontSize: 10.0)),
                              pw.Text('Tel No.          :',
                                  style: pw.TextStyle(fontSize: 10.0)),
                            ]),
                      ),
                    ),

                    pw.Expanded(
                      flex: 1,
                      child: pw.Container(
                        padding: pw.EdgeInsets.all(5.0),
                        // decoration: pw.BoxDecoration(border: pw.Border.all()),
                        child: pw.Column(
                            // mainAxisAlignment:
                            //     pw.MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('Quotation No    : GST-1952',
                                  style: pw.TextStyle(fontSize: 10.0)),
                              pw.Text('Date                 : 29-10-2022',
                                  style: pw.TextStyle(fontSize: 10.0)),
                              pw.SizedBox(height: 12.0),
                              pw.Text('Sales Incharge. : Surat (95747774477)',
                                  style: pw.TextStyle(fontSize: 10.0)),
                            ]),
                      ),
                    ),

                    // pw.Column(
                    //     mainAxisAlignment: pw.MainAxisAlignment.start,
                    //     crossAxisAlignment: pw.CrossAxisAlignment.start,
                    //     children: [
                    //       pw.Text(
                    //         'Quotation No    : GST-1952',
                    //         textAlign: pw.TextAlign.justify,
                    //       ),
                    //       pw.Text(
                    //         'Date                 : 29-10-2022',
                    //         textAlign: pw.TextAlign.justify,
                    //       ),
                    //       pw.SizedBox(height: 10),
                    //       pw.Text(
                    //         'Sales Incharge. : Surat (95747774477)',
                    //         textAlign: pw.TextAlign.justify,
                    //       ),
                    //     ]),
                  ]),
            ),
            pw.Container(
              margin: pw.EdgeInsets.only(left: 30.0, right: 30.0),
              child: pw.Row(children: [
                tableHeaderContainer("S. N.", 35, context),
                pw.Expanded(
                    child: tableHeaderContainer(
                        "Description of Goods", 0.0, context)),
                tableHeaderContainer("Unit", 40, context),
                tableHeaderContainer("MRP", 40, context),
                tableHeaderContainer("Disc", 45, context),
                tableHeaderContainer("Price", 40, context),
                tableHeaderContainer("Qty.", 40, context),
                tableHeaderContainer("Amount", 50, context),
              ]),
            )
          ]);
        },
        build: (contx) {
          // print("pageNumber  ${contx.pageNumber}");
          // print("pagesCount  ${contx.pagesCount}");
          // print("page  ${contx.page}");
          // print("document  ${contx.document}");
          // print("pageLabel  ${contx.pageLabel}");

          return [


            pw.Column(
                children: finalList.map((e) {
              var i = finalList.indexOf(e);
              return pw.Container(
                  margin:
                      pw.EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
                  height: MediaQuery.of(context).size.height - 252,
                  // height: MediaQuery.of(context).size.height * 0.68,
                  child: pw.Column(children: [
                    pw.Container(
                        //height: 200,
                        child: pw.Wrap(
                            children: e.map((e) {
                      var index = myProductList.indexOf(e) + 1;
                      return pw.Row(children: [
                        pw.Container(
                          height: MediaQuery.of(context).size.width * 0.040,
                          // height: 186.2,
                          width: 35,

                          alignment: pw.Alignment.center,
                          padding: const pw.EdgeInsets.all(5),
                          decoration: pw.BoxDecoration(
                              border: pw.Border(
                                  right: pw.BorderSide(width: 1.0),
                                  left: pw.BorderSide(width: 1.0))),
                          child: pw.Text(
                            "${index}.",
                            style: const pw.TextStyle(
                              fontSize: 9.0,
                            ),
                          ),
                        ),
                        pw.Expanded(
                            child: tableDataContainer(
                                "${e.description}", 0.0, context)),
                        tableDataContainer("PCS", 40, context),
                        tableDataContainer("650.00", 40, context),
                        tableDataContainer("15.00 %", 45, context),
                        tableDataContainer("${e.price}.00", 40, context),
                        tableDataContainer("${e.qty}.00", 40, context),
                        tableDataContainer("${e.price}.00", 50, context),
                      ]);
                    }
                                // pw.Text("${e.description}")
                                ).toList())),

                    // nextPageExpended(myProductList,context),

                    expendedWidget(myProductList),
                    totalContainer11(
                        myProductList, finalQtyList[i], finalPriceList[i]),
                  ]));
            }).toList()),




            // pw.Wrap(
            //     children: myProductList.map((e) {
            //       // print("pageNumber  ${contx.pageNumber}");
            //       var index = myProductList.indexOf(e) + 1;
            //       return pw.Row(children: [
            //         pw.Container(
            //           height: MediaQuery.of(context).size.width * 0.040,
            //           // height: 186.2,
            //           width: 35,
            //
            //           alignment: pw.Alignment.center,
            //           padding: const pw.EdgeInsets.all(5),
            //           decoration: pw.BoxDecoration(
            //               border: pw.Border(
            //                   right: pw.BorderSide(width: 1.0),
            //                   left: pw.BorderSide(width: 1.0))),
            //           child: pw.Text(
            //             "${index}.",
            //             style: const pw.TextStyle(
            //               fontSize: 9.0,
            //             ),
            //           ),
            //         ),
            //         pw.Expanded(
            //             child: tableDataContainer(
            //                 "${e.description}", 0.0, context)),
            //         tableDataContainer("PCS", 40, context),
            //         tableDataContainer("650.00", 40, context),
            //         tableDataContainer("15.00 %", 45, context),
            //         tableDataContainer("${e.price}.00", 40, context),
            //         tableDataContainer("${e.qty}.00", 40, context),
            //         tableDataContainer("${e.price}.00", 50, context),
            //       ]);
            //     }
            //       // pw.Text("${e.description}")
            //     ).toList()),
            // expendedWidget(myProductList),




            // pw.Container(
            //     // flex: 50,
            //     child: pw.Wrap(
            //         children: list1.map((e) {
            //   var index = myProductList.indexOf(e) + 1;
            //   return pw.Row(children: [
            //     pw.Container(
            //       height: MediaQuery.of(context).size.width * 0.040,
            //       // height: 186.2,
            //       width: 35,
            //
            //       alignment: pw.Alignment.center,
            //       padding: const pw.EdgeInsets.all(5),
            //       decoration: pw.BoxDecoration(
            //           border: pw.Border(
            //               right: pw.BorderSide(width: 1.0),
            //               left: pw.BorderSide(width: 1.0))),
            //       child: pw.Text(
            //         "${index}",
            //         style: const pw.TextStyle(
            //           fontSize: 9.0,
            //         ),
            //       ),
            //     ),
            //     pw.Expanded(
            //         child:
            //             tableDataContainer("${e.description}", 0.0, context)),
            //     tableDataContainer("PCS", 40, context),
            //     tableDataContainer("650.00", 40, context),
            //     tableDataContainer("15.00 %", 45, context),
            //     tableDataContainer("${e.price}.00", 40, context),
            //     tableDataContainer("${e.qty}.00", 40, context),
            //     tableDataContainer("${e.price}.00", 50, context),
            //   ]);
            // }
            //             // pw.Text("${e.description}")
            //             ).toList())),
            //
            // // nextPageExpended(myProductList,context),
            //
            // expendedWidget(myProductList),
            // totalContainer11(myProductList,totalQty1,totalPrice1),
            //
            // //second
            //
            // list2.isNotEmpty
            //     ? pw.Container(
            //         // flex: 50,
            //         child: pw.Wrap(
            //             children: list2.map((e) {
            //         var index = myProductList.indexOf(e) + 1;
            //         return pw.Row(children: [
            //           pw.Container(
            //             height: MediaQuery.of(context).size.width * 0.040,
            //             // height: 186.2,
            //             width: 35,
            //
            //             alignment: pw.Alignment.center,
            //             padding: const pw.EdgeInsets.all(5),
            //             decoration: pw.BoxDecoration(
            //                 border: pw.Border(
            //                     right: pw.BorderSide(width: 1.0),
            //                     left: pw.BorderSide(width: 1.0))),
            //             child: pw.Text(
            //               "${index}",
            //               style: const pw.TextStyle(
            //                 fontSize: 9.0,
            //               ),
            //             ),
            //           ),
            //           pw.Expanded(
            //               child: tableDataContainer(
            //                   "${e.description}", 0.0, context)),
            //           tableDataContainer("PCS", 40, context),
            //           tableDataContainer("650.00", 40, context),
            //           tableDataContainer("15.00 %", 45, context),
            //           tableDataContainer("${e.price}.00", 40, context),
            //           tableDataContainer("${e.qty}.00", 40, context),
            //           tableDataContainer("${e.price}.00", 50, context),
            //         ]);
            //       }
            //                 // pw.Text("${e.description}")
            //                 ).toList()))
            //     : pw.Container(),
            //
            // // nextPageExpended(myProductList,context),
            //
            // list2.isNotEmpty ? expendedWidget(myProductList) : pw.Container(),
            // list2.isNotEmpty ? totalContainer11(myProductList,totalQty2,totalPrice2) : pw.Container(),
            //
            // //Three
            //
            // list3.isNotEmpty
            //     ? pw.Container(
            //         // flex: 50,
            //         child: pw.Wrap(
            //             children: list3.map((e) {
            //         var index = myProductList.indexOf(e) + 1;
            //         return pw.Row(children: [
            //           pw.Container(
            //             height: MediaQuery.of(context).size.width * 0.040,
            //             // height: 186.2,
            //             width: 35,
            //
            //             alignment: pw.Alignment.center,
            //             padding: const pw.EdgeInsets.all(5),
            //             decoration: pw.BoxDecoration(
            //                 border: pw.Border(
            //                     right: pw.BorderSide(width: 1.0),
            //                     left: pw.BorderSide(width: 1.0))),
            //             child: pw.Text(
            //               "${index}",
            //               style: const pw.TextStyle(
            //                 fontSize: 9.0,
            //               ),
            //             ),
            //           ),
            //           pw.Expanded(
            //               child: tableDataContainer(
            //                   "${e.description}", 0.0, context)),
            //           tableDataContainer("PCS", 40, context),
            //           tableDataContainer("650.00", 40, context),
            //           tableDataContainer("15.00 %", 45, context),
            //           tableDataContainer("${e.price}.00", 40, context),
            //           tableDataContainer("${e.qty}.00", 40, context),
            //           tableDataContainer("${e.price}.00", 50, context),
            //         ]);
            //       }
            //                 // pw.Text("${e.description}")
            //                 ).toList()))
            //     : pw.Container(),
            //
            // // nextPageExpended(myProductList,context),
            //
            // list3.isNotEmpty ? expendedWidget(myProductList) : pw.Container(),
            // list3.isNotEmpty ? totalContainer11(myProductList,totalQty3,totalPrice3) : pw.Container()
          ];
        },
        // footer: (context) {
        //   List<Total> totalList = [];
        //   int totalQty=0;
        //   int totalPrice = 0;
        //   for(int i = 0; i<myProductList.length; i++){
        //     print("pageNumber  ${context.pageNumber}");
        //     print("qty  ${myProductList[i].qty}");
        //     if( context.pageNumber == 1){
        //       totalQty = (totalQty + myProductList[i].qty!);
        //       totalPrice = (totalPrice + myProductList[i].price!);
        //     }
        //     if( context.pageNumber == 2){
        //       totalQty = (totalQty + myProductList[i].qty!);
        //       totalPrice = (totalPrice + myProductList[i].price!);
        //     }
        //     //totalList.add(Total(price: myProductList[i].price,qty: myProductList[i].qty,index: context.pageNumber));
        //         // totalQty = (totalQty + chunks[i][j].qty) as int;
        //         // totalPrice = (totalPrice + chunks[i][j].price) as int;
        //     //   if(totalList[i].index == context.pageNumber){
        //     //     totalQty = (totalQty + totalList[i].qty!);
        //     //     totalPrice = (totalPrice + totalList[i].price!);
        //     //   }
        //     // for(int i = 0; i<totalList.length; i++){
        //     //   print("pageNumber  ${context.pageNumber}");
        //     //   if(totalList[i].index == context.pageNumber){
        //     //     totalQty = (totalQty + totalList[i].qty!);
        //     //     totalPrice = (totalPrice + totalList[i].price!);
        //     //   }
        //   }
        //
        //   // for(int i = 0; i<totalList.length; i++){
        //   //   print("pageNumber  ${context.pageNumber}");
        //   //   if(totalList[i].index == context.pageNumber){
        //   //     totalQty = (totalQty + totalList[i].qty!);
        //   //     totalPrice = (totalPrice + totalList[i].price!);
        //   //   }
        //   //
        //   //
        //   // }
        //
        //
        //   // print("pageNumber  ${context.pageNumber}");
        //   // print("pagesCount  ${context.pagesCount}");
        //   // print("page  ${context.page}");
        //   // print("document  ${context.document}");
        //   // print("pageLabel  ${context.pageLabel}");
        //   return totalContainer11(
        //       myProductList, totalQty, totalPrice,context.pageNumber,totalList,context);
        // },
      ),
    );
  }

  // static writeOnProductWithPdf(Document pdf, List<Product>? myProductList,
  //     String title, Uint8List iconImage, BuildContext context) {
  //   // pdf.addPage(pw.MultiPage(
  //   //   //margin: pw.EdgeInsets.all(20),
  //   //   crossAxisAlignment: pw.CrossAxisAlignment.center,
  //   //   mainAxisAlignment: pw.MainAxisAlignment.center,
  //   //   pageFormat: PdfPageFormat.a4,
  //   //   build: (context) {
  //   //     return <pw.Widget>[
  //   //       pw.Header(
  //   //         //level: 0,
  //   //           child: pw.Row(
  //   //               mainAxisAlignment: pw.MainAxisAlignment.center,
  //   //               crossAxisAlignment: pw.CrossAxisAlignment.center,
  //   //               children: [
  //   //                 // pw.Image(image,height: 100, width: 100, alignment: pw.Alignment.centerLeft),
  //   //                 pw.SizedBox(width: 20),
  //   //                 pw.Text("$title",
  //   //                     textAlign: pw.TextAlign.center,
  //   //                     style: pw.TextStyle(
  //   //                       fontSize: 40,
  //   //                       color: PdfColor.fromHex('#4684C2'),
  //   //                       fontWeight: pw.FontWeight.bold,
  //   //                     )),
  //   //                 pw.SizedBox(width: 20),
  //   //               ])),
  //   //       //pw.Divider(color: PdfColor.fromHex('#4684C2'),thickness: 3),
  //   //       pw.GridView(crossAxisCount: 2, childAspectRatio: 1, children: [
  //   //         for (int i = 0; i < myProductList!.length; i++)
  //   //           pw.Container(
  //   //               margin: const pw.EdgeInsets.only(top: 10),
  //   //               alignment: pw.Alignment.centerLeft,
  //   //               //height: 300,
  //   //               child: pw.Column(
  //   //                   mainAxisAlignment: pw.MainAxisAlignment.start,
  //   //                   crossAxisAlignment: pw.CrossAxisAlignment.start,
  //   //                   children: [
  //   //                     //pw.Image(imageN[i],alignment: pw.Alignment.centerLeft,height: 100, width: 200),
  //   //                     pw.Text("Product Name: ${myProductList[i].name}",
  //   //                         textAlign: pw.TextAlign.left,
  //   //                         style: const pw.TextStyle(
  //   //                           fontSize: 15,
  //   //                         )),
  //   //                     pw.Text("Description: ${myProductList[i].description}",
  //   //                         textAlign: pw.TextAlign.left,
  //   //                         style: const pw.TextStyle(
  //   //                           fontSize: 15,
  //   //                         )),
  //   //                     pw.Text("Quantity: ${myProductList[i].qty}",
  //   //                         textAlign: pw.TextAlign.left,
  //   //                         style: const pw.TextStyle(
  //   //                           fontSize: 15,
  //   //                         )),
  //   //
  //   //                   ])),
  //   //       ]),
  //   //     ];
  //   //   },
  //   // ));
  //
  //   final tableHeaders = [
  //     'S.N',
  //     'Description of Goods',
  //     'Unit',
  //     'MRP',
  //     'Disc',
  //     'Price',
  //     'Qty',
  //     'Amount',
  //   ];
  //   List<dynamic>? list = [];
  //
  //   for (int i = 0; i < myProductList!.length; i++) {
  //     list.add([
  //       '${i + 1}.',
  //       'Hettich TSD ',
  //       'Pair',
  //       '1000',
  //       '15.00 %',
  //       '270',
  //       '${myProductList[i].qty}',
  //       '800',
  //     ]);
  //   }
  //   print("list.length ${list.length}");
  //   // final tableDatas;
  //   //for(int i = 0 ; i<myProductList!.length;i++){
  //   List<List<dynamic>> tableDatas = [];
  //   for (int i = 0; i < list.length; i++) {
  //     tableDatas.add(list[i]);
  //   }
  //   //tableDatas.addAll(list);
  //
  //   // }
  //   List<dynamic> emptyList = [
  //     '',
  //     '',
  //     '',
  //     '',
  //     '',
  //     '',
  //     '',
  //     '',
  //   ];
  //
  //   List<List<dynamic>> tableData = [
  //     [
  //       '1.',
  //       '2.00',
  //       'Pair',
  //       '1000',
  //       '15.00 %',
  //       '270',
  //       '9.00',
  //       '800',
  //     ],
  //     [
  //       '2.',
  //       '2.00',
  //       'Pair',
  //       '1000',
  //       '15.00 %',
  //       '270',
  //       '9.00',
  //       '800',
  //     ],
  //     [
  //       '3.',
  //       '2.00',
  //       'Pair',
  //       '1000',
  //       '15.00 %',
  //       '270',
  //       '9.00',
  //       '800',
  //     ]
  //   ];
  //
  //   for (int i = 1; i < 21; i++) {
  //     //  print("first ii$i");
  //     if (myProductList.length == i) {
  //       for (int j = 0; j < 21 - i; j++) {
  //         print("first jj$j");
  //         tableDatas.add(emptyList);
  //       }
  //     }
  //   }
  //
  //   // for (int i = 22; i < 50; i++) {
  //   //  // print("first ii11111111$i");
  //   //   if (myProductList.length == i) {
  //   //     for (int j = 0; j < 21 - i-21; j++) {
  //   //       print("first jj11111111$j");
  //   //       myProductList.add(Product());
  //   //     }
  //   //   }
  //   // }
  //   // if(myProductList.length == 1){
  //   //   for(int i = 0; i< 11; i++){
  //   //     tableDatas.add(emptyList);
  //   //   }
  //   // }else if(myProductList.length == 2){
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   // }else if(myProductList.length == 3){
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   // }else if(myProductList.length == 4){
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   // }else if(myProductList.length == 5){
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   // }else if(myProductList.length == 6){
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   // }else if(myProductList.length == 7){
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   // }else if(myProductList.length == 8){
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   // }else if(myProductList.length == 9){
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   // }else if(myProductList.length == 10){
  //   //   tableDatas.add(emptyList);
  //   //   tableDatas.add(emptyList);
  //   // }else if(myProductList.length == 11){
  //   //   tableDatas.add(emptyList);
  //   // }
  //   pdf.addPage(
  //     pw.MultiPage(
  //       // header: (context) {
  //       //   return pw.Text(
  //       //     'Flutter Approach',
  //       //     style: pw.TextStyle(
  //       //       fontWeight: pw.FontWeight.bold,
  //       //       fontSize: 15.0,
  //       //     ),
  //       //   );
  //       // },
  //       build: (contx) {
  //         return [
  //           pw.Container(
  //             alignment: pw.Alignment.center,
  //             decoration: pw.BoxDecoration(border: pw.Border.all()),
  //             padding: pw.EdgeInsets.all(5.0),
  //             child: pw.Column(
  //               mainAxisAlignment: pw.MainAxisAlignment.center,
  //               crossAxisAlignment: pw.CrossAxisAlignment.center,
  //               children: [
  //                 pw.Text(
  //                   '|| Shree Ganeshay Namah ||',
  //                   style: const pw.TextStyle(
  //                     fontSize: 9.0,
  //                     color: PdfColors.grey700,
  //                   ),
  //                 ),
  //                 pw.SizedBox(height: 1 * PdfPageFormat.mm),
  //                 pw.Text(
  //                   'Quotation / Performa invoice',
  //                   style: pw.TextStyle(
  //                     fontSize: 11.0,
  //                     fontWeight: pw.FontWeight.normal,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //
  //           pw.Container(
  //             decoration: pw.BoxDecoration(border: pw.Border.all()),
  //             //padding: pw.EdgeInsets.all(8.0),
  //             child: pw.Row(
  //                 mainAxisAlignment: pw.MainAxisAlignment.start,
  //                 crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                 children: [
  //                   pw.Expanded(
  //                     flex: 1,
  //                     child: pw.Container(
  //                       padding: pw.EdgeInsets.all(5.0),
  //                       decoration: pw.BoxDecoration(border: pw.Border.all()),
  //                       child: pw.Column(
  //                           mainAxisAlignment:
  //                           pw.MainAxisAlignment.spaceBetween,
  //                           crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                           children: [
  //                             pw.Text('Party Detail',
  //                                 style: pw.TextStyle(
  //                                     color: PdfColors.grey700,
  //                                     fontSize: 10.0)),
  //                             pw.Text('Kamlesh Bhai Rana ',
  //                                 style: pw.TextStyle(fontSize: 10.0)),
  //                             pw.SizedBox(height: 20.0),
  //                             pw.Text('Party Gst No :',
  //                                 style: pw.TextStyle(fontSize: 10.0)),
  //                             pw.Text('Mobile No.     : 99857487544',
  //                                 style: pw.TextStyle(fontSize: 10.0)),
  //                             pw.Text('Tel No.          :',
  //                                 style: pw.TextStyle(fontSize: 10.0)),
  //                           ]),
  //                     ),
  //                   ),
  //
  //                   pw.Expanded(
  //                     flex: 1,
  //                     child: pw.Container(
  //                       padding: pw.EdgeInsets.all(5.0),
  //                       // decoration: pw.BoxDecoration(border: pw.Border.all()),
  //                       child: pw.Column(
  //                           mainAxisAlignment:
  //                           pw.MainAxisAlignment.spaceBetween,
  //                           crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                           children: [
  //                             pw.Text('Quotation No    : GST-1952',
  //                                 style: pw.TextStyle(fontSize: 10.0)),
  //                             pw.Text('Date                 : 29-10-2022',
  //                                 style: pw.TextStyle(fontSize: 10.0)),
  //                             pw.SizedBox(height: 10.0),
  //                             pw.Text('Sales Incharge. : Surat (95747774477)',
  //                                 style: pw.TextStyle(fontSize: 10.0)),
  //                           ]),
  //                     ),
  //                   ),
  //
  //                   // pw.Column(
  //                   //     mainAxisAlignment: pw.MainAxisAlignment.start,
  //                   //     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                   //     children: [
  //                   //       pw.Text(
  //                   //         'Quotation No    : GST-1952',
  //                   //         textAlign: pw.TextAlign.justify,
  //                   //       ),
  //                   //       pw.Text(
  //                   //         'Date                 : 29-10-2022',
  //                   //         textAlign: pw.TextAlign.justify,
  //                   //       ),
  //                   //       pw.SizedBox(height: 10),
  //                   //       pw.Text(
  //                   //         'Sales Incharge. : Surat (95747774477)',
  //                   //         textAlign: pw.TextAlign.justify,
  //                   //       ),
  //                   //     ]),
  //                 ]),
  //           ),
  //
  //           //
  //           //
  //           //
  //           // pw.Text(
  //           //   'Dear John,\nLorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit, tenetur error',
  //           //   textAlign: pw.TextAlign.justify,
  //           // ),
  //           // pw.SizedBox(height: 5 * PdfPageFormat.mm),
  //
  //           ///
  //           /// PDF Table Create
  //           ///
  //           ///
  //           ///
  //           ///
  //
  //           //
  //           // pw.Expanded(
  //           //     flex: 50,
  //           //     child: pw.Wrap(
  //           //     children: myProductList
  //           //         .map((e) {
  //           //
  //           //       return pw.Container(
  //           //         alignment: pw.Alignment.center,
  //           //         padding: const pw.EdgeInsets.all(5),
  //           //         decoration:
  //           //         pw.BoxDecoration(border: pw.Border.all()),
  //           //         child: pw.Text(
  //           //           "${e.description}",
  //           //           style: const pw.TextStyle(
  //           //             fontSize: 9.0,
  //           //           ),
  //           //         ),
  //           //       );
  //           //     }
  //           //       // pw.Text("${e.description}")
  //           //     )
  //           //         .toList()))
  //           // ,
  //
  //           pw.Column(
  //               mainAxisAlignment: pw.MainAxisAlignment.start,
  //               crossAxisAlignment: pw.CrossAxisAlignment.start,
  //               children: [
  //                 pw.Container(
  //                     alignment: pw.Alignment.topCenter,
  //                     //height: 200,
  //                     padding: pw.EdgeInsets.only(left: 1.0, right: 1.0, top: 1.0),
  //                     decoration: pw.BoxDecoration(border: pw.Border.all()),
  //                     child: pw.Table.fromTextArray(
  //                       headers: tableHeaders,
  //                       data: tableDatas,
  //
  //
  //                       border:
  //                       const pw.TableBorder(verticalInside: pw.BorderSide(width: 1)),
  //                       //border: pw.TableBorder.all(),
  //                       headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 9.0),
  //                       cellStyle : const pw.TextStyle(fontSize: 9.0),
  //                       headerDecoration:
  //                       const pw.BoxDecoration(color: PdfColors.grey300),
  //                       cellHeight: 20.0,
  //                       columnWidths: {
  //                         7: pw.FixedColumnWidth(40.0),
  //                       },
  //                       headerAlignments: {
  //                         0: pw.Alignment.centerRight,
  //                         1: pw.Alignment.center,
  //                         2: pw.Alignment.center,
  //                         3: pw.Alignment.center,
  //                         4: pw.Alignment.center,
  //                         5: pw.Alignment.center,
  //                         6: pw.Alignment.center,
  //                         7: pw.Alignment.center,
  //                       },
  //                       cellAlignments: {
  //                         0: pw.Alignment.centerRight,
  //                         1: pw.Alignment.centerLeft,
  //                         2: pw.Alignment.center,
  //                         3: pw.Alignment.center,
  //                         4: pw.Alignment.center,
  //                         5: pw.Alignment.center,
  //                         6: pw.Alignment.center,
  //                         7: pw.Alignment.center,
  //                       },
  //                     )),
  //               ]),
  //
  //           pw.Container(
  //               decoration: pw.BoxDecoration(border: pw.Border.all()),
  //               // padding: pw.EdgeInsets.all(8.0),
  //               child: pw.Row(
  //                   mainAxisAlignment: pw.MainAxisAlignment.end,
  //                   crossAxisAlignment: pw.CrossAxisAlignment.center,
  //                   children: [
  //                     pw.Text("8.00", style: pw.TextStyle(fontSize: 9)),
  //                     pw.SizedBox(width: 20),
  //                     pw.Container(
  //                       decoration: pw.BoxDecoration(border: pw.Border.all()),
  //                       padding: pw.EdgeInsets.only(
  //                           top: 5.0, bottom: 5.0, left: 16.5, right: 16),
  //                       child:
  //                       pw.Text('800.00', style: pw.TextStyle(fontSize: 9)),
  //                     )
  //                   ])),
  //
  //           pw.Container(
  //             decoration: pw.BoxDecoration(border: pw.Border.all()),
  //             child: pw.Row(
  //                 mainAxisAlignment: pw.MainAxisAlignment.start,
  //                 crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                 children: [
  //                   pw.Container(
  //                     padding: pw.EdgeInsets.only(top: 5.0, left: 5.0),
  //                     child: pw.Column(
  //                         mainAxisAlignment: pw.MainAxisAlignment.start,
  //                         crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                         children: [
  //                           pw.Text('Eight Thousand Only',
  //                               style: pw.TextStyle(fontSize: 9)),
  //                         ]),
  //                   ),
  //                   pw.Spacer(),
  //                   pw.Row(
  //                       mainAxisAlignment: pw.MainAxisAlignment.start,
  //                       crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                       children: [
  //                         pw.Container(
  //                           padding: pw.EdgeInsets.only(top: 5.0),
  //                           child: pw.Text('Grand Total -',
  //                               style: pw.TextStyle(fontSize: 9)),
  //                         ),
  //                         pw.SizedBox(width: 10),
  //                         pw.Container(
  //                           decoration:
  //                           pw.BoxDecoration(border: pw.Border.all()),
  //                           padding: pw.EdgeInsets.only(
  //                               top: 5.0, bottom: 5.0, left: 16.5, right: 16),
  //                           child: pw.Text('800.00',
  //                               style: pw.TextStyle(fontSize: 9)),
  //                         )
  //                       ]),
  //                 ]),
  //           ),
  //
  //           pw.Container(
  //             padding: pw.EdgeInsets.all(5.0),
  //             decoration: pw.BoxDecoration(border: pw.Border.all()),
  //             child: pw.Row(
  //                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
  //                 crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                 children: [
  //                   //width: MediaQuery.of(context).size.width,
  //
  //                   pw.Text(
  //                     'Your total saving : 1079.49',
  //                     style: const pw.TextStyle(
  //                       fontSize: 10.0,
  //                       color: PdfColors.red,
  //                     ),
  //                   ),
  //
  //                   //  width: MediaQuery.of(context).size.width,
  //
  //                   pw.Text(
  //                     'Your total saving : 1079.49',
  //                     style: const pw.TextStyle(
  //                       fontSize: 10.0,
  //                       color: PdfColors.white,
  //                     ),
  //                   ),
  //                 ]),
  //           ),
  //           pw.Container(
  //             decoration: pw.BoxDecoration(border: pw.Border.all()),
  //             child: pw.Row(
  //                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
  //                 crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                 children: [
  //                   //width: MediaQuery.of(context).size.width,
  //                   pw.Expanded(
  //                       flex: 1,
  //                       child: pw.Container(
  //                           decoration:
  //                           pw.BoxDecoration(border: pw.Border.all()),
  //                           child: pw.Column(
  //                               mainAxisAlignment: pw.MainAxisAlignment.start,
  //                               crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                               children: [
  //                                 pw.Container(
  //                                   padding: const pw.EdgeInsets.only(
  //                                       left: 5.0, top: 5),
  //                                   // decoration: pw.BoxDecoration(border: pw.Border.all()),
  //                                   child: pw.Text(
  //                                     'Term & Cond',
  //                                     style: const pw.TextStyle(
  //                                       decoration: pw.TextDecoration.underline,
  //                                       fontSize: 8.0,
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 pw.Container(
  //                                   padding: const pw.EdgeInsets.only(
  //                                       left: 5.0, top: 5.0),
  //                                   // decoration: pw.BoxDecoration(border: pw.Border.all()),
  //                                   child: pw.Text(
  //                                     'E.& O.E',
  //                                     style: const pw.TextStyle(fontSize: 9.0),
  //                                   ),
  //                                 ),
  //                                 pw.Container(
  //                                   padding:
  //                                   const pw.EdgeInsets.only(left: 5.0),
  //                                   // decoration: pw.BoxDecoration(border: pw.Border.all()),
  //                                   child: pw.Text(
  //                                     '1. Rate given above :',
  //                                     style: const pw.TextStyle(
  //                                       fontSize: 9.0,
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 pw.Container(
  //                                   padding:
  //                                   const pw.EdgeInsets.only(left: 5.0),
  //                                   // decoration: pw.BoxDecoration(border: pw.Border.all()),
  //                                   child: pw.Text(
  //                                     '2. Quot Valid for 2 days Only ',
  //                                     style: const pw.TextStyle(
  //                                       fontSize: 9.0,
  //                                       color: PdfColors.red,
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 pw.Container(
  //                                   padding:
  //                                   const pw.EdgeInsets.only(left: 5.0),
  //                                   // decoration: pw.BoxDecoration(border: pw.Border.all()),
  //                                   child: pw.Text(
  //                                     '3. GST Tax Applicable ',
  //                                     style: const pw.TextStyle(
  //                                       fontSize: 9.0,
  //                                       color: PdfColors.red,
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ]))),
  //                 ]),
  //           ),
  //           pw.Container(
  //             alignment: pw.Alignment.center,
  //             padding: const pw.EdgeInsets.all(5),
  //             decoration: pw.BoxDecoration(border: pw.Border.all()),
  //             child: pw.Text(
  //               'Bank name : Bank of India : A/c No : 64654657445564 Branch : Vapi ',
  //               style: const pw.TextStyle(
  //                 fontSize: 9.0,
  //               ),
  //             ),
  //           )
  //
  //           // pw.Divider(),
  //           //  pw.Container(
  //           //    alignment: pw.Alignment.centerRight,
  //           //    child: pw.Row(
  //           //      children: [
  //           //        pw.Spacer(flex: 6),
  //           //        pw.Expanded(
  //           //          flex: 4,
  //           //          child: pw.Column(
  //           //            crossAxisAlignment: pw.CrossAxisAlignment.start,
  //           //            children: [
  //           //              pw.Row(
  //           //                children: [
  //           //                  pw.Expanded(
  //           //                    child: pw.Text(
  //           //                      'Net total',
  //           //                      style: pw.TextStyle(
  //           //                        fontWeight: pw.FontWeight.bold,
  //           //                      ),
  //           //                    ),
  //           //                  ),
  //           //                  pw.Text(
  //           //                    '\$ 464',
  //           //                    style: pw.TextStyle(
  //           //                      fontWeight: pw.FontWeight.bold,
  //           //                    ),
  //           //                  ),
  //           //                ],
  //           //              ),
  //           //              pw.Row(
  //           //                children: [
  //           //                  pw.Expanded(
  //           //                    child: pw.Text(
  //           //                      'Vat 19.5 %',
  //           //                      style: pw.TextStyle(
  //           //                        fontWeight: pw.FontWeight.bold,
  //           //                      ),
  //           //                    ),
  //           //                  ),
  //           //                  pw.Text(
  //           //                    '\$ 90.48',
  //           //                    style: pw.TextStyle(
  //           //                      fontWeight: pw.FontWeight.bold,
  //           //                    ),
  //           //                  ),
  //           //                ],
  //           //              ),
  //           //              pw.Divider(),
  //           //              pw.Row(
  //           //                children: [
  //           //                  pw.Expanded(
  //           //                    child: pw.Text(
  //           //                      'Total amount due',
  //           //                      style: pw.TextStyle(
  //           //                        fontSize: 14.0,
  //           //                        fontWeight: pw.FontWeight.bold,
  //           //                      ),
  //           //                    ),
  //           //                  ),
  //           //                  pw.Text(
  //           //                    '\$ 554.48',
  //           //                    style: pw.TextStyle(
  //           //                      fontWeight: pw.FontWeight.bold,
  //           //                    ),
  //           //                  ),
  //           //                ],
  //           //              ),
  //           //              pw.SizedBox(height: 2 * PdfPageFormat.mm),
  //           //              pw.Container(height: 1, color: PdfColors.grey400),
  //           //              pw.SizedBox(height: 0.5 * PdfPageFormat.mm),
  //           //              pw.Container(height: 1, color: PdfColors.grey400),
  //           //            ],
  //           //          ),
  //           //        ),
  //           //      ],
  //           //    ),
  //           //  ),
  //         ];
  //       },
  //       // footer: (context) {
  //       //   return pw.Column(
  //       //     mainAxisSize: pw.MainAxisSize.min,
  //       //     children: [
  //       //       pw.Divider(),
  //       //       pw.SizedBox(height: 2 * PdfPageFormat.mm),
  //       //       pw.Text(
  //       //         'Flutter Approach',
  //       //         style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
  //       //       ),
  //       //       pw.SizedBox(height: 1 * PdfPageFormat.mm),
  //       //       pw.Row(
  //       //         mainAxisAlignment: pw.MainAxisAlignment.center,
  //       //         children: [
  //       //           pw.Text(
  //       //             'Address: ',
  //       //             style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
  //       //           ),
  //       //           pw.Text(
  //       //             'Merul Badda, Anandanagor, Dhaka 1212',
  //       //           ),
  //       //         ],
  //       //       ),
  //       //       pw.SizedBox(height: 1 * PdfPageFormat.mm),
  //       //       pw.Row(
  //       //         mainAxisAlignment: pw.MainAxisAlignment.center,
  //       //         children: [
  //       //           pw.Text(
  //       //             'Email: ',
  //       //             style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
  //       //           ),
  //       //           pw.Text(
  //       //             'flutterapproach@gmail.com',
  //       //           ),
  //       //         ],
  //       //       ),
  //       //     ],
  //       //   );
  //       // },
  //     ),
  //   );
  // }

  static Future<File> getDownloadPath(String title) async {
    var dir = await DownloadsPathProvider.downloadsDirectory;
    print("object directory path ${dir!.path + "/${title}.pdf"}");
    return File(dir.path + "/${title}.pdf");
  }

  static Future savePdf(Document pdf, String name) async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    File file = File("$documentPath/$name.pdf");
    if (await file.exists()) {
      // file.delete();
      print("already file exist");
      file.writeAsBytesSync(
        List.from(await pdf.save()),
      );
    } else {
      print("file not exist");
      file.writeAsBytesSync(List.from(await pdf.save()));
    }
  }

  static Future<File> getFullPath(Document pdf, String name) async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    File file = File("$documentPath/$name.pdf");
    return file;
  }
}
