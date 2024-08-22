import 'package:flutter/material.dart';

final _navKey = GlobalKey<NavigatorState>();

GlobalKey<NavigatorState> get navKey => _navKey;

NavigatorState? get navigator => _navKey.currentState;