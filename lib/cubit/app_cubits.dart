import 'package:bloc/bloc.dart';
import 'package:pizza/cubit/app_cubit_states.dart';
import 'package:pizza/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  final DataServices dataServices;
  AppCubits({required this.dataServices}) : super(InitialState()) {
    emit(HomePageState());
  }

  void getData() async {
    late final pizza_info;
    try {
      emit(LoadingState());
      pizza_info = await dataServices.getInfo();
      print(pizza_info);
      emit(LoadedState(pizza_info));
    } catch (e) {}
  }
}
