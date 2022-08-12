import 'package:flutter/material.dart';
import 'package:furnipart_sales/model/product.dart';
import 'package:furnipart_sales/views/product/product_detail.dart';
import 'package:furnipart_sales/widgets/product_card.dart';


import '../../shared/helpers.dart';


class ProductGridList extends StatefulWidget{
  const ProductGridList({Key? key}) : super(key: key);

  @override
  State<ProductGridList> createState() => _ProductGridListState();
}

class _ProductGridListState extends State<ProductGridList> {

  List<Product>? myProductList;
  TextEditingController? searchView;
  bool search = false;


  Product product1 =  Product(
    name: "Fresh Peach",
    description: "dozen"
      , qty: 0, price: 50
  );
  Product product2 =  Product(
    name: "Avacado",
    description: "2.0 lbs", qty: 0, price: 50
  );
  Product product3 =  Product(
    name: "Pineapple",
    description: "1.2 lbs", qty: 0, price: 50
  );
  Product product4 =  Product(
    name: "Black Grapes",
    description: "dozen", qty: 0, price: 50
  );

  @override
  void initState() {
    myProductList = [product1, product2, product3, product4];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: screenWidth(context) > screenHeight(context) ? 4 : 2,
          childAspectRatio: 181 / 234,
          crossAxisSpacing: 18,
          mainAxisSpacing: 20),
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
      itemCount: myProductList!.length ,
      itemBuilder: (context, index) => GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (builder) =>  ProductDetail(product: myProductList![index])));
        },
        child: ProductCard(
         // shadeColor: Colors.white,
        //  image: viewModel.products[index].image,
          price: 10.0,
          title: myProductList![index].name,
          unit:  myProductList![index].description,
          qtyInCart:10,
          // qtyInCart: viewModel.productQuantity(viewModel.products[index]),
          onMinusTap: () => 10,
          onPlusTap: () => 10,
          // onFavoriteButtonTap: () =>
          //     viewModel.addOrRemoveFavorites(viewModel.products[index]),
          // favoriteToggle: viewModel.isFavorited(viewModel.products[index]),
        ),
      ),
      shrinkWrap: true,
      primary: false,
    );
  }
}
