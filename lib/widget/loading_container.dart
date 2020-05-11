import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final bool cover;

  const LoadingContainer(
      {Key key,
      @required this.isLoading,
      @required this.child,
      this.cover = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !cover
        ? !isLoading ? child : _loadingView
        : Stack(
            children: <Widget>[child, isLoading ? _loadingView : null],
          );
  }

  Widget get _loadingView {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
