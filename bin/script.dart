import 'dart:async';
import 'dart:io';
import 'package:script/login.dart' as script;
import 'package:script/send_passport_request.dart';
import 'package:script/confirm_trx.dart';

int i = 0;

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

  late final bool isSuccess;
  if (i % 2 == 0) {
    final isSuccess = await confirmTrx(cookies);
  } else {
     final isSuccess = await sendPassportRequest(cookies);
  }
  
  if (isSuccess) exit(0);
  i++;

  Timer(Duration(milliseconds: sleepInMilliseconds),
      () => start(sleepInMilliseconds));
}
