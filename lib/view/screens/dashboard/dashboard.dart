import 'package:product_api_task/allimport.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Dashboard",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
