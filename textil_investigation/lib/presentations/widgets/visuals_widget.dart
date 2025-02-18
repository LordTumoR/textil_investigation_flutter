import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textil_investigation/presentations/blocs/telas/telas_bloc.dart';
import 'package:textil_investigation/presentations/blocs/telas/telas_event.dart';
import 'package:textil_investigation/presentations/blocs/telas/telas_state.dart';

class VisualsWidget extends StatefulWidget {
  const VisualsWidget({super.key});

  @override
  _VisualsWidgetState createState() => _VisualsWidgetState();
}

class _VisualsWidgetState extends State<VisualsWidget> {
  double transparency = 1;
  double brightness = 1;
  double touch = 1;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final state = context.watch<TelasBloc>().state;
    if (state is TelasLoaded) {
      transparency = state.transparency ?? 1.0;
      brightness = state.shine ?? 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TelasBloc, TelasState>(
      builder: (context, state) {
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
                const SizedBox(height: 10),
                _buildSlider(
                  context,
                  label: 'Transparencia',
                  value: transparency,
                  onChanged: (value) {
                    setState(() => transparency = value);
                  },
                  minText: 'Opaco',
                  maxText: 'Trasnparente',
                ),
                _buildSlider(
                  context,
                  label: 'Brillo',
                  value: brightness,
                  onChanged: (value) {
                    setState(() => brightness = value);
                  },
                  minText: 'Mate',
                  maxText: 'Brillante',
                ),
                _buildSlider(
                  context,
                  label: 'Tacto',
                  value: touch,
                  onChanged: (value) {
                    setState(() => touch = value);
                  },
                  minText: 'Suave',
                  maxText: 'Aspero',
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    context.read<TelasBloc>().add(
                          UpdateTelasEvent(
                              transparency: transparency,
                              shine: brightness,
                              isAnadirOrBuscar: true),
                        );
                  },
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
                  onPressed: () {
                    context.read<TelasBloc>().add(
                          UpdateTelasEvent(
                              transparency: transparency,
                              shine: brightness,
                              touch: touch,
                              isAnadirOrBuscar: false),
                        );
                  },
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
      },
    );
  }

  Widget _buildSlider(
    BuildContext context, {
    required String label,
    required double value,
    required ValueChanged<double> onChanged,
    required String minText,
    required String maxText,
  }) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Slider(
          value: value,
          min: 1,
          max: 5,
          divisions: 4,
          label: value.toStringAsFixed(1),
          onChanged: onChanged,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(minText, style: const TextStyle(fontSize: 16)),
            Text(maxText, style: const TextStyle(fontSize: 16)),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
