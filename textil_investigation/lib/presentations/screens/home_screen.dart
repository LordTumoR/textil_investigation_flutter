import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textil_investigation/presentations/appbar/defaul_app_bar.dart';
import 'package:textil_investigation/presentations/blocs/index-state.dart';
import 'package:textil_investigation/presentations/blocs/index_bloc.dart';
import 'package:textil_investigation/presentations/blocs/index_event.dart';
import 'package:textil_investigation/presentations/navigatorBar/default_bottom_navigation_bar.dart';
import 'package:textil_investigation/presentations/widgets/home_widget.dart';
import 'package:textil_investigation/presentations/widgets/visuals_widget.dart';
import 'package:textil_investigation/presentations/widgets/search_text_widget.dart';
import 'package:textil_investigation/presentations/widgets/tactile_widget.dart';
import 'package:textil_investigation/presentations/widgets/widget_caracteristics_request.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool knowname = false;
  bool havesample = false;
  bool _showCaracteristicsWidget = false;
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
    return BlocBuilder<IndexBloc, IndexState>(
      builder: (context, state) {
        int currentIndex = 0; // Valor por defecto
        if (state is IndexLoaded) {
          currentIndex = state.number; // Obtén el índice del estado
        }

        return Scaffold(
          appBar: DefaultAppBar(),
          body: _getBody(currentIndex),
          bottomNavigationBar: DefaultBottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index, showCaracteristics, showText) {
              context.read<IndexBloc>().add(UpdateNumberEvent(index));
              setState(() {
                _showCaracteristicsWidget = showCaracteristics;
                _showTextWidget = showText;
              });
            },
            showCaracteristicsWidget: _showCaracteristicsWidget,
            showTextWidget: _showTextWidget,
          ),
        );
      },
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return const CustomScreen();
      case 1:
        return buildCaracteristicsWidget(context);
      case 2:
        return const VisualsWidget();
      default:
        return const CustomScreen();
    }
  }
}
