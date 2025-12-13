import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry_app/shared/button.dart';
import 'custom_text.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 550,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(CupertinoIcons.clear),
              ),
              onTap: () => Navigator.pop(context),
            ),
            SizedBox(height:20),
            CustomText(
              text: "Payment success".toUpperCase(),
              color: Colors.black,
              fontSize: 19,
            ),
            SizedBox(height:30),
            Image.asset("assets/Vector.png",width: 60),
            SizedBox(height:20),
            CustomText(
              text: "Payment success".toUpperCase(),
              color: Colors.black,
              fontSize: 19,
            ),
            SizedBox(height:20),
            CustomText(
              text: "Payment ID 15263541".toUpperCase(),
              color: Colors.black,
              fontSize: 14,
            ),
            SizedBox(height:20),
            Divider(),
            SizedBox(height:20),
            CustomText(
              text: "Rate your purchase".toUpperCase(),
              color: Colors.black,
              fontSize: 19,
            ),
            SizedBox(height:20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/Vector (1).png",height: 50,width: 50,),
                SizedBox(width:20),
                Image.asset("assets/Vector (2).png",height: 50,width: 50,),
                SizedBox(width:20),
                Image.asset("assets/Vector (3).png",height: 50,width: 50,),
              ],
            ),
            Spacer(),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: Button(isSvgg: false, title: "Submit", onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }),
                ),
                SizedBox(height:20),
                Expanded(
                  child: Button(isSvgg: false, title: "Cancel", onTap: () {
                    Navigator.pop(context);
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}