import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../views/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>(debugLabel: '_formKey');
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Utils().toastMessage('Please enter both email and password');
      return;
    }

    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Handle successful login
    } on FirebaseAuthException catch (error) {
      String errorMessage = 'An error occurred while logging in';
      if (error.code == 'user-not-found') {
        errorMessage = 'User not found';
      } else if (error.code == 'wrong-password') {
        errorMessage = 'Invalid password';
      }
      Utils().toastMessage(errorMessage);
    }
  }

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
        backgroundColor: CupertinoColors.white,
        leading: Image(
          image: const AssetImage("images/Buddie.png"),
          height: height * 0.02,
        ),
        iconTheme: const IconThemeData(
          color: Colors.green,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: const [
              Expanded(
                child: Image(
                  image: AssetImage("images/uic.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              "Please log in to UIC Shibboleth to                                "
              " Continue ",
              style: TextStyle(
                fontSize: 30,
                height: 1.3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CupertinoTextFormFieldRow(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: "UIC NetID or EmailAddress ",
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please UIC NetID or EmailAddress ";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CupertinoTextFormFieldRow(
                          controller: passwordController,
                          placeholder: " Password",
                          obscureText: true,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: CupertinoColors.systemGrey,
                            ),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r"[a-zA-Z]+|\s+@[uic.edu]"),
                            )
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter your password";
                            }
                            return null;
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 20,
          ),
          CupertinoButton(
            color: CupertinoColors.activeGreen,
            child: const Text(
              'Sign In',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                login();
              }
            },
          ),
          Container(height: 50),
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    "Forget Password?\n",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Text(
            'To reset your password, visit the University of Illinois\n'
            'NetID Center',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 17.2),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter, // set background color
            child: Row(
              children: const [
                Expanded(
                  child: SizedBox(
                    height: 30,
                    child: Center(
                      child: Text(
                        '@Copyright 2023 | BUDDIE-UP All Rights Reserved',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
