import 'package:flutter/material.dart';
import '../module/database_data.dart';
import 'insert_display.dart';
import 'view_display.dart';

class FRONTDISPLAY extends StatefulWidget {
  const FRONTDISPLAY({Key? key}) : super(key: key);

  @override
  State<FRONTDISPLAY> createState() => _FRONTDISPLAYState();
}

class _FRONTDISPLAYState extends State<FRONTDISPLAY> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B6165),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 150),
          const Text(
            'CONTACT BUDDY',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Image.asset(
            'assets/images/app_logo.png',
            width: 400,
            height: 400,
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                backgroundColor: const Color(0xFF3B6150),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VIEWDISPLAY()),
                  );
                },
                child: const Icon(Icons.visibility),
              ),
              const SizedBox(width: 16),
              FloatingActionButton(
                backgroundColor: const Color(0xFF3B6150),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const INSERTDISPLAY()),
                  );
                },
                child: const Icon(Icons.add_circle),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
