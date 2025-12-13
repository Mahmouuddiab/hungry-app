import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/shared/custom_text.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.isSvgg, required this.title,required this.onTap});
  final bool isSvgg;
  final String title;
  final Function()? onTap;


  @override
  Widget build(BuildContext context) {
    bool isSvg = isSvgg;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColors.primary,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 13,vertical: 16),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isSvg
                  ? SvgPicture.asset("assets/svgs/shopping bag.svg",width: 20,)
                  : SizedBox.shrink(),
              SizedBox(width: 10,),
              CustomText(text: title.toUpperCase(),fontSize: 18,color: AppColors.white,),
            ],
          ),
        ),

      ),
    );
  }
}
