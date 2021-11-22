import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:dart_bs58/dart_bs58.dart';
import 'package:test/test.dart';

import 'fixtures.dart' as fixtures;

void main() {
  group('dart_bs58', () {
    group('encode', () {
      for (fixtures.Valid f in fixtures.valid) {
        test('can encode "${f.hex}"', () {
          final actual = bs58.encode(hex.decode(f.hex) as Uint8List);
          expect(actual, f.string);
        });
      }
    });
    group('decode', () {
      for (fixtures.Valid f in fixtures.valid) {
        test('can decode "${f.string}"', () {
          final actual = hex.encode(bs58.decode(f.string));
          expect(actual, f.hex);
        });
      }
      for (fixtures.Invalid f in fixtures.invalid) {
        test('throws ${f.description}', () {
          Uint8List? decoded;
          try {
            decoded = bs58.decode(f.string);
          } catch (e) {
            expect(e.toString(), matches(RegExp(r'Non-base58 character')));
          } finally {
            expect(decoded, isNull);
          }
        });
      }
    });
  });
}
