library d3.src.js.behavior;

import 'dart:js';
import 'd3.dart';

import 'selection.dart' as sel;
import 'scale.dart' as sc;
import 'transition.dart' as trans;

JsObject _behavior = context['d3']['behavior'];

Drag drag() => new Drag._(_behavior.callMethod('drag'));

class Drag {
  final JsObject _proxy;

  Drag._(this._proxy);

  factory Drag() => drag();

  /// Apply the drag behavior to the selected elements.
  Drag call(selection) {
    var args = []; // this = selection in drag.js#L17
    if (selection is sel.Selection) {
      args.add(sel.getProxy(selection));
    } else if (selection is trans.Transition) {
      args.add(trans.getProxy(selection));
    } else if (selection is JsArray) {
      args.add(selection);
    } else {
      throw new ArgumentError.value(selection);
    }
    return new Drag._(_proxy.callMethod('call', args));
  }

  Drag on(String type, [/*Function*/ listener = undefined]) {
    var args = [type];
    if (listener != undefined) {
      args.add(func4VarArgs(listener));
    }
    var retval = _proxy.callMethod('on', args);
    if (listener == undefined) {
      return retval;
    } else {
      return new Drag._(retval);
    }
  }

  Drag origin([/*Function*/ origin = undefined]) {
    var args = [];
    if (origin != undefined) {
      args.add(origin);
    }
    var retval = _proxy.callMethod('origin', args);
    if (origin == undefined) {
      return retval;
    } else {
      return new Drag._(retval);
    }
  }
}

/// Create a zoom behavior.
Zoom zoom() => new Zoom._(_behavior.callMethod('zoom'));

class Zoom {
  final JsObject _proxy;

  Zoom._(this._proxy);

  factory Zoom() => zoom();

  /// Apply the zoom behavior to the selected elements.
  call(selection) {
    var args = [_proxy];
    if (selection is sel.Selection) {
      args.add(sel.getProxy(selection));
    } else if (selection is trans.Transition) {
      args.add(trans.getProxy(selection));
    } else if (selection is JsArray) {
      args.add(selection);
    } else {
      throw new ArgumentError.value(selection);
    }
    return new Zoom._(_proxy.callMethod('call', args));
  }

  /// The current translate offset.
  translate([/*List*/ translate = undefined]) {
    var args = [];
    if (translate != undefined) {
      args.add(new JsObject.jsify(translate));
    }
    var retval = _proxy.callMethod('translate', args);
    if (translate == undefined) {
      return retval;
    } else {
      return new Zoom._(retval);
    }
  }

  /// The current scale factor.
  scale([/*num*/ scale = undefined]) {
    var args = [];
    if (scale != undefined) {
      args.add(scale);
    }
    var retval = _proxy.callMethod('scale', args);
    if (scale == undefined) {
      return retval;
    } else {
      return new Zoom._(retval);
    }
  }

  /// Optional limits on the scale factor.
  scaleExtent([/*List*/ extent = undefined]) {
    var args = [];
    if (extent != undefined) {
      args.add(new JsObject.jsify(extent));
    }
    var retval = _proxy.callMethod('scaleExtent', args);
    if (extent == undefined) {
      return retval;
    } else {
      return new Zoom._(retval);
    }
  }

  /// An optional focal point for mousewheel zooming.
  center([/*List*/ center = undefined]) {
    var args = [];
    if (center != undefined) {
      args.add(new JsObject.jsify(center));
    }
    var retval = _proxy.callMethod('center', args);
    if (center == undefined) {
      return retval;
    } else {
      return new Zoom._(retval);
    }
  }

  /// The dimensions of the viewport.
  size([/*List*/ size = undefined]) {
    var args = [];
    if (size != undefined) {
      args.add(new JsObject.jsify(size));
    }
    var retval = _proxy.callMethod('size', args);
    if (size == undefined) {
      return retval;
    } else {
      return new Zoom._(retval);
    }
  }

  /// An optional scale whose domain is bound to the x extent of the viewport.
  x([x = undefined]) {
    var args = [];
    if (x != undefined) {
      args.add(sc.getProxy(x));
    }
    var retval = _proxy.callMethod('x', args);
    if (x == undefined) {
      return retval; // TODO: wrap in Scale
    } else {
      return new Zoom._(retval);
    }
  }

  /// An optional scale whose domain is bound to the y extent of the viewport.
  y([y = undefined]) {
    var args = [];
    if (y != undefined) {
      args.add(sc.getProxy(y));
    }
    var retval = _proxy.callMethod('y', args);
    if (y == undefined) {
      return retval; // TODO: wrap in Scale
    } else {
      return new Zoom._(retval);
    }
  }

  /// Listeners for when the scale or translate changes.
  Zoom on(String type, Function listener) {
    return new Zoom._(_proxy.callMethod('on', [type, func4VarArgs(listener)]));
  }

  /// Dispatch zoom events after setting the scale or translate.
  Zoom event(selection) {
    var args = [];
    if (selection is sel.Selection) {
      args.add(sel.getProxy(selection));
    } else if (selection is trans.Transition) {
      args.add(trans.getProxy(selection));
    } else if (selection is JsArray) {
      args.add(selection);
    } else {
      throw new ArgumentError.value(selection);
    }
    return new Zoom._(_proxy.callMethod('event', args));
  }

  /// Get or set the dblclick transition duration.
  duration([/*num*/ duration = undefined]) {
    var args = [];
    if (duration != undefined) {
      args.add(sc.getProxy(duration));
    }
    var retval = _proxy.callMethod('duration', args);
    if (duration == undefined) {
      return retval;
    } else {
      return new Zoom._(retval);
    }
  }
}
