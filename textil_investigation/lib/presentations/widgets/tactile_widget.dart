import 'package:flutter/material.dart';

class TactileWidget extends StatefulWidget {
  const TactileWidget({super.key});

  @override
  _TactileWidgetState createState() => _TactileWidgetState();
}

class _TactileWidgetState extends State<TactileWidget> {
  double _endurance = 1;
  double _absorption = 1;
  double _elasticity = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 400,
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.touch_app, size: 50),
            const SizedBox(height: 50),
            const Text(
              'Resistencia',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Slider(
              value: _endurance,
              min: 1,
              max: 5,
              divisions: 4,
              label: _endurance.toStringAsFixed(1),
              onChanged: (value) {
                setState(() {
                  _endurance = value;
                });
              },
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Poca', style: TextStyle(fontSize: 16)),
                Text('Mucha', style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Absorcion',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _absorption,
              min: 1,
              max: 5,
              divisions: 4,
              label: _absorption.toStringAsFixed(1),
              onChanged: (value) {
                setState(() {
                  _absorption = value;
                });
              },
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Poca', style: TextStyle(fontSize: 16)),
                Text('Mucha', style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Elasticidad',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _elasticity,
              min: 1,
              max: 5,
              divisions: 4,
              label: _elasticity.toStringAsFixed(1),
              onChanged: (value) {
                setState(() {
                  _elasticity = value;
                });
              },
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Poca', style: TextStyle(fontSize: 16)),
                Text('Mucha', style: TextStyle(fontSize: 16)),
              ],
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
        ),
      ),
    );
  }
}
