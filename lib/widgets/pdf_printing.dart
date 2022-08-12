import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furnipart_sales/constants/asset_constants.dart';
import 'package:furnipart_sales/model/customer.dart';
import 'package:furnipart_sales/model/product.dart';
import 'package:furnipart_sales/shared/styles.dart';
import 'package:furnipart_sales/utils/common_method.dart';
import 'package:furnipart_sales/views/quotation/quotation_list.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PrintingPage extends StatelessWidget {

  final List<Product>? myQuotationList;
  final String title;
  final bool isSwitched;

  const PrintingPage( { required this.myQuotationList, required this.title, required this.isSwitched}) ;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title:  Text(title),backgroundColor: appBlackColor,),
      body: Theme(
        data: ThemeData(primaryColor: appBlackColor),
        child: PdfPreview(
          build: (format) => _generatePdf(format, title, context),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title, BuildContext context) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true,);
    final font = await PdfGoogleFonts.nunitoExtraLight();

    // pdf.addPage(
    //   pw.Page(
    //     pageFormat: format,
    //     build: (context) {
    //       return pw.Column(
    //         children: [
    //           // pw.SizedBox(
    //           //   width: double.infinity,
    //           //   child: pw.FittedBox(
    //           //     child: pw.Text(title, style: pw.TextStyle(font: font)),
    //           //   ),
    //           // ),
    //           // pw.SizedBox(height: 20),
    //           pw.Flexible(child: pw.FlutterLogo())
    //         ],
    //       );
    //     },
    //   ),
    // );

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
    //         for (int i = 0; i < myQuotationList!.length; i++)
    //           pw.Container(
    //               margin: const pw.EdgeInsets.only(top: 10),
    //               alignment: pw.Alignment.centerLeft,
    //               //height: 300,
    //               child: pw.Column(
    //                   mainAxisAlignment: pw.MainAxisAlignment.start,
    //                   crossAxisAlignment: pw.CrossAxisAlignment.start,
    //                   children: [
    //                     //pw.Image(imageN[i],alignment: pw.Alignment.centerLeft,height: 100, width: 200),
    //                     pw.Text("Customer Name: ${myQuotationList![i].name}",
    //                         textAlign: pw.TextAlign.left,
    //                         style: const pw.TextStyle(
    //                           fontSize: 15,
    //                         )),
    //                     pw.Text("Mobile No.: ${myQuotationList![i].number}",
    //                         textAlign: pw.TextAlign.left,
    //                         style: const pw.TextStyle(
    //                           fontSize: 15,
    //                         )),
    //                     pw.Text("Date: ${myQuotationList![i].dateTime}",
    //                         textAlign: pw.TextAlign.left,
    //                         style: const pw.TextStyle(
    //                           fontSize: 15,
    //                         )),
    //                     pw.Text("Status: ${myQuotationList![i].status}",
    //                         textAlign: pw.TextAlign.left,
    //                         style: const pw.TextStyle(
    //                           fontSize: 15,
    //                         )),
    //                   ])),
    //       ]),
    //     ];
    //   },
    // ));
    final iconImage = (await rootBundle.load(AssetConstants.appLogo)).buffer.asUint8List();
    if(isSwitched){
      CommonMethod.writeOnProductPdf(
          pdf, myQuotationList, "Quotation Invoice",iconImage,context);
    }else{
      CommonMethod.writeOnProductWithPdf(
          pdf, myQuotationList, "Quotation Invoice",iconImage,context);
    }

    return pdf.save();
  }
}