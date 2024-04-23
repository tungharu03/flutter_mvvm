import 'package:flutter/material.dart';
import 'sample_item_view_model.dart';
import 'sample_item_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final SampleItemViewModel _viewModel = SampleItemViewModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SampleItemListView(viewModel: _viewModel),
    );
  }
}

