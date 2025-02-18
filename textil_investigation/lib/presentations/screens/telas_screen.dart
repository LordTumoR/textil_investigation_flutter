import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:textil_investigation/presentations/appbar/defaul_app_bar.dart';
import 'package:textil_investigation/presentations/blocs/telas/telas_bloc.dart';
import 'package:textil_investigation/presentations/blocs/telas/telas_state.dart';

class TelaScreen extends StatefulWidget {
  const TelaScreen({super.key});

  @override
  State<TelaScreen> createState() => _TelaScreenState();
}

class _TelaScreenState extends State<TelaScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TelasBloc, TelasState>(
      builder: (context, state) {
        if (state is TelasLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TelasLoaded) {
          if (state.telas!.isEmpty) {
            return const Center(child: Text('No telas available'));
          } else {
            return Scaffold(
              appBar: DefaultAppBar(),
              body: ListView.builder(
                itemCount: state.telas!.length,
                itemBuilder: (context, index) {
                  final tela = state.telas![index];
                  return ListTile(
                    leading: tela.img != null
                        ? Image.network(tela.img!)
                        : const Icon(Icons.image_not_supported),
                    title: Text(tela.denominacion),
                    onTap: () {
                      context.go('/home/tela/${tela.id}');
                    },
                  );
                },
              ),
            );
          }
        } else if (state is TelasError) {
          return const Center(child: Text('Failed to load telas'));
        } else {
          return Container();
        }
      },
    );
  }
}