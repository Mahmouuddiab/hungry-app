import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hungry_app/core/di/di.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/validators/app_validators.dart';
import 'package:hungry_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:hungry_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:hungry_app/features/auth/presentation/screens/login_screen.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_field.dart';
import 'package:hungry_app/shared/custom_snackbar.dart';
import 'package:hungry_app/shared/custom_text.dart';

class RegisterScreen extends StatefulWidget {
   RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

   TextEditingController nameController = TextEditingController();

   TextEditingController emailController = TextEditingController();

   TextEditingController passwordController = TextEditingController();

   TextEditingController rePasswordController = TextEditingController();

   TextEditingController phoneController = TextEditingController();

   var formKey = GlobalKey<FormState>();

   bool obscurePassword = true;

   AuthCubit authCubit = getIt<AuthCubit>();


  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: authCubit,
      listener: (context, state) {
        if(state is RegisterLoadingState){
          CustomSnackBar.loading(context, "Loading");
        }

        if(state is RegisterSuccessState){
          CustomSnackBar.success(context, "Success Register");
        }
        if(state is RegisterErrorState){
          CustomSnackBar.error(context, state.error);
        }
      },
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 120,),
              Center(child: SvgPicture.asset("assets/Hungry_.svg",color: AppColors.primary,)),
              SizedBox(height: 20,),
              CustomText(
                  text: "Welcome to Our Food App ",
                color: AppColors.primary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 50,),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 14),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 25,
                      children: [
                        SizedBox(height: 5,),
                        CustomField(
                            hintTxt: "Name",
                          prefixIcon: Icon(Icons.person,color: AppColors.white,),
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          validator:(p0) => AppValidators.displayNameValidator(nameController.text),
                          controller: nameController,
                        ),
                        CustomField(
                          hintTxt: "Email",
                          prefixIcon: Icon(Icons.email_outlined,color: AppColors.white,),
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          validator:(p0) => AppValidators.emailValidator(emailController.text),
                          controller: emailController,
                        ),
                        CustomField(
                          hintTxt: "Password",
                          obscureText: obscurePassword,
                          keyboardType: TextInputType.number,
                          validator:(p0) => AppValidators.passwordValidator(passwordController.text),
                          controller: passwordController,
                          prefixIcon: Icon(Icons.lock_outline,color: AppColors.white,),
                          suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              }
                              , icon: Icon(obscurePassword? Icons.visibility_off:Icons.visibility,color: AppColors.white,)
                          ),
                        ),
                        CustomField(
                          hintTxt: "Confirm Password",
                          obscureText: obscurePassword,
                          keyboardType: TextInputType.number,
                          validator:(p0) => AppValidators.repeatPasswordValidator(password: passwordController.text,value: rePasswordController.text),
                          controller: rePasswordController,
                          prefixIcon: Icon(Icons.lock_outline,color: AppColors.white,),
                          suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              }
                              , icon: Icon(obscurePassword? Icons.visibility_off:Icons.visibility,color: AppColors.white,)
                          ),
                        ),
                        CustomField(
                          hintTxt: "Phone Number",
                          prefixIcon: Icon(Icons.phone,color: AppColors.white,),
                          obscureText: false,
                          keyboardType: TextInputType.phone,
                          validator:(p0) => AppValidators.phoneValidator(phoneController.text, context),
                          controller: phoneController,
                        ),
                        CustomButton(
                            onPressed: (){
                              if(formKey.currentState!.validate()){
                                authCubit.register(
                                    nameController.text,
                                    emailController.text,
                                    passwordController.text,
                                    rePasswordController.text,
                                    phoneController.text);
                              }
                            },
                            child:  CustomText(
                                text: "Register",
                              color: AppColors.primary,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 7,
                          children: [
                            CustomText(
                                text: "Already have an account ? ",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                              },
                              child: CustomText(
                                text: "Login",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.yellow,
                              ),
                            )
                          ],
                        )
                      ],
                    ),

                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
