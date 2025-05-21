import 'dart:convert';
import '../classes/data_types.dart';
import 'package:http/http.dart' as http;


Future<List<Customer>> getAllCustomers() async {
  final url = Uri.parse('https://your-api-endpoint.com/'); // Replace with actual endpoint
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data.map((item) => Customer.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load customers');
  }
}

Future<Customer> getCustomerById(int id) async {
  final url = Uri.parse('https://your-api-endpoint.com/$id'); // Replace with actual endpoint
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return Customer.fromJson(data);
  } else {
    throw Exception('Failed to load customer with ID $id');
  }
}

Future<http.Response> createCustomer(Customer customer) async {
  final url = Uri.parse('https://your-api-endpoint.com/customers'); // Replace with your endpoint
  final body = jsonEncode(customer.toJson()); // Encode the JSON data
  final headers = {'Content-Type': 'application/json'}; // Set content type

  final response = await http.post(url, body: body, headers: headers);
  return response;
}