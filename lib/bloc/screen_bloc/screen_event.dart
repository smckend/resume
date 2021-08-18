import 'package:equatable/equatable.dart';
import 'package:resume/bloc/screen_bloc/bloc.dart';

abstract class ScreenEvent extends Equatable {
  const ScreenEvent();
}

class UpdateScreen extends ScreenEvent {
  final Screen screen;

  UpdateScreen(this.screen);

  @override
  List<Object> get props => [screen];

  @override
  String toString() => 'UpdateScreen { screen: $screen }';
}
