import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/shared/custom_dialog.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:hungry_app/shared/header.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isShow = false;
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(title: "Payment method"),
                SizedBox(height: 10,),
                /// visa card
                CreditCardWidget(
                  padding: 6,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isShow,
                  onCreditCardWidgetChange: (v) {},
                  cardBgColor: AppColors.primary,
                  obscureCardCvv: false,
                  obscureCardNumber: true,
                  isHolderNameVisible: true,
                ),

                SizedBox(height:20),

                /// form
                CreditCardForm(
                  formKey: _key,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  onCreditCardModelChange: onCreditCardModelChange,
                  isCardHolderNameUpperCase: true,
                  obscureCvv: false,
                  inputConfiguration: InputConfiguration(
                    cardNumberTextStyle: TextStyle(fontFamily: "TenorSans"),
                    cardNumberDecoration: InputDecoration(
                      hintText: "Card Number",
                      hintStyle: TextStyle(fontFamily: "TenorSans"),
                      counterStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),

                      ),
                    ),
                    cardHolderTextStyle: TextStyle(fontFamily: "TenorSans"),
                    cardHolderDecoration: InputDecoration(
                      hintText: "Card Number",
                      hintStyle: TextStyle(fontFamily: "TenorSans"),
                      counterStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),

                      ),
                    ),
                    cvvCodeTextStyle: TextStyle(fontFamily: "TenorSans"),
                    cvvCodeDecoration: InputDecoration(
                      hintText: "CVV",
                      hintStyle: TextStyle(fontFamily: "TenorSans"),
                      counterStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),

                      ),
                    ),
                    expiryDateTextStyle: TextStyle(fontFamily: "TenorSans"),
                    expiryDateDecoration: InputDecoration(
                      hintText: "Expiry Date",
                      hintStyle: TextStyle(fontFamily: "TenorSans"),
                      counterStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),

                      ),
                    ),
                  ),
                ),
                
                SizedBox(height:100),
                
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){
                        if(_key.currentState!.validate()){
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return Dialog(
                                child: CustomDialog(),
                              ) ;
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 12,horizontal: 10),

                      ),
                      child: CustomText(
                        text: "Pay Now",
                        color:AppColors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  void onCreditCardModelChange(CreditCardModel data) {
    setState(() {
      cardNumber = data.cardNumber;
      cardHolderName = data.cardHolderName;
      cvvCode = data.cvvCode;
      expiryDate = data.expiryDate;
      isShow = data.isCvvFocused;
    });
  }

}
