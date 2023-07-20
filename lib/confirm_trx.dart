import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> confirmTrx(String cookies) async {
  final passportPayload = jsonEncode({"ALIAS":"OPMzqeNCAi","P_USERNAME":"WebSite","P_ID":"157344332","P_VERIFICATION_CODE":null});
  final reqHeaders = {
    'Accept': 'application/json, text/plain, */*',
    'Accept-Encoding': 'gzip, deflate, br',
    'Accept-Language': 'en-US,en;q=0.5',
    'Alias': 'OPMzqeNCAi',
    'Connection': 'keep-alive',
    'Content-Length': '91',
    'Content-Type': 'application/json',
    'Sec-Fetch-Dest': 'empty',
    'Sec-Fetch-Mode': 'cors',
    'Sec-Fetch-Site': 'cross-site',
    'Cookie': cookies.trim(),
    'Host': 'api.ecscsy.com:8080',
    'Origin': 'https://ecsc.gov.sy',
    'Referer': 'https://ecsc.gov.sy/',
    'Source': 'WEB',
    'User-Agent':
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67',
    'dnt': '1',
    'sec-ch-ua':
        '"Not.A/Brand";v="8", "Chromium";v="114", "Microsoft Edge";v="114"',
    'sec-ch-ua-mobile': '?0',
    'sec-ch-ua-platform': '"Windows"',
    'sec-gpc': '1',
  };

  print('Confirm trx..');
  try {
    final res = await http
        .post(
          Uri.parse('https://api.ecscsy.com:8080/dbm/db/execute'),
          headers: reqHeaders,
          body: passportPayload,
        )
        .timeout(Duration(seconds: 5));

    if (res.statusCode == 200) {
      print(res.body);
      return true;
    } else {
      print('${res.statusCode}: ${res.reasonPhrase}');
      print(utf8.decode(res.body.codeUnits));
      return false;
    }
  } catch (e) {
    print(e);

    return false;
  }
}
