import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({super.key});

  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  final ImagePicker _picker = ImagePicker();

  Future<void> takePicture() async {
    // final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    // if (image != null) {
    showFeatureUnavailableDialog();
    // }
  }

  void showFeatureUnavailableDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            title: const Text("Funcionalidad no disponible"),
            content: const Text("Esta caracteristica aun no esta disponible."),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Cerrar"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.camera_alt, size: 50),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: takePicture,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00B0B9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "Tomar Foto",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
