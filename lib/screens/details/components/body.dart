import 'package:adzone/models/product.dart';
import 'package:adzone/screens/details/components/product_description.dart';
import 'package:adzone/widgets/top_rounded_container.dart';
import 'package:adzone/screens/home/home_screen.dart';
import 'package:adzone/size_config.dart';
import 'package:adzone/theme.dart';
import 'package:adzone/widgets/navbar.dart';
import 'package:flutter/material.dart';

import 'product_image.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key,@required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
              height: 85,
              child: Stack(
                children: [
                  Positioned(
                      top: -15,
                      left: -15,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFFFA7850)),
                        width: 100,
                        height: 100,
                        child: TextButton(
                            style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                primary: Colors.white),
                            onPressed: () => Navigator.of(context).pop(),
                            child: Icon(IconData(0xe092,
                                fontFamily: 'MaterialIcons',
                                matchTextDirection: true))),
                      )),
                ],
              ),
            ),
        ProductImage(product: product),
        TopRoundedContainer(
          color: Color.fromARGB(255, 255, 251, 250),
          child: ProductDescription(
            product: product,
            pressOnSeeMore: () {},
          ),
        ),
        
        //btn
        TopRoundedContainer(
          color: Color.fromARGB(255, 255, 251, 250),
          child: Padding(
            padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.15, right: SizeConfig.screenWidth * 0.15, top: getProportionateScreenWidth(15), bottom: getProportionateScreenWidth(40),),
            child: ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Navbar(),),);
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(kWhiteColor),
                backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)))
              ),
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Text(
                  'Buy',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
                ),
              ),
          ),
        ) 
      ],
    );
  }
}


