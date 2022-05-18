import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'bloc/var_mixin.dart';

class Home extends HookWidget with HookWidgetMixin {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(title: Text("Home")),
      content: Column(
        children: [
          Container(
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

class SecondPage extends HookWidget with HookWidgetMixin {
  SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(title: Text("Second")),
      content: Column(
        children: [
          Container(
            color: Colors.red,
          )
        ],
      ),
    );
  }
}

class ThirdPage extends HookWidget with HookWidgetMixin {
  ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(title: Text("Thrid")),
      content: Column(
        children: [
          Container(
            color: Colors.red,
          )
        ],
      ),
    );
  }
}

class Settings extends HookWidget with HookWidgetMixin {
  Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(title: Text("Settings")),
      content: Column(
        children: [
          Container(
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
