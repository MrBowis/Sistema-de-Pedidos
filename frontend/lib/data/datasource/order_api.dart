import '../../domain/entities/order.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ContactApi {
  final String baseUrl = 'http://127.0.0.1:8000/api-pedidos/pedidos/';

  Future<List<Order>> fetchContacts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Order.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load contacts');
    }
  }

  //crear contacto
  Future<Order> createContact(Order contact) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(contact.toJson()..remove('id')),
    );

    if (response.statusCode == 201) {
      return Order.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create contact');
    }
  }

  //actualizar contacto
  Future<Order> updateContact(Order contact) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${contact.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(contact.toJson()),
    );

    if (response.statusCode == 200) {
      return Order.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update contact');
    }
  }

  //eliminar contacto
  Future<void> deleteContact(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete contact');
    }
  }
}
