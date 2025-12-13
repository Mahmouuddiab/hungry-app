import 'package:flutter/material.dart';
import 'package:hungry_app/features/home/presentation/widgets/category.dart';
import 'package:hungry_app/shared/custom_text.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  CategoryModel category;
  TabItem({super.key,required this.isSelected,required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
      decoration: BoxDecoration(
          color: isSelected?Colors.green:Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.green,width: 1.5)
      ),
      child: CustomText(
        text: category.name,
        fontWeight: FontWeight.bold,
        fontSize: 17,
        color: isSelected?Colors.white:Colors.green,
      ),
    );
  }
}
