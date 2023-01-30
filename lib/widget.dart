import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//@immutable
class SmartBox extends StatelessWidget {
  SmartBox({
    Key? key,
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerStatus,
    this.onChanged,
  }) : super(key: key);

  // final List mySmartDevices;
  final String? smartDeviceName;
  final String? iconPath;
  final bool? powerStatus;

  void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
            color: powerStatus! ? Colors.green.shade400 : Colors.grey,
            borderRadius: powerStatus!
                ? BorderRadius.circular(35)
                : BorderRadius.circular(5),
            boxShadow: powerStatus!
                ? [
                    BoxShadow(
                      offset: const Offset(0, 17),
                      blurRadius: 23,
                      spreadRadius: -15,
                      color: Colors.green.shade400,
                    ),
                  ]
                : const [
                    BoxShadow(
                      offset: Offset(0, 17),
                      blurRadius: 23,
                      spreadRadius: -8,
                      color: Colors.grey,
                    ),
                  ]),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                iconPath!,
                height: 65,
                color: powerStatus! ? Colors.white : Colors.grey.shade700,
              ),
            ),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    smartDeviceName!,
                    style: TextStyle(
                      color: powerStatus! ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: pi / 2,
                  child: CupertinoSwitch(
                    activeColor: Colors.green.shade900,
                    trackColor: Colors.grey.shade600,

                    value: powerStatus!,
                    //pass a function to change the power status
                    onChanged: onChanged,
                  ),
                )
              ],
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
