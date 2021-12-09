import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/modules/chat_list/view/chat_list.dart';
import 'package:get_x/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get_x/app/modules/favorites/view/favorites_view.dart';
import 'package:get_x/app/modules/home/view/home_view.dart';
import 'package:get_x/app/modules/my_data/view/my_data_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              controller.title,
              style: const TextStyle(fontSize: 14),
            ),
            backgroundColor: Colors.indigoAccent,
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.notifications))
            ],
          ),
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: const [
                HomeView(),
                FavoritesView(),
                MyDataView(),
                ChatListView(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: 'Home',
                backgroundColor: Colors.indigoAccent,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                label: 'Favoritos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.white),
                label: 'Meu perfil',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat, color: Colors.white),
                label: 'Chat',
              ),
            ],
          ),
        );
      },
    );
  }
}
