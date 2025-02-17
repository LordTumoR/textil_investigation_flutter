import 'package:equatable/equatable.dart';
import 'package:textil_investigation/domain/entities/composicion_entity.dart';

/// ✅ **Estado base del Bloc**
abstract class ComposicionState extends Equatable {
  const ComposicionState();

  @override
  List<Object?> get props => [];
}

/// ✅ **Estado inicial del Bloc**
class ComposicionInitial extends ComposicionState {}

/// ✅ **Estado cuando se están cargando los datos**
class ComposicionLoading extends ComposicionState {}

/// ✅ **Estado que almacena los datos de las Composiciones y los filtros aplicados**
class ComposicionLoaded extends ComposicionState {
  final List<ComposicionEntity> composiciones;

  const ComposicionLoaded(this.composiciones);

  @override
  List<Object?> get props => [composiciones];
}

/// ✅ **Estado cuando ocurre un error**
class ComposicionError extends ComposicionState {
  final String message;

  const ComposicionError(this.message);

  @override
  List<Object?> get props => [message];
}
