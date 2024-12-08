import 'package:car_rental_final/presentation/pages/car_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/car_model.dart';

class CarCard extends StatelessWidget {
  final Car car;

  const CarCard({
    Key? key,
    required this.car,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);

    return GestureDetector(
      onTap: () {
        Get.to(CardDetailsPage(car: car));
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: size.height * 0.015,
          horizontal: size.width * 0.03,
        ),
        decoration: BoxDecoration(
          color: themeData.cardColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Car Image with Favorite Icon
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset(
                    car.carImage,
                    width: double.infinity,
                    height: size.height * 0.18,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: size.height * 0.015,
                  right: size.width * 0.03,
                  child: Container(
                    height: size.height * 0.045,
                    width: size.height * 0.045,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      color: themeData.primaryColor,
                      size: size.width * 0.05,
                    ),
                  ),
                ),
              ],
            ),
            // Car Details Section
            Padding(
              padding: EdgeInsets.all(size.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Car Name
                  Text(
                    car.carName,
                    style: GoogleFonts.poppins(
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.bold,
                      color: themeData.primaryColor,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  // Car Features Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FeatureIconText(
                        icon: Icons.speed,
                        text: '${car.carPower}mph',
                        themeData: themeData,
                        size: size,
                      ),
                      FeatureIconText(
                        icon: Icons.chair,
                        text: '${car.people} Seats',
                        themeData: themeData,
                        size: size,
                      ),
                      FeatureIconText(
                        icon: Icons.attach_money,
                        text: '£${car.carPrice}/Day',
                        themeData: themeData,
                        size: size,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper Widget for Feature Icon and Text
class FeatureIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final ThemeData themeData;
  final Size size;

  const FeatureIconText({
    Key? key,
    required this.icon,
    required this.text,
    required this.themeData,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: size.width * 0.045,
          color: themeData.secondaryHeaderColor,
        ),
        SizedBox(width: size.width * 0.01),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: size.width * 0.035,
            color: themeData.secondaryHeaderColor,
          ),
        ),
      ],
    );
  }
}
