@JS('d3.dsv')
library d3.src.csv;

import 'package:js/js.dart';

@JS('d3.dsv')
external dsv(url, [accessor, callback]);

@JS('d3.dsv')
class Dsv {
  Dsv(delimiter, mimeType);

  external parse(string, [accessor]);
  external parseRows(string, [accessor]);
  external format(rows);
  external formatRows(rows);
}
