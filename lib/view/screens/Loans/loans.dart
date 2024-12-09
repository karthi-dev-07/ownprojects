import 'package:product_api_task/allimport.dart';

class Loans extends StatefulWidget {
  const Loans({super.key});

  @override
  State<Loans> createState() => _LoansState();
}

class _LoansState extends State<Loans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Loans",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
