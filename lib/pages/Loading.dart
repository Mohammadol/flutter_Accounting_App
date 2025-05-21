import 'package:flutter/material.dart';
import '../services/customer_api.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}
class _LoadingState extends State<Loading> {

  void getData() async {
    await CustomersData.getAllCustomers();
    Navigator.pushReplacementNamed(context, '/User');
  }

  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(body: Center(child: SizedBox( height: 100.0,width: 100.0, child: const CircularProgressIndicator())));
  }
}

