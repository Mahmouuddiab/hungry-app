import 'package:flutter/material.dart';
import '../core/utils/app_colors.dart';
import 'custom_text.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height:20),
        Center(
            child:
            CustomText(
          text: title.toUpperCase(),
          color: AppColors.primary,
          fontSize: 20,
              fontWeight: FontWeight.bold,
        )),
        SizedBox(height:10),
        Image.asset("assets/line.png",width: 200,height:30,color:AppColors.primary),
        SizedBox(height:20),

      ],
    );
  }
}
