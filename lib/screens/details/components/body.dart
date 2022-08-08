import 'package:adzone/models/product.dart';
import 'package:adzone/screens/details/components/product_description.dart';
import 'package:adzone/widgets/top_rounded_container.dart';
import 'package:adzone/screens/home/home_screen.dart';
import 'package:adzone/size_config.dart';
import 'package:adzone/theme.dart';
import 'package:adzone/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'product_image.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key,@required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
              height: 22.w,
              child: Stack(
                children: [
                  Positioned(
                      top: -8.h,
                      left: -4.w,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFFFA7850)),
                        width: 25.w,
                        height: 25.h,
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
          color: kWhiteColor,
          child: Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 2.w,),
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
                padding: EdgeInsets.all(4.w),
                child: Text(
                  'Buy',
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                )
                ),
              ),
          ),
        ) 
      ],
    );
  }
}


