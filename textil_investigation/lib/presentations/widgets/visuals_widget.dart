import 'package:flutter/material.dart';

class VisualsWidget extends StatefulWidget {
  const VisualsWidget({super.key});

  @override
  _VisualsWidgetState createState() => _VisualsWidgetState();
}

class _VisualsWidgetState extends State<VisualsWidget> {
  double _transparency = 1;
  double _brightness = 1;

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
            const Icon(Icons.visibility, size: 50),
            const SizedBox(height: 50),
            const Text(
              'Transparencia',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Slider(
              value: _transparency,
              min: 1,
              max: 5,
              divisions: 4,
              label: _transparency.toStringAsFixed(1),
              onChanged: (value) {
                setState(() {
                  _transparency = value;
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
              'Brillo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _brightness,
              min: 1,
              max: 5,
              divisions: 4,
              label: _brightness.toStringAsFixed(1),
              onChanged: (value) {
                setState(() {
                  _brightness = value;
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