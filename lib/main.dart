
import 'package:product_api_task/view/screens/BaseScreen/baseScreen.dart';

import 'package:product_api_task/allimport.dart';

void main() {
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: BaseScreen(),
        // home: BaseScreen(
        //       child: Center(child: Text('Dashboard'))
        //   ),
      )
  );
}

// void main() {
//   Get.put(BaseScreenController()); // Ensure only one instance
//   runApp(GetMaterialApp(
//     initialRoute: '/main',
//     getPages: [
//       GetPage(name: '/main', page: () => Dashboards()),
//       GetPage(name: '/transactions', page: () => TransactionsScreen()),
//       GetPage(name: '/accounts', page: () => AccountsScreen()),
//       GetPage(name: '/investments', page: () => InvestmentsScreen()),
//       GetPage(name: '/credit-cards', page: () => CreditCardsScreen()),
//       GetPage(name: '/loans', page: () => LoansScreen()),
//       GetPage(name: '/products', page: () => ProductPage()),
//       GetPage(name: '/settings', page: () => SettingsScreen()),
//     ],
//     debugShowCheckedModeBanner: false,
//     home: BaseScreenLayout(child: Dashboards(),),
//   ));
// }