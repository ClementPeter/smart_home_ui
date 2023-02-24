import 'dart:math';
import 'package:flutter/material.dart';


class CustomSlider extends StatefulWidget {
  double value;
  final String? iconPath;
  final ValueChanged<double>? onChanged;
  final bool powerStatus;

  CustomSlider(
      {required this.value,
      this.onChanged,
      required this.powerStatus,
      this.iconPath});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        //color: Colors.grey,
        color: widget.powerStatus || widget.value > 5
            ? Colors.green.shade200
            : Colors.grey,
        // borderRadius: BorderRadius.circular(25),
        borderRadius: widget.powerStatus
            ? BorderRadius.circular(35)
            : BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 17),
            blurRadius: 23,
            spreadRadius: -15,
            color: widget.powerStatus == false || widget.value < 5
                ? Colors.grey.shade400
                : Colors.green.shade400,
            // Colors.green.shade400,
          ),
        ],
      ),
      child: Column(
        //alignment: Alignment.topCenter,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Stack(
            //alignment: Alignment.topRight,
            children: [
              Image.asset(
                widget.iconPath!,
                height: 40,
                color: widget.powerStatus || widget.value > 5
                    ? Colors.green
                    : Colors.grey.shade700,
              ),
            ],
          ),
          const SizedBox(height: 40),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Transform.rotate(
                  angle: -pi / 2,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Color(0xFF4CAF50),
                        inactiveTrackColor: Colors.white54,
                        trackHeight: 70.0,
                        thumbColor: Colors.transparent,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 0.0),
                        overlayColor: Colors.white.withAlpha(32),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 14.0),
                        // trackShape:                          RetroSliderTrackShape(), // <-- Custom Thumb Shape
                        trackShape: RoundedRectSliderTrackShape()
                        // trackShape: CustomTrackShape()),
                        ),
                    child: Slider(
                      value: widget.value,
                      min: 0,
                      max: 100,
                      // onChanged: widget.onChanged,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          widget.value = value;
                        });
                        // widget.onChanged(value);
                      },
                    ),
                    // child: Slider(
                    //   //activeTrackColor: Colors.white54,
                    //   //inactiveTrackColor: Colors.green,
                    //   //activeColor: Colors.green,
                    //   //inactiveColor: Colors.white,
                    //   value: value,
                    //   min: 0,
                    //   max: 100,
                    //   onChanged: onChanged,
                    //   // onChanged: (value) {
                    //   //   setState(() {
                    //   //     _value = value;
                    //   //   });
                    //   //   widget.onChanged(value);
                    //   // },
                    // ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
