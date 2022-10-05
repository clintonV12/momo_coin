import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart';

import '../constants.dart';

class Account {
  final int id;
  final double y_balance;
  final String phone;
  final String wallet_address;

  const Account(
      {required this.id,
      required this.y_balance,
      required this.phone,
      required this.wallet_address});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      y_balance: double.parse(json['y_balance'].toString()),
      id: json['id'],
      phone: json['phone'],
      wallet_address: json['wallet_address'],
    );
  }
}

Future<Account> fetchAccount(phone) async {
  final response = await get(
    Uri.parse(
        ApiConstants.baseUrl + ApiConstants.userAccountEndpoint + '78679654'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.toString());
    return Account.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load account');
  }
}
