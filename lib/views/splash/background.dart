import 'package:flutter/material.dart';
import '../../constants/asset_constants.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child:
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetConstants.appLogo),
              fit: BoxFit.contain),
        ),
      ),
    );
  }
}
