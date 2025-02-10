import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textil_investigation/presentations/blocs/telas/telas_bloc.dart';
import 'package:textil_investigation/presentations/blocs/telas/telas_event.dart';
import 'package:textil_investigation/presentations/blocs/telas/telas_state.dart';

class TactileWidget extends StatelessWidget {
  const TactileWidget({super.key});

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
                const Icon(Icons.touch_app, size: 50),
                const SizedBox(height: 50),
                _buildSlider(
                  context,
                  label: 'Resistencia',
                  value: state.endurance,
                  onChanged: (value) {
                    context.read<TelasBloc>().add(
                          UpdateTelasEvent(
                            endurance: value,
                            absorption: state.absorption,
                            elasticity: state.elasticity,
                          ),
                        );
                  },
                ),
                _buildSlider(
                  context,
                  label: 'Absorción',
                  value: state.absorption,
                  onChanged: (value) {
                    context.read<TelasBloc>().add(
                          UpdateTelasEvent(
                            endurance: state.endurance,
                            absorption: value,
                            elasticity: state.elasticity,
                          ),
                        );
                  },
                ),
                _buildSlider(
                  context,
                  label: 'Elasticidad',
                  value: state.elasticity,
                  onChanged: (value) {
                    context.read<TelasBloc>().add(
                          UpdateTelasEvent(
                            endurance: state.endurance,
                            absorption: state.absorption,
                            elasticity: value,
                          ),
                        );
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
                  onPressed: () {
                    context.read<TelasBloc>().add(
                          UpdateTelasEvent(
                            endurance: state.endurance,
                            absorption: state.absorption,
                            elasticity: state.elasticity,
                          ),
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
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Poca', style: TextStyle(fontSize: 16)),
            Text('Mucha', style: TextStyle(fontSize: 16)),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
