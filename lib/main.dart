import 'package:fluent_ui/fluent_ui.dart';
import 'app.dart';

void main() {
  runApp(const WinApp());
}

class WinApp extends StatelessWidget {
  const WinApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      debugShowCheckedModeBanner: false,
      title: "Invoice App",
      home: App(),
    );
  }
}
