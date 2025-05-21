import 'dart:convert';
import '../classes/data_types.dart';
import 'package:http/http.dart' as http;

class CustomersData{

  static List<Customer> lista=[];

  static Future<void>? getAllCustomers() async {
    lista=[];
    final url = Uri.parse('http://localhost:3000/customers/'); // Replace with actual endpoint
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      for(int x=0;x<data.length;x++){
        lista.add(Customer.fromJson(data[x]));
      }
    } else {
      throw Exception('Failed to load customers');
    }
  }

  static Future<Customer> getCustomerById(int id) async {
    final url = Uri.parse('https://http://localhost:3000/customers/$id'); // Replace with actual endpoint
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Customer.fromJson(data);
    } else {
      throw Exception('Failed to load customer with ID $id');
    }
  }

  static Future<int> createCustomer(Customer customer) async {
    final url = Uri.parse('http://localhost:3000/customers/'); // Replace with your endpoint
    final body = jsonEncode(customer.toJson()); // Encode the JSON data
    final headers = {'Content-Type': 'application/json'}; // Set content type
    final response = await http.post(url, body: body, headers: headers);
    return response.statusCode;
  }

  static Future<http.Response> updateCustomer(Customer customer) async {
    final url = Uri.parse('http://localhost:3000/customers/${customer.id}'); // Replace with endpoint, include ID
    final body = jsonEncode(customer.toJson()); // Encode JSON data
    final headers = {'Content-Type': 'application/json'}; // Set content type
    final response = await http.put(url, body: body, headers: headers);
    return response;
  }

  static Future<bool> deleteCustomer(String customerId) async {
    final url = Uri.parse('http://localhost:3000/customers/$customerId'); // Replace with endpoint, use ID
    final response = await http.delete(url);
    return response.statusCode==200?true: false;
  }



}

