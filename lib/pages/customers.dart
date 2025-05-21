import 'dart:typed_data';

import '../classes/data_types.dart';
import 'package:flutter/material.dart';
import '../services/customer_api.dart';

class Customers extends StatefulWidget {
  @override
  _CustomersState createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController idController= TextEditingController();
  String addOrUpdate="Add";
  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: y / 2,
              width: x,
              alignment: Alignment.center,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    border: TableBorder.symmetric(
                        inside: BorderSide.none,
                        outside: BorderSide(color: Colors.grey)),
                    columns: [
                      DataColumn(
                        label: TextButton.icon(
                          onPressed: () {
                            setState(() {
                              CustomersData.lista
                                  .sort((a, b) => a.name.compareTo(b.name));
                            });
                          },
                          icon: const Icon(
                            Icons.sort,
                            color: Colors.cyan,
                          ),
                          label: const Text(
                            'Name',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: TextButton.icon(
                          onPressed: () {
                            setState(() {
                              CustomersData.lista
                                  .sort((a, b) => a.email.compareTo(b.email));
                            });
                          },
                          icon: const Icon(
                            Icons.sort,
                            color: Colors.cyan,
                          ),
                          label: const Text(
                            'email',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: TextButton.icon(
                          onPressed: () {
                            setState(() {
                              CustomersData.lista
                                  .sort((a, b) => a.phone.compareTo(b.phone));
                            });
                          },
                          icon: const Icon(
                            Icons.sort,
                            color: Colors.cyan,
                          ),
                          label: const Text(
                            'phone',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      DataColumn(label: Text('Control')),
                    ],
                    rows: CustomersData.lista
                        .map((customer) => DataRow(
                              cells: [
                                DataCell(Text(customer.name)),
                                DataCell(Text(customer.email)),
                                DataCell(Text(customer.phone)),
                                DataCell(Row(
                                  children: [
                                    IconButton(onPressed: (){
                                      idController.text=customer.id.toString();
                                      nameController.text=customer.name;
                                      emailController.text=customer.email;
                                      phoneController.text=customer.phone;
                                      addOrUpdate='Edit';
                                      setState(() {

                                      });

                                    }, icon: Icon(Icons.edit)),
                                    IconButton(
                                      onPressed: () async {
                                        dynamic z =
                                            await CustomersData.deleteCustomer(
                                                customer.id.toString());
                                        z
                                            ? CustomersData.lista.remove(customer)
                                            : '';
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(z
                                                ? '${customer.name} has been deleted'
                                                : 'Error Check your Internet connection'),
                                            duration: Duration(
                                                seconds:
                                                    3), // Set duration to 3 seconds
                                          ),
                                        );
                                        setState(() {});
                                      },
                                      icon: Icon(Icons.delete),
                                    ),
                                  ],
                                )),
                              ],
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
            Container(
              width: x,
              height: y/2,
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25.0,
                    ),
                    const Text(
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
                            controller: idController,
                            decoration: const InputDecoration(
                                hintText: 'Enter Customer Name'),
                          ),
                          TextField(
                            controller: nameController,
                            decoration: const InputDecoration(
                                hintText: 'Enter Customer Name'),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: phoneController,
                            decoration: const InputDecoration(
                                hintText: 'Enter Customer phone'),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: emailController,
                            decoration: const InputDecoration(
                                hintText: 'Enter Customer email'),
                          ),
                          Center(
                              child: TextButton.icon(
                            onPressed: () {
                              addOrUpdate=='Add'?() async{
                              Customer customer = Customer(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text);
                              await CustomersData.createCustomer(customer);
                              await CustomersData.getAllCustomers();}:(){
                                Customer customer = Customer(
                                    id: idController.text,
                                    name: nameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text);
                                CustomersData.updateCustomer(customer);
                              };
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.grey,
                            ),
                            label: Text(
                              '$addOrUpdate',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

// Implement _deleteCustomer function to handle customer deletion
}
