// import 'package:flutter/material.dart';

// // class SliderWidget extends StatelessWidget {
// //   const SliderWidget({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Slider(
// //       value: 0.5,
// //       onChanged: (value) {
// //         print(value);
// //       },

// //     );
// //   }
// // }

// //////////////
// ///class FatSliderTrackShape extends SliderTrackShape {
//   final double trackHeight;

//   const FatSliderTrackShape({this.trackHeight = 4});

//   @override
//   Rect getPreferredRect({
//     RenderBox parentBox,
//     Offset offset = Offset.zero,
//     SliderThemeData sliderTheme,
//     bool isEnabled,
//     bool isDiscrete,
//   }) {
//     final trackHeight = sliderTheme.trackHeight ?? this.trackHeight;
//     final trackLeft = offset.dx + 16; // adjust for slider thumb size
//     final trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
//     final trackWidth = parentBox.size.width - 32; // adjust for slider thumb size
//     return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
//   }

//   @override
//   void paint(PaintingContext context, Offset offset,
//       {RenderBox parentBox,
//       SliderThemeData sliderTheme,
//       Animation<double> enableAnimation,
//       TextDirection textDirection,
//       SliderComponentShape thumb}) {
//     final trackRect = getPreferredRect(
//         parentBox: parentBox,
//         offset: offset,
//         sliderTheme: sliderTheme,
//         isEnabled: isEnabled(enableAnimation),
//         isDiscrete: false);
//     final trackPaint = Paint()
//       ..color = sliderTheme.activeTrackColor
//       ..style = PaintingStyle.fill;
//     final thumbRadius = sliderTheme.thumbShape.getPreferredSize(false, false).width / 2;
//     final thumbCenter = Offset(trackRect.left + thumbRadius, trackRect.center.dy);
//     context.canvas.drawCircle(thumbCenter, thumbRadius, trackPaint);
//   }
// }

// class CustomSlider extends StatefulWidget {
//   final double value;
//   final ValueChanged<double> onChanged;

//   CustomSlider({this.value, this.onChanged});

//   @override
//   _CustomSliderState createState() => _CustomSliderState();
// }

// class _CustomSliderState extends State<CustomSlider> {
//   double _value;

//   @override
//   void initState() {
//     super.initState();
//     _value = widget.value;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SliderTheme(
//       data: SliderThemeData(
//         trackHeight: 4,
//         activeTrackColor: Colors.blue,
//         thumbColor: Colors.blue,
//         thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
//         trackShape: FatSliderTrackShape(),
//       ),
//       child: Slider(
//         value: _value,
//         min: 0,
//         max: 100,
//         onChanged: (value) {
//           setState(() {
//             _value = value;
//           });
//           widget.onChanged(value);
//         },
//       ),
//     );
//   }
// }

// import 'dart:math';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class FatSliderTrackShape extends SliderTrackShape {
//   final double trackHeight;

//   const FatSliderTrackShape({this.trackHeight = 8});

//   @override
//   Rect getPreferredRect({
//     RenderBox? parentBox,
//     Offset offset = Offset.zero,
//     SliderThemeData? sliderTheme,
//     bool? isEnabled,
//     bool? isDiscrete,
//   }) {
//     final trackHeight = sliderTheme!.trackHeight ?? this.trackHeight;
//     final trackLeft = offset.dx + 16; // adjust for slider thumb size
//     final trackTop = offset.dy + (parentBox!.size.height - trackHeight) / 2;
//     final trackWidth =
//         parentBox!.size.width - 32; // adjust for slider thumb size
//     return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
//   }

//   // @override
//   // void paint(
//   //   PaintingContext context,
//   //   Offset offset, {
//   //   required RenderBox parentBox,
//   //   required SliderThemeData sliderTheme,
//   //   required Animation<double> enableAnimation,
//   //   required Offset thumbCenter,
//   //   isEnabled = true,
//   //   isDiscrete = false,
//   //   // bool isEnabled :isEnabled(enableAnimation),
//   //   // bool isDiscrete,
//   //   required TextDirection textDirection,
//   // }) {
//   //   // TODO: implement paint
//   // }

