import 'package:flutter/material.dart';
import 'sample_item.dart';

class SampleItemViewModel extends ChangeNotifier {
  final List<SampleItem> items = [];

  void addItem(String name) {
    items.add(SampleItem(id: SampleItem.generateUuid(), name: name));
    notifyListeners();
  }

  void removeItem(String id) {
    items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void updateItem(String id, String newName) {
    try {
      final item = items.firstWhere((item) => item.id == id);
      item.name = newName;
      notifyListeners();
    } catch (e) {
      debugPrint("Không tìm thấy mục với ID $id");
    }
  }
}
