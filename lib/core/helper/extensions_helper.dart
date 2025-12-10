import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

extension SliverExtension on Widget {
  SliverToBoxAdapter toSliver() => SliverToBoxAdapter(child: this);
}

extension MoneyHelper on num {
  String toFormatMoney() {
    // Convert to string and remove trailing zeros after decimal point
    String numStr = toStringAsFixed(2).replaceAll(RegExp(r'\.0+$'), '');
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    return numStr.replaceAllMapped(reg, (Match m) => '${m[1]},');
  }
}

extension CurrencyStringExtension on String {
  String toWithIraqCurrency() => '$this ${AppStrings.iraqCurrency}';
}
