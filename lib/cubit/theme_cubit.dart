import 'package:bloc/bloc.dart';

/// A [Cubit] which manages the [ThemeType] as its state.

enum ThemeType { light, dark }
class ThemeCubit extends Cubit<ThemeType> {
  ThemeCubit() : super(ThemeType.light);
  void toggleTheme() => emit(state == ThemeType.light ? ThemeType.dark : ThemeType.light);
}