import 'package:product_api_task/allimport.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Transaction",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
