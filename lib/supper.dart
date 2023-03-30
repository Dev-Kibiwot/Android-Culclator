import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SupperBugar extends StatefulWidget {
  const SupperBugar({super.key});

  @override
  State<SupperBugar> createState() => _SupperBugarState();
}

class _SupperBugarState extends State<SupperBugar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: (){}, 
                  icon: Icon(Icons.menu,
                  color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: (){}, 
                  icon: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.shopping_cart_outlined,
                    color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}