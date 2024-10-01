import 'package:flutter/foundation.dart';

class RebuildNotifier extends ValueNotifier<bool> {
  RebuildNotifier() : super(false);

  void triggerRebuild() {
    value = !value;
  }
}

final rebuildNotifier = RebuildNotifier();