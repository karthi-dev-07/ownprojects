import 'package:product_api_task/allimport.dart';

class Myprevilage extends StatefulWidget {
  const Myprevilage({super.key});

  @override
  State<Myprevilage> createState() => _MyprevilageState();
}

class _MyprevilageState extends State<Myprevilage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("MyPreveilage",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
