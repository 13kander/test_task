import 'package:flutter/material.dart';

class DataScroll extends StatelessWidget {
  const DataScroll({Key key, this.dataCategory}) : super(key: key);
  final List<String> dataCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: dataCategory.map((e) => Text(e)).toList(),
          ),
        ),
      ),
    );
  }
}
