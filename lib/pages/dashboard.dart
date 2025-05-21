import 'package:flutter/material.dart';


class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController emailController = TextEditingController();

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 25.0,
              ),
              Text(
                'Create New Customer',
                style: TextStyle(color: Colors.cyan, fontSize: 20),
              ),
              Container(
                height: 1,
                width: 500,
                color: Colors.cyan,
              ),
              SizedBox(
                width: 250,
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          hintText: 'Enter Customer Name'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                          hintText: 'Enter Customer phone'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          hintText: 'Enter Customer email'),
                    ),
                    Center(
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            color: Colors.grey,
                          ),
                          label: Text(
                            'Add',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
