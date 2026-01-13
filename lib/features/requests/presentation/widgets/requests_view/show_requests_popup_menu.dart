import 'package:beit_alnakha_admin/config/routes/routes.dart';
import 'package:beit_alnakha_admin/core/functions/build_popup_menu_items.dart';
import 'package:beit_alnakha_admin/core/functions/get_status_enum.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_view/add_note_request_dialog.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_view/delete_request_dialog.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/show_change_request_status_dialog.dart';
import 'package:beit_alnakha_admin/core/helper/enums.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/flutter_context_menu/core/models/context_menu.dart';
import 'package:beit_alnakha_admin/core/widgets/flutter_context_menu/core/models/context_menu_entry.dart';
import 'package:beit_alnakha_admin/core/widgets/flutter_context_menu/core/utils/helpers.dart';
import 'package:beit_alnakha_admin/core/widgets/status_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showRequestsPopupMenu(BuildContext context, Offset position) async {
  showContextMenu(
    context,
    contextMenu: ContextMenu(
      entries: <ContextMenuEntry>[
        buildContextMenuItem(
          context: context,
          action: MenuActionEnum.viewDetails,
          onSelected: (value) {
            context.pushNamed(
              Routes.requestDetailsView,
              pathParameters: {'requestId': '112000'},
            );
          },
        ),
        // buildContextMenuItem(
        //   context: context,
        //   action: MenuActionEnum.edit,
        //   onSelected: (value) {},
        // ),

        buildContextSubMenuItem(
          context: context,
          action: MenuActionEnum.updateStatus,
          // onSelected: (value) {
          //   // implement copy
          // },
          items: AppStrings.requestsStatusForPopupMenu
              .map(
                (e) => buildContextWidgetMenuItem(
                  context: context,
                  widget: StatusContainerWidget(status: e),
                  onSelected: (value) {
                    showChangeRequestStatusDialog(context: context, status: getStatusEnum(e));
                  },
                ),
              )
              .toList(),
        ),
        buildContextMenuItem(
          context: context,
          action: MenuActionEnum.addNote,
          onSelected: (value) {
            showDialog(
              context: context,
              builder: (context) {
                return AddNoteRequestDialog();
              },
            );
          },
        ),
        buildContextMenuItem(
          context: context,
          action: MenuActionEnum.delete,
          onSelected: (value) {
            showDialog(
              context: context,
              builder: (context) {
                return DeleteRequestDialog();
              },
            );
          },
        ),
      ],
      position: position,
      boxDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.size12),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.grey400,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: AppSize.size8),
    ),
  );
  // or
  // final selectedValue = await menu.show(context);
  //print(selectedValue);
}