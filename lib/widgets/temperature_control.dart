import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/climate_state.dart';
import '../constants/app_colors.dart';


// Allows user to increment/decrement target temperature within set bounds

class TemperatureControl extends StatelessWidget {
  const TemperatureControl({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ClimateState>();

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Target Temperature',
            style: TextStyle(
              color: AppColors.textMuted,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ControlButton(
                icon: Icons.remove,
                onTap: state.isPowerOn
                    ? context.read<ClimateState>().decreaseTemperature
                    : null,
              ),
              const SizedBox(width: 32),
              Text(
                '${state.targetTemperature.toInt()}°C',
                style: const TextStyle(
                  fontSize: 52,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(width: 32),
              _ControlButton(
                icon: Icons.add,
                onTap: state.isPowerOn
                    ? context.read<ClimateState>().increaseTemperature
                    : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _ControlButton({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isEnabled = onTap != null;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: isEnabled
              ? AppColors.primary.withOpacity(0.1)
              : Colors.grey.withOpacity(0.1),
          shape: BoxShape.circle,
          border: Border.all(
            color: isEnabled ? AppColors.primary : Colors.grey,
            width: 1.5,
          ),
        ),
        child: Icon(
          icon,
          color: isEnabled ? AppColors.primary : Colors.grey,
          size: 20,
        ),
      ),
    );
  }
}