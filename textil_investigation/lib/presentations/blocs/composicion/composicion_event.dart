import 'package:equatable/equatable.dart';

abstract class ComposicionEvent extends Equatable {
  const ComposicionEvent();

  @override
  List<Object?> get props => [];
}

/// ✅ **Evento para actualizar los filtros**
class UpdateComposicionEvent extends ComposicionEvent {
  const UpdateComposicionEvent();
}

/// ✅ **Evento para hacer la búsqueda de telas filtradas**
class FetchComposicionEvent extends ComposicionEvent {
  const FetchComposicionEvent();
}
