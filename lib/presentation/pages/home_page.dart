// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:unicons/unicons.dart';
//
// import '../../data/models/database.dart';
// import '../widgets/all_stores.dart';
// import '../widgets/store_card.dart';
// import '../widgets/car_card.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     ThemeData themeData = Theme.of(context);
//
//     return Scaffold(
//       backgroundColor: themeData.backgroundColor,
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(50.0),
//         child: AppBar(
//           elevation: 0,
//           backgroundColor: themeData.backgroundColor,
//           leading: Padding(
//             padding: EdgeInsets.only(left: size.width * 0.05),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: themeData.backgroundColor.withOpacity(0.03),
//                 borderRadius: const BorderRadius.all(Radius.circular(10)),
//               ),
//               child: Icon(
//                 UniconsLine.bars,
//                 color: themeData.secondaryHeaderColor,
//               ),
//             ),
//           ),
//           title: Text(
//             "Car Rental",
//             style: GoogleFonts.poppins(
//               color: themeData.primaryColor,
//               fontWeight: FontWeight.bold,
//               fontSize: size.width * 0.05,
//             ),
//           ),
//           centerTitle: true,
//           actions: [
//             Padding(
//               padding: EdgeInsets.only(right: size.width * 0.05),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: themeData.backgroundColor.withOpacity(0.03),
//                   borderRadius: const BorderRadius.all(Radius.circular(10)),
//                 ),
//                 child: Icon(
//                   UniconsLine.search,
//                   color: themeData.secondaryHeaderColor,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: SafeArea(
//         child: ListView(
//           children: [
//             SizedBox(
//               width: size.width * 0.65,
//               height: size.height * 0.06,
//               child: TextField(
//                 //searchbar
//                 style: GoogleFonts.poppins(
//                   color: themeData.primaryColor,
//                 ),
//                 textInputAction: TextInputAction.next,
//                 decoration: InputDecoration(
//                   contentPadding: EdgeInsets.only(
//                     top: size.height * 0.01,
//                     left: size.width * 0.04,
//                     right: size.width * 0.04,
//                   ),
//                   enabledBorder: textFieldBorder(),
//                   focusedBorder: textFieldBorder(),
//                   border: textFieldBorder(),
//                   hintStyle: GoogleFonts.poppins(
//                     color: themeData.primaryColor,
//                   ),
//                   hintText: 'Search a car',
//                 ),
//               ),
//             ),
//             // Stores Section
//             Padding(
//               padding: EdgeInsets.only(
//                 top: size.height * 0.02,
//                 left: size.width * 0.05,
//                 right: size.width * 0.05,
//               ),
//               child: Text(
//                 'Stores',
//                 style: GoogleFonts.poppins(
//                   fontSize: size.width * 0.05,
//                   fontWeight: FontWeight.bold,
//                   color: themeData.primaryColor,
//                 ),
//               ),
//             ),
//             AllStores(size: size, themeData: themeData,),
//
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
//               child: Column(
//                 children: [
//                   CarCard(
//                     car: cars[0]
//                   ),
//                   SizedBox(height: size.height * 0.02),
//                   CarCard(
//                    car: cars[1]
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//
//   OutlineInputBorder textFieldBorder() {
//     return OutlineInputBorder(
//       borderRadius: const BorderRadius.all(Radius.circular(15.0)),
//       borderSide: BorderSide(
//         color: Colors.grey.withOpacity(0.5),
//         width: 1.0,
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

import '../../data/models/car_model.dart';
import '../../data/models/database.dart';
import '../widgets/all_stores.dart';
import '../widgets/car_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedStore; // Store filter
  List<Car> filteredCars = cars; // Filtered cars list

  signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  void filterCarsByStore(int? storeId) {
    setState(() {
      selectedStore = storeId;
      if (storeId == null) {
        filteredCars = cars;
      } else {
        filteredCars = cars.where((car) => car.storeId == storeId).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: themeData.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: themeData.backgroundColor,
          leading: Padding(
            padding: EdgeInsets.only(left: size.width * 0.05),
            child: Container(
              decoration: BoxDecoration(
                color: themeData.backgroundColor.withOpacity(0.03),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Icon(
                UniconsLine.bars,
                color: themeData.secondaryHeaderColor,
              ),
            ),
          ),
          title: Text(
            "Car Rental",
            style: GoogleFonts.poppins(
              color: themeData.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.05,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: size.width * 0.05),
              child: Container(
                decoration: BoxDecoration(
                  color: themeData.backgroundColor.withOpacity(0.03),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: IconButton(
                  onPressed: signUserOut,
                  icon: Icon(Icons.logout),
                )
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            // Search Bar
            Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: TextField(
                style: GoogleFonts.poppins(
                  color: themeData.primaryColor,
                ),
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: size.height * 0.01,
                    horizontal: size.width * 0.04,
                  ),
                  enabledBorder: textFieldBorder(),
                  focusedBorder: textFieldBorder(),
                  border: textFieldBorder(),
                  hintStyle: GoogleFonts.poppins(
                    color: themeData.primaryColor,
                  ),
                  hintText: 'Search a car',
                ),
              ),
            ),

            // Stores Section
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: Text(
                'Stores',
                style: GoogleFonts.poppins(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: themeData.primaryColor,
                ),
              ),
            ),
            AllStores(
              size: size,
              themeData: themeData,
              onStoreSelected: filterCarsByStore, // Pass filter function
              selectedStore: selectedStore,
            ),

            SizedBox(height: 20,),
            // Cars Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                children: filteredCars.map((car) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.02),
                    child: CarCard(car: car),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder textFieldBorder() {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.5),
        width: 1.0,
      ),
    );
  }
}
