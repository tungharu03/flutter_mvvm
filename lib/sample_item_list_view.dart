import 'package:flutter/material.dart';
import 'sample_item.dart';
import 'sample_item_view_model.dart';
import 'sample_item_details_view.dart';

class SampleItemListView extends StatelessWidget {
  final SampleItemViewModel viewModel;

  const SampleItemListView({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách mục'),
      ),
      body: ListView.builder(
        itemCount: viewModel.items.length,
        itemBuilder: (context, index) {
          final item = viewModel.items[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(item.id),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SampleItemDetailsView(item: item),
                ),
              );
            },
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                viewModel.removeItem(item.id);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddItemDialog(context, viewModel);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddItemDialog(BuildContext context, SampleItemViewModel viewModel) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController _controller = TextEditingController();
        return AlertDialog(
          title: Text('Thêm mới mục'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: 'Nhập tên mục'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                viewModel.addItem(_controller.text);
                Navigator.of(context).pop();
              },
              child: Text('Thêm'),
            ),
          ],
        );
      },
    );
  }
}
