import 'package:product_api_task/allimport.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Settings",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
