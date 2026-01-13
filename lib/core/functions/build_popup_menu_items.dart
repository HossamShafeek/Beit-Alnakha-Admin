import 'package:beit_alnakha_admin/core/helper/enums.dart';
import 'package:beit_alnakha_admin/core/helper/menu_action_extension.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/flutter_context_menu/components/menu_item.dart';
import 'package:beit_alnakha_admin/core/widgets/flutter_context_menu/core/models/context_menu_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<PopupMenuEntry<MenuActionEnum>> buildPopupMenuItems(
  BuildContext context,
  List<MenuActionEnum> actions,
) {
  return actions.map((action) {
    return PopupMenuItem<MenuActionEnum>(
      value: action,
      child: Row(
        children: [
          SvgPicture.asset(
            action.icon,
            height: AppSize.size24,
            width: AppSize.size24,
            colorFilter: ColorFilter.mode(action.color, BlendMode.srcIn),
          ),
          const SizedBox(width: AppSize.size8),
          Text(
            action.title,
            style: AppStyles.medium16(context).copyWith(color: action.color),
          ),
        ],
      ),
    );
  }).toList();
}

List<MenuItem<ContextMenuEntry>> buildContextPopupMenuItems({
  required BuildContext context,
  required List<MenuActionEnum> actions,
  void Function(ContextMenuEntry?)? onSelected,
}) {
  return actions.map((action) {
    return buildContextMenuItem(
      context: context,
      action: action,
      onSelected: onSelected,
    );
  }).toList();
}

MenuItem<ContextMenuEntry> buildContextMenuItem({
  required BuildContext context,
  required MenuActionEnum action,
  void Function(ContextMenuEntry?)? onSelected,
}) {
  return MenuItem<ContextMenuEntry>(
    label: Text(
      action.title,
      style: AppStyles.medium16(context).copyWith(color: action.color),
    ),
    icon: FittedBox(
      fit: BoxFit.scaleDown,
      child: SvgPicture.asset(
        action.icon,
        height: AppSize.size24,
        width: AppSize.size24,
        colorFilter: ColorFilter.mode(action.color, BlendMode.srcIn),
      ),
    ),
    onSelected: onSelected,
  );
}

MenuItem<ContextMenuEntry> buildContextSubMenuItem({
  required BuildContext context,
  required MenuActionEnum action,
  void Function(ContextMenuEntry?)? onSelected,
  required List<ContextMenuEntry<ContextMenuEntry<dynamic>>> items
}) {
  return MenuItem.submenu(
    items: items,
    label: Text(
      action.title,
      style: AppStyles.medium16(context).copyWith(color: action.color),
    ),
    icon: FittedBox(
      fit: BoxFit.scaleDown,
      child: SvgPicture.asset(
        action.icon,
        height: AppSize.size24,
        width: AppSize.size24,
        colorFilter: ColorFilter.mode(action.color, BlendMode.srcIn),
      ),
    ),
    onSelected: onSelected,
    trailing: FittedBox(
      fit: BoxFit.scaleDown,
      child: RotatedBox(
        quarterTurns: 2,
        child: SvgPicture.asset(
          AppAssets.arrowRight,
          height: AppSize.size24,
          width: AppSize.size24,
          colorFilter: ColorFilter.mode(
            AppColors.secondaryBlack,
            BlendMode.srcIn,
          ),
        ),
      ),
    ),
  );
}

MenuItem<ContextMenuEntry> buildContextWidgetMenuItem({
  required BuildContext context,
  required Widget widget,
  void Function(ContextMenuEntry?)? onSelected,
}) {
  return MenuItem<ContextMenuEntry>(
    replaceItemWidget: widget,
    onSelected: onSelected,
  );
}