import 'package:product_api_task/allimport.dart';
import 'package:product_api_task/view/screens/Accounts/accounts.dart';
import 'package:product_api_task/view/screens/CriedtCard/criedtcard.dart';
import 'package:product_api_task/view/screens/Investments/investment.dart';
import 'package:product_api_task/view/screens/Loans/loans.dart';
import 'package:product_api_task/view/screens/Myprevilage/myprevilage.dart';
import 'package:product_api_task/view/screens/Profile/profileScreen.dart';
import 'package:product_api_task/view/screens/Transactions/transaction.dart';
import 'package:product_api_task/view/screens/dashboard/dashboard.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {

  ProductController controller = Get.put(ProductController());
  bool showDrawer = false;

  Widget customDrawer ()=> Drawer(
    width: 180,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text("Dashboard"),
          onTap: (){
            controller.isSelected.value = 0;
            controller.isSelectedLabel.value = "Dashboard";
            Get.back();
          },
          leading: Icon(Icons.home),
        ),
        ListTile(
          title: Text("Transaction"),
          onTap: (){
            controller.isSelected.value = 1;
            controller.isSelectedLabel.value = "Transaction";
            Get.back();
          },
          leading: Icon(Icons.monetization_on_outlined),
        ),
        ListTile(
          title: Text("Accounts"),
          onTap: (){
            controller.isSelected.value = 2;
            controller.isSelectedLabel.value = "Accounts";
            Get.back();
          },
          leading: Icon(Icons.person),
        ),
        ListTile(
          title: Text("Investments"),
          onTap: (){
            controller.isSelected.value = 3;
            controller.isSelectedLabel.value = "Investments";
            Get.back();
          },
          leading: Icon(Icons.inventory_2_outlined),
        ),
        ListTile(
          title: Text("Credit Card"),
          onTap: (){
            controller.isSelected.value = 4;
            controller.isSelectedLabel.value = "Credit Card";
            Get.back();
          },
          leading: Icon(Icons.credit_card_sharp),
        ),
        ListTile(
          title: Text("Loans"),
          onTap: (){
            controller.isSelected.value = 5;
            controller.isSelectedLabel.value = "Loans";
            Get.back();
          },
          leading: Icon(Icons.call_to_action_sharp),
        ),
        ListTile(
          title: Text("Product"),
          onTap: (){
            controller.isSelected.value = 6;
            controller.isSelectedLabel.value = "Product";
            Get.back();
          },
          leading: Icon(Icons.production_quantity_limits),
        ),
        ListTile(
          title: Text("My Previlage"),
          onTap: (){
            controller.isSelected.value = 7;
            controller.isSelectedLabel.value = "My previlage";
            Get.back();
          },
          leading: Icon(Icons.bubble_chart_outlined),
        ),

        ListTile(
          title: Text("Setting"),
          onTap: (){
            controller.isSelected.value = 8;
            controller.isSelectedLabel.value = "Setting";
            Get.back();
          },
          leading: Icon(Icons.settings),
        ),
      ],
    ),
  );

  Widget iconDrawer ()=> Container(
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.5),
      borderRadius: BorderRadius.circular(10)
    ),
    padding: const EdgeInsets.all(10),
    child: Column(
      children: [
        IconButton(
          onPressed: (){
            controller.isSelected.value = 0;
            controller.isSelectedLabel.value = "Dashboard";
            Get.back();
          },
          icon: Icon(Icons.home),
        ),
        IconButton(
          onPressed: (){
            controller.isSelected.value = 1;
            controller.isSelectedLabel.value = "Transaction";
            Get.back();
          },
          icon: Icon(Icons.monetization_on_outlined),
        ),
        IconButton(
          onPressed: (){
            controller.isSelected.value = 2;
            controller.isSelectedLabel.value = "Accounts";
            Get.back();
          },
          icon: Icon(Icons.person),
        ),
        IconButton(
          onPressed: (){
            controller.isSelected.value = 3;
            controller.isSelectedLabel.value = "Investments";
            Get.back();
          },
          icon: Icon(Icons.inventory_2_outlined),
        ),
        IconButton(
          onPressed: (){
            controller.isSelected.value = 4;
            controller.isSelectedLabel.value = "Credit Card";
            Get.back();
          },
          icon: Icon(Icons.credit_card_sharp),
        ),
        IconButton(
          onPressed: (){
            controller.isSelected.value = 5;
            controller.isSelectedLabel.value = "Loans";
            Get.back();
          },
          icon: Icon(Icons.call_to_action_sharp),
        ),
        IconButton(
          onPressed: (){
            controller.isSelected.value = 6;
            controller.isSelectedLabel.value = "Product";
            Get.back();
          },
          icon: Icon(Icons.production_quantity_limits),
        ),
        IconButton(
          onPressed: (){
            controller.isSelected.value = 7;
            controller.isSelectedLabel.value = "My previlage";
            Get.back();
          },
          icon: Icon(Icons.bubble_chart_outlined),
        ),
        IconButton(
          onPressed: (){
            controller.isSelected.value = 8;
            controller.isSelectedLabel.value = "Setting";
            Get.back();
          },
          icon: Icon(Icons.settings),
        ),
      ],
    ),
  );


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(leadingWidth: showDrawer?180:60,
          leading: GetPlatform.isWeb ?
          Container(
            child: showDrawer?
            InkWell(
              onTap: (){
                setState(() {
                  showDrawer = !showDrawer;
                });
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Text("BankDash"),
              ),
            )
                :IconButton(
                onPressed: (){
                  setState(() {
                    showDrawer = !showDrawer;
                  });
                },
                icon: const Icon(Icons.more_vert)
            ),
          ) : null,
          title: Obx(
              ()=> Text("${controller.isSelectedLabel}")
          ),
        ),
        drawer: customDrawer(),
        body: Row(
          children: [
            GetPlatform.isWeb?
            Container(
              child: showDrawer ? customDrawer() : iconDrawer(),
            )
              :
            const SizedBox.shrink(),
            Obx(
                ()=> controller.isSelected.value == 0 ? Expanded(child: Dashboard()):
                    controller.isSelected.value == 1 ? Expanded(child: Transaction()) :
                    controller.isSelected.value == 2 ? Expanded(child: Accounts()) :
                    controller.isSelected.value == 3 ? Expanded(child: Investment()) :
                    controller.isSelected.value == 4 ? Expanded(child: Criedtcard()) :
                    controller.isSelected.value == 5 ? Expanded(child: Loans()) :
                    controller.isSelected.value == 6 ? Expanded(child: ProductPage()) :
                    controller.isSelected.value == 7 ? Expanded(child: Myprevilage()) :
                    controller.isSelected.value == 8 ? const Expanded(child: ProfileEditScreen()) : const SizedBox()

            ),
          ],
        ),
      ),
    );
  }



}
