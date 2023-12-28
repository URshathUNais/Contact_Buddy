import 'package:contact/display/front_display.dart';
import 'package:contact/display/view_display.dart';
import 'package:flutter/material.dart';

import '../database/query_file.dart';
import '../module/database_data.dart';

class INSERTDISPLAY extends StatefulWidget {
  const INSERTDISPLAY({super.key});

  @override
  State<INSERTDISPLAY> createState() => _INSERTDISPLAYState();
}

class _INSERTDISPLAYState extends State<INSERTDISPLAY> {
  late DATABASEQUERY handler;

  TextEditingController nameTextController = TextEditingController();
  TextEditingController ageTextController = TextEditingController();
  TextEditingController countryTextController = TextEditingController();


  @override
  void initState() {
    super.initState();
    handler = DATABASEQUERY();
  }

  @override
  void dispose() {
    super.dispose();
    nameTextController.dispose();
    ageTextController.dispose();
    countryTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF809191),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 1),
              Container(
                padding: const EdgeInsets.only(bottom: 60),
                child: Image.asset(
                  'assets/images/app_logo.png',
                  width: 150,
                  height: 150,
                ),
              ),
              TextFormField(
                controller: nameTextController,
                decoration: const InputDecoration(
                  labelText: 'Name :',
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: ageTextController,
                decoration: const InputDecoration(
                  labelText: 'Mobile :',
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: countryTextController,
                decoration: const InputDecoration(
                  labelText: 'Email :',
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150.0,
                      height: 60.0,
                      child: ElevatedButton(
                        onPressed: () {
                          handler.initializeDB().whenComplete(() async {
                            User secondUser = User(
                              name: nameTextController.text,
                              age: int.parse(ageTextController.text),
                              country: countryTextController.text,
                            );
                            List<User> listOfUsers = [secondUser];
                            handler.insertUser(listOfUsers);
                            setState(() {});
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const VIEWDISPLAY()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text(
                          "SAVE",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50), // Space between buttons
                    FloatingActionButton(
                      backgroundColor: const Color(0xFF3B6150),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FRONTDISPLAY()),
                        );
                      },
                      child: const Icon(Icons.arrow_back),
                    ),
                  ],
                ),
              )


            ],
          ),
        ),
    );
  }
}