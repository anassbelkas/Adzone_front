
import 'package:adzone/models/product.dart';
import 'package:adzone/size_config.dart';
import 'package:adzone/theme.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key, this.width=140, this.aspectRection=1.02,@required this.product,
  }) : super(key: key);

  final double width, aspectRection;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20),),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: aspectRection, 
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Image.asset(product.images[0]),
              ),
            ),
            const SizedBox(height: 5,),
            Text(product.title, style: TextStyle(color: Colors.black), maxLines: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${product.price} Points", style: TextStyle(fontSize: getProportionateScreenWidth(18), fontWeight: FontWeight.w600, color: kPrimaryColor),),
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {},
                  child: Container(
                    // padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                    width: getProportionateScreenWidth(28),
                    height: getProportionateScreenWidth(28),
                    decoration: BoxDecoration(
                      color: product.isFavourite 
                      ? kPrimaryColor.withOpacity(0.15)
                      : kTextFieldColor.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.check, color: product.isFavourite
                    ? Color(0xFFFF4848)
                    : Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

