import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/routes/app_routes.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.mydata);
              },
              child: Card(
                elevation: 4,
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  child: ListTile(
                    title: Text(
                      'Meus dados',
                      style: TextStyle(
                          color: Colors.blueGrey[600],
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(Icons.person, color: Colors.blueGrey[600]),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.password);
              },
              child: Card(
                elevation: 4,
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  child: ListTile(
                    title: Text('Alterar senha',
                        style: TextStyle(
                            color: Colors.blueGrey[600],
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    leading: Icon(
                      Icons.visibility,
                      color: Colors.blueGrey[600],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                Get.offAllNamed(Routes.login);
              },
              child: Card(
                elevation: 4,
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  child: ListTile(
                    title: Text(
                      'Sair',
                      style: TextStyle(
                          color: Colors.blueGrey[600],
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(
                      Icons.exit_to_app_rounded,
                      color: Colors.blueGrey[600],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      )),
    );
  }
}
