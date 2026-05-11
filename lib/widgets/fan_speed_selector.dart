import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/climate_state.dart';
import '../constants/app_colors.dart';


// Segmented selector for fan speed — disabled when power is off

class FanSpeedSelector extends StatelessWidget {
  const FanSpeedSelector({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Fan Speed',
            style: TextStyle(color: AppColors.textMuted, fontSize: 14),
          ),
          const SizedBox(height: 16),
          Row(
            children: FanSpeed.values.map((speed) {
              final isSelected = state.fanSpeed == speed;
              final isEnabled = state.isPowerOn;
              final label =
                  speed.name[0].toUpperCase() + speed.name.substring(1);

              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: GestureDetector(
                    onTap: isEnabled
                        ? () => context.read<ClimateState>().setFanSpeed(speed)
                        : null,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: isSelected && isEnabled
                            ? AppColors.primary
                            : AppColors.background,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          label,
                          style: TextStyle(
                            color: isSelected && isEnabled
                                ? Colors.white
                                : AppColors.textPrimary
                                    .withOpacity(isEnabled ? 1 : 0.3),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}