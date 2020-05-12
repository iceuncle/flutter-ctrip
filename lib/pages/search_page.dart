import 'package:flutter/material.dart';
import 'package:flutter_ctrip/widget/search_bar.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            SearchBar(
              hideLeft: true,
              defaultText: '哈哈',
              hint: '123',
              leftButtonClick: () {
                Navigator.pop(context);
              },
              onChanged: _onTextChange,
            )
          ],
        ),
      ),
    );
  }

  void _onTextChange(String value) {

  }
}
