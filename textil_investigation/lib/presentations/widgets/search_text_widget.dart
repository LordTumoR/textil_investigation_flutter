import 'package:flutter/material.dart';
import 'package:textil_investigation/presentations/funcionalities/searc_function.dart';

class SearchTextWidget extends StatefulWidget {
  final List<Map<String, String>> fabrics;

  const SearchTextWidget({super.key, required this.fabrics});

  @override
  State<SearchTextWidget> createState() => _SearchTextWidgetState();
}

class _SearchTextWidgetState extends State<SearchTextWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  List<Map<String, String>> _searchResults = [];

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
                  setState(() {
                    _searchResults = searchFabrics(text, widget.fabrics);
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    _searchResults = searchFabrics(
                      _nombreController.text,
                      widget.fabrics,
                    );
                  });
                }
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
            Expanded(
              child: _searchResults.isNotEmpty
                  ? ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final fabric = _searchResults[index];
                        return ListTile(
                          leading: const Icon(
                            Icons.search,
                            color: Colors.blue,
                          ),
                          title: Text(
                            fabric['name']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          onTap: () {
                            showFabricDialog(context, fabric);
                          },
                        );
                      },
                    )
                  : Center(
                      child: _nombreController.text.isNotEmpty
                          ? const Text(
                              'No se encontraron resultados.',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            )
                          : const Text(
                              'Ingrese un nombre para buscar telas.',
                            ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
