import 'package:adzone/models/product.dart';
import 'package:adzone/size_config.dart';
import 'package:adzone/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    this.height = 160,
    this.width = 160,
    this.aspectRection = 1.02,
    @required this.product,
    @required this.press,
  }) : super(key: key);

  final double width, aspectRection, height;
  final Product product;
  final GestureTapCallback press;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: getProportionateScreenWidth(20),),
//       child: GestureDetector(
//         onTap: press,
//         child: SizedBox(
//           width: getProportionateScreenWidth(width),
//           child: Column(
//             children: [
//               AspectRatio(
//                 aspectRatio: aspectRection,
//                 child: Container(
//                   padding: EdgeInsets.all(getProportionateScreenWidth(10)),
//                   decoration: BoxDecoration(
//                     color: kPrimaryColor.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(15)
//                   ),
//                   child: Image.asset(product.images[0]),
//                 ),
//               ),
//               const SizedBox(height: 5,),
//               Text(product.title, style: TextStyle(color: Colors.black), maxLines: 2,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("${product.price} Points", style: TextStyle(fontSize: getProportionateScreenWidth(18), fontWeight: FontWeight.w600, color: kPrimaryColor),),
//                   InkWell(
//                     borderRadius: BorderRadius.circular(30),
//                     onTap: () {},
//                     child: Container(
//                       // padding: EdgeInsets.all(getProportionateScreenWidth(10)),
//                       width: getProportionateScreenWidth(28),
//                       height: getProportionateScreenWidth(28),
//                       decoration: BoxDecoration(
//                         color: product.isFavourite
//                         ? kPrimaryColor.withOpacity(0.15)
//                         : kTextFieldColor.withOpacity(0.3),
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(Icons.check, color: product.isFavourite
//                       ? Color(0xFFFF4848)
//                       : Colors.white),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.w, right: 2.w, top: 12.w),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: 45.w,
          height: 30.w,
          child: AspectRatio(
            aspectRatio: aspectRection,
            child: Container(
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                  color: kGreyColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15)),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Positioned(
                    top: -10.w,
                    right: -1.w,
                    child: Image.asset(product.images[0], width: 30.w),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${product.price} Points",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: kGreenColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1.w,
                      ),
                      Text(
                        product.title,
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                    ],
                  ),

                  // const SizedBox(height: 5,),
                  // Text(product.title, style: TextStyle(fontSize: 14.sp, color: Colors.black, fontWeight: FontWeight.bold), maxLines: 2,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     InkWell(
                  //       borderRadius: BorderRadius.circular(30),
                  //       onTap: () {},
                  //       child: Container(
                  //         // padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  //         width: getProportionateScreenWidth(28),
                  //         height: getProportionateScreenWidth(28),
                  //         decoration: BoxDecoration(
                  //           color: product.isFavourite
                  //           ? kPrimaryColor.withOpacity(0.15)
                  //           : kTextFieldColor.withOpacity(0.3),
                  //           shape: BoxShape.circle,
                  //         ),
                  //         child: Icon(Icons.check, color: product.isFavourite
                  //         ? Color(0xFFFF4848)
                  //         : Colors.white),
                  //       ),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
