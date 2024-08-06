import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moofli_fullstack/constants/error_handling.dart';
import 'package:moofli_fullstack/constants/global_variables.dart';
import 'package:moofli_fullstack/models/user.dart';
import 'package:moofli_fullstack/screens/home.dart';
import 'package:moofli_fullstack/provider_class/userprovider.dart';
import 'package:moofli_fullstack/utils/snackbar_helper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:moofli_fullstack/models/user.dart';
class AuthService {
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/user/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // print(res.body);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          Navigator.pushNamedAndRemoveUntil(
            context,
            home_page.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showErrorMessage(context, message: e.toString());
    }
  }

  // get user data
  // void getUserData(
  //   BuildContext context,
  // ) async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     String? token = prefs.getString('x-auth-token');

  //     if (token == null) {
  //       prefs.setString('x-auth-token', '');
  //     }

  //     var tokenRes = await http.post(
  //       Uri.parse('$uri/user-tokenIsValid/'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'x-auth-token': token!
  //       },
  //     );

  //     var response = jsonDecode(tokenRes.body);

  //     if (response == true) {
  //       http.Response userRes = await http.get(
  //         Uri.parse('$uri/'),
  //         headers: <String, String>{
  //           'Content-Type': 'application/json; charset=UTF-8',
  //           'x-auth-token': token
  //         },
  //       );

  //       var userProvider = Provider.of<UserProvider>(context, listen: false);
  //       userProvider.setUser(userRes.body);
  //     }
  //   } catch (e) {
  //     showErrorMessage(context, message: e.toString());
  //   }
  // }

   Future<void> fetchDiaryEntries(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        throw "Token is null";
      }

      String userId = Provider.of<UserProvider>(context, listen: false).user.id;
      print('Fetching diary entries for user: $userId');

      final response = await http.get(
        Uri.parse('$uri/diary/entries/user/$userId'),
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': token,
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<Post> posts =
            body.map((dynamic item) => Post.fromJson(item)).toList();
        Provider.of<UserProvider>(context, listen: false)
            .setDiaryEntries(posts);
      } else {
        throw "Failed to load diary entries: ${response.statusCode} ${response.reasonPhrase}";
      }
    } catch (e) {
      print('Error fetching diary entries: $e');
      showErrorMessage(context, message: e.toString());
    }
  }
}
