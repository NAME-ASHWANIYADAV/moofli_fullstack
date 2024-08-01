import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moofli_fullstack/utils/snackbar_helper.dart';

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showErrorMessage(context, message:  jsonDecode(response.body)['msg']);
      break;
    case 500:
      showErrorMessage(context,message:  jsonDecode(response.body)['error']);
      break;
    default:
      showErrorMessage(context, message:  response.body);
  }
}