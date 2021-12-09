import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/core/components/custom_button/button.dart';
import 'package:get_x/app/modules/password/controllers/password_controller.dart';
import 'package:get_x/app/routes/app_routes.dart';

class PasswordView extends GetView<PasswordController> {
  const PasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Alterar sennha',
          style: TextStyle(fontSize: 14),
        ),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextFormField(
                        obscureText: true,
                        controller: controller.password,
                        decoration: const InputDecoration(
                          hintText: 'Senha atual',
                          border: InputBorder.none,
                        )),
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
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextFormField(
                        obscureText: true,
                        controller: controller.password,
                        decoration: const InputDecoration(
                          hintText: 'Nova senha',
                          border: InputBorder.none,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CustomButton(
              isLoading: false,
              onPressed: () {},
              title: 'Salvar',
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
