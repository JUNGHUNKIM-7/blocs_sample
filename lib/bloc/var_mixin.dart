import 'package:demo/bloc/page_idx.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'base.dart';
import 'combiner.dart';
import 'darkmode.dart';

//for each bloc
mixin GlobalMixin on Equatable {
  final modeEvent = BaseStreamController<DarkModeEvent?>(state: null);
  final modeStatus = BaseStreamController<bool>(state: false);
  final pageIdx = BaseStreamController<int>(state: 0);
}

//for controllers -> Repository
mixin Blocs on Equatable {
  final darkMode = DarkModeBloc();
  final pageBloc = PageIdxBloc();
}

//for Each Widgets
mixin HookWidgetMixin on HookWidget {
  final Controllers controllers = Controllers();
  final Repository repository = Repository();
}
