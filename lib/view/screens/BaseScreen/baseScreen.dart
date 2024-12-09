import 'package:product_api_task/allimport.dart';
import 'package:product_api_task/view/screens/Profile/profileScreen.dart';

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
          title: Text("Product"),
          onTap: (){
            controller.isSelected.value = 1;
            controller.isSelectedLabel.value = "Product";
            Get.back();
          },
          leading: Icon(Icons.settings),
        ),
        ListTile(
          title: Text("Profile"),
          onTap: (){
            controller.isSelected.value = 2;
            controller.isSelectedLabel.value = "Profile";
            Get.back();
          },
          leading: Icon(Icons.person),
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
            controller.isSelectedLabel.value = "Product";
            Get.back();
          },
          icon: Icon(Icons.settings),
        ),
        IconButton(
          onPressed: (){
            controller.isSelected.value = 2;
            controller.isSelectedLabel.value = "Profile";
            Get.back();
          },
          icon: Icon(Icons.person),
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
                ()=> controller.isSelected.value == 0 ? const Text("Dashboard") :
                    controller.isSelected.value == 1 ? Expanded(child: ProductPage()) :
                    controller.isSelected.value == 2 ? const Expanded(child: ProfileEditScreen()) : const SizedBox()

            ),
          ],
        ),
      ),
    );
  }



}
