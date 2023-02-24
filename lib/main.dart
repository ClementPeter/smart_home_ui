import 'dart:math';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/slider_widget.dart';
import 'package:smart_home/smartBoxWidget.dart';

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

  bool? status = false; //main power status

  //List of Smart Devices
  List mySmartDevices = [
    ["Smart Light", "images/light-bulb.png", true],
    ["Smart AC", "images/air-conditioner.png", false],
    ["Smart TV", "images/smart-tv.png", false],
    ["Smart Fan", "images/fan.png", true],
  ];
  //function to toggle the swtich
  void powerSwitchedToggled(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  void mainPowerToggledOn() {
    setState(() {
      print(mySmartDevices[1][2]);
      status = true;
      mySmartDevices[0][2] = status;
      mySmartDevices[1][2] = status;
      mySmartDevices[2][2] = status;
      mySmartDevices[3][2] = status;
      sliderValue = 20;

      // mySmartDevices[2] = value;
    });
  }

  void mainPowerToggledOff() {
    setState(() {
      print(mySmartDevices[1][2]);
      status = false;
      mySmartDevices[0][2] = false;
      mySmartDevices[1][2] = false;
      mySmartDevices[2][2] = false;
      mySmartDevices[3][2] = false;
      sliderValue = 0;

      // mySmartDevices[2] = value;
    });
  }

  //Slider controls
  //double _currentSliderValue = 10;
  double sliderValue = 20;

  //void Function(bool)? onchanged;
  //VoidCallback? onchanged;
  ValueChanged<double>? onchanged;

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
                    height: 40,
                    color: Colors.grey[800],
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      return mainPowerToggledOn();
                    },
                    onDoubleTap: () {
                      return mainPowerToggledOff();
                    },
                    child: Icon(
                      Icons.bolt,
                      color: status! ? Colors.green : Colors.grey,
                      size: 80,
                    ),
                  ),

                  // account icon
                  Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),
            //Welcome Text
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

            const SizedBox(height: 20),

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
            const SizedBox(height: 15),
            // smart devices grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  itemCount: mySmartDevices.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemBuilder: (context, index) {
                    return FlipCard(
                      direction: FlipDirection.HORIZONTAL,
                      side: CardSide.FRONT,
                      speed: 500,
                      onFlipDone: (status) {
                        print(status);
                      },
                      front: SmartBox(
                        smartDeviceName: mySmartDevices[index][0],
                        iconPath: mySmartDevices[index][1],
                        powerStatus: mySmartDevices[index][2],
                        onChanged: (value) {
                          powerSwitchedToggled(value, index);
                        },
                      ),
                      back: CustomSlider(
                        value: sliderValue,
                        iconPath: mySmartDevices[index][1],
                        powerStatus: mySmartDevices[index][2],
                      ),
                    );
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
