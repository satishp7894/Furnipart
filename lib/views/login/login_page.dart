import 'package:flutter/material.dart';
import 'package:furnipart_sales/constants/string_constants.dart';
import 'package:furnipart_sales/views/home/home_page.dart';
import 'package:furnipart_sales/views/otp/number_register.dart';
import 'package:furnipart_sales/widgets/authentication_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/asset_constants.dart';
import '../../shared/helpers.dart';
import '../../shared/styles.dart';
import '../../widgets/app_main_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String validationMessage = '';
  final email = TextEditingController();
  final emailFocus = FocusNode();
  final password = TextEditingController();
  final passwordFocus = FocusNode();
  bool isLoading = false;
  bool emailHasError = false;
  bool shouldRemember = false;
  bool isObscure = true;
  bool passwordHasError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBlackColor,
      body: Center(
        child: SingleChildScrollView(
          child: _form(),
        ),
      ),
    );
  }

  _form() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 30),
            child: Text(
              'Welcome back !',
              style: TextStyle(
                  color: appWhiteColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 25 * (3 / 100)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 2),
            child: Text(
              'Sign in to your account',
              style: paragraph2,
            ),
          ),
          const SizedBox(height: 26),
          //
          // Center(
          //   child: Image.asset(
          //     AssetConstants.appLogo,
          //     width:  150,
          //     height: 100,
          //   ),
          // ),

          // Email Field
          AuthenticationField(
            controller: email,
            focusNode: emailFocus,
            hasError: emailHasError,
            onChanged: (text) {
              emailHasError = false;
            },
            onSubmit: (text) {
              FocusScope.of(context).requestFocus(passwordFocus);
            },
            textColor: const Color(0xFF868889),
            onTap: () {},
            onEditingComplete: () => {},
            label: 'Email',
            prefixIconPath: AssetConstants.emailIcon,
          ),
          verticalSpaceMini,

          // Password Field
          AuthenticationField(
            controller: password,
            focusNode: passwordFocus,
            hasError: passwordHasError,
            onChanged: (text) {
              passwordHasError = false;
            },
            onSubmit: (text) {
              FocusScope.of(context).unfocus();
            },
            textColor: const Color(0xFF868889),
            onTap: () => {},
            onEditingComplete: () {
              FocusScope.of(context).unfocus();
            },
            obscureText: isObscure,
            label: 'Password',
            prefixIconPath: AssetConstants.passwordIcon,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(left: 5, right: 10),
              child: IconButton(
                onPressed: () {
                  isObscure = !isObscure;
                  setState(() {});
                },
                icon: Icon(
                  isObscure ? Icons.visibility : Icons.visibility_off,
                  color: appGreyColor,
                ),
              ),
            ),
          ),

          // Error Message
          if (validationMessage != "") ...[
            verticalSpaceMini,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  validationMessage,
                  textAlign: TextAlign.center,
                  style: paragraph6.copyWith(color: Colors.red, fontSize: 15),
                ),
              ),
            ),
          ],
          verticalSpaceRegular,
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 26),
          //   child: Row(
          //     mainAxisSize: MainAxisSize.max,
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: const [
          //       Text('Forgot Password',
          //           style: TextStyle(decoration: TextDecoration.underline,color: appWhiteColor)),
          //     ],
          //   ),
          // ),
          // verticalSpaceMedium,

          // Form Button
          AppMainButton(
            text: 'Login',
            isLoading: isLoading,
            onTap: () {
              FocusScope.of(context).unfocus();
              validateForm();
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void navigationPage() async {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (builder) => const NumberRegister(isFlag: false,)),);
  }

  void validateForm() async {
    isLoading = true;
    emailHasError = false;
    passwordHasError = false;
    String emails = email.text;
    String passwords = password.text;
    RegExp regExp = RegExp(emailPattern);

    if (emails.isEmpty) {
      emailHasError = true;
      validationMessage = 'Please enter a email address';
    } else if (!regExp.hasMatch(emails)) {
      emailHasError = true;
      validationMessage = 'Please enter a valid email address';
    } else if (passwords.isEmpty) {
      passwordHasError = true;
      validationMessage = 'Please enter a password';
    } else if (passwords.length < 8) {
      passwordHasError = true;
      validationMessage = 'Please enter a minimum 8 character';
    } else {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool(isLogged, true);
        navigationPage();
      } catch (e) {
        validationMessage = 'Invalid credentials';
      }
    }
    isLoading = false;
    setState(() {});
  }
}
