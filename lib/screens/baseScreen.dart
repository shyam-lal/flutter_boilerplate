import 'package:flutter/material.dart';

abstract class BaseScreen extends StatelessWidget {}

abstract class BaseScreenState<T extends BaseScreen> {
  String get screenName;

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(screenName),
    );
  }

  Widget buildBody(BuildContext context);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }
}
