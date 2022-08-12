import 'package:flutter/material.dart';
import 'package:furnipart_sales/constants/asset_constants.dart';
import 'package:furnipart_sales/model/product.dart';
import 'package:furnipart_sales/shared/styles.dart';

class ProductDetail extends StatefulWidget {
  final Product product;
  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: buildAppbar(context),
      appBar: AppBar(
        backgroundColor: appBlackColor,
        title: const Text("Product Details"),
        centerTitle: true,

      ),
      body: _body(size, 200, 250, 0.14),);
  }

  AppBar buildAppbar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_outlined),
        onPressed: () => Navigator.pop(context),
        color: Colors.white,
      ),
      backgroundColor: Colors.black,
      elevation: 0,
    );
  }

  _body(Size size, double width, double height, double multiplepads) {

    return SingleChildScrollView(
      child: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(children: [
                BodyDetail(
                  size: size,
                  widget: widget,
                  multiplepad: multiplepads,
                ),
                HeaderDetail(
                  widget: widget,
                  size: size,
                  widthimg: width,
                  heightimg: height,
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class BodyDetail extends StatefulWidget {
  const BodyDetail(
      {Key? key,
        required this.size,
        required this.widget,
        required this.multiplepad})
      : super(key: key);

  final Size size;
  final ProductDetail widget;
  final double multiplepad;

  @override
  State<BodyDetail> createState() => _BodyDetailState();
}

class _BodyDetailState extends State<BodyDetail> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: widget.size.height * widget.multiplepad, left: 20),
      margin: EdgeInsets.only(top: widget.size.height * 0.3),
      //height: 500,
      decoration: const BoxDecoration(
          color: appWhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Rating',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold,color: appBlackColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade900,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const  Text(
                        "10",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20,color: appBlackColor),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                width: 52,
                height: 42,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey.shade400),
                child: Stack(children: [
                  Center(
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            pressed == false ? pressed = true : pressed = false;
                          });
                        },
                        icon: pressed == false
                            ? const Icon(Icons.favorite_border,
                            color: Colors.white, size: 25)
                            : const Icon(Icons.favorite,
                            color: appRedColor, size: 25)),
                  ),
                ]),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(right: 20),
            width: widget.size.width - 20,
            child: const Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since. When an unknown printer took a galley.',
              style: TextStyle(fontSize: 16,color: appBlackColor),
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(
            height: widget.size.height * 0.12,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(right: 20),
          //   child: Row(
          //     children: [
          //       ElevatedButton(
          //         onPressed: () {},
          //         child: const Icon(Icons.shopping_cart_outlined),
          //         style: ButtonStyle(
          //             backgroundColor: MaterialStateProperty.all<Color>(
          //                 appRedColor),
          //             elevation: MaterialStateProperty.all<double>(2)),
          //       ),
          //       const SizedBox(
          //         width: 15,
          //       ),
          //       Expanded(
          //           child: ElevatedButton(
          //               onPressed: () => {},
          //               //Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOut(product: widget.widget.product))),
          //               child: Text(
          //                 'BUY NOW',
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.bold, fontSize: 20),
          //               ),
          //               style: ButtonStyle(
          //                   backgroundColor: MaterialStateProperty.all<Color>(
          //                       appRedColor),
          //                   elevation: MaterialStateProperty.all<double>(2))))
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

}

class HeaderDetail extends StatelessWidget {
  final ProductDetail widget;
  final Size size;
  final double widthimg;
  final double heightimg;

  const HeaderDetail(
      {Key? key,
        required this.widget,
        required this.size,
        required this.widthimg,
        required this.heightimg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          const Text(
            'Furnipart Product',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          Text(
            widget.product.name!,
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                        text: 'Price\n',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white)),
                    TextSpan(
                        text: "₹ " +widget.product.price!.toString(),
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: appRedColor))
                  ])),
              // Container(
              //     width: widthimg,
              //     height: heightimg,
              //     child: Image.asset(
              //       AssetConstants.countryIcon,
              //       fit: BoxFit.contain,
              //     ))
            ],
          )
        ],
      ),
    );
  }
}
