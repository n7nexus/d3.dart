import 'package:unittest/unittest.dart';

import '../../src/selection/selection.dart' as d4;

void main() {
  group('on select(body)', () {
    group('on an initially-empty page', () {
      Selection body = d4.select('body');
      test('sets a property as a string', () {
        body.style('background-color', 'red');
        expect(body.node().style.getPropertyValue('background-color'), equals('red'));
      });
      test('sets a property as a number', () {
        body.style('opacity', .3);
        expect(body.node().style.getPropertyValue('opacity'), equals('0.3'));
      });
      test('sets a property as a function', () {
        body.style('background-color', () { return 'orange'; });
        expect(body.node().style.getPropertyValue('background-color'), equals('orange'));
      });
      test('sets properties as a map of constants', () {
        body.style({'background-color': 'white', opacity: .42});
        expect(body.node().style.getPropertyValue('background-color'), equals('white'));
        expect(body.node().style.getPropertyValue('opacity'), equals('0.42'));
      });
      test('sets properties as a map of functions', () {
        body.data(['orange']).style({'background-color': String, opacity: (d, i) { return i; }});
        expect(body.node().style.getPropertyValue('background-color'), equals('orange'));
        expect(body.node().style.getPropertyValue('opacity'), equals('0'));
      });
      test('gets a property value', () {
        body.node().style.setProperty('background-color', 'yellow', '');
        expect(body.style('background-color'), equals('yellow'));
      });
      test('observes the specified priority', () {
        body.style('background-color', 'green', 'important');
        expect(body.node().style.getPropertyPriority('background-color'), equals('important'));
        body.style({opacity: .52}, 'important');
        expect(body.node().style.getPropertyPriority('opacity'), equals('important'));
        body.style({visibility: () { return 'visible'; }}, 'important');
        expect(body.node().style.getPropertyPriority('visibility'), equals('important'));
      });
      test('removes a property as null', () {
        body.style('background-color', 'green').style('background-color', null);
        expect(body.style('background-color'), equals(''));
      });
      test('removes a property as a function', () {
        body.style('background-color', 'green').style('background-color', () { return null; });
        expect(body.style('background-color'), equals(''));
      });
      test('removes properties as a map of nulls', () {
        body.node().style.setProperty('background-color', 'purple');
        body.style({'background-color': null});
        expect(body.style('background-color'), equals(''));
      });
      test('removes properties as a map of functions that return null', () {
        body.node().style.setProperty('background-color', 'purple');
        body.style({'background-color': () {}});
        expect(body.style('background-color'), equals(''));
      });
      test('returns the current selection', () {
        expect(body.style('background-color', 'green'), same(body));
      });
    });
  });
}
