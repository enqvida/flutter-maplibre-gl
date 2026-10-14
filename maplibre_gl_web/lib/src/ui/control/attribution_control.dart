import 'dart:js_interop';

import 'package:maplibre_gl_web/src/interop/interop.dart';
import 'package:maplibre_gl_web/src/interop/ui/control/attribution_control_interop.dart';
import 'package:maplibre_gl_web/src/ui/map.dart';

class AttributionControlOptions
    extends JsObjectWrapper<AttributionControlOptionsJsImpl> {
  factory AttributionControlOptions({
    bool? compact,
    List<String>? customAttribution,
  }) => AttributionControlOptions.fromJsObject(
    AttributionControlOptionsJsImpl(
      compact: compact,
      customAttribution: customAttribution?.map((s) => s.toJS).toList().toJS,
    ),
  );

  /// Creates a new AttributionControlOptions from a [jsObject].
  AttributionControlOptions.fromJsObject(super.jsObject) : super.fromJsObject();
}

/// An `AttributionControl` contains the map source credits.
///
/// @implements {IControl}
/// @param {Object} [options]
/// @param {Boolean} [options.compact] If `true`, the attribution control will always collapse when moving the map. If `false`,force the expanded attribution control. The default is a responsive attribution that collapses when the user moves the map on maps less than 640 pixels wide.
/// @param `{List<String>}` [options.customAttribution] Attributions to show in addition to any other attributions.
/// @example
/// var attribution = new maplibregl.AttributionControl();
/// map.addControl(attribution, 'top-left');
/// @see [Display map attribution controls](https://maplibre.org/maplibre-gl-js/docs/examples/attribution-position/)
class AttributionControl extends JsObjectWrapper<AttributionControlJsImpl> {
  AttributionControlOptions get options =>
      AttributionControlOptions.fromJsObject(jsObject.options);

  factory AttributionControl(AttributionControlOptions options) =>
      AttributionControl.fromJsObject(
        AttributionControlJsImpl(options.jsObject),
      );

  onAdd(MapLibreMap map) => jsObject.onAdd(map.jsObject);

  onRemove() => jsObject.onRemove();

  /// Whether the attached attribution control is expanded.
  bool get expanded =>
      jsObject.container.classList.contains('maplibregl-compact-show');

  /// Sets the attached compact control's state without changing its credits.
  ///
  /// Call after adding the control to the map. Establish compact mode even if
  /// the style has not supplied attribution yet, so MapLibre GL JS does not
  /// expand the control when its first source credits arrive.
  void setExpanded(bool expanded) {
    final container = jsObject.container;
    container.classList
      ..add('maplibregl-compact')
      ..toggle('maplibregl-compact-show', expanded);
    container.open = expanded;
  }

  /// Creates a new MapOptions from a [jsObject].
  AttributionControl.fromJsObject(super.jsObject) : super.fromJsObject();
}
