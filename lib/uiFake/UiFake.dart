
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart'  if (dart.library.html)  'dart:ui' as ui;

class platformViewRegistry {
  static registerViewFactory(String viewId, dynamic cb) {
    ui.platformViewRegistry.registerViewFactory(viewId, cb);
  }
}
