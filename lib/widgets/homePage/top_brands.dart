// import 'package:flutter/material.dart';
//
// import 'brand_logo.dart';
// import 'category.dart';
//
// Column buildTopBrands(Size size, ThemeData themeData) {
//   return Column(
//     children: [
//       buildCategory('Top Brands', size, themeData),
//       Padding(
//         padding: EdgeInsets.only(top: size.height * 0.015),
//         child:Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             buildBrandLogo(
//               Image.asset(
//                 'assets/icons/hyundai.png',
//                 height: size.width * 0.1,
//                 width: size.width * 0.15,
//                 fit: BoxFit.fill,
//               ),
//               size,
//               themeData,
//             ),
//             buildBrandLogo(
//               Image.asset(
//                 'assets/icons/volkswagen.png',
//                 height: size.width * 0.12,
//                 width: size.width * 0.12,
//                 fit: BoxFit.fill,
//               ),
//               size,
//               themeData,
//             ),
//             buildBrandLogo(
//               Image.asset(
//                 'assets/icons/toyota.png',
//                 height: size.width * 0.08,
//                 width: size.width * 0.12,
//                 fit: BoxFit.fill,
//               ),
//               size,
//               themeData,
//             ),
//             buildBrandLogo(
//               Image.asset(
//                 'assets/icons/bmw.png',
//                 height: size.width * 0.12,
//                 width: size.width * 0.12,
//                 fit: BoxFit.fill,
//               ),
//               size,
//               themeData,
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// }

import 'package:car_rental/pages/store_page.dart';
import 'package:flutter/material.dart';

import '../../pages/store_details.dart';
import 'brand_logo.dart';
import 'category.dart';

Column buildTopBrands(Size size, ThemeData themeData, BuildContext context, List<Map> stores) {
  return Column(
    children: [
      buildCategory('Stores', size, themeData, context),
      Padding(
        padding: EdgeInsets.only(top: size.height * 0.015),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Enable horizontal scrolling
          child: Row(
            children: stores.map((store) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StoreDetailsPage(storeId:  store['storeId']),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: Column(
                    children: [
                      buildBrandLogo(
                        Image.asset(
                          store['storeImage'], // Use the storeImage property
                          height: size.width * 0.1,
                          width: size.width * 0.15,
                          fit: BoxFit.fill,
                        ),
                        size,
                        themeData,
                      ),
                      SizedBox(height: 5),
                      Text(
                        store['storeName'],
                        style: themeData.textTheme.caption,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    ],
  );
}
