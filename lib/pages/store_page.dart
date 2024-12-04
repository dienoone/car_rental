import 'package:car_rental/pages/store_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class StoresPage extends StatelessWidget {
  final List<Map> stores;

  const StoresPage({Key? key, required this.stores}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Stores',
          style: themeData.textTheme.headline6,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.03),
        child: GridView.builder(
          itemCount: stores.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: size.width * 0.03,
            mainAxisSpacing: size.height * 0.02,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return buildStoreCard(index, size, themeData, context);
          },
        ),
      ),
    );
  }

  Widget buildStoreCard(int i, Size size, ThemeData themeData, BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(StoreDetailsPage(storeId: stores[i]['storeId']));
      },
      child: Container(
        decoration: BoxDecoration(
          color: themeData.cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Store Image
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      stores[i]['storeImage'],
                      height: size.width * 0.3,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              // Store Name
              Text(
                stores[i]['storeName'],
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  color: themeData.secondaryHeaderColor,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Store Location
              Text(
                stores[i]['location'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  color: themeData.primaryColor.withOpacity(0.8),
                  fontSize: size.width * 0.03,
                ),
              ),
              // Store Rating and Icon
              Row(
                children: [
                  Icon(
                    UniconsLine.star,
                    color: Colors.amber,
                    size: size.width * 0.04,
                  ),
                  Text(
                    '${stores[i]['rating']}',
                    style: GoogleFonts.poppins(
                      color: themeData.secondaryHeaderColor,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: size.width * 0.02),
                    child: SizedBox(
                      height: size.width * 0.1,
                      width: size.width * 0.1,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff3b22a1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Icon(
                          UniconsLine.map_marker,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
