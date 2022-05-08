import 'package:equatable/equatable.dart';
import 'package:pizza/models/pizza_model.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomePageState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
  
}

class LoadedState extends CubitStates {
  LoadedState(this.pizaz_info);
  final List<PizzaModel> pizaz_info;
  @override
  // TODO: implement props
  List<Object?> get props => [pizaz_info];
}
