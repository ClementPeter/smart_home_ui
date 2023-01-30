import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      title: 'Smart Home',
      home: const MyHomePage(title: 'Smart Home UI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  //List of Smart Devices
  List mySmartDevices = [
    ["Smart Light", "images/light-bulb.png", true],
    ["Smart AC", "images/air-conditioner.png", true],
    ["Smart TV", "images/smart-tv.png", false],
    ["Smart Fan", "images/fan.png", false],
  ];
  //function to toggle the swtich
  void powerSwitchedToggled(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //custom app bar with 2 top icons
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // menu icon
                  Image.asset(
                    'images/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),

                  // account icon
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Home",
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                  ),
                  Text(
                    "Peter",
                    style: GoogleFonts.bebasNeue(fontSize: 72),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Divider(
                thickness: 1,
                color: Color.fromARGB(255, 204, 204, 204),
              ),
            ),

            const SizedBox(height: 25),

            // smart devices grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                "Smart Devices",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            const SizedBox(height: 25),
            // smart devices grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  itemCount: mySmartDevices.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    //crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemBuilder: (context, index) {
                    return SmartBox(
                        smartDeviceName: mySmartDevices[index][0],
                        iconPath: mySmartDevices[index][1],
                        powerStatus: mySmartDevices[index][2],
                        onChanged: (value) {
                          powerSwitchedToggled(value, index);
                        });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
