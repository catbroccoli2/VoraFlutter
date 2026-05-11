import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/climate_state.dart';
import '../widgets/temperature_control.dart';
import '../widgets/fan_speed_selector.dart';
import '../widgets/power_toggle.dart';
import '../widgets/reading_card.dart';
import '../constants/app_colors.dart';

class ClimateScreen extends StatelessWidget {
  const ClimateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ClimateState>();

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: AppColors.primary,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: SafeArea(
              bottom: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/vora.png', height: 32),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 8,
                          color: state.isPowerOn
                              ? Colors.greenAccent
                              : Colors.grey,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          state.isPowerOn ? 'Active' : 'Off',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Living Room',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Climate Control',
                    style: TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: ReadingCard(
                          icon: Icons.thermostat,
                          label: 'Current Temp',
                          value: '${state.currentTemperature}°C',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ReadingCard(
                          icon: Icons.water_drop_outlined,
                          label: 'Humidity',
                          value: '${state.currentHumidity}%',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const PowerToggle(),
                  const SizedBox(height: 16),
                  const TemperatureControl(),
                  const SizedBox(height: 16),
                  const FanSpeedSelector(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}