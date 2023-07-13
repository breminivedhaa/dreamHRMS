import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sodium/flutter_sodium.dart';
import 'dart:convert';
class Encrypt extends StatefulWidget {
  const Encrypt({Key? key}) : super(key: key);

  @override
  State<Encrypt> createState() => _EncryptState();
}

class _EncryptState extends State<Encrypt> {
  String _encryptedMessage = '';
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    initSodium();
  }

  void initSodium() async {
     Sodium.init();
    setState(() {});
  }

  void encryptMessage() {
      // final key = Sodium.cryptoSecretboxKeygen();

      // final key = Uint8List.fromList(utf8.encode('20f52cbd78033da9905ecb7891e7c9b8dad0c79b30177ffe87cec59ab337d783'));
      // print("key $key");
      // // final nonce = Sodium.randombytesBuf(Sodium.cryptoSecretboxNoncebytes);
      // // final nonce = Uint8List.fromList(utf8.encode('5c27c449e7531dd3e439cb7fb14a253675328661555ed8f6'));
      //
      // final nonceHex = "5c27c449e7531dd3e439cb7fb14a253675328661555ed8f6";
      // final nonce = Uint8List.fromList(hex.decode(nonceHex));
      // print("nonce $nonce");
      // final message = Uint8List.fromList(utf8.encode('Hello, World!'));
      // print("message $message");
      // final encrypted = Sodium.cryptoSecretboxEasy(message, nonce, key);
      // print("encrypted $encrypted");

    final keyHex = "20f52cbd78033da9905ecb7891e7c9b8dad0c79b30177ffe87cec59ab337d783";
    final nonceHex = "5c27c449e7531dd3e439cb7fb14a253675328661555ed8f6";
    final key = Sodium.hex2bin(keyHex);
    final nonce = Sodium.hex2bin(nonceHex);
    // final key = Uint8List.fromList(Sodium.hex2bin(keyHex));
    // final nonce = Uint8List.fromList(Sodium.hex2bin(nonceHex));

    final message = json.encode({"email_id": "saranya@dreamguys.com", "password": "123456"});

    final encrypted = Sodium.cryptoSecretboxEasy(Uint8List.fromList(utf8.encode(message)), nonce, key);


    setState(() {
        _encryptedMessage = Sodium.bin2hex(encrypted);
        print("_encryptedMessage $_encryptedMessage");
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (true)
              Text(
                'Initializing Sodium...',
                style: Theme.of(context).textTheme.headline6,
              ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:encryptMessage,
        tooltip: 'Encrypt',
        child: Icon(Icons.lock),
      ),
    );
  }
}