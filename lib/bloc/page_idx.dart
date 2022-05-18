import 'package:demo/bloc/var_mixin.dart';
import 'package:equatable/equatable.dart';

abstract class PageIdxBlocInterface {
  void dispose();

  void demo();
}

class PageIdxBloc extends Equatable
    with GlobalMixin
    implements PageIdxBlocInterface {
  @override
  void dispose() {
    pageIdx.dispose();
  }

  @override
  void demo() {}

  @override
  List<Object?> get props => [pageIdx.state];
}
