import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../global/themes/color_theme.dart';
import '../../../global/themes/typography_theme.dart';
import '../../../global/widgets/text_field/password_text_field/password_text_field.dart';
import '../../../global/widgets/text_field/regular_text_field/regular_text_field.dart';
import '../../controllers/auth_controller.dart';
import '../controllers/auth_sign_in_controller.dart';

class AuthSignInView extends GetView<AuthSignInController> {
  AuthSignInView({Key? key}) : super(key: key);

  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LOGIN',
                      style: TypographyTheme.titleLarge.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ColorsTheme.primaryColor,
                      ),
                    ),
                    Text(
                      'Silahkan login untuk melanjutkan',
                    ),
                  ],
                ),
                Column(
                  children: [
                    RegularTextField(
                      controller: controller.emailController,
                      label: "Email",
                      suffixIcon: FaIcon(FontAwesomeIcons.envelope),
                    ),
                    SizedBox(height: 8),
                    PasswordTextField(
                      controller: controller.passwordController,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.emailController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Email Tidak Boleh Kosong'),
                              action: SnackBarAction(
                                label: 'Ok',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            ),
                          );
                        } else if (controller.passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  const Text('Password Tidak Boleh Kosong'),
                              action: SnackBarAction(
                                label: 'Ok',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            ),
                          );
                        } else {
                          authController.firebaseAuthLogin(
                              controller.emailController.text,
                              controller.passwordController.text);
                        }
                      },
                      child: Text("LOGIN"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Belum Punya Akun? "),
                    InkWell(
                      child: Text(
                        "Daftar",
                        style: TypographyTheme.bodyRegular.copyWith(
                          color: ColorsTheme.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onTap: () {
                        Get.toNamed(Routes.AUTH_SIGN_UP);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
