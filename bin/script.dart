import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:script/login.dart' as script;
import 'package:script/send_passport_request.dart';

void main(List<String> arguments) async {
  await start(int.parse(arguments.first));
}

Future<void> start(int sleepInMilliseconds) async {
  final cookies = await script.login();
  if (cookies == null) return start(sleepInMilliseconds);
  final isSuccess = await sendPassportRequest(cookies);
  if (isSuccess) exit(0);
  Timer(Duration(milliseconds: sleepInMilliseconds),
      () => start(sleepInMilliseconds));
}
