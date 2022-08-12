import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furnipart_sales/shared/styles.dart';
import 'package:furnipart_sales/views/customer/create_customer.dart';
import 'package:furnipart_sales/views/home/home_page.dart';
// import 'package:toast/toast.dart';
//
class OtpPage extends StatefulWidget {
  final bool isFlag;
  const OtpPage({Key? key, required this.isFlag}) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {

  String otpNumber1 = "";
  String otpNumber2 = "";
  String otpNumber3 = "";
  String otpNumber4 = "";
  final text1 = TextEditingController();
  final text2 = TextEditingController();
  final text3 = TextEditingController();
  final text4 = TextEditingController();
 // ToastContext? toastContext;

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: appBlackColor,
      appBar: AppBar(
        backgroundColor: appBlackColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [

              SizedBox(
                height: 18,
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/illustration-3.png',
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Verification',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: appWhiteColor
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter your OTP code number",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: appWhiteColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 28,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _textFieldOTP(text1,first: true, last: false),
                      SizedBox(width: 10,),
                      _textFieldOTP(text2,first: false, last: false),
                      SizedBox(width: 10,),
                      _textFieldOTP(text3,first: false, last: false),
                      SizedBox(width: 10,),
                      _textFieldOTP(text4,first: false, last: true),
                    ],
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        print("otpNumber1 ${text1.text}");
                        print("otpNumber2 ${text2.text}");
                        print("otpNumber3 ${text3.text}");
                        print("otpNumber4 ${text4.text}");
                        validateOtp();
                        // if(otpNumber.isEmpty){
                        //   // Navigator.of(context).push(
                        //   //   MaterialPageRoute(builder: (context) => const CreateCustomer()),
                        //   // );
                        // }else{
                        //
                        // }
                      },
                      style: ButtonStyle(
                        foregroundColor:
                        MaterialStateProperty.all<Color>(appWhiteColor),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(appRedColor),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text(
                          'Send',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "Didn't you receive any code?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: appWhiteColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "Resend New Code",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color:appWhiteColor,
                  decoration: TextDecoration.underline
                ),
                textAlign: TextAlign.center,

              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP(TextEditingController textEditingController, {bool? first, last}) {
    return Expanded(
    //  height: 85,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          controller: textEditingController,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: appBlackColor),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            fillColor: appWhiteColor,
              hintText:'*' ,
              hintStyle: TextStyle(fontWeight: FontWeight.bold,color: appGreyColor,fontSize: 15),
              filled: true,

           // label: Text('*'),
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: Color(0xFFBA68C8)),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.purple),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }

  void validateOtp() {
    if(text1.text.isEmpty || text2.text.isEmpty || text3.text.isEmpty || text4.text.isEmpty ){
      print("Invalid Otp");
      Fluttertoast.showToast(
          msg: "Invalid Otp",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      //Toast.show("Invalid Otp", duration: Toast.lengthShort, gravity:  Toast.bottom,backgroundColor: appWhiteColor);
    }else if(widget.isFlag == true){
      print("Otp ${text1.text + text2.text + text3.text + text4.text}");
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const CreateCustomer()),
      );
    }else{
      print("Otp ${text1.text + text2.text + text3.text + text4.text}");
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const Home()),(route)=>false
      );
    }
  }
}


