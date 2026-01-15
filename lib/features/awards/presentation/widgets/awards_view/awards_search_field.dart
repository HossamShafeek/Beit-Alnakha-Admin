import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/search_field.dart';
import 'package:flutter/material.dart';

class AwardsSearchField extends StatelessWidget {
  const AwardsSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.sizeForSearchField,
      child: SearchField(
        controller: TextEditingController(),
        hintText: AppStrings.searchWithAwardName,
      ),
    );
  }
}
