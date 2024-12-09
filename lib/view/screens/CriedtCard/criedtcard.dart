import 'package:product_api_task/allimport.dart';

class Criedtcard extends StatefulWidget {
  const Criedtcard({super.key});

  @override
  State<Criedtcard> createState() => _CriedtcardState();
}

class _CriedtcardState extends State<Criedtcard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("CriedtCard",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
