import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:resume/bloc/screen_bloc/bloc.dart';

enum Screen { home, projects }

class ScreenBloc extends Bloc<ScreenEvent, Screen> {
  ScreenBloc(Screen initialState) : super(initialState);

  @override
  Stream<Screen> mapEventToState(
      ScreenEvent event,
      ) async* {
    if (event is UpdateScreen) {
      yield event.screen;
    }
  }
}
