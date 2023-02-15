import 'package:flutter/material.dart';

import 'baseNavigator.dart';

class BaseVM<T extends BaseNavigator> extends ChangeNotifier {
  T? myNavigator = null;
}
