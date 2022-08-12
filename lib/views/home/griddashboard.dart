
import 'package:flutter/material.dart';
import 'package:furnipart_sales/shared/styles.dart';
import 'package:furnipart_sales/views/customer/create_customer.dart';
import 'package:furnipart_sales/views/customer/customer_list.dart';
import 'package:furnipart_sales/views/otp/number_register.dart';
import 'package:furnipart_sales/views/product/product_list.dart';
import 'package:furnipart_sales/views/quotation/create_quotation.dart';
import 'package:furnipart_sales/views/quotation/quotation_list.dart';
// import 'package:google_fonts/google_fonts.dart';

class GridDashboard extends StatelessWidget {
  Items item1 =  Items(
      title: "Create Quotation",
      subtitle: "",
      event: "",
      img: "assets/images/edit.png",
  );
  Items item2 =  Items(
    title: "Product List",
    subtitle: "Bocali, Apple",
    event: "4 Items",
    img: "assets/images/food.png",
  );
  Items item3 =  Items(
    title: "Customer List",
    subtitle: "Lucy Mao going to Office",
    event: "5 Items",
    img: "assets/images/customer_list.png",
  );
  Items item4 =  Items(
    title: "Create Customer",
    subtitle: "Rose favirited your Post",
    event: "",
    img: "assets/images/customers.png",
  );
  Items item5 =  Items(
    title: "Quotation List",
    subtitle: "Homework, Design",
    event: "4 Items",
    img: "assets/images/todo.png",
  );
  Items item6 =  Items(
    title: "Settings",
    subtitle: "",
    event: "2 Items",
    img: "assets/images/setting.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
     var color = 0xff453658;
   // var color = 0xB3FFFFFF;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return InkWell(
              onTap: (){
                if(data.title == "Create Quotation"){
                  print("Create Quotation");
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder) =>  const CreateQuotation()));
                }else if(data.title == "Product List"){
                  print("Product List");
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder) =>  const ProductPage()));
                }else if(data.title == "Customer List"){
                  print("Customer List");
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder) =>  const CustomertList()));
                }else if(data.title == "Create Customer"){
                  print("Create Customer");
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder) =>  const NumberRegister(isFlag: true)));
                }else if(data.title == "Quotation List"){
                  print("Quotation List");
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder) =>  const QuotationList()));
                }else if(data.title == "Settings"){
                  print("Settings");
                //  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (builder) =>  Home()), (route) => false);
                }

              },
              child: Container(
                // color: Colors.transparent,
                decoration: BoxDecoration(
                    color: appWhiteColor, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img!,
                      width: 42,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.title!,
                      style:  const TextStyle(
                              color: appBlackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      data.subtitle!,
                      style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.event!,
                      style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                              fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String? title;
  String? subtitle;
  String? event;
  String? img;
  Items({this.title, this.subtitle, this.event, this.img});
}
