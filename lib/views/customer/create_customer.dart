import 'package:flutter/material.dart';
import 'package:furnipart_sales/constants/asset_constants.dart';
import 'package:furnipart_sales/shared/styles.dart';
import 'package:furnipart_sales/views/home/home_page.dart';
import 'package:furnipart_sales/widgets/validation_message.dart';
import 'package:furnipart_sales/widgets/app_main_button.dart';
import 'package:furnipart_sales/widgets/authentication_field.dart';
import 'package:furnipart_sales/widgets/customized_app_bar.dart';


class CreateCustomer extends StatefulWidget {
  const CreateCustomer({Key? key}) : super(key: key);

  @override
  State<CreateCustomer> createState() => _CreateCustomerState();
}

class _CreateCustomerState extends State<CreateCustomer> {

  TextEditingController name = TextEditingController();
  FocusNode nameFocus = FocusNode();
  TextEditingController email = TextEditingController();
  FocusNode emailFocus = FocusNode();
  // TextEditingController phone = TextEditingController();
  // FocusNode phoneFocus = FocusNode();
  TextEditingController address = TextEditingController();
  FocusNode addressFocus = FocusNode();
  TextEditingController zipcode = TextEditingController();
  FocusNode zipcodeFocus = FocusNode();
  TextEditingController city = TextEditingController();
  FocusNode cityFocus = FocusNode();
  // FocusNode countryFocus = FocusNode();

  bool formNameHasError = false;
  bool formEmailHasError = false;
  // bool formPhoneHasError = false;
  bool formAddressHasError = false;
  bool formZipcodeHasError = false;
  bool formCityHasError = false;
  // bool formCountryHasError = false;

  String formName = '';
  String? formNameError = 'Field cannot be empty';
  String formEmail = '';
  String? formEmailError = 'Field cannot be empty';
  // String formPhone = '';
  // String? formPhoneError = 'Field cannot be empty';
  String formAddress = '';
  String? formAddressError = 'Field cannot be empty';
  String formZipcode = '';
  String? formZipcodeError = 'Field cannot be empty';
  String formCity = '';
  String? formCityError = 'Field cannot be empty';
  String formCountry = '';
  String? formCountryError = 'Field cannot be empty';

  void validateEmailField() {
    if (formEmail.isEmpty) {
      formEmailError = 'Field cannot be empty';
      formEmailHasError = true;
    } else if (formEmail.length < 5) {
      formEmailError = 'Enter a valid email';
      formEmailHasError = true;
    } else if (!formEmail.contains('@')) {
      formEmailError = 'Enter a valid email';
      formEmailHasError = true;
    }else{
      formEmailHasError = false;
    }
    setState(() {

    });
  }

  void validateNameField() {
    if (formName.isEmpty) {
      formNameError = 'Field cannot be empty';
      formNameHasError = true;
    } else if (formName.length < 3) {
      formNameError = 'Enter a valid name';
      formNameHasError = true;
    }else{
      formNameHasError = false;
    }
    setState(() {

    });
  }

  // void validatePhoneField() {
  //   if (formPhone.isEmpty) {
  //     formPhoneError = 'Field cannot be empty';
  //     formPhoneHasError = true;
  //   } else if (formPhone.length < 10) {
  //     formPhoneError = 'Enter a valid phone number';
  //     formPhoneHasError = true;
  //   }else{
  //     formPhoneHasError = false;
  //   }
  //   setState(() {
  //
  //   });
  // }

  void validateAddressField() {
    if (formAddress.isEmpty) {
      formAddressError = 'Field cannot be empty';
      formAddressHasError = true;
    } else if (formAddress.length < 3) {
      formAddressError = 'Enter a valid address';
      formAddressHasError = true;
    }else{
      formAddressHasError = false;
    }
    setState(() {

    });
  }

