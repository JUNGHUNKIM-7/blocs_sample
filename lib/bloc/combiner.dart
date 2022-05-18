import 'package:demo/bloc/var_mixin.dart';
import 'package:equatable/equatable.dart';
import 'darkmode.dart';

class Controllers extends Equatable with Blocs {
  Stream<bool?> get darkModeStream => darkMode.modeStatus.bSubject.stream;

  set setDarkMode(DarkModeEvent evt) => darkMode.modeEvent.state = evt;

  Stream<int> get pageIdxStream => pageBloc.pageIdx.bSubject.stream;

  set setPageIdx(int val) => pageBloc.pageIdx.state = val;

  @override
  List<Object?> get props => [
        darkMode.modeStatus.state,
        pageBloc.pageIdx.state,
      ];
}

abstract class RepositoryInterface {
  void get();

  void set(int val);

  void update();

  void delete();
}

class Repository extends Controllers implements RepositoryInterface {
  @override
  void delete() {
    // TODO: implement delete
  }

  @override
  void get() {
    // TODO: implement get
  }

  @override
  void set(int val) {
    setPageIdx = val;
  }

  @override
  void update() {
    // TODO: implement update
  }
}
