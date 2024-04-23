import 'package:flutter/material.dart';
import 'sample_item.dart';
import 'sample_item_view_model.dart';

class SampleItemDetailsView extends StatelessWidget {
  final SampleItem item;

  const SampleItemDetailsView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController(text: item.name);
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết mục'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${item.id}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Tên mục'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                SampleItemViewModel().updateItem(item.id, _controller.text);
                Navigator.pop(context);
              },
              child: Text('Cập nhật'),
            ),
          ],
        ),
      ),
    );
  }
}
