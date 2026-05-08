import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/climate_state.dart';

class PowerToggle extends StatelessWidget {
  const PowerToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ClimateState>();

    return GestureDetector(
      onTap: () => context.read<ClimateState>().togglePower(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF1A2634),
          borderRadius: BorderRadius.circular(20),
        ),

        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: state.isPowerOn
                        ? const Color(0xFF4DD9AC).withOpacity(0.15)
                        : Colors.grey.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.power_settings_new,
                    color: state.isPowerOn ? const Color(0xFF4DD9AC) : Colors.grey,
                    size: 20,
                  ),
                ),


                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Power',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      state.isPowerOn ? 'System is running' : 'System is off',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

              ],
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 52,
              height: 28,
              decoration: BoxDecoration(
                color: state.isPowerOn
                    ? const Color(0xFF4DD9AC)
                    : Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(14),
              ),
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 300),
                alignment: state.isPowerOn
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.all(3),
                  width: 22,
                  height: 22,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}