import 'package:flutter_riverpod/flutter_riverpod.dart';

final controllerGetPositionLat =
    StateProvider.autoDispose<double>((ref) => 41.311355762972845);
final controllerGetPositionLong =
    StateProvider.autoDispose<double>((ref) => 69.27950520068407);

final controllerGetPositionSelect = StateProvider.autoDispose<bool>((ref) {
  if (ref.watch(controllerGetPositionLat).toString().length > 4 &&
      ref.watch(controllerGetPositionLong).toString().length > 4) {
    return true;
  } else {
    return false;
  }
});
