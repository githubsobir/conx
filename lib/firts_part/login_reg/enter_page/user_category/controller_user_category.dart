import 'package:flutter_riverpod/flutter_riverpod.dart';



final userCategoryControllerIndex = StateProvider<int>((ref) => 0);
final userCategoryControllerCheckBoxValue = StateProvider<String>((ref) => "");