import 'package:flutter/material.dart';

//context - scope, kon screen e dekhae..
//eta akta method
void showSnackbarMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
