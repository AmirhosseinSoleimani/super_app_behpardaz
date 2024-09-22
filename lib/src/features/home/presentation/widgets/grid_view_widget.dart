import 'package:flutter/material.dart';
import 'package:super_app_behpardaz/src/features/home/domain/entity/grid_view_entity.dart';
import 'package:super_app_behpardaz/src/shared/resources/value_manager.dart';
import 'package:super_app_behpardaz/src/shared/ui_kit/inkwell_button/inkwell_button.dart';
import 'package:super_app_behpardaz/src/shared/ui_kit/svg_widget/svg_widget.dart';
class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key, required this.gridViewList});
  final List<GridViewEntity> gridViewList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 1.0,
        ),
        itemCount: gridViewList.length,
        itemBuilder: (context, index) {
          return GridContainer(
            svgPath: gridViewList[index].svgPath ?? '',
            title: gridViewList[index].title ?? '',
            onTap: gridViewList[index].onTap ?? () {
            },

          );
        },
      ),
    );
  }
}

class GridContainer extends StatelessWidget {
  const GridContainer({super.key, required this.svgPath, required this.title, required this.onTap});
  final String svgPath;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkwellButton(
      onTap: onTap,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      borderRadius: AppSize.s12,
      borderColor: Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          SVGWidget(svgPath: svgPath, color: Theme.of(context).colorScheme.onSurface, size: AppSize.s28,),
          Space.h4,
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}