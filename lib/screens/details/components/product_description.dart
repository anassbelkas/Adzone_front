import 'package:adzone/models/product.dart';
import 'package:adzone/size_config.dart';
import 'package:adzone/theme.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key key,
    @required this.product,@required this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20),vertical: getProportionateScreenWidth(10)),
          child: Column(
            children: [
              Text(product.title, style: Theme.of(context).textTheme.headline6, maxLines: 2,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${product.price} Points", style: TextStyle(fontSize: getProportionateScreenWidth(20), fontWeight: FontWeight.w600, color: kPrimaryColor),),
                  ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 5,),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            width: getProportionateScreenWidth(64),
            decoration: BoxDecoration(
              color: product.isFavourite ? Color(0xFFFFE6E6) : kTextFieldColor.withOpacity(0.3),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Icon(Icons.check, color: product.isFavourite ? Color(0xFFFF4848) : Colors.white,),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(
            product.description,
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20), vertical: 10),
          child: GestureDetector(
            onTap: pressOnSeeMore,
            child: Row(
              children: [
                Text("See more details", style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),),
                SizedBox(height: 5,),
                Icon(Icons.arrow_forward_ios, size: 12, color: kPrimaryColor,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}