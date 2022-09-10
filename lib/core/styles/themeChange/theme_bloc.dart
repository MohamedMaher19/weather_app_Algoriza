import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../themes.dart';


part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: appThemeData[AppTheme.dark]!, isDark: true)) {
    on<ThemeEvent>((event, emit) {
      if (event is ThemeChanged) {
        emit.call(ThemeState(themeData: appThemeData[event.theme]!, isDark: event.theme == AppTheme.dark));
      }
    });
  }
}