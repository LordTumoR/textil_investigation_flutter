import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textil_investigation/presentations/blocs/index_bloc.dart';
import 'package:textil_investigation/presentations/blocs/index_event.dart';
import 'package:textil_investigation/presentations/blocs/other/other_bloc.dart';
import 'package:textil_investigation/presentations/blocs/other/other_event.dart';
import 'package:textil_investigation/presentations/blocs/other/other_state.dart';

class OtherCharacteristicsWidget extends StatefulWidget {
  const OtherCharacteristicsWidget({super.key});

  @override
  OtherCharacteristicsWidgetState createState() =>
      OtherCharacteristicsWidgetState();
}

class OtherCharacteristicsWidgetState
    extends State<OtherCharacteristicsWidget> {
  bool isWaterResistant = false;
  bool isStainResistant = false;
  bool isFireRetardant = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtherCharacteristicsBloc, OtherCharacteristicsState>(
      builder: (context, state) {
        if (state is OtherCharacteristicsLoaded) {
          isWaterResistant = state.isWaterResistant ?? false;
          isStainResistant = state.isStainResistant ?? false;
          isFireRetardant = state.isFireRetardant ?? false;
        }

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
                context.read<OtherCharacteristicsBloc>().add(
                      UpdateOtherCharacteristicsEvent(
                        isWaterResistant: isWaterResistant,
                        isStainResistant: isStainResistant,
                        isFireRetardant: isFireRetardant,
                      ),
                    );
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
                context.read<OtherCharacteristicsBloc>().add(
                      UpdateOtherCharacteristicsEvent(
                        isWaterResistant: isWaterResistant,
                        isStainResistant: isStainResistant,
                        isFireRetardant: isFireRetardant,
                      ),
                    );
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
                context.read<OtherCharacteristicsBloc>().add(
                      UpdateOtherCharacteristicsEvent(
                        isWaterResistant: isWaterResistant,
                        isStainResistant: isStainResistant,
                        isFireRetardant: isFireRetardant,
                      ),
                    );
              },
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                context.read<OtherCharacteristicsBloc>().add(
                      UpdateOtherCharacteristicsEvent(
                        isWaterResistant: isWaterResistant,
                        isStainResistant: isStainResistant,
                        isFireRetardant: isFireRetardant,
                      ),
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
                context.read<OtherCharacteristicsBloc>().add(
                      UpdateOtherCharacteristicsEvent(
                        isWaterResistant: isWaterResistant,
                        isStainResistant: isStainResistant,
                        isFireRetardant: isFireRetardant,
                      ),
                    );

                context.read<IndexBloc>().add(const UpdateNumberEvent(1));
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
        );
      },
    );
  }
}
