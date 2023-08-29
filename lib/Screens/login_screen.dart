import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constants/responsive_constants.dart';
import '../Constants/spacing.dart';
import '../Controller/login_controller.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_text_field.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final LoginController loginController = Get.put(LoginController());
  bool passwordVisible = true;
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  bool checkBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            spacing(20),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                'assets/images/background.png',
                height: screenHeight(context) / 5,
              ),
            ),
            Image.asset(
              'assets/images/login_screen.png',
              height: screenHeight(context) / 8,
            ),
            spacing(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Row(children: [Text('Number')]),
                  spacing(8),
                  SizedBox(
                    height: screenHeight(context) * 0.06,
                    child: textField(
                      obscure: false,
                      keyboard: TextInputType.text,
                      fillColor: const Color(0xffE8EDFF),
                      prefixIcon: Icons.phone_android_sharp,
                      showPrefixIcon: true,
                      maxLines: 1,
                      borderRadius: 25,
                      hintText: 'Enter your number',
                      controller: loginController.numberController.value,
                    ),
                  ),
                  spacing(20),
                  const Row(children: [Text('Password')]),
                  spacing(8),
                  SizedBox(
                    height: screenHeight(context) * 0.06,
                    child: textField(
                      showPrefixIcon: true,
                      fillColor: const Color(0xffE8EDFF),
                      maxLines: 1,
                      prefixIcon: Icons.lock,
                      controller: loginController.passwordController.value,
                      hintText: 'Password',
                      borderRadius: 25,
                      keyboard: TextInputType.text,
                      suffixIcon: passwordVisible
                          ? CupertinoIcons.eye
                          : CupertinoIcons.eye_slash,
                      obscure: passwordVisible,
                      hidePassword: () {
                        passwordVisible = !passwordVisible;
                        setState(() {});
                        passwordVisible;
                      },
                    ),
                  ),
                  spacing(8),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.black,
                          value: checkBox,
                          fillColor: const MaterialStatePropertyAll(
                            Color(0xffD9D9D9),
                          ),
                          onChanged: (value) {
                            setState(() {
                              checkBox = value!;
                            });
                          },
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                              side: BorderSide.none),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(children: [
                            TextSpan(
                                text:
                                    'By continuing you are agreeing to our \n',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff001948))),
                            TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff2B7CFC),
                                    fontWeight: FontWeight.w400)),
                            TextSpan(
                                text: ' and ',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff001948),
                                    fontWeight: FontWeight.w400)),
                            TextSpan(
                                text: 'Terms of Services.',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff2B7CFC),
                                    fontWeight: FontWeight.w400))
                          ]),
                        ),
                      ],
                    ),
                  ),
                  spacing(30),
                  CustomButton(
                    buttonHeight: screenHeight(context) * 0.06,
                    radius: 25,
                    onTapFunction: () {
                      loginController.loginApi('', '');
                    },
                    buttonText: 'Login',
                    buttonTextColor: Colors.white,
                    buttonColor: const Color(0xff567DF4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
