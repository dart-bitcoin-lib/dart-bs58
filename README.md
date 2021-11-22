dart_bs58
====
Dart component to compute base 58 encoding. This encoding is typically used for cryptocurrencies such as Bitcoin.

inspired by [bs58](https://github.com/cryptocoinjs/bs58).

**Note:** If you're looking for **base 58 check** encoding,
see: [https://github.com/dart-bitcoin-lib/dart-bs58check](https://github.com/dart-bitcoin-lib/dart-bs58check), which
depends upon this library.

Install
-------

    dart pub add dart_bs58

API
---

### encode(input)

`input` must be a [Uint8List](https://api.dart.dev/stable/2.13.4/dart-typed_data/Uint8List-class.html) or an `Array`. It
returns a `string`.

**example**:

```dart
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:dart_bs58/dart_bs58.dart';

void main() {
  final Uint8List bytes =
  hex.decode('003c176e659bea0f29a3e9bf7880c112b1b31b4dc826268187')
  as Uint8List;

  final address = bs58.encode(bytes);
  print(address);
  // => 16UjcYNBG9GTK4uq2f7yYEbuifqCzoLMGS
}
```

### decode(input)

`input` must be a base 58 encoded string. Returns
a [Uint8List](https://api.dart.dev/stable/2.13.4/dart-typed_data/Uint8List-class.html).

**example**:

```dart
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:dart_bs58/dart_bs58.dart';

void main() {
  final address = '16UjcYNBG9GTK4uq2f7yYEbuifqCzoLMGS';
  final Uint8List bytes = bs58.decode(address);

  print(hex.encode(bytes));
  // => 003c176e659bea0f29a3e9bf7880c112b1b31b4dc826268187
}
```

## LICENSE [MIT](LICENSE)