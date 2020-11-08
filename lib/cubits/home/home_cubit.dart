import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(0));

  void onWeatherSelected(int selectedIndex) => emit(HomeState(selectedIndex));
}
