import 'package:car_rental_final/data/models/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:latlong2/latlong.dart';

import '../../data/models/car_model.dart';

class MapsDetailsPage extends StatelessWidget {
  final Car car;

  const MapsDetailsPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: ()=>Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: const LatLng(51, -0.09),
              zoom: 13,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
            ],
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: carDetailsCard(car: car, context: context)
          )
        ],
      ),
    );
  }
}

Widget carDetailsCard({required Car car, required BuildContext context}) {
  return SizedBox(
    height: 350,
    child: Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)
              ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text('${car.carName}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Icon(Icons.directions_car, color: Colors.white, size: 16,),
                  const SizedBox(width: 5,),
                  const Text(
                    '> 20 km',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(width: 10,),
                  const Icon(Icons.battery_full, color: Colors.white, size: 14,),
                  const SizedBox(width: 5,),
                  Text(
                    '${car.carPower.toString()}',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              )
            ],
          ),
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Features", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                featureIcons(),
                 SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text('\$${car.carPrice}/day', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                    ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => PaypalCheckoutView(
                              sandboxMode: true,
                              clientId: clientId,
                              secretKey: secretId,
                              transactions: const [
                                {
                                  "amount": {
                                    "total": '70',
                                    "currency": "USD",
                                    "details": {
                                      "subtotal": '70',
                                      "shipping": '0',
                                      "shipping_discount": 0
                                    }
                                  },
                                  "description": "The payment transaction description.",
                                  // "payment_options": {
                                  //   "allowed_payment_method":
                                  //       "INSTANT_FUNDING_SOURCE"
                                  // },
                                  "item_list": {
                                    "items": [
                                      {
                                        "name": "Apple",
                                        "quantity": 4,
                                        "price": '5',
                                        "currency": "USD"
                                      },
                                      {
                                        "name": "Pineapple",
                                        "quantity": 5,
                                        "price": '10',
                                        "currency": "USD"
                                      }
                                    ],

                                    // shipping address is not required though
                                    //   "shipping_address": {
                                    //     "recipient_name": "tharwat",
                                    //     "line1": "Alexandria",
                                    //     "line2": "",
                                    //     "city": "Alexandria",
                                    //     "country_code": "EG",
                                    //     "postal_code": "21505",
                                    //     "phone": "+00000000",
                                    //     "state": "Alexandria"
                                    //  },
                                  }
                                }
                              ],
                              note: "Contact us for any questions on your order.",
                              onSuccess: (Map params) async {
                                print("onSuccess: $params");
                              },
                              onError: (error) {
                                print("onError: $error");
                                Navigator.pop(context);
                              },
                              onCancel: () {
                                print('cancelled:');
                              },
                            ),
                          ));
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                        child: const Text('Book Now', style: TextStyle(color: Colors.white),)
                    )
                  ],
                )
              ],
            ),
          ),
        ),

        Positioned(
            top: 50,
            right: 20,
            child: Image.asset('assets/white_car.png')
        )
      ],
    ),
  );
}

Widget featureIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      featureIcon(Icons.local_gas_station, 'Diesel', 'Common Rail'),
      featureIcon(Icons.speed, 'Acceleration', '0 - 100km/s'),
      featureIcon(Icons.ac_unit, 'Cold', 'Temp Control'),
    ],
  );
}

Widget featureIcon(IconData icon, String title, String subtitle){
  return Container(
    width: 100,
    height: 100,
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1)
    ),
    child: Column(
      children: [
        Icon(icon, size: 28,),
        Text(title),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.grey, fontSize: 10),
        )
      ],
    ),
  );
}