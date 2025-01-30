import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textil_investigation/presentations/blocs/index_bloc.dart';
import 'package:textil_investigation/presentations/blocs/index_event.dart';

Widget buildCaracteristicsWidget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 350),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '¿Qué características tiene o debe tener?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 22),
            buildCustomButton(
              label: 'Visuales',
              icon: Icons.visibility,
              onPressed: () {
                context.read<IndexBloc>().add(const UpdateNumberEvent(2));
              },
            ),
            const SizedBox(height: 12),
            buildCustomButton(
              label: 'Táctiles',
              icon: Icons.touch_app,
              onPressed: () {
                // Acción para el botón "Táctiles"
              },
            ),
            const SizedBox(height: 12),
            buildCustomButton(
              label: 'Otras',
              icon: Icons.help_outline,
              onPressed: () {
                // Acción para el botón "Otras"
              },
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildCustomButton({
  required String label,
  required IconData icon,
  required VoidCallback onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF00B0B9),
      padding: const EdgeInsets.symmetric(vertical: 15),
      minimumSize: const Size(double.infinity, 60), // Ancho y alto mínimo
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const SizedBox(width: 8), // Añadimos un poco de separación
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10), // Espaciado entre el icono y el texto
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Icon(Icons.arrow_forward_ios, color: Colors.white),
      ],
    ),
  );
}
