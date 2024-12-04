// A placeholder for the store details page
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

import '../data/cars.dart';
import '../data/stores.dart';
import '../widgets/homePage/car.dart';
import 'details_page.dart';

class StoreDetailsPage extends StatefulWidget {
  final int storeId; // Accept the storeId instead of car-specific details

  const StoreDetailsPage({
    Key? key,
    required this.storeId, // Store ID as a parameter
  }) : super(key: key);

  @override
  _StoreDetailsPageState createState() => _StoreDetailsPageState();
}

class _StoreDetailsPageState extends State<StoreDetailsPage> {
  late Map store;
  late List<Map> storeCars;

  @override
  void initState() {
    super.initState();
    store = stores.firstWhere((store) => store['storeId'] == widget.storeId);
    storeCars = cars.where((car) => car['storeId'] == widget.storeId).toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          shadowColor: Colors.transparent,
          backgroundColor: themeData.backgroundColor,
          leading: Padding(
            padding: EdgeInsets.only(left: size.width * 0.05),
            child: SizedBox(
              height: size.width * 0.1,
              width: size.width * 0.1,
              child: InkWell(
                onTap: () {
                  // Get.back();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: themeData.cardColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Icon(
                    UniconsLine.multiply,
                    color: themeData.secondaryHeaderColor,
                    size: size.height * 0.025,
                  ),
                ),
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leadingWidth: size.width * 0.15,
          title: Image.asset(
            themeData.brightness == Brightness.dark
                ? 'assets/icons/SobGOGlight.png'
                : 'assets/icons/SobGOGdark.png',
            height: size.height * 0.06,
            width: size.width * 0.35,
          ),
          centerTitle: true,
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: themeData.backgroundColor,
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
              ),
              child: Stack(
                children: [
                  ListView(
                    children: [
                      // Store Information
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                store['storeImage'],
                                height: size.width * 0.2,
                                width: size.width * 0.2,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: size.width * 0.05),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  store['storeName'],
                                  style: GoogleFonts.poppins(
                                    color: themeData.primaryColor,
                                    fontSize: size.width * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.01),
                                Text(
                                  store['location'],
                                  style: GoogleFonts.poppins(
                                    color: themeData.primaryColor.withOpacity(0.7),
                                    fontSize: size.width * 0.04,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.01),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow[800],
                                      size: size.width * 0.06,
                                    ),
                                    Text(
                                      store['rating'].toString(),
                                      style: GoogleFonts.poppins(
                                        color: Colors.yellow[800],
                                        fontSize: size.width * 0.04,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height * 0.01),
                                Text(
                                  'Contact: ${store['contact']}',
                                  style: GoogleFonts.poppins(
                                    color: themeData.primaryColor.withOpacity(0.7),
                                    fontSize: size.width * 0.04,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Cars List
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.03),
                        child: Text(
                          'Cars Available at ${store['storeName']}',
                          style: GoogleFonts.poppins(
                            color: themeData.primaryColor,
                            fontSize: size.width * 0.055,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.7, // Height for the grid view section
                        child: GridView.builder(
                          itemCount: storeCars.length, // Number of cars
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Two items per row
                            crossAxisSpacing: size.width * 0.03, // Horizontal spacing
                            mainAxisSpacing: size.height * 0.02, // Vertical spacing
                            childAspectRatio: 0.75, // Aspect ratio of each grid item
                          ),
                          itemBuilder: (context, index) {
                            return buildCarGrid(index, size, themeData); // Call buildCarGrid
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCarGrid(int i, Size size, ThemeData themeData) {
    return InkWell(
      onTap: () {
        Get.to(DetailsPage(
          carImage: cars[i]['carImage'],
          carClass: cars[i]['carClass'],
          carName: cars[i]['carName'],
          carPower: cars[i]['carPower'],
          people: cars[i]['people'],
          bags: cars[i]['bags'],
          carPrice: cars[i]['carPrice'],
          carRating: cars[i]['carRating'],
          isRotated: cars[i]['isRotated'],
          bluetooth: cars[i]['bluetooth'],
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: themeData.cardColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Car Image
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: cars[i]['isRotated']
                        ? Image.asset(
                      cars[i]['carImage'],
                      height: size.width * 0.3,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                        : Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(pi),
                      child: Image.asset(
                        cars[i]['carImage'],
                        height: size.width * 0.3,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              // Car Class
              Text(
                cars[i]['carClass'],
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: themeData.secondaryHeaderColor,
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Car Name
              Text(
                cars[i]['carName'],
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: themeData.secondaryHeaderColor,
                  fontSize: size.width * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Car Price and Info
              Row(
                children: [
                  Text(
                    '${cars[i]['carPrice']}\$',
                    style: GoogleFonts.poppins(
                      color: themeData.secondaryHeaderColor,
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '/per day',
                    style: GoogleFonts.poppins(
                      color: themeData.primaryColor.withOpacity(0.8),
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.bold,
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
                          UniconsLine.credit_card,
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
