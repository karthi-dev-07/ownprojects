import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:file_picker/file_picker.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2)
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          // title: const Text(
          //   "Edit Profile",
          //   style: TextStyle(color: Colors.black),
          // ),
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: "Edit Profile"),
              Tab(text: "Preferences"),
              Tab(text: "Security"),
            ],
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            ProfileTab(),
            PreferencesTab(),
            SecurityTab(),
          ],
        ),
      ),
    );
  }
}

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _permanentAddressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  var formError = {};

  @override
  void initState(){
    super.initState();
    getData();
  }

  void getData()async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString("name")??"";
      _userNameController.text = prefs.getString("userName")??"";
      _emailController.text = prefs.getString("email")??"";
      _passwordController.text = prefs.getString("password")??"";
      _dobController.text = prefs.getString("dob")??"";
      _cityController.text = prefs.getString("city")??"";
      _addressController.text = prefs.getString("address")??"";
      _permanentAddressController.text = prefs.getString("permanentAddress")??"";
      _postalCodeController.text = prefs.getString("postalCode")??"";
      _countryController.text = prefs.getString("country")??"";
    });
    print("GetDate is printed");
    print("${prefs.getString("name")}");
  }

  validateInput(){
    print(_nameController.text.isEmpty);
    formError = {};
    if(_nameController.text.isEmpty){
      print("Inside if");
        formError['name'] ="Please Enter Name";
      print(formError);
    }else if(_userNameController.text.isEmpty){
      formError['user'] ="Please Enter UserName";
    }else if(_emailController.text.isEmpty){
      formError['email'] ="Please Enter Email";
    }else if(_passwordController.text.isEmpty){
      formError['pass'] ="Please Enter Password";
    }else if(_dobController.text.isEmpty){
      formError['dob'] ="Please Enter DOB";
    }else if(_addressController.text.isEmpty){
      formError['address'] ="Please Enter Address";
    }else if(_permanentAddressController.text.isEmpty){
      formError['permanentAddress'] ="Please Enter PermanentAddress";
    }else if(_cityController.text.isEmpty){
      formError['city'] ="Please Enter City";
    }else if(_postalCodeController.text.isEmpty){
      formError['postal'] ="Please Enter Postal";
    }else if(_countryController.text.isEmpty){
      formError['country'] ="Please Enter Country";
    }
    else{
      saveData();
    }
    setState(() {});
    print("Validate Input $formError");
  }

  bool validateFields() {
    if (_nameController.text.isEmpty ||
        _userNameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _dobController.text.isEmpty ||
        _addressController.text.isEmpty ||
        _permanentAddressController.text.isEmpty ||
        _cityController.text.isEmpty ||
        _postalCodeController.text.isEmpty ||
        _countryController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All fields must be filled!')),
      );
      return false;
    }
    return true;
  }

  Future<void> saveData() async {
    if (!validateFields()) return;

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('name', _nameController.text);
    await prefs.setString('userName', _userNameController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('password', _passwordController.text);
    await prefs.setString('dob', _dobController.text);
    await prefs.setString('address', _addressController.text);
    await prefs.setString('permanentAddress', _permanentAddressController.text);
    await prefs.setString('city', _cityController.text);
    await prefs.setString('postalCode', _postalCodeController.text);
    await prefs.setString('country', _countryController.text);

    // if (_imageFile != null) {
    //   await prefs.setString('imagePath', _imageFile!.path);
    // }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile data saved successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    foregroundImage: AssetImage("assets/women.png"),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 16,
                      child: IconButton(
                        icon: const Icon(Icons.edit, size: 16, color: Colors.white),
                        onPressed: (){},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: buildTextField("Your Name", controller: _nameController,errorText: formError['name']),),
                  const SizedBox(width: 16),
                  Expanded(child: buildTextField("User Name", controller: _userNameController,errorText: formError['user']),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: buildTextField("Email", controller: _emailController,errorText: formError['email'])),
                  const SizedBox(width: 16),
                  Expanded(child: buildTextField("Password", controller: _passwordController, isPassword: true,errorText: formError['pass'])),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: buildTextField("Date of Birth", controller: _dobController,errorText: formError['dob'])),
                  const SizedBox(width: 16),
                  Expanded(child: buildTextField("Present Address", controller: _addressController,errorText: formError['address'])),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: buildTextField("Permanent Address", controller: _permanentAddressController,errorText:formError["permanentAddress"])),
                  const SizedBox(width: 16),
                  Expanded(child: buildTextField("City", controller: _cityController,errorText: formError['city'])),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: buildTextField("Postal Code", controller: _postalCodeController,errorText: formError['postal'])),
                  const SizedBox(width: 16),
                  Expanded(child: buildTextField("Country", controller: _countryController,errorText: formError['country'])),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Spacer(),
                  ElevatedButton(
                    onPressed: validateInput,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Save",
                      style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildTextField(String label, {bool isPassword = false, TextEditingController? controller,errorText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 5),
          TextField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              errorText: errorText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class PreferencesTab extends StatelessWidget {
  const PreferencesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Preferences Screen",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class SecurityTab extends StatelessWidget {
  const SecurityTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Security Screen",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
