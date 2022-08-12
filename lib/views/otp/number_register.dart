import 'package:flutter/material.dart';
import 'package:furnipart_sales/constants/asset_constants.dart';
import 'package:furnipart_sales/shared/styles.dart';
import 'package:furnipart_sales/widgets/authentication_field.dart';
import 'package:furnipart_sales/widgets/validation_message.dart';

import 'otp_page.dart';

class NumberRegister extends StatefulWidget {
  final bool isFlag;
  const NumberRegister({Key? key, required this.isFlag}) : super(key: key);

  @override
  _NumberRegisterState createState() => _NumberRegisterState();
}

class _NumberRegisterState extends State<NumberRegister> {
  TextEditingController phone = TextEditingController();
  FocusNode phoneFocus = FocusNode();

  bool formPhoneHasError = false;
  String formPhone = '';
  String? formPhoneError = 'Field cannot be empty';

  void validatePhoneField() {
    String pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp regExp = RegExp(pattern);
    if (formPhone.isEmpty) {
      formPhoneError = 'Field cannot be empty';
      formPhoneHasError = true;
    } else if (formPhone.length < 10) {
      formPhoneError = 'Enter a number minimum 10 digit';
      formPhoneHasError = true;
    } else if (!regExp.hasMatch(phone.text)) {
      formPhoneError = 'Enter a valid phone number';
      formPhoneHasError = true;
    }else {
      formPhoneHasError = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBlackColor,
      ),
      // resizeToAvoidBottomInset: false,
      backgroundColor: appBlackColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all( 24),
          child: Column(
            children: [
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: GestureDetector(
              //     onTap: () => Navigator.pop(context),
              //     child: Icon(
              //       Icons.arrow_back,
              //       size: 32,
              //       color: appWhiteColor,
              //     ),
              //   ),
              // ),
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
                  'assets/images/illustration-2.png',
                ),
              ),
              SizedBox(
                height: 24,
              ),

              Text(
                'Registration',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: appWhiteColor),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Add your phone number. we'll send you a verification code so we know you're real",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: appGreyColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 28,
              ),
              Column(
                children: [
                  // TextFormField(
                  //   keyboardType: TextInputType.number,
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  //   decoration: InputDecoration(
                  //     enabledBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.black12),
                  //         borderRadius: BorderRadius.circular(10)),
                  //     focusedBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.black12),
                  //         borderRadius: BorderRadius.circular(10)),
                  //     prefix: Padding(
                  //       padding: EdgeInsets.symmetric(horizontal: 8),
                  //       child: Text(
                  //         '(+91)',
                  //         style: TextStyle(
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ),
                  //     suffixIcon: Icon(
                  //       Icons.check_circle,
                  //       color: Colors.green,
                  //       size: 32,
                  //     ),
                  //   ),
                  // ),

                  AuthenticationField(
                    controller: phone,
                    focusNode: phoneFocus,
                    hasError: formPhoneHasError,
                    onChanged: (text) {
                      formPhone = text;
                      formPhoneHasError = false;
                      validatePhoneField();
                    },
                    onSubmit: (text) {
                      FocusScope.of(context).unfocus();
                    },
                    textColor: appGreyColor,
                    onTap: () {},
                    onEditingComplete: () {},
                    label: 'Phone',
                    suffixIcon: Container(
                      margin: const EdgeInsets.only(right: 2),
                      width: 60,
                      alignment: Alignment.center,
                      child: Image.asset(
                        AssetConstants.phoneIcon,
                        width: 24,
                        height: 24,
                      ),
                    ),
                    prefixIconPath: AssetConstants.phoneIcon,
                    prefixIcon: Container(
                      margin: const EdgeInsets.only(right: 2),
                      width: 60,
                      alignment: Alignment.center,
                      child: const Text(
                        "+91",
                        style: TextStyle(
                            color: appGreyColor, fontWeight: FontWeight.bold,fontSize: 17),
                      ),
                    ),
                  ),
                  ValidationMessage(
                    hasError: formPhoneHasError,
                    errorMessage: formPhoneError,
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: ElevatedButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          validateForm();
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
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> validateForm() async {
    validatePhoneField();
    if (formPhoneHasError == false) {
      setState(() {
        print("formPhone : $formPhone");
        print("widget.isFlag : ${widget.isFlag}");
      });
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) =>  OtpPage(isFlag: widget.isFlag,)),
      );
    }
  }
}
