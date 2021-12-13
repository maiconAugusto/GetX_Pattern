import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/modules/register/controllers/register_controller.dart';
import 'package:get_x/app/routes/app_routes.dart';

class SuccessView extends GetView<RegisterController> {
  const SuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.transparent,
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle_outline_outlined,
                      color: Colors.blueGrey[600],
                      size: 60.0,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Sua conta foi criada com sucesso!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.blueGrey[600],
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: double.maxFinite,
                height: 65,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.indigoAccent)),
                  onPressed: () {
                    Get.offAllNamed(Routes.dashboard);
                  },
                  child: const Text(
                    'Acessar o aplicativo',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
