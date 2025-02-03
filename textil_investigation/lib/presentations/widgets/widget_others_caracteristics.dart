import 'package:flutter/material.dart';

class OtherCharacteristicsWidget extends StatefulWidget {
  const OtherCharacteristicsWidget({super.key});

  @override
  _OtherCharacteristicsWidgetState createState() =>
      _OtherCharacteristicsWidgetState();
}

class _OtherCharacteristicsWidgetState
    extends State<OtherCharacteristicsWidget> {
  bool isWaterResistant = false;
  bool isStainResistant = false;
  bool isFireRetardant = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CheckboxListTile(
          title: const Text('Resistente al agua'),
          secondary: const Icon(Icons.water_drop),
          value: isWaterResistant,
          onChanged: (bool? value) {
            setState(() {
              isWaterResistant = value ?? false;
            });
          },
        ),
        const SizedBox(height: 12),
        CheckboxListTile(
          title: const Text('Antimanchas'),
          secondary: const Icon(Icons.cleaning_services),
          value: isStainResistant,
          onChanged: (bool? value) {
            setState(() {
              isStainResistant = value ?? false;
            });
          },
        ),
        const SizedBox(height: 12),
        CheckboxListTile(
          title: const Text('Ignífugo'),
          secondary: const Icon(Icons.fire_extinguisher),
          value: isFireRetardant,
          onChanged: (bool? value) {
            setState(() {
              isFireRetardant = value ?? false;
            });
          },
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00B0B9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Buscar',
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF00C5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Añadir características',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
