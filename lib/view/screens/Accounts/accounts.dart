import 'package:product_api_task/allimport.dart';

class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Accounts",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
