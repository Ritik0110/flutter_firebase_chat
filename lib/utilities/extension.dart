import 'package:flutter/cupertino.dart';

extension SizeExtension on num{
  SizedBox get sizedBoxWidth => SizedBox(width: toDouble());
  SizedBox get sizedBoxHeight => SizedBox(height: toDouble());
}