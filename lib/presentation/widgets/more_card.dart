import 'package:flutter/material.dart';

import '../../data/models/car_model.dart';
import '../pages/map_details_page.dart';

class MoreCard extends StatelessWidget {
  final Car car;

  const MoreCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color(0xff212020),
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 8,
                  offset: Offset(0,4)
              )
            ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  car.carName,
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    const Icon(Icons.directions_car, color: Colors.white, size: 16,),
                    const SizedBox(width: 5,),
                    const Text(
                      '> 20 km',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(width: 10,),
                    const Icon(Icons.battery_full, color: Colors.white, size: 16,),
                    const SizedBox(width: 5,),
                    Text(
                      car.carPower.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                )
              ],
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 24,)
          ],
        ),
      ),
    );
  }
}