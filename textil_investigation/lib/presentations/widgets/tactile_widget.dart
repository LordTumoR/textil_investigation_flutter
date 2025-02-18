import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:textil_investigation/presentations/blocs/index_bloc.dart';
import 'package:textil_investigation/presentations/blocs/index_event.dart';
import 'package:textil_investigation/presentations/blocs/telas/telas_bloc.dart';
import 'package:textil_investigation/presentations/blocs/telas/telas_event.dart';
import 'package:textil_investigation/presentations/blocs/telas/telas_state.dart';

class TactileWidget extends StatelessWidget {
  const TactileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TelasBloc, TelasState>(
      builder: (context, state) {
        double endurance = 1.0;
        double absorption = 1.0;
        double elasticity = 1.0;

        if (state is TelasLoaded) {
          endurance = state.endurance ?? 1.0;
          absorption = state.absorption ?? 1.0;
          elasticity = state.elasticity ?? 1.0;
        }

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
                const SizedBox(height: 10),
                _buildSlider(
                  context,
                  label: 'Resistencia',
                  value: endurance,
                  onChanged: (value) {
                    context.read<TelasBloc>().add(
                          UpdateTelasEvent(endurance: value),
                        );
                  },
                  minText: 'Baja',
                  maxText: 'Alta',
                ),
                _buildSlider(
                  context,
                  label: 'Absorción',
                  value: absorption,
                  onChanged: (value) {
                    context.read<TelasBloc>().add(
                          UpdateTelasEvent(absorption: value),
                        );
                  },
                  minText: 'Higroscópico',
                  maxText: 'Absorbente',
                ),
                _buildSlider(
                  context,
                  label: 'Elasticidad',
                  value: elasticity,
                  onChanged: (value) {
                    context.read<TelasBloc>().add(
                          UpdateTelasEvent(elasticity: value),
                        );
                  },
                  minText: 'Baja',
                  maxText: 'Alta',
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<TelasBloc>().add(
                          UpdateTelasEvent(
                            endurance: endurance,
                            absorption: absorption,
                            elasticity: elasticity,
                            isAnadirOrBuscar: true,
                          ),
                        );
                    context.go('/home/telas');
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
                            endurance: endurance,
                            absorption: absorption,
                            elasticity: elasticity,
                            isAnadirOrBuscar: false,
                          ),
                        );
                    context.read<IndexBloc>().add(UpdateNumberEvent(1));
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
