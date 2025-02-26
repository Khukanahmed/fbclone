import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xff023D45);
  static const Color shadowColor = Color(0xff292929);
  static const Color bgColor = Colors.black;
  static const Color blackColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static const Color grayColor = Colors.grey;
  static Color redcolor = Colors.red;
  static Color tealAcent = const Color(0xff02cbd2);
  static Color unselect = const Color(0xffD0D5DD);

  static Color boderColor = const Color(0xffD0D5DD);
  static Color greenColor = Colors.green;
  static Color fieldColor = Colors.grey.shade200;
  static Color textColor = Color(0xff9C9C9C);




  static List gradientsColor = const [
  LinearGradient(
    begin: Alignment(-1.0, 0.0),
    end: Alignment(1.0, 0.0),
    transform: GradientRotation(90),
    colors: [
      Color(0xFFFFFFFF),
     
      Color(0xFF156A76),
      Color(0xFF014852),
    ],
  ),
  LinearGradient(
    begin: Alignment(-1.0, 0.0),
    end: Alignment(1.0, 0.0),
    transform: GradientRotation(90),
    colors: [
       Color(0xFF156A76),
      Color(0xFF014852),
    ],
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    transform: GradientRotation(-135),
    colors: [
      Color.fromRGBO(72, 229, 169, 1),
      Color.fromRGBO(143, 199, 173, 1),
    ],
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(116, 167, 126, 1),
      Color.fromRGBO(24, 175, 78, 1),
    ],
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFff7f11),
      Color(0xFFff7f11),
    ],
  ),
  LinearGradient(
    begin: Alignment(-1.0, 0.0),
    end: Alignment(1.0, 0.0),
    transform: GradientRotation(90),
    colors: [
      Color(0xFF00ffe1),
      Color(0xFFe9ff42),
    ],
  )
];
static List feedBackGroundGradientColors = [
  "{\"backgroundImage\":\"linear-gradient(45deg, rgb(255, 115, 0) 0%, rgb(255, 0, 234) 100%)\"}",
  "{\"backgroundImage\":\"linear-gradient(135deg, rgb(143, 199, 173), rgb(72, 229, 169))\"}",
  "{\"backgroundImage\":\"linear-gradient(135deg, rgb(116, 167, 126), rgb(24, 175, 78))\"}",
  "{\"backgroundImage\":\"linear-gradient(45deg, rgb(255, 127, 17) 0%, rgb(255, 127, 17) 100%)\"}",
  "{\"backgroundImage\":\"linear-gradient(45deg, rgb(233, 255, 66) 0%, rgb(0, 255, 225) 100%)\"}"
];


}
