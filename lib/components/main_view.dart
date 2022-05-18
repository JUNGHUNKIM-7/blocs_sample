import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../bloc/combiner.dart';
import '../bloc/darkmode.dart';

import '../bloc/var_mixin.dart';
import '../main_nav_body.dart';
import '../styles.dart';

enum ItemType { bodyItems, footerItems }

class MainView extends HookWidget with HookWidgetMixin {
  MainView({Key? key}) : super(key: key);

  static final List<HookWidget> pages = [
    Home(),
    SecondPage(),
    ThirdPage(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    final idx = useStream(controllers.pageIdxStream);
    final theme = useStream(controllers.darkModeStream);

    return NavigationView(
      appBar: const NavigationAppBar(
        title: Center(
          child: Text('MainHeader'),
        ),
      ),
      pane: _navigationPanel(
        curr: idx.data ?? 0,
        combiner: controllers,
      ),
      content: pages[idx.data ?? 0],
      contentShape: WidgetStyle(isDark: theme.data ?? false).getBorder,
    );
  }

  List<PaneItem> _getPanel(Map<String, IconData> items) {
    final List<PaneItem> listOfPanel = items.entries
        .map(
          (e) => PaneItem(
            icon: Icon(e.value),
            title: Text(e.key),
          ),
        )
        .toList();

    return List.generate(listOfPanel.length, (index) {
      return listOfPanel[index];
    });
  }

  List<NavigationPaneItem> _items({required ItemType type}) {
    final Map<String, IconData> body = {
      'Home': FluentIcons.home,
      'Make Invoice': FluentIcons.document_management,
      'Other': FluentIcons.archive,
    };

    final Map<String, IconData> footer = {
      'Settings': FluentIcons.settings,
    };

    switch (type) {
      case ItemType.bodyItems:
        return _getPanel(body);
      case ItemType.footerItems:
        return _getPanel(footer);
      default:
        throw Exception('ItemType not found');
    }
  }

  NavigationPane _navigationPanel({
    required int curr,
    required Controllers combiner,
  }) {
    return NavigationPane(
      header: const Padding(
        padding: EdgeInsets.only(left: 18),
        child: Text('Dark Mode'),
      ),
      selected: curr,
      items: _items(type: ItemType.bodyItems),
      onChanged: (int idx) => combiner.setPageIdx = idx,
      footerItems: _items(type: ItemType.footerItems),
      menuButton: IconButton(
        icon: const Icon(FluentIcons.brightness),
        onPressed: () => combiner.setDarkMode = DarkModeEvent.changeMode,
      ),
    );
  }
}
