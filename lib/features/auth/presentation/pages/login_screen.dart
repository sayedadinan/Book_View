import 'package:books_app/core/theme/color_scheme.dart';
import 'package:books_app/core/utils/extentions.dart';
import 'package:books_app/core/widgets/app_customsizedbox.dart';
import 'package:books_app/core/widgets/app_textfield.dart';
import 'package:books_app/core/widgets/app_texts.dart';
import 'package:books_app/features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';
import 'package:books_app/features/books/presentation/pages/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscurePassword = true; // Initially obscured for password
  bool isObscureConfirmPassword =
      true; // Initially obscured for confirm password
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content: Text('Successfully Logged In'),
          //     backgroundColor: AppColors.successColor,
          //   ),
          // );
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.success(
              message: "Successfully User Registered",
            ),
          );
          // Navigate to another page or show success message
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const BottomBar(),
          ));
        } else if (state is AuthFailure) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(
              message: state.error,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20),
              ),
              child: Column(
                children: [
                  const CustomSizedBoxHeight(101),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: getProportionateScreenWidth(75),
                        height: getProportionateScreenHeight(75),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 227, 225, 225)
                                  .withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 9,
                              offset: const Offset(0.1, 0.1),
                            ),
                          ],
                          image: const DecorationImage(
                            image: AssetImage('assets/images/Logo.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const CustomSizedBoxHeight(93),
                  const Row(
                    children: [
                      CustomText(
                        color: AppColors.primaryColor,
                        size: 12,
                        text: 'Username',
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                  const CustomSizedBoxHeight(7),
                  // Username Field
                  Inputfield(
                    controller: usernameController,
                    obscureText: false, // No obscuring for username
                    hinttext: 'Enter your name',
                    togglePasswordVisibility: null, // No toggle functionality
                  ),
                  const CustomSizedBoxHeight(16),
                  const Row(
                    children: [
                      CustomText(
                        color: AppColors.greyColor,
                        size: 12,
                        text: 'Password',
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                  const CustomSizedBoxHeight(7),
                  // Password Field
                  Inputfield(
                    controller: passwordController,
                    obscureText: isObscurePassword,
                    togglePasswordVisibility: () {
                      setState(() {
                        isObscurePassword = !isObscurePassword;
                      });
                    },
                    hinttext: 'Enter your password',
                  ),
                  const CustomSizedBoxHeight(16),
                  const Row(
                    children: [
                      CustomText(
                        color: AppColors.greyColor,
                        size: 12,
                        text: 'Confirm Password',
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                  const CustomSizedBoxHeight(7),
                  // Confirm Password Field
                  Inputfield(
                    controller: confirmPasswordController,
                    obscureText: isObscureConfirmPassword,
                    togglePasswordVisibility: () {
                      setState(() {
                        isObscureConfirmPassword = !isObscureConfirmPassword;
                      });
                    },
                    hinttext: 'Confirm your password',
                  ),
                  const CustomSizedBoxHeight(16),
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => const BottomBar()));
                      if (passwordController.text !=
                          confirmPasswordController.text) {
                        showTopSnackBar(
                          Overlay.of(context),
                          const CustomSnackBar.error(
                            message:
                                "Password and Confirm password should be same",
                          ),
                        );
                      }
                      if (usernameController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        showTopSnackBar(
                          Overlay.of(context),
                          const CustomSnackBar.error(
                            message: "name and password should not be empty",
                          ),
                        );
                      } else {
                        context.read<AuthBloc>().add(
                              RegisterUserEvent(
                                username: usernameController.text,
                                password: passwordController.text,
                              ),
                            );
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: getProportionateScreenHeight(40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: AppColors.primaryColor,
                      ),
                      child: Center(
                        child: (state is AuthLoading)
                            ? const CircularProgressIndicator(
                                strokeWidth: 50,
                                color: AppColors.whiteColor,
                              )
                            : const CustomText(
                                color: AppColors.whiteColor,
                                size: 12,
                                text: 'Register',
                                weight: FontWeight.w600,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
