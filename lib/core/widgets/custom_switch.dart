import 'package:flutter/material.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isGradient;


  const CustomSwitch({super.key, required this.value, required this.onChanged, this.isGradient=false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 50,
        height: 28,
        padding: const EdgeInsets.all(2.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: value ? AppColors.primary : AppColors.grey,
          gradient:isGradient? LinearGradient(
            colors: value
                ? [AppColors.primary.withValues(alpha: 0.6), AppColors.primary]
                : [AppColors.grey400, Colors.grey],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ):null,
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
