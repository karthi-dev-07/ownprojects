import 'package:product_api_task/allimport.dart';

class Investment extends StatefulWidget {
  const Investment({super.key});

  @override
  State<Investment> createState() => _InvestmentState();
}

class _InvestmentState extends State<Investment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Investment",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
