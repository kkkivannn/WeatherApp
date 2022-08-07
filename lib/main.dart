// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:

// Project imports:

import 'home_page_app/page/my_app.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}
