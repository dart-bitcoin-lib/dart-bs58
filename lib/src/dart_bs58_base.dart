import 'dart:typed_data';

import 'package:dart_base_x/dart_base_x.dart';

/// Base58 Encoder/Decoder
Base58Codec bs58 =
    Base58Codec('123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz');

class Base58Codec extends BaseXCodec {
  Base58Codec(String alphabet) : super(alphabet);

  /// Encodes [input].
  ///
  /// The input is encoded as if by `encoder.convert`.
  @override
  String encode(Uint8List input) {
    if (input.isEmpty) return '';
    return encoder.convert(input);
  }

  /// Decodes [encoded] data.
  ///
  /// The input is decoded as if by `decoder.convert`.
  @override
  Uint8List decode(String encoded) {
    if (RegExp('[^$alphabet]').hasMatch(encoded) == true) {
      throw Exception('Non-base58 character');
    }
    if (RegExp('^${alphabet[0]}+\$', multiLine: true).hasMatch(encoded)) {
      return Uint8List(encoded.length);
    }
    return decoder.convert(encoded);
  }
}
