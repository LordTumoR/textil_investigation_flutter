import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';

/// Filtra las telas según el texto de búsqueda
List<Map<String, String>> searchFabrics(
  String searchText,
  List<Map<String, String>> fabrics,
) {
  String inputName = removeDiacritics(searchText.toLowerCase());

  return fabrics.where((fabric) {
    String fabricName = removeDiacritics(fabric['name']!.toLowerCase());
    return fabricName.contains(inputName);
  }).toList();
}

/// Muestra un cuadro de diálogo con los detalles de la tela
void showFabricDialog(BuildContext context, Map<String, String> fabric) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(fabric['name']!),
        content: Text(fabric['description']!),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cerrar'),
          ),
        ],
      );
    },
  );
}
