import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool knowname = false;
  bool havesample = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            children: [
              Image.asset(
                'assets/backwithout.png',
                width: 45,
                height: 45,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'TEXTIL INVESTIGATION',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00B0B9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Sí',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              knowname = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF00C5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('No',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (knowname)
              const Divider(
                height: 40,
                thickness: 1,
                color: Colors.grey,
              ),
            if (knowname)
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
                              backgroundColor: const Color(0xFF00B0B9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Sí',
                                style: TextStyle(color: Colors.white)),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                havesample = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF00C5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('No',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            if (knowname)
              const Divider(
                height: 40,
                thickness: 1,
                color: Colors.grey,
              ),
            if (havesample)
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
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF00B0B9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Siguiente',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        selectedItemColor: const Color.fromARGB(255, 192, 237, 240),
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/maquinacoser.png',
              width: 30,
              height: 30,
            ),
            label: 'Aplicaciones',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/imperdible.png',
              width: 30,
              height: 30,
            ),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
