import 'package:flutter/material.dart';

ButtonStyle btnStyleColor(color) {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all(color),
  );
}