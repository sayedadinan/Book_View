import 'package:flutter_bloc/flutter_bloc.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ColorSwitchBloc extends Bloc<ColorSwitchEvent, ColorSwitchState> {
  ColorSwitchBloc() : super(ColorSwitchLightState());

  @override
  Stream<ColorSwitchState> mapEventToState(ColorSwitchEvent event) async* {
    if (event is ToggleColorEvent) {
      if (state is ColorSwitchLightState) {
        yield ColorSwitchDarkState(); // Switch to dark colors
      } else {
        yield ColorSwitchLightState(); // Switch to light colors
      }
    }
  }
}
