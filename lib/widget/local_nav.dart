import 'package:flutter/material.dart';
import 'package:flutter_ctrip/model/common_model.dart';
import 'package:flutter_ctrip/util/navigator_util.dart';
import 'package:flutter_ctrip/widget/webview.dart';

class LocalNav extends StatelessWidget {
  final List<CommonModel> localNavList;

  const LocalNav({Key key, @required this.localNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 69,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Padding(
        padding: EdgeInsets.all(7),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context) {
    if (localNavList == null) return null;
    List<Widget> items = [];
    localNavList.forEach((model) {
      items.add(_item(context, model));
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items,
    );
  }

  Widget _item(BuildContext context, CommonModel model) {
    return GestureDetector(
      onTap: () {
        NavigatorUtil.push(
            context,
            WebView(
                url: model.url,
                statusBarColor: model.statusBarColor,
                hideAppBar: model.hideAppBar));
      },
      child: Column(
        children: <Widget>[
          Image.network(
            model.icon,
            height: 32,
            width: 32,
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              model.title,
              style: TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
