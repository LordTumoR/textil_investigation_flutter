import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DefaultBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final bool showCaracteristicsWidget;
  final bool showTextWidget;
  final void Function(int, bool, bool) onTap;

  const DefaultBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.showCaracteristicsWidget,
    required this.showTextWidget,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      currentIndex: currentIndex,
      selectedItemColor: const Color.fromARGB(255, 192, 237, 240),
      unselectedItemColor: Colors.white,
      showUnselectedLabels: true,
      onTap: (index) {
        bool updatedShowCaracteristicsWidget = showCaracteristicsWidget;
        bool updatedShowTextWidget = showTextWidget;
        if (index == 0) {
          updatedShowCaracteristicsWidget = false;
          updatedShowTextWidget = false;
          context.go('/home');
        }
        onTap(index, updatedShowCaracteristicsWidget, updatedShowTextWidget);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.apps),
          label: 'Apps',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Configuración',
        ),
      ],
    );
  }
}
