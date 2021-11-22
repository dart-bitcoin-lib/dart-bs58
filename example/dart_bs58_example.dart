import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:dart_bs58/dart_bs58.dart';

void encodeTest() {
  final Uint8List bytes =
      hex.decode('003c176e659bea0f29a3e9bf7880c112b1b31b4dc826268187')
          as Uint8List;

  final address = bs58.encode(bytes);
  print(address);
  // => 16UjcYNBG9GTK4uq2f7yYEbuifqCzoLMGS
}

void decodeTest() {
  final address = '16UjcYNBG9GTK4uq2f7yYEbuifqCzoLMGS';
  final Uint8List bytes = bs58.decode(address);

  print(hex.encode(bytes));
  // => 003c176e659bea0f29a3e9bf7880c112b1b31b4dc826268187
}

void main() {
  encodeTest();
  decodeTest();
}
