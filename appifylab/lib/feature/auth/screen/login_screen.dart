import 'package:appifylab/core/const/app_colors.dart';
import 'package:appifylab/core/const/image_path.dart';
import 'package:appifylab/core/style/global_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          true, // Allows screen resizing when keyboard appears
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(gradient: AppColors.gradientsColor[1]),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Center(child: Image.asset(ImagePath.logo, width: 200)),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  padding: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.4),
                    border: Border(
                      top: BorderSide(
                        width: 4,
                        color: Colors.black.withValues(alpha: 0.4),
                      ),
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Center(
                          child: Text(
                            'Sign In',
                            style: globalTextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        Text(
                          'Email',
                          style: globalTextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        TextField(
                          style: globalTextStyle(color: Colors.white),
                          controller: loginController.emailController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            fillColor: Colors.white.withValues(alpha: 0.25),
                            filled: true,
                            hintText: 'Email',
                            hintStyle: globalTextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Password',
                          style: globalTextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Obx(
                          () => TextField(
                            style: globalTextStyle(color: Colors.white),
                            controller: loginController.passwordController,
                            obscureText:
                                !loginController
                                    .isPasswordVisible
                                    .value, // Updated logic
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  loginController
                                      .togglePasswordVisible(); // Correct function call
                                },
                                icon: Icon(
                                  loginController.isPasswordVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                              fillColor: Colors.white.withOpacity(
                                0.25,
                              ), // Corrected method
                              filled: true,
                              hintText: 'Password',
                              hintStyle: globalTextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Row(
                          children: [
                            Obx(() {
                              return Checkbox(
                                value: loginController.isClicked.value,
                                onChanged: (bool? value) {
                                  loginController.isClicked.value =
                                      value ?? false;
                                },
                                checkColor: AppColors.shadowColor,
                                activeColor: AppColors.greenColor,
                              );
                            }),
                            GestureDetector(
                              onTap: () {
                                loginController.isClicked.value =
                                    !loginController.isClicked.value;
                              },
                              child: Text(
                                'Remember me',
                                style: TextStyle(color: AppColors.textColor),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              loginController.login();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffE8F54A),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Login',
                              style: globalTextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
