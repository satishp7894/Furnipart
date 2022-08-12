import 'package:flutter/material.dart';
import '../../constants/asset_constants.dart';
import '../../shared/styles.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    // if (!viewModel.onlyProducts) {
    //   controller.text = '';
    // }

    return Container(
      margin: const EdgeInsets.only(top: 51, left: 17, right: 17, bottom: 10),
      alignment: Alignment.center,
      height: 50,
      decoration: BoxDecoration(
        color: appWhiteColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: controller,
        style: paragraph4,
        textInputAction: TextInputAction.search,
        maxLines: 1,
        textAlignVertical: TextAlignVertical.center,
      //  onChanged: (text) => viewModel.searchBarText = text,
        // onSubmitted: (text) {
        //   viewModel.onlyProducts = true;
        //   viewModel.onModelReady();
        // },
        cursorColor: appGreyColor,
        decoration: InputDecoration(
          isCollapsed: true,
          border: InputBorder.none,
          label: const Padding(
            padding: EdgeInsets.only(top: 3),
            child: Text('Search keywords...'),
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
    );
  }
}
