import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:textil_investigation/presentations/blocs/telas/telas_bloc.dart';
import 'package:textil_investigation/presentations/blocs/telas/telas_event.dart';
import 'package:textil_investigation/presentations/blocs/telas/telas_state.dart';

class SearchTextWidget extends StatefulWidget {
  const SearchTextWidget({super.key});

  @override
  State<SearchTextWidget> createState() => _SearchTextWidgetState();
}

class _SearchTextWidgetState extends State<SearchTextWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  @override
  void initState() {
    super.initState();
    context
        .read<TelasBloc>()
        .add(UpdateTelasEvent(name: null, isAnadirOrBuscar: true));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text(
              '¿Sabes cómo se llama la tela?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: "Pon el nombre",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre no puede estar vacío';
                  }
                  return null;
                },
                onChanged: (text) {
                  final upperCaseText = text.toUpperCase();
                  context.read<TelasBloc>().add(UpdateTelasEvent(
                      name: upperCaseText, isAnadirOrBuscar: true));
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<TelasBloc, TelasState>(
                builder: (context, state) {
                  if (state is TelasLoaded) {
                    if (state.telas == null &&
                        _nombreController.text.isNotEmpty &&
                        state.name == null) {
                      return const Center(
                        child: Text(
                          'No se encontraron resultados.',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: state.telas?.length,
                      itemBuilder: (context, index) {
                        final fabric = state.telas?[index];
                        return GestureDetector(
                            onTap: () {
                              context.go('/home/tela/${fabric.id}');
                            },
                            child: ListTile(
                                leading: const Icon(Icons.search,
                                    color: Colors.blue),
                                title: Text(
                                  fabric!.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                )));
                      },
                    );
                  } else if (state is TelasError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    );
                  }

                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
