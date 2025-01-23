import 'package:flutter/material.dart';
import 'package:textil_investigation/presentations/appbar/defaul_app_bar.dart';
import 'package:textil_investigation/presentations/navigatorBar/default_bottom_navigation_bar.dart';
import 'package:textil_investigation/presentations/widgets/search_text_widget.dart';
import 'package:textil_investigation/presentations/widgets/widget_caracteristics_request.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool _showCaracteristicsWidget =
      false; // Controla si mostramos las características
  bool _showTextWidget = false;
  final List<Map<String, String>> fabrics = [
    {
      'name': 'Algodón',
      'description': 'Tela suave, fresca y ligera, ideal para el verano.'
    },
    {
      'name': 'Lana',
      'description': 'Tela cálida y resistente, perfecta para el invierno.'
    },
    {
      'name': 'Seda',
      'description': 'Tela suave y brillante, utilizada para ropa elegante.'
    },
    {
      'name': 'Poliéster',
      'description': 'Tela duradera y económica, utilizada en ropa casual.'
    },
    {
      'name': 'Lino',
      'description': 'Tela transpirable y fresca, ideal para climas cálidos.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: DefaultAppBar(),
      body: _showCaracteristicsWidget
          ? buildCaracteristicsWidget()
          : _showTextWidget
              ? SearchTextWidget(fabrics: fabrics)
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.8,
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '¿Sabes cómo se llama la tela?',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _showTextWidget = true;
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF00B0B9),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: const Text(
                                          'Sí',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFFFF00C5),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: const Text('No',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(
                            height: 40,
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          // Segundo Contenedor
                          SizedBox(
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.8,
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '¿Tienes una muestra?',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF00B0B9),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: const Text('Sí',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                      const SizedBox(width: 10),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFFFF00C5),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: const Text('No',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(
                            height: 40,
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          // Tercer Contenedor
                          SizedBox(
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.8,
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '¿Qué características tiene o debe tener?',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _showCaracteristicsWidget = true;
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF00B0B9),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: const Text('Siguiente',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
      bottomNavigationBar: DefaultBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index, showCaracteristics, showText) {
          setState(() {
            _currentIndex = index;
            _showCaracteristicsWidget = showCaracteristics;
            _showTextWidget = showText;
          });
        },
        showCaracteristicsWidget: _showCaracteristicsWidget,
        showTextWidget: _showTextWidget,
      ),
    );
  }
}
