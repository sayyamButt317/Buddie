import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Handler/takeimage.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

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
    return Scaffold(
      body: Center(
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
                )),
                Container(
                  height: 10,
                ),
                const Center(
                    child: Text(
                  "(Make Sure You Fill in all required feild!)",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )),
                Container(
                  height: 15,
                ),
                TextField(
                  controller: _name,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Name",
                    labelStyle: TextStyle(),
                    hintText: "Enter Your Name here ",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                ),
                Container(
                  height: 14,
                ),
                TextField(
                  controller: _lastname,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_2),
                    labelText: "Last Name",
                    hintText: "Enter Your Last name here ",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                ),
                Container(
                  height: 14,
                ),
                TextField(
                  controller: _gender,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_4_rounded),
                    labelText: "Gender",
                    hintText: "Enter Your Gender here ",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                ),
                Container(
                  height: 14,
                ),
                SizedBox(
                  child: TextField(
                    controller: _language,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      labelText: "language",
                      hintText: "Enter Your language",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                Container(
                  height: 14,
                ),
                TextField(
                  controller: _phone,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: "Phone Number",
                    hintText: "Enter Your Phone Number here ",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                Container(
                  height: 14,
                ),
                TextField(
                  controller: _ethnicity,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.group),
                    labelText: "Ethnicity",
                    hintText: "Enter Your Ethnicity here ",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                ),
                Container(
                  height: 14,
                ),
                Row(
                  children: [
                    const Align(alignment: Alignment.bottomCenter),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: const Size(120, 48),
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                      onPressed: () => Get.to(() => const TakeImage()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
