import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_container_with_title.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_list_tile.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_phone_field.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_switch.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_text_field.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/widgets/agent_view/governorates_drop_down.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/widgets/agent_view/regions_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddAgentTextsFieldsSection extends StatelessWidget {
  const AddAgentTextsFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerWithTitle(
      child: Column(
        children: [
          CustomTextField(
            controller: TextEditingController(),
            prefixIcon: FittedBox(
              fit: BoxFit.scaleDown,
              child: SvgPicture.asset(AppAssets.username),
            ),
            validator: (value) {
              if (value!.trim().isEmpty) {
                return AppStrings.pleaseEnterUsername;
              }
              return null;
            },
            hintText: AppStrings.username,
          ),
          CustomPhoneField(
            paddingForBottom: 1,
            controller: TextEditingController(),
          ),
          CustomTextField(
            controller: TextEditingController(),
            enabledPasswordVisibility: true,
            obscureText: true,
            prefixIcon: FittedBox(
              fit: BoxFit.scaleDown,
              child: SvgPicture.asset(AppAssets.lock),
            ),
            validator: (value) {
              if (value!.trim().isEmpty) {
                return AppStrings.pleaseEnterPassword;
              } else if (value.length < 6) {
                return AppStrings.passwordIsTooShort;
              }
              return null;
            },
            hintText: AppStrings.password,
          ),
          GovernoratesDropDown(controller: TextEditingController()),
          RegionsDropDown(controller: TextEditingController()),
          CustomListTile(
            paddingForBottom: AppSize.size12,
            svgIconPath: AppAssets.status,
            titleText: AppStrings.agentStatus,
            trailing: CustomSwitch(value: true, onChanged: (value) {}),
          ),
        ],
      ),
    );
  }
}
