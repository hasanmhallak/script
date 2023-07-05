import 'dart:convert';
import 'dart:io';
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
    'Alias': 'OPHRUHvKso',
    'Content-Type': 'application/json',
    'Cookie': cookies.trim(),
    'Host': 'api.ecscsy.com:8080',
    'Origin': 'https://ecsc.gov.sy',
    'Referer': 'https://ecsc.gov.sy/',
    'Source': 'WEB',
  };

  print('sending request..');
  try {
    final res = await http.post(
      Uri.parse('https://api.ecscsy.com:8080/dbm/db/execute'),
      headers: reqHeaders,
      body: passportPayload,
    );

    if (res.statusCode == 200) {
      print(res.body);
      return true;
    } else {
      print('${res.statusCode}: ${res.reasonPhrase}');
      print(jsonDecode(res.body));
      return false;
    }
  } catch (e) {
    print(e);

    return false;
  }
}
