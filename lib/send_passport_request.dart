import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> sendPassportRequest(String cookies) async {
  print('prepearing payload..');
  final passportPayload = jsonEncode({
    "ALIAS": "OPHRUHvKso",
    "P_USERNAME": "WebSite",
    "P_ZCITYID": 16,
    "P_ZTOWNID": 17107755,
    "P_ZSIDEID": null,
    "P_ZPROCESSID": 18123129,
    "P_FNAME": "محمد حسام",
    "P_LNAME": "حلاق",
    "P_FATHER": "محمود",
    "P_MOTHER": "حلا",
    "P_COPIES": 1,
    "P_SYRIAID": "07020067923",
    "P_BIRTH_PLACE": "سراقب",
    "P_BIRTH_DATE": "1999-05-18",
    "P_REGISTNO": "840",
    "P_IDDOCNO": "",
    "P_CENTERID": 60739316,
    "P_MOBILE": "0965225683",
    "P_TEL": "0965225683",
    "P_ADDR_GENERAL": null,
    "P_D_METHOD": "1",
    "P_D_ADDRESS": null,
    "P_ADD_ZCITYID": 16,
    "P_ADD_ZTOWNID": 17107755,
    "P_ADD_AREA": "",
    "P_ADD_NAH": "",
    "P_ADD_VILLAGE": "",
    "P_ADD_POST_OFFICE": null,
    "P_LEGALID": null,
    "P_PASSPORT_TYPE": "3",
    "P_MATE_COUNT": 0,
    "P_PASSPORT_KIND": "10"
  });

  print('prepearing header..');
  final reqHeaders = {
    'Accept': 'application/json, text/plain, */*',
    'Accept-Encoding': 'gzip, deflate, br',
    'Accept-Language': 'en-US,en;q=0.9',
    'Alias': 'OPHRUHvKso',
    'Connection': 'keep-alive',
    'Content-Length': '670',
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

  print('sending request..');
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
