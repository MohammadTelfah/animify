import 'package:animify/components/info_card.dart';
import 'package:animify/utils/rive_utils.dart';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../models/rive_asset.dart';
import 'side_menu_tile.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAsset selectedMenu = sideMenus.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xFF17203A),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InfoCard(
              name: 'User',
              profession: 'Developer',
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                top: 32,
                bottom: 16,
              ),
              child: Text(
                'Browse'.toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            ...sideMenus.map(
              (menu) => SideMenuTile(
                menu: menu,
                riveonInit: (artboard) {
                  StateMachineController controller =
                      RiveUtils.getRiveController(
                    artboard,
                    stateMachineName: menu.stateMachineName,
                  );
                  menu.input = controller.findSMI('active') as SMIBool;
                },
                press: () {
                  menu.input!.change(true);
                  Future.delayed(const Duration(seconds: 1), () {
                    menu.input!.change(false);
                  });
                  setState(() {
                    selectedMenu = menu;
                  });
                },
                isActive: selectedMenu == menu,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                top: 32,
                bottom: 16,
              ),
              child: Text(
                'History'.toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            ...sideMenu2.map(
              (menu) => SideMenuTile(
                menu: menu,
                riveonInit: (artboard) {
                  StateMachineController controller =
                      RiveUtils.getRiveController(
                    artboard,
                    stateMachineName: menu.stateMachineName,
                  );
                  menu.input = controller.findSMI('active') as SMIBool;
                },
                press: () {
                  menu.input!.change(true);
                  Future.delayed(const Duration(seconds: 1), () {
                    menu.input!.change(false);
                  });
                  setState(() {
                    selectedMenu = menu;
                  });
                },
                isActive: selectedMenu == menu,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
