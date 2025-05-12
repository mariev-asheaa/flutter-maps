import 'package:flutter/material.dart';
import 'package:flutter_maps_and_payment/Map_Feature/presentation/Custom_Google_Map.dart';

void main() {
  runApp(const MapsAndPaymentTest());
}

class MapsAndPaymentTest extends StatelessWidget {
  const MapsAndPaymentTest({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomGoogleMap(),
    );
  }
}
