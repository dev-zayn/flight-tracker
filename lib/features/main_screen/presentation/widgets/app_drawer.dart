import 'package:auto_route/auto_route.dart';
import 'package:flight_tracker/core/router/router.gr.dart';
import 'package:flight_tracker/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class AppDrawer extends StatelessWidget {
  final AdvancedDrawerController drawerController;
  const AppDrawer({super.key, required this.drawerController});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Row(
              children: [
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'to Flight Tracker',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: kcPrimary,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            ListTile(
              onTap: () {
                drawerController.hideDrawer();
              },
              leading: const Icon(Icons.home),
              title: const Text('Home'),
            ),
            const SizedBox(height: 20),
            ListTile(
              onTap: () {
                drawerController.hideDrawer();
                context.router.push(const BookmarkedFlightsRoute());
              },
              leading: const Icon(Icons.bookmark),
              title: const Text('Bookmarks'),
            ),
            const SizedBox(height: 20),
            ListTile(
              onTap: () {
                drawerController.hideDrawer();
              },
              leading: const Icon(Icons.info),
              title: const Text('About'),
            ),
            const SizedBox(height: 20),
            ListTile(
              onTap: () {
                drawerController.hideDrawer();
              },
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
