import 'package:accounting/services/customer_api.dart';
import 'package:flutter/material.dart';

class HomeInit extends StatefulWidget {
  const HomeInit({super.key});
  @override
  State<HomeInit> createState() => _HomeInitState();
}

class _HomeInitState extends State<HomeInit> {
  bool userExist = false;
  String logInText = 'Kindly Create A new User';
  String appBarText = 'Initial Configuration';

  setPage() {
    if (userExist) {
      logInText = 'LogIn!!';
      appBarText = 'Welcome';
    }
  }

  final formKey = GlobalKey<FormState>();
  String Database = '';
  @override
  Widget build(BuildContext context) {
    dynamic width = MediaQuery.of(context).size.width > 720
        ? MediaQuery.of(context).size.width / 10 * 4
        : MediaQuery.of(context).size.width / 10 * 8;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          appBarText,
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[200]),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Kindly Create A new User',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ),
          Container(
            height: 1.0,
            width: width,
            color: Colors.cyan,
          ),
          Center(
            child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: width,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            icon: Icon(Icons.account_circle_rounded),
                            labelText: 'Enter Your Name',
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan))),
                      ),
                    ),
                    SizedBox(
                      width: width,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.password_rounded),
                          labelText: 'Enter Your Password',
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width,
                      child: DropdownButtonFormField(
                          hint: Text(
                            'SELECT THE TYPE',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey[800]),
                          ),
                          focusColor: Colors.transparent,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.menu_outlined),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan),
                              )),
                          items: const [
                            DropdownMenuItem(
                              value: "-1",
                              child: Text('Select Type'),
                            ),
                            DropdownMenuItem(
                              value: "Business",
                              child: Text('Business Store'),
                            ),
                            DropdownMenuItem(
                              value: "Personal",
                              child: Text('Personal pocket'),
                            )
                          ],
                          onChanged: (v) {}),
                    )
                  ],
                )),
          ),
          const SizedBox(
            height: 15.0,
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/Loading');
            },
            icon: const Icon(
              Icons.login,
              color: Colors.black54,
            ),
            label: Text('Submit', style: TextStyle(color: Colors.black54)),
          ),
        ],
      ),
    );
  }
}