  void validateZipcodeField() {
    if (formZipcode.isEmpty) {
      formZipcodeError = 'Field cannot be empty';
      formZipcodeHasError = true;
    } else if (formZipcode.length < 3) {
      formZipcodeError = 'Enter a valid zipcode';
      formZipcodeHasError = true;
    }else{
      formZipcodeHasError = false;
    }
    setState(() {

    });
  }

  void validateCityField() {
    if (formCity.isEmpty) {
      formCityError = 'Field cannot be empty';
      formCityHasError = true;
    } else if (formCity.length < 2) {
      formCityError = 'Enter a valid city';
      formCityHasError = true;
    }else{
      formCityHasError = false;
    }
    setState(() {

    });
  }


  // void validateCountryField() {
  //   if (formCountry == '') {
  //     formCountryError = 'Field cannot be empty';
  //     formCountryHasError = true;
  //   }
  // }





  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: appBlackColor,
      appBar: AppBar(
        backgroundColor: appBlackColor,
        title: const Text("Create Customer"),
        centerTitle: true,

      ),
      body: Column(
        children: [
          // CustomizedAppBar(
          //   title: 'Create Customer',
          //   leading: AssetConstants.backArrowBlack,
          //   leadingOnTap: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
          Expanded(
            child:
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 29),

                  // Name Field
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AuthenticationField(
                        controller: name,
                        focusNode: nameFocus,
                        hasError:formNameHasError,
                        onChanged: (text) {
                          formName = text;
                          formNameHasError = false;
                          validateNameField();
                        },
                        onSubmit: (text) {},
                        textColor: appGreyColor,
                        onTap: () {},
                        onEditingComplete: () {},
                        label: 'Name',
                        prefixIconPath: AssetConstants.nameIcon,
                        prefixIcon: Container(
                          margin: const EdgeInsets.only(right: 2),
                          width: 60,
                          alignment: Alignment.center,
                          child: Image.asset(
                            AssetConstants.nameIcon,
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                      ValidationMessage(
                        hasError: formNameHasError,
                        errorMessage: formNameError,
                      ),
                    ],
                  ),

                  // Email Field
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AuthenticationField(
                        controller: email,
                        focusNode: emailFocus,
                        hasError: formEmailHasError,
                        onChanged: (text) {
                         formEmail = text;
                         formEmailHasError = false;
                         validateEmailField();
                        },
                        onSubmit: (text) {},
                        textColor: appGreyColor,
                        onTap: () {},
                        onEditingComplete: () {},
                        label: 'Email',
                        prefixIconPath: AssetConstants.emailIcon,
                        prefixIcon: Container(
                          margin: const EdgeInsets.only(right: 2),
                          width: 60,
                          alignment: Alignment.center,
                          child: Image.asset(
                            AssetConstants.emailIcon,
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                      ValidationMessage(
                        hasError: formEmailHasError,
                        errorMessage: formEmailError,
                      ),
                    ],
                  ),

                  // // Phone Field
                  // Column(
                  //   mainAxisSize: MainAxisSize.min,
                  //   children: [
                  //     AuthenticationField(
                  //       controller: phone,
                  //       focusNode: phoneFocus,
                  //       hasError: formPhoneHasError,
                  //       onChanged: (text) {
                  //         formPhone = text;
                  //         formPhoneHasError = false;
                  //         validatePhoneField();
                  //       },
                  //       onSubmit: (text) {},
                  //       textColor: appGreyColor,
                  //       onTap: () {},
                  //       onEditingComplete: () {},
                  //       label: 'Phone',
                  //       prefixIconPath: AssetConstants.phoneIcon,
                  //       prefixIcon: Container(
                  //         margin: const EdgeInsets.only(right: 2),
                  //         width: 60,
                  //         alignment: Alignment.center,
                  //         child: Image.asset(
                  //           AssetConstants.phoneIcon,
                  //           width: 24,
                  //           height: 24,
                  //         ),
                  //       ),
                  //     ),
                  //     ValidationMessage(
                  //       hasError: formPhoneHasError,
                  //       errorMessage: formPhoneError,
                  //     ),
                  //   ],
                  // ),

                  // Address Field
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AuthenticationField(
                        controller: address,
                        focusNode: addressFocus,
                        hasError: formAddressHasError,
                        onChanged: (text) {
                        formAddress = text;
                        formAddressHasError = false;
                        validateAddressField();
                        },
                        onSubmit: (text) {},
                        textColor: appGreyColor,
                        onTap: () {},
                        onEditingComplete: () {},
                        label: 'Address',
                        prefixIconPath: AssetConstants.addressIcon,
                        prefixIcon: Container(
                          margin: const EdgeInsets.only(right: 2),
                          width: 60,
                          alignment: Alignment.center,
                          child: Image.asset(
                            AssetConstants.addressIcon,
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                      ValidationMessage(
                        hasError: formAddressHasError,
                        errorMessage: formAddressError,
                      ),
                    ],
                  ),

                  // ZipCode Field
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AuthenticationField(
                        controller: zipcode,
                        focusNode: zipcodeFocus,
                        hasError: formZipcodeHasError,
                        onChanged: (text) {
                          formZipcode = text;
                          formZipcodeHasError = false;
                          validateZipcodeField();
                        },
                        onSubmit: (text) {},
                        textColor: appGreyColor,
                        onTap: () {},
                        onEditingComplete: () {},
                        label: 'Zip code',
                        prefixIconPath: AssetConstants.zipcodeIcon,
                        prefixIcon: Container(
                          margin: const EdgeInsets.only(right: 2),
                          width: 60,
                          alignment: Alignment.center,
                          child: Image.asset(
                            AssetConstants.zipcodeIcon,
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                      ValidationMessage(
                        hasError: formZipcodeHasError,
                        errorMessage: formZipcodeError,
                      ),
                    ],
                  ),

                  // City Field
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AuthenticationField(
                        controller: city,
                        focusNode: cityFocus,
                        hasError: formCityHasError,
                        onChanged: (text) {
                          formCity = text;
                          formCityHasError = false;
                          validateCityField();
                        },
                        onSubmit: (text) {},
                        textColor: appGreyColor,
                        onTap: () {},
                        onEditingComplete: () {},
                        label: 'City',
                        prefixIconPath: AssetConstants.cityIcon,
                        prefixIcon: Container(
                          margin: const EdgeInsets.only(right: 2),
                          width: 60,
                          alignment: Alignment.center,
                          child: Image.asset(
                            AssetConstants.cityIcon,
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                      ValidationMessage(
                        hasError: formCityHasError,
                        errorMessage: formCityError,
                      ),
                    ],
                  ),

                  // Country Dropdown Box
                  // Column(
                  //   mainAxisSize: MainAxisSize.min,
                  //   children: [
                  //     Stack(
                  //       children: [
                  //         AnimatedContainer(
                  //           duration: Duration(
                  //               milliseconds:
                  //               formCountryHasError == true ? 300 : 200),
                  //           alignment: Alignment.center,
                  //           height: 62,
                  //           margin: const EdgeInsets.symmetric(horizontal: 15),
                  //           decoration: BoxDecoration(
                  //             color: appPurpleColor,
                  //             borderRadius: BorderRadius.circular(5),
                  //             border: Border.all(
                  //               width: 2,
                  //               color: formCountryHasError == true
                  //                   ? Colors.red
                  //                   : Colors.transparent,
                  //             ),
                  //           ),
                  //           child: DropdownButtonFormField(
                  //             hint: Padding(
                  //               padding: const EdgeInsets.only(left: 62),
                  //               child: Text(
                  //                 'Country',
                  //                 style:
                  //                 heading3.copyWith(letterSpacing: 15 * (3 / 100)),
                  //               ),
                  //             ),
                  //             isExpanded: true,
                  //             focusNode: countryFocus,
                  //             dropdownColor: appPurpleColor,
                  //             items: <DropdownMenuItem<String>>[
                  //               DropdownMenuItem(
                  //                 child: Padding(
                  //                   padding: const EdgeInsets.only(left: 62),
                  //                   child: Text(
                  //                     'United States',
                  //                     style: heading3.copyWith(
                  //                       letterSpacing: 15 * (3 / 100),
                  //                       color: appGreyColor,
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 value: 'united states',
                  //               ),
                  //               DropdownMenuItem(
                  //                 child: Padding(
                  //                   padding: const EdgeInsets.only(left: 62),
                  //                   child: Text(
                  //                     'Pakistan',
                  //                     style: heading3.copyWith(
                  //                       letterSpacing: 15 * (3 / 100),
                  //                       color: appGreyColor,
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 value: 'pakistan',
                  //               ),
                  //             ],
                  //             onChanged: (text) {
                  //               formCountry = text.toString();
                  //               formCountryHasError = false;
                  //               setState(() {
                  //
                  //               });
                  //             },
                  //             icon: Container(
                  //               alignment: Alignment.centerLeft,
                  //               color: Colors.transparent,
                  //               width: 37,
                  //               child: Image.asset(AssetConstants.dropdownIcon),
                  //             ),
                  //             decoration: InputDecoration(border: InputBorder.none),
                  //           ),
                  //         ),
                  //         Positioned(
                  //           left: 0,
                  //           top: 0,
                  //           bottom: 0,
                  //           child: Container(
                  //             margin: const EdgeInsets.only(left: 18),
                  //             width: 60,
                  //             alignment: Alignment.center,
                  //             child: Image.asset(
                  //               AssetConstants.countryIcon,
                  //               width: 24,
                  //               height: 24,
                  //             ),
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //     ValidationMessage(
                  //       hasError: formCountryHasError,
                  //       errorMessage: formCountryError,
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 13),
                ],
              ),
            )
          ),
          const SizedBox(height: 13),
          AppMainButton(
              onTap: () {
                FocusScope.of(context).unfocus();
                //if (!model.isLoading) {
                  validateForm();
                //}
              },
              text: 'Next'),
          const SizedBox(height: 36),
        ],
      ),
    );
  }
  Future<void> validateForm() async {
    validateNameField();
    validateEmailField();
    // validatePhoneField();
    validateAddressField();
    validateZipcodeField();
    validateCityField();
  //  validateCountryField();
    if (formAddressHasError == false &&
        formNameHasError == false &&
        formEmailHasError == false &&
        formZipcodeHasError == false &&
        formCityHasError == false ) {
      isLoading = true;
      setState(() {
        print("formName    : $formName");
        print("formEmail   : $formEmail");
        // print("formPhone   : $formPhone");
        print("formAddress : $formAddress");
        print("formZipcode : $formZipcode");
        print("formCity    : $formCity");
        print("formCountry : $formCountry");
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (builder) => const Home()), (route) => false);
//      _formName,
        //      _formEmail,
        //      _formPhone,
        //      _formAddress,
        //      _formZipcode,
        //      _formCity,
        //      _formCountry,
      });
     // notifyListeners();
     //  try {
     //    int id = await Api.placeOrder(
     //      _auth.authToken,
     //      _formName,
     //      _formEmail,
     //      _formPhone,
     //      _formAddress,
     //      _formZipcode,
     //      _formCity,
     //      _formCountry,
     //      cart.map((e) => e.toJson()).toList(),
     //    );
     //    _cartService.clearCart();
     //    isLoading = false;
     //    notifyListeners();
     //    _navigator.navigateTo(Routes.orderSuccessView,
     //        arguments: OrderSuccessViewArguments(id: id));
     //  } catch (e) {
     //    isLoading = false;
     //    notifyListeners();
     //    print(e.toString());
     //  }
    }
  }
}