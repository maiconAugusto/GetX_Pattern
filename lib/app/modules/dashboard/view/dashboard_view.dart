import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/modules/chat_list/view/chat_list.dart';
import 'package:get_x/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get_x/app/modules/favorites/view/favorites_view.dart';
import 'package:get_x/app/modules/home/view/home_view.dart';
import 'package:get_x/app/modules/menu/view/menu_view.dart';

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
              style: const TextStyle(fontSize: 16),
            ),
            backgroundColor: Colors.indigoAccent,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none_outlined,
                      color: Colors.white))
            ],
          ),
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: const [
                HomeView(),
                FavoritesView(),
                MenuView(),
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
                  Icons.home_filled,
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
                icon: Icon(Icons.menu, color: Colors.white),
                label: 'Menu',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.chat_bubble_2_fill,
                  color: Colors.white,
                ),
                label: 'Chat',
              ),
            ],
          ),
        );
      },
    );
  }
}
