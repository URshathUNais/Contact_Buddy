import 'package:contact/display/front_display.dart';
import 'package:flutter/material.dart';

import '../database/query_file.dart';
import '../module/database_data.dart';
import 'insert_display.dart';

class VIEWDISPLAY extends StatefulWidget {
  const VIEWDISPLAY({Key? key}) : super(key: key);

  @override
  State<VIEWDISPLAY> createState() => _VIEWDISPLAYState();
}

class _VIEWDISPLAYState extends State<VIEWDISPLAY> {
  late DATABASEQUERY handler;

  @override
  void initState() {
    super.initState();
    handler = DATABASEQUERY();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF809191),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 60.0,bottom: 0.0, left: 8.0, right: 8.0),
            child: Text(
              'Saved Contacts',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

          Expanded(
            child: FutureBuilder(
              future: handler.retrieveUsers(),
              builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: const Color(0xFF3B6150),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: w,
                            height: 80.0,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        "Name: ${snapshot.data![index].name}",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        "Mobile: ${snapshot.data![index].age.toString()}",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Text(
                                              "Email: ${snapshot.data![index].country}",
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            alignment: Alignment.centerRight,
                                            child: IconButton(
                                              color: Colors.black,
                                              onPressed: () {

                                                setState(() {

                                                });
                                              },
                                              icon: const Icon(Icons.system_update),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.centerRight,
                                            child: IconButton(
                                              color: Colors.black,
                                              onPressed: () {
                                                handler.deleteUser(snapshot.data![index].id!);
                                                setState(() {
                                                  snapshot.data!.remove(snapshot.data![index]);
                                                });
                                              },
                                              icon: const Icon(Icons.delete),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF3B6150),
        child: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FRONTDISPLAY()),
          );
        },
      ),
    );
  }
}
