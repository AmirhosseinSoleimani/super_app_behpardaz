import 'package:flutter/material.dart';
import 'package:super_app_behpardaz/src/features/home/domain/entity/grid_view_entity.dart';
import 'package:super_app_behpardaz/src/features/home/presentation/widgets/banner_screen.dart';
import 'package:super_app_behpardaz/src/features/home/presentation/widgets/drawer_widget.dart';
import 'package:super_app_behpardaz/src/features/home/presentation/widgets/grid_view_widget.dart';
import 'package:super_app_behpardaz/src/shared/resources/assets_manager.dart';
import 'package:super_app_behpardaz/src/shared/resources/value_manager.dart';
import 'package:super_app_behpardaz/src/shared/ui_kit/inkwell_button/inkwell_button.dart';
import 'package:super_app_behpardaz/src/shared/ui_kit/svg_widget/svg_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<GridViewEntity> gridViewList = [
    GridViewEntity(
        svgPath: SvgManager.car,
        title: 'خدمات خودرویی'
    ),
    GridViewEntity(
        svgPath: SvgManager.simCard,
        title: 'خرید شارژ'
    ),
    GridViewEntity(
        svgPath: SvgManager.bank,
        title: 'خدمات بانکی'
    ),
    GridViewEntity(
        svgPath: SvgManager.charity,
        title: 'نیکوکاری'
    ),
    GridViewEntity(
        svgPath: SvgManager.internet,
        title: 'خرید اینترنت'
    ),
    GridViewEntity(
        svgPath: SvgManager.hotel,
        title: 'هتل'
    ),
    GridViewEntity(
        svgPath: SvgManager.ticket,
        title: 'خرید بلیط'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Image.asset(ImageManager.logo, width: AppSize.s150,),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu, size: AppSize.s24, color: Theme.of(context).colorScheme.onSurface,),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer(); // باز کردن endDrawer
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: AppSize.s60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
              child: Row(
                children: [
                  Expanded(
                    child: InkwellButton(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      borderColor: Theme.of(context).colorScheme.secondary,
                      onTap: () {},
                      child: Row(
                        children: [
                          SVGWidget(svgPath: SvgManager.wallet, color: Theme.of(context).colorScheme.onSurface, size: AppSize.s28,),
                          Space.w4,
                          Text('کیف پول', style: Theme.of(context).textTheme.titleMedium,),
                          Space.w32,
                          Icon(IconManager.arrowForward, color: Theme.of(context).colorScheme.onSurface, size: AppSize.s16,)

                        ],
                      ),
                    ),
                  ),
                  Space.w8,
                  Expanded(
                    child: InkwellButton(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      borderColor: Theme.of(context).colorScheme.secondary,
                      onTap: () {},
                      child: Row(
                        children: [
                          SVGWidget(svgPath: SvgManager.card, color: Theme.of(context).colorScheme.onSurface, size: AppSize.s28,),
                          Space.w4,
                          Text('اعتبار خرید', style: Theme.of(context).textTheme.titleMedium,),
                          Space.w32,
                          Icon(IconManager.arrowForward, color: Theme.of(context).colorScheme.onSurface, size: AppSize.s16,)

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Space.h16,
          const SizedBox(
              width: double.infinity,
              height: 200,
              child: BannerScreen()),
          Expanded(child: GridViewScreen(gridViewList: gridViewList,)),
        ],
      ),
      drawer: const Drawer(
        child: DrawerWidget()
      ),
    );
  }
}



