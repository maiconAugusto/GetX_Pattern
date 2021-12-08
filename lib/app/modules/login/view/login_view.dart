import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/core/components/custom_button/button.dart';
import 'package:get_x/app/modules/login/controllers/login_controller.dart';
import 'package:get_x/app/routes/app_routes.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return Form(
          key: controller.key,
          child: Container(
            alignment: Alignment.center,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      alignment: Alignment.center,
                      height: 65,
                      padding: const EdgeInsets.only(
                        left: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(
                                0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: controller.email,
                        decoration: const InputDecoration(
                            hintText: 'E-mail', border: InputBorder.none),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      alignment: Alignment.center,
                      height: 65,
                      padding: const EdgeInsets.only(
                        left: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(
                                0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: TextFormField(
                        obscureText: !controller.passwordVisible.value,
                        controller: controller.password,
                        decoration: InputDecoration(
                            hintText: 'Senha',
                            border: InputBorder.none,
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.lockPassword();
                                },
                                child: controller.passwordVisible.value
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: CustomButton(
                      isLoading: false,
                      onPressed: () {
                        Get.toNamed(Routes.home);
                        controller.auth();
                      },
                      title: 'Login',
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Não tem uma conta?',
                    style: TextStyle(color: Colors.blueGrey[400]),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.register);
                      },
                      child: const Text('CRIAR UMA CONTA',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 12,
                              color: Colors.indigoAccent)))
                ],
              ),
            ),
          ));
    }));
  }
}
