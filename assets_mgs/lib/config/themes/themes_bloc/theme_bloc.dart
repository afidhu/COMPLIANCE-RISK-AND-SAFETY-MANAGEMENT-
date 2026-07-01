

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// --- Events ---
abstract class ThemeEvent {}
class ToggleThemeEvent extends ThemeEvent {}

// --- Bloc ---
class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc() : super(ThemeMode.system) {
    on<ToggleThemeEvent>((event, emit) {
      if (state == ThemeMode.dark) {
        emit(ThemeMode.light);
      } else {
        emit(ThemeMode.dark);
      }
    });
  }
}
