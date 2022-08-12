
import 'package:flutter/material.dart';
import 'package:furnipart_sales/constants/asset_constants.dart';
// import 'package:google_fonts/google_fonts.dart';

// App Colors
const Color appGreenColor = Color(0xFF6CC51D);
const Color appGreyColor = Color(0xFF868889);
const Color appWhiteColor = Color(0xFFF4F5F9);
const Color appBlackColor = Color(0xFF000000);
const Color appBlueColor = Color(0xFF407EC7);
const Color appGreenSecondary = Color(0xFFAEDC81);
const Color appGreySecondary = Color(0xFFEBEBEB);
const Color appGreyDark = Color(0xFFB1B1B1);
const Color appRedColor = Color(0xFFEF574B);
const Color appRedSecondary = Color(0xFFf9747c);
const Color appPurpleColor = Color(0xff453658);
const Color appChekColor = Color(0xffCD5C5C);
const Color appBlackSecondary = Color(0xff3D4041);

// App TextStyles
TextStyle heading1 = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w700,
  letterSpacing: 20 * (30.5 / 100),
  color: appGreenColor,
);

TextStyle heading2 =const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  letterSpacing: 20 * (30.5 / 100),
  color: appGreenColor,
);

TextStyle heading3 = const TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w500,
  letterSpacing: 15 * (20 / 100),
  color: appGreyColor,
);

TextStyle heading4 = const TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w700,
  letterSpacing: 30 * (3 / 100),
  color: Colors.black,
);

TextStyle heading5 = const TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w600,
  letterSpacing: 25 * (3 / 100),
  color: Colors.white,
);

TextStyle heading6 = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  letterSpacing: 18 * (3 / 100),
  color: Colors.white,
);

TextStyle heading7 = const TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: Colors.red,
);

TextStyle priceStyle = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.red,
);

TextStyle paragraph1 = const TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w500,
  letterSpacing: 15 * (3 / 100),
  color: appGreyColor,
);

TextStyle paragraph2 = const TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w400,
  letterSpacing: 15 * (3 / 100),
  color: appGreyColor,
);

TextStyle paragraph3 = const TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w300,
  letterSpacing: 15 * (3 / 100),
  color: appGreyColor,
);

TextStyle paragraph4 = const TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w500,
  color: appGreyColor,
);

TextStyle paragraph5 = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
  color: Colors.black,
);

TextStyle paragraph6 = const TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: appGreyColor,
);

TextStyle paragraph7 = const TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.w500,
  color: appGreyColor,
);

TextStyle paragraph8 = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: appGreyDark,
);

TextStyle paragraph9 = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w700,
  color: appGreyDark,
);

TextStyle textButtonStyle = const TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
  color: appWhiteColor,
);



Color getCategoryColorFromId(int id) {
  switch (id) {
    case 1:
      return const Color(0xFFE6F2EA);
    case 2:
      return const Color(0xFFFFE9E5);
    case 3:
      return const Color(0xFFFFF6E3);
    case 4:
      return const Color(0xFFF3EFFA);
    case 5:
      return const Color(0xFFDCF4F5);
    case 6:
      return const Color(0xFFFFE8F2);
    default:
      return const Color(0xFFFFFFFF);
  }
}

String getCategoryIconFromId(int id) {
  switch (id) {
    case 1:
      return AssetConstants.vegetablesIcon;
    case 2:
      return AssetConstants.fruitsIcon;
    case 3:
      return AssetConstants.beveragesIcon;
    case 4:
      return AssetConstants.groceryIcon;
    case 5:
      return AssetConstants.edibleOilIcon;
    case 6:
      return AssetConstants.householdIcon;
    default:
      return AssetConstants.errorIcon;
  }
}
