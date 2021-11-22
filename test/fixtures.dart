import 'dart:convert';
import 'dart:io';

class Invalid {
  String description;
  String string;

  Invalid.fromJSON(Map<String, dynamic> data)
      : description = data['description'],
        string = data['string'];
}

class Valid {
  String hex;
  String string;

  Valid.fromJSON(Map<String, dynamic> data)
      : hex = data['hex'],
        string = data['string'];
}

String _jsonString = File('test/fixtures.json').readAsStringSync();
Map<String, dynamic> _json = jsonDecode(_jsonString);

List<Invalid> invalid =
    _json['invalid']!.map((e) => Invalid.fromJSON(e)).cast<Invalid>().toList();

List<Valid> valid =
    _json['valid']!.map((e) => Valid.fromJSON(e)).cast<Valid>().toList();
