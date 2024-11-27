import 'package:books_app/core/theme/color_scheme.dart';
import 'package:books_app/core/utils/extentions.dart';
import 'package:books_app/core/widgets/app_texts.dart';
import 'package:books_app/features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.usernameController,
    required this.state,
  });

  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController usernameController;
  final AuthState state;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (passwordController.text != confirmPasswordController.text) {
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.error(
              message: "Password and Confirm password should be same",
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
              ? SizedBox(
                  width: 35,
                  height: 35,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.whiteColor,
                  ),
                )
              : CustomText(
                  color: AppColors.whiteColor,
                  size: 12,
                  text: 'Register',
                  weight: FontWeight.w600,
                ),
        ),
      ),
    );
  }
}