//   @override
//   void paint(
//     PaintingContext context,
//     Offset offset, {
//     RenderBox? parentBox,
//     SliderThemeData? sliderTheme,
//     Animation<double>? enableAnimation,
//     TextDirection? textDirection,
//     SliderComponentShape? thumb,
//   }) {
//     final trackRect = getPreferredRect(
//         parentBox: parentBox,
//         offset: offset,
//         sliderTheme: sliderTheme,
//         //isEnabled: isEnabled,
//         isDiscrete: false);
//     final trackPaint = Paint()
//       ..color = sliderTheme!.activeTrackColor!
//       ..style = PaintingStyle.fill;
//     final thumbRadius =
//         sliderTheme.thumbShape!.getPreferredSize(false, false).width / 2;
//     final thumbCenter =
//         Offset(trackRect.left + thumbRadius, trackRect.center.dy);
//     context.canvas.drawCircle(thumbCenter, thumbRadius, trackPaint);
//   }
// }

// //
//
//
//
//
//
//
//
//
//
//
// //
// //
// import 'dart:math';
// import 'package:flutter/material.dart';


import 'dart:math';
import 'package:flutter/material.dart';

// class RetroSliderTrackShape extends SliderTrackShape {
//   @override
//   Rect getPreferredRect({
//     RenderBox? parentBox,
//     Offset offset = Offset.zero,
//     SliderThemeData? sliderTheme,
//     bool? isEnabled,
//     bool? isDiscrete,
//   }) {
//     final double thumbWidth =
//         sliderTheme!.thumbShape!.getPreferredSize(true, isDiscrete!).width;
//     final double? trackHeight = sliderTheme.trackHeight;
//     //assert(thumbWidth >= 0);
//     //assert(trackHeight! >= 0);
//     //assert(parentBox!.size.width >= thumbWidth);
//     //assert(parentBox!.size.height >= trackHeight!);

//     final double trackLeft = offset.dx + thumbWidth;
//     final double trackTop = offset.dy + (parentBox!.size.height - 10.0);
//     final double trackWidth = parentBox.size.width - thumbWidth;
//     return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight!);
//   }

//   @override
//   void paint(
//     PaintingContext context,
//     Offset offset, {
//     RenderBox? parentBox,
//     SliderThemeData? sliderTheme,
//     Animation<double>? enableAnimation,
//     TextDirection? textDirection,
//     Offset? thumbCenter,
//     bool? isDiscrete,
//     bool? isEnabled,
//   }) {
//     if (sliderTheme!.trackHeight == 0) {
//       return;
//     }

//     final Rect trackRect = getPreferredRect(
//       parentBox: parentBox,
//       offset: offset,
//       sliderTheme: sliderTheme,
//       isEnabled: isEnabled,
//       isDiscrete: isDiscrete,
//     );

//     final Paint fillPaint = Paint()
//       ..color = sliderTheme.activeTrackColor!
//       ..style = PaintingStyle.fill;

//     // final Paint borderPaint = Paint()
//     //   // ..color = Colors.white
//     //   //..strokeWidth = 1.0
//     //   ..style = PaintingStyle.stroke;

//     final pathSegment = Path()
//       ..moveTo(trackRect.left, trackRect.top)
//       ..lineTo(trackRect.right, trackRect.top)
//       ..arcTo(
//           Rect.fromPoints(
//             Offset(trackRect.right + 10, trackRect.top),
//             Offset(trackRect.right - 10, trackRect.bottom),
//           ),
//           -pi / 2,
//           pi,
//           false)
//       ..lineTo(trackRect.left, trackRect.bottom)
//       ..arcTo(
//           Rect.fromPoints(
//             Offset(trackRect.left + 7, trackRect.top),
//             Offset(trackRect.left - 7, trackRect.bottom),
//           ),
//           -pi * 3 / 2,
//           pi,
//           false);

//     context.canvas.drawPath(pathSegment, fillPaint);
//     // context.canvas.drawPath(pathSegment, borderPaint);
//   }
// }

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
