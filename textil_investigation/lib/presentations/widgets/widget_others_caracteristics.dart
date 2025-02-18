import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:textil_investigation/presentations/blocs/composicion/composicion_bloc.dart';
import 'package:textil_investigation/presentations/blocs/composicion/composicion_event.dart';
import 'package:textil_investigation/presentations/blocs/composicion/composicion_state.dart';
import 'package:textil_investigation/presentations/blocs/index_bloc.dart';
import 'package:textil_investigation/presentations/blocs/index_event.dart';
import 'package:textil_investigation/presentations/blocs/telas/telas_bloc.dart';
import 'package:textil_investigation/presentations/blocs/telas/telas_event.dart';

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
  int? selectedCompositionId;

  @override
  void initState() {
    super.initState();
    context.read<ComposicionBloc>().add(FetchComposicionEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<ComposicionBloc, ComposicionState>(
          builder: (context, state) {
            if (state is ComposicionLoading) {
              return const CircularProgressIndicator();
            } else if (state is ComposicionLoaded) {
              final composiciones = state.composiciones;

              return DropdownButton<int>(
                value: selectedCompositionId,
                hint: const Text("Selecciona una composición"),
                isExpanded: true,
                items: composiciones.map((composicion) {
                  return DropdownMenuItem<int>(
                    value: composicion.id,
                    child: Text(composicion.descripcion),
                  );
                }).toList(),
                onChanged: (int? newValue) {
                  if (newValue != null) {
                    setState(() {
                      selectedCompositionId = newValue;
                    });
                  }
                },
              );
            } else if (state is ComposicionError) {
              return Text("Error: ${state.message}");
            } else {
              return const Text("No hay datos disponibles");
            }
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: selectedCompositionId != null
              ? () {
                  context.read<TelasBloc>().add(
                        UpdateTelasEvent(composition: selectedCompositionId),
                      );
                  context.go('/home/telas');
                }
              : null, // Deshabilitado si no hay selección
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00B0B9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Buscar', style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            context.read<TelasBloc>().add(
                  UpdateTelasEvent(
                    composition: selectedCompositionId,
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
          child: const Text('Añadir características',
              style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
