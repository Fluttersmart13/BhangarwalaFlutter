import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class SimpleTextWidget extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  SimpleTextWidget(
      {required this.title,
      required this.fontSize,
      required this.color,
      required this.fontWeight})
      : super();

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          color: color ?? koTextColor,
          overflow: TextOverflow.ellipsis),
    );
  }
}

class AppLargeText extends StatelessWidget {
  double size;
  final String text;
  final Color color;

  AppLargeText({this.size = 24, required this.text, this.color = color1})
      : super();

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: FontWeight.bold,
          fontFamily: 'Georgia'),
    );
  }
}

class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color color;

  AppText(
      {required Key key,
      this.size = 16,
      required this.text,
      this.color = Colors.black54})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}

class SizedText extends StatelessWidget {
  final String text;
  final Color color;
  const SizedText({required Key key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size textsize = _textSize(text);
    return Container(
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 16, color: colorPrimary, fontWeight: FontWeight.w700),
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.clip,
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            children: [
              for (int i = 0; i < textsize.width / 5; i++)
                i.isEven
                    ? Container(
                        width: 5,
                        color: kGreen,
                        height: 2,
                      )
                    : Container(
                        width: 5,
                        color: kWhite,
                        height: 2,
                      )
            ],
          )
        ],
      ),
    );
  }

  Size _textSize(String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 16,
          color: color,
          fontWeight: FontWeight.w700,
        ),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: double.infinity, minWidth: 0);

    return textPainter.size;
  }
}

// class OzoneText extends StatelessWidget {
//   final String text;
//   final double fontSize;
//   final Color color;
//   final FontWeight fontWeight;
//   final TextAlign textAlign;
//   final int maxLines;
//   final TextOverflow overflow;
//   final TextStyle style;
//   const OzoneText({
//     Key key,
//     this.text,
//     this.fontSize = 14,
//     this.color,
//     this.fontWeight = FontWeight.normal,
//     this.textAlign = TextAlign.start,
//     this.maxLines,
//     this.overflow,
//     this.style,
//   }) : super(key: key);
//
//   static TextStyle defaultStyle({
//     double fontSize,
//     Color color,
//     FontWeight fontWeight,
//   }) =>
//       GoogleFonts.poppins(
//         textStyle: TextStyle(
//           fontSize: fontSize,
//           color: color ?? koTextColor,
//           fontWeight: fontWeight,
//         ),
//       );
//
//   static TextStyle headerStyle({
//     required double fontSize,
//     Color? color,
//     required FontWeight fontWeight,
//   }) =>
//       GoogleFonts.satisfy(
//         textStyle: TextStyle(
//           fontSize: fontSize,
//           color: color ?? koTextColor,
//           fontWeight: fontWeight,
//         ),
//       );
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: style ??
//           defaultStyle(
//             fontSize: fontSize,
//             fontWeight: fontWeight,
//             color: color,
//           ),
//       textAlign: textAlign,
//       maxLines: maxLines,
//       overflow: overflow,
//     );
//   }
// }
