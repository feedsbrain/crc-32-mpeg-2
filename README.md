# CRC-32/MPEG-2

This is Flutter and Dart package that calculate CRC-32 checksum for given string with CRC-32/MPEG-2 capabilities. It's heavily inspired by original [repo](https://github.com/kuranja-89/crc32_checksum) from [@kuranja-89](https://github.com/kuranja-89).

Check the test code for example of usage:

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:crc_32_mpeg_2/src/crc32.dart';
import 'package:convert/convert.dart';

void main() {
  var data = '1303EC00801B4950515253545556574849508BE011C043BC21840806';

  test('should return crc-32 from List<int>', () {
    expect(CRC32.calculate(hex.decode(data)).toRadixString(16), 'c5c69655');
  });

  test('should return crc-32 from string', () {
    expect(CRC32.calculate('HAX').toRadixString(16), 'd1aa2e8');
  });

  test('should return crc-32/mpeg-2 from List<int>', () {
    expect(CRC32.mpeg2(hex.decode(data)).toRadixString(16), '2bc68d1a');
  });

  test('should return crc-32/mpeg-2 from string', () {
    expect(CRC32.mpeg2('MPEG-2').toRadixString(16), '23e21287');
  });
}

```
