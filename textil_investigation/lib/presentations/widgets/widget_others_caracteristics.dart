import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:textil_investigation/presentations/blocs/campos/campos_bloc.dart';
import 'package:textil_investigation/presentations/blocs/campos/campos_event.dart';
import 'package:textil_investigation/presentations/blocs/campos/campos_state.dart';
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
  int? selectedCompositionId;
  int? selectedAplicacionId;
  int? selectedConservacionId;
  int? selectedTipoEstructuralId;
  int? selectedEstructuraLigamentoId;

  @override
  void initState() {
    super.initState();
    context.read<CamposBloc>().add(FetchAllCamposEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<CamposBloc, CamposState>(
          builder: (context, state) {
            if (state is CamposLoading) {
              return const CircularProgressIndicator();
            } else if (state is AllCamposLoaded) {
              final composiciones = state.composiciones;
              final aplicaciones = state.aplicaciones;
              final conservaciones = state.conservaciones;
              final tiposEstructurales = state.tiposEstructurales;
              final estructurasLigamento = state.estructurasLigamento;
              return Column(
                children: [
                  DropdownButton<int>(
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
                  ),
                  const SizedBox(height: 20),
                  DropdownButton<int>(
                    value: selectedAplicacionId,
                    hint: const Text("Selecciona una aplicación"),
                    isExpanded: true,
                    items: aplicaciones.map((aplicacion) {
                      return DropdownMenuItem<int>(
                        value: aplicacion.id,
                        child: Text(aplicacion.descripcion),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedAplicacionId = newValue;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  DropdownButton<int>(
                    value: selectedConservacionId,
                    hint: const Text("Selecciona una conservación"),
                    isExpanded: true,
                    items: conservaciones.map((conservacion) {
                      return DropdownMenuItem<int>(
                        value: conservacion.id,
                        child: Text(conservacion.descripcion),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedConservacionId = newValue;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  DropdownButton<int>(
                    value: selectedTipoEstructuralId,
                    hint: const Text("Selecciona un tipo estructural"),
                    isExpanded: true,
                    items: tiposEstructurales.map((tipoEstructural) {
                      return DropdownMenuItem<int>(
                        value: tipoEstructural.id,
                        child: Text(tipoEstructural.descripcion),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedTipoEstructuralId = newValue;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  DropdownButton<int>(
                    value: selectedEstructuraLigamentoId,
                    hint: const Text("Selecciona una estructura de ligamento"),
                    isExpanded: true,
                    items: estructurasLigamento.map((estructuraLigamento) {
                      return DropdownMenuItem<int>(
                        value: estructuraLigamento.id,
                        child: Text(estructuraLigamento.descripcion),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedEstructuraLigamentoId = newValue;
                        });
                      }
                    },
                  ),
                ],
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
          onPressed: selectedCompositionId != null ||
                  selectedAplicacionId != null ||
                  selectedConservacionId != null ||
                  selectedTipoEstructuralId != null ||
                  selectedEstructuraLigamentoId != null
              ? () {
                  context.read<TelasBloc>().add(
                        UpdateTelasEvent(
                            composition: selectedCompositionId,
                            aplicacion: selectedAplicacionId,
                            conservacion: selectedConservacionId,
                            tipoEstructural: selectedTipoEstructuralId,
                            estructuraLigamento: selectedEstructuraLigamentoId,
                            isAnadirOrBuscar: true),
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
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              selectedCompositionId = null;
              selectedAplicacionId = null;
              selectedConservacionId = null;
              selectedTipoEstructuralId = null;
              selectedEstructuraLigamentoId = null;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Eliminar todos los campos',
              style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
