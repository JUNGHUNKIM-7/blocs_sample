import 'package:demo/bloc/var_mixin.dart';
import 'package:equatable/equatable.dart';

enum DarkModeEvent { changeMode }

abstract class DarkModeBlocInterface {
  void dispose();
}

class DarkModeBloc extends Equatable
    with GlobalMixin
    implements DarkModeBlocInterface {
  DarkModeBloc() {
    modeEvent.bSubject.listen((DarkModeEvent? evt) {
      switch (evt) {
        case DarkModeEvent.changeMode:
          modeStatus.state = !modeStatus.state;
          break;
        default:
          modeStatus.state;
      }
    });
  }

  @override
  void dispose() {
    modeEvent.dispose();
    modeStatus.dispose();
  }

  @override
  List<Object?> get props => [modeEvent.state, modeStatus.state];
}