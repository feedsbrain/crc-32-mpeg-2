import 'package:flutter_test/flutter_test.dart';
import 'package:crc_32_mpeg_2/src/crc32.dart';
import 'package:convert/convert.dart';

void main() {
  var testData = '4583EC00801B4950515253545556574849508BE011C043BC2184B564';
  var testChecksum = 'EF5DB7B5';

  test('should return crc-32/mpeg-2 from List<int>', () {
    expect(CRC32.mpeg2(hex.decode(testData)).toRadixString(16), testChecksum.toLowerCase());
  });

  test('should return crc-32/mpeg-2 from string', () {
    expect(CRC32.mpeg2('MPEG-2').toRadixString(16), '23e21287');
  });
}
