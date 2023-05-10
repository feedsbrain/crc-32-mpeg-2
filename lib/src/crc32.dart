import 'dart:convert';

import 'package:crc_32_mpeg_2/src/crc_table.dart';

class CRC32 {
  static int calculate(var input, [int crc = 0]) {
    if (input == null) throw ArgumentError.notNull('input');
    if (input is String) input = utf8.encode(input);

    crc = crc ^ (0xffffffff);

    for (var byte in input) {
      if (!(byte >= -128 && byte <= 255)) {
        throw FormatException("Invalid value in input: $byte");
      }

      var x = CrcTable.hax[(crc ^ byte) & 0xff];
      crc = (crc & 0xffffffff) >> 8;
      crc ^= x;
    }
    crc = crc ^ (0xffffffff);

    return crc & 0xffffffff;
  }

  static int mpeg2(var input, [int crc = 0xffffffff]) {
    if (input == null) throw ArgumentError.notNull('input');
    if (input is String) input = utf8.encode(input);

    for (var index = 0; index < input.length; index++) {
      var byte = input[index];
      var x = CrcTable.mpeg2[((crc >> 24) ^ byte) & 0xff];
      crc = (crc & 0xffffffff) << 8;
      crc ^= x;
    }

    return crc & 0xffffffff;
  }
}
