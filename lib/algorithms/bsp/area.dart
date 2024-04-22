import 'dart:math';

import 'package:logging/logging.dart';
// ignore: unused_import
import 'package:rogue_adventure/algorithms/bsp/extention/list2d_extention.dart';

class Point {
  late int y;
  late int x;
  Point({required this.y, required this.x});

  double squaredDistanceOf(Point p) {
    return sqrt(pow(p.y - y, 2) + pow(p.x - x, 2));
  }

  Point distanceOf(Point destination) {
    return Point(y: destination.y - y, x: destination.x - x);
  }

  bool isCompletelyLargerThan(Point p) {
    return y > p.y && x > p.x;
  }

  Point deepCopy() {
    return Point(y: y, x: x);
  }

  @override
  String toString() {
    return "y: $y, x: $x";
  }
}

class Area {
  final Logger logging = Logger('Area');
  late Point from;
  late Point to;

  Area({required this.from, required this.to});

  bool isIn(int y, int x) =>
      y >= from.y && y <= to.y && x >= from.x && x <= to.x;

  Point center() {
    return Point(y: (from.y + to.y) ~/ 2, x: (from.x + to.x) ~/ 2);
  }

  List<int> shape() {
    return [to.y - from.y, to.x - from.x];
  }

  Duplicate overWrapDirectionTo(Area another) {
    List<int> xRange =
        List.generate(to.x - from.x + 1, (index) => index + from.x);
    List<int> anotherXRange = List.generate(
        another.to.x - another.from.x + 1, (index) => index + another.from.x);

    List<int> duplication =
        xRange.where((element) => anotherXRange.contains(element)).toList();


    if (duplication.isNotEmpty) {
      return Duplicate.X;
    }

    List<int> yRange =
        List.generate(to.y - from.y + 1, (index) => index + from.y);
    List<int> anotherYRange = List.generate(
        another.to.y - another.from.y + 1, (index) => index + another.from.y);


    duplication =
        yRange.where((element) => anotherYRange.contains(element)).toList();

    if (duplication.isNotEmpty) {
      return Duplicate.Y;
    }

    return Duplicate.none;
  }

  Point getRandomPoint() {
    return Point(
        y: Random().nextInt(to.y - from.y) + from.y,
        x: Random().nextInt(to.x - from.x) + from.x);
  }

  Area add(Point p) {
    return Area(
        from: Point(y: from.y + p.y, x: from.x + p.x),
        to: Point(y: to.y + p.y, x: to.x + p.x));
  }

  void modify() {
    if (from.x > to.x) {
      logging.info("before: ${toString()}");
      int tmp = from.x;
      from.x = to.x;
      to.x = tmp;
      logging.info("after: ${toString()}");
    }
    if (from.y > to.y) {
      logging.info("before: ${toString()}");
      int tmp = from.y;
      from.y = to.y;
      to.y = tmp;
      logging.info("after: ${toString()}");
    }
  }

  @override
  String toString() {
    return "from (y: ${from.y}, x: ${from.x}) to (y: ${to.y}, x: ${to.x})";
  }
}

enum Duplicate { X, Y, none }
