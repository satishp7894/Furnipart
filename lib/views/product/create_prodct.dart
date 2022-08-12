import 'package:flutter/material.dart';
import 'package:furnipart_sales/constants/asset_constants.dart';
import 'package:furnipart_sales/shared/styles.dart';
import 'package:furnipart_sales/widgets/validation_message.dart';
import 'package:furnipart_sales/widgets/app_main_button.dart';
import 'package:furnipart_sales/widgets/authentication_field.dart';
import 'package:furnipart_sales/widgets/customized_app_bar.dart';


class CreateProduct extends StatefulWidget {
  const CreateProduct({Key? key}) : super(key: key);

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {

  TextEditingController name = TextEditingController();
  FocusNode nameFocus = FocusNode();
  TextEditingController description = TextEditingController();
  FocusNode descriptionFocus = FocusNode();


  bool formNameHasError = false;
  bool formDescriptionHasError = false;
  // bool formCountryHasError = false;

  String formName = '';
  String? formNameError = 'Field cannot be empty';
  String formDescription = '';
  String? formDescriptionError = 'Field cannot be empty';



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



  void validateDescriptionField() {
    if (formDescription.isEmpty) {
      formDescriptionError = 'Field cannot be empty';
      formDescriptionHasError = true;
    } else if (formDescription.length < 3) {
      formDescriptionError = 'Enter a valid address';
      formDescriptionHasError = true;
    }else{
      formDescriptionHasError = false;
    }
    setState(() {

    });
  }






  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: appBlackColor,
      body: Column(
        children: [
          CustomizedAppBar(
            title: 'Create Product',
            leading: AssetConstants.backArrowBlack,
            leadingOnTap: () {
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(height: 13),
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


                  // Address Field
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AuthenticationField(
                        controller: description,
                        focusNode: descriptionFocus,
                        hasError: formDescriptionHasError,
                        onChanged: (text) {
                        formDescription = text;
                        formDescriptionHasError = false;
                        validateDescriptionField();
                        },
                        onSubmit: (text) {},
                        textColor: appGreyColor,
                        onTap: () {},
                        onEditingComplete: () {},
                        label: 'Description',
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
                        hasError: formDescriptionHasError,
                        errorMessage: formDescriptionError,
                      ),
                    ],
                  ),

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
    validateDescriptionField();
    if (formNameHasError == false &&
        formDescriptionHasError == false) {
      setState(() {
        print("formName         : $formName");
        print("formDescription  : $formDescription");
      });

    }
  }
}