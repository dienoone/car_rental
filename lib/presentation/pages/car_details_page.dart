import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/models/car_model.dart';
import '../widgets/more_card.dart';
import 'map_details_page.dart';

class CardDetailsPage extends StatelessWidget {
  final Car car;

  const CardDetailsPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          // Car image
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                car.carImage,
                fit: BoxFit.cover,
                height: 250,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Car details
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Car name
                    Text(
                      car.carName,
                      style: GoogleFonts.roboto(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Car details grid
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildDetailTile(Icons.speed, 'Driving Range', '429 km'),
                        buildDetailTile(Icons.bolt, 'Power', '280 kW'),
                        buildDetailTile(Icons.person, 'Seating', '4 seats'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildDetailTile(Icons.timer, '0-100 km/h', '5.4 s'),
                        buildDetailTile(
                            Icons.directions_car, 'Drive', 'All-wheel'),
                        buildDetailTile(Icons.speed, 'Max Speed', '230 km/h'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Color(0xffF3F3F3),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                    spreadRadius: 5,
                                  )
                                ],
                              ),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage:
                                    AssetImage('assets/user.png'),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Jane Cooper',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '\$4,253',
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MapsDetailsPage(car: car),
                                  ),
                                );
                              },
                              child: Container(
                                height: 170,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10,
                                      spreadRadius: 5,
                                    )
                                  ],
                                ),
                                child: Image.asset(
                                  'assets/maps.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'More Cars',
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // More Cars
                    Column(
                      children: [
                        MoreCard(
                          car: Car(
                            carName: "${car.carName}-1",
                            carClass: car.carClass,
                            carPower: car.carPower + 50,
                            people: car.people,
                            bags: car.bags,
                            bluetooth: car.bluetooth,
                            carImage: car.carImage,
                            carPrice: car.carPrice + 200,
                            isRotated: car.isRotated,
                            carRating: car.carRating,
                            storeId: 1,
                          ),
                        ),
                        const SizedBox(height: 10),
                        MoreCard(
                          car: Car(
                            carName: "${car.carName}-2",
                            carClass: car.carClass,
                            carPower: car.carPower + 50,
                            people: car.people,
                            bags: car.bags,
                            bluetooth: car.bluetooth,
                            carImage: car.carImage,
                            carPrice: car.carPrice + 200,
                            isRotated: car.isRotated,
                            carRating: car.carRating,
                            storeId: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDetailTile(IconData icon, String title, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.black, size: 30),
        const SizedBox(height: 5),
        Text(
          title,
          style: GoogleFonts.roboto(
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
        Text(
          value,
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
