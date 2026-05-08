import 'package:flutter/material.dart';

enum FanSpeed { low, medium, high }

class ClimateState extends ChangeNotifier {
  final String roomName = 'Living Room';
  final double currentTemperature = 23.5;
  final int currentHumidity = 62;

  double _targetTemperature = 22.0;
  bool _isPowerOn = true;
  FanSpeed _fanSpeed = FanSpeed.medium;

  double get targetTemperature => _targetTemperature;
  bool get isPowerOn => _isPowerOn;
  FanSpeed get fanSpeed => _fanSpeed;

  void increaseTemperature() {
    if (_targetTemperature < 30) {
      _targetTemperature++;
      notifyListeners();
    }
  }

  void decreaseTemperature() {
    if (_targetTemperature > 16) {
      _targetTemperature--;
      notifyListeners();
    }
  }

  void togglePower() {
    _isPowerOn = !_isPowerOn;
    notifyListeners();
  }

  void setFanSpeed(FanSpeed speed) {
    _fanSpeed = speed;
    notifyListeners();
  }
}