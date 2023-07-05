import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String?> login() async {
  print('started.');
  print('prepearing login payload..');
  final loginPayload = jsonEncode(
    {"username": "07020067923", "password": "Soula1234!@#"},
  );

  print('prepearing login header..');
  final loginHeaders = {
    "Accept": "application/json, text/plain, */*",
    "Accept-Encoding": "gzip, deflate, br",
    "Accept-Language": "en-US,en;q=0.9",
    "Connection": "keep-alive",
    "Content-Length": "52",
    "Content-Type": "application/json",
    "Host": "api.ecscsy.com:8080",
    'Sec-Fetch-Dest': 'empty',
    'Sec-Fetch-Mode': 'cors',
    'Sec-Fetch-Site': 'cross-site',
    "Origin": "https://ecsc.gov.sy",
    "Referer": "https://ecsc.gov.sy/",
    "Source": "WEB",
    "User-Agent":
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67",
    "dnt": "1",
    "sec-ch-ua":
        "\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"",
    "sec-ch-ua-mobile": "?0",
    "sec-ch-ua-platform": "\"Windows\"",
    "sec-gpc": "1",
  };

  print('sending request..');

  try {
    final res = await http.post(
      Uri.parse('https://api.ecscsy.com:8080/secure/auth/login'),
      headers: loginHeaders,
      body: loginPayload,
    );

    if (res.statusCode == 200) {
      // return res.headers['set-cookie']!.split(';').first;
      return res.headers['set-cookie'];
    } else {
      print('${res.statusCode}: ${res.reasonPhrase}');
      return null;
    }
  } catch (e) {
    print(e);
    return null;
  }
}
