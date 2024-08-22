import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

SnackBar appSnackBar(String message, Color backgroundColor) => SnackBar(
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      content: Text(
        message,
       
      ),
    );