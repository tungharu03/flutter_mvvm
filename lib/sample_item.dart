import 'dart:math';

class SampleItem {
  String id;
  String name;

  SampleItem({required this.id, required this.name});

  static String generateUuid() {
    return int.parse('${DateTime.now().millisecondsSinceEpoch}${Random().nextInt(100000)}')
        .toRadixString(35)
        .substring(0, 9);
  }
}
