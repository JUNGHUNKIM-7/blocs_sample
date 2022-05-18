import 'package:fluent_ui/fluent_ui.dart';

class Styles {
  const Styles({required this.isDark});
  final bool isDark;

  static final primaryColor = Colors.red;
  static final secondaryColor = Colors.blue;

  get iconColor => isDark ? primaryColor : secondaryColor;
  get borderColor => isDark ? primaryColor : secondaryColor;
}

class WidgetStyle extends Styles {
  WidgetStyle({required bool isDark}) : super(isDark: isDark);

  RoundedRectangleBorder get getBorder => RoundedRectangleBorder(
        side: BorderSide(color: borderColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      );
}
