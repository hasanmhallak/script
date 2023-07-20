import 'dart:async';
import 'dart:io';
import 'package:script/login.dart' as script;
import 'package:script/send_passport_request.dart';
import 'package:script/confirm_trx.dart';

void main(List<String> arguments) async {
  await start(int.parse(arguments.first));
}

Future<void> start(int sleepInMilliseconds) async {
  final cookies = await script.login();
  print(cookies);
  if (cookies == null) {
    Timer(Duration(milliseconds: sleepInMilliseconds),
        () => start(sleepInMilliseconds));
    return;
  }
  final isSuccess = await confirmTrx(cookies);
  if (isSuccess) exit(0);
  Timer(Duration(milliseconds: sleepInMilliseconds),
      () => start(sleepInMilliseconds));
}
