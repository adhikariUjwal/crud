import 'dart:convert';
import 'package:crud/Models/UserModel.dart';

import 'package:http/http.dart' as http;

class UserController {
  //Sending data to server
  Future sendDataToServer(String fullName) async {
    try {
      final url = Uri.parse('https://64835a24f2e76ae1b95c59f2.mockapi.io/user');

      final payload = {'name': fullName};

      final response = await http.post(url, body: payload);

      if (response.statusCode == 201) {
        print('Data sent successfully');
      } else {
        print('Failed to send data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occoured: $e');
    }
  }

  //Receive data form the server
  Future getUserData() async {
    var url = Uri.parse('https://64835a24f2e76ae1b95c59f2.mockapi.io/user');
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    List<User> users = [];
    for (var u in jsonData) {
      User user = User(u['name'], u['id'], u['avatar']);
      users.add(user);
    }
    print(users.length);

    return users;
  }

  // Delete user from the server
  Future deleteUser(String userId) async {
    try {
      final url =
          Uri.parse('https://64835a24f2e76ae1b95c59f2.mockapi.io/user/$userId');

      final response = await http.delete(url);

      if (response.statusCode == 200) {
        print('User deleted successfully');
      } else {
        print('Failed to delete user. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  // Update user on the server
  Future updateUser(String userId, String updateFullName) async {
    try {
      final url =
          Uri.parse('https://64835a24f2e76ae1b95c59f2.mockapi.io/user/$userId');

      final payload = {'name': updateFullName};

      final response = await http.put(url, body: payload);

      if (response.statusCode == 200) {
        print('User updated successfully');
      } else {
        print('Failed to update user. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}
