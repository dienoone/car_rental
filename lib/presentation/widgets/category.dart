import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Category extends StatelessWidget {
  final Size size;
  final String text;
  final ThemeData themeData;
  final void Function() onTab;  // Define the onTap as a function type

  const Category({
    super.key,
    required this.size,  // Make sure to pass the size value
    required this.text,  // Make sure to pass the text value
    required this.themeData,
    required this.onTab, // Make sure to pass the onTab function
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.03,
            left: size.width * 0.05,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: themeData.secondaryHeaderColor,
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.055,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.03,
            right: size.width * 0.05,
          ),
          child: TextButton(
            onPressed: onTab,
            child: Text(
              'View All',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: themeData.primaryColor.withOpacity(0.8),
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
          ,
        ),
      ],
    );
  }
}
