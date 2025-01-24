import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart';
import '../widget/custom_textfield.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orangeAccent, Colors.yellowAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    height: context.height * 0.55,
                    width: context.width,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/auth-bg.png'), fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome Back!",
                      style: TextStyle(fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Please sign in to continue.",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFieldWidget(
                      hintText: "Enter Identifier",
                      obscurePassword: false,
                      onChanged: (value) => controller.identifier.value = value ?? "",
                      controller: controller.identifierEditingController,
                      suffixIcon: const SizedBox(),
                    ),
                    const SizedBox(height: 15),
                    Obx(() => CustomTextFieldWidget(
                        hintText: "Enter Password",
                        obscurePassword: controller.showPassword.value,
                        onChanged: (value) => controller.password.value = value ?? "",
                        controller: controller.passwordEditingController,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: GestureDetector(
                            child: controller.showPassword.value
                                ? const Icon(Icons.remove_red_eye)
                                : const Icon(Icons.remove_red_eye_outlined),
                            onTap: (){
                              controller.showPassword.value = !controller.showPassword.value;
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    GestureDetector(
                      onTap: controller.authenticate,
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        alignment: Alignment.center,
                        child: controller.isAuthenticating.value
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 18,),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
