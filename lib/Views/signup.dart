import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Handler/takeimage.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _name = TextEditingController();
  final _lastname = TextEditingController();
  final _gender = TextEditingController();
  final _language = TextEditingController();
  final _phone = TextEditingController();
  final _ethnicity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      endDrawer: Drawer(
        child: Container(
          color: Colors.green, // set the background color here
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                child: UserAccountsDrawerHeader(
                  accountName: ListTile(
                    leading: Icon(Icons.phone, color: Colors.white),
                    title: Text(
                      "+1(773)732-3001",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  accountEmail: ListTile(
                    leading: Icon(Icons.email, color: Colors.white),
                    title: Text(
                      "support@buddie-up.com",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(color: Colors.green),
                ),
              ),
              ListTile(
                  title: const Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctxt) => const Signup()));
                  }),
              ListTile(
                title: const Text(
                  'History',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'About',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Contact',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Terms & Conditions',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image(
          image: const AssetImage(
            "images/Buddie.png",
          ),
          height: height * 0.05,
        ),
        iconTheme: const IconThemeData(
          color: Colors.green,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      "Personal Information",
                      style: TextStyle(
                        fontSize: 28,
                        height: 1.8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  const Center(
                    child: Text(
                      "(Make Sure You Fill in all required fields!)",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    height: 15,
                  ),
                  CupertinoTextField(
                    controller: _name,
                    placeholder: "Name",
                    keyboardType: TextInputType.text,
                  ),
                  Container(
                    height: 14,
                  ),
                  CupertinoTextField(
                    controller: _lastname,
                    placeholder: "Last Name",
                    keyboardType: TextInputType.text,
                  ),
                  Container(
                    height: 14,
                  ),
                  CupertinoTextField(
                    controller: _gender,
                    placeholder: "Gender",
                    keyboardType: TextInputType.text,
                  ),
                  Container(
                    height: 14,
                  ),
                  SizedBox(
                    child: CupertinoTextField(
                      controller: _language,
                      placeholder: "Language",
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                  Container(
                    height: 14,
                  ),
                  CupertinoTextField(
                    controller: _phone,
                    placeholder: "Phone Number",
                    keyboardType: TextInputType.phone,
                  ),
                  Container(
                    height: 14,
                  ),
                  CupertinoTextField(
                    controller: _ethnicity,
                    placeholder: "Ethnicity",
                    keyboardType: TextInputType.text,
                  ),
                  Container(
                    height: 14,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CupertinoButton(
                          color: Colors.green,
                          minSize: 48,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TakeImage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
