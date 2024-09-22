import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:super_app_behpardaz/src/features/car_services/domain/entity/aid_car_entity.dart';
import 'package:super_app_behpardaz/src/features/car_services/presentation/widgets/add_car_screen.dart';
import 'package:super_app_behpardaz/src/features/car_services/presentation/widgets/car_plate_widget.dart';
import 'package:super_app_behpardaz/src/features/car_services/presentation/widgets/violation_screen.dart';
import 'package:super_app_behpardaz/src/features/car_services/presentation/widgets/web_view_page.dart';
import 'package:super_app_behpardaz/src/shared/resources/assets_manager.dart';
import 'package:super_app_behpardaz/src/shared/resources/color_manager.dart';
import 'package:super_app_behpardaz/src/shared/resources/value_manager.dart';
import 'package:super_app_behpardaz/src/shared/ui_kit/svg_widget/svg_widget.dart';

class CarServicesScreen extends StatelessWidget {
  static const carServicesScreenPath = '/car-services';
  static const carServicesScreenName = 'car-services';
  const CarServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'خدمات خودرویی',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: Icon(IconManager.arrowBack, size: AppSize.s20, color: Theme.of(context).colorScheme.onSurface,),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'وسیله های نقلیه',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    context.push(AddCarScreen.addCarScreenPath);
                  },
                  child: Row(
                    children: [
                      Text(
                        'افزودن خودرو',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                      ),
                      Icon(
                        IconManager.add,
                        size: AppSize.s24,
                        color: Theme.of(context).colorScheme.onPrimary,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: AppSize.s150,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12))
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: AppPadding.p8, left: AppPadding.p8),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('BMW', style: Theme.of(context).textTheme.titleMedium,),
                              Space.h12,
                              const CarPlateWidget(
                                width: AppSize.s150,
                                height: AppSize.s42,
                                firstNumber: '75',
                                areaCode: 'و',
                                secondNumber: '258',
                                countryCode: '40',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: FractionalOffset.centerRight,
                child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.6,
                    height: AppSize.s150,
                    color: ColorDarkManager.transparent,
                    child: SVGWidget(svgPath: SvgManager.bmw, size: AppSize.s150, color: Theme.of(context).colorScheme.onSurface, boxFit: BoxFit.cover,),
                ),
              )
            ],
          ),
          Space.h16,
          Container(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: AppSize.s60,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12))
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
              child: Row(
                children: [
                  SVGWidget(svgPath: SvgManager.road, size: AppSize.s24, color: Theme.of(context).colorScheme.onPrimary,),
                  Space.w8,
                  Text(
                    'عوارض آزادراهی',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(),
                  Icon(
                    IconManager.arrowForward,
                    size: AppSize.s18,
                    color: Theme.of(context).colorScheme.onSurface,
                  )
                ],
              ),
            ),
          ),
          Space.h16,
          InkWell(
            onTap: () {
              context.push(ViolationScreen.violationScreenPath);
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: AppSize.s60,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
                child: Row(
                  children: [
                    SVGWidget(svgPath: SvgManager.traffic, size: AppSize.s32, color: Theme.of(context).colorScheme.onPrimary,),
                    Space.w8,
                    Text(
                      'خلافی',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Spacer(),
                    Icon(
                      IconManager.arrowForward,
                      size: AppSize.s18,
                      color: Theme.of(context).colorScheme.onSurface,
                    )
                  ],
                ),
              ),
            ),
          ),
          Space.h16,
          Container(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: AppSize.s60,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12))
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
              child: Row(
                children: [
                  SVGWidget(svgPath: SvgManager.cctv, size: AppSize.s32, color: Theme.of(context).colorScheme.onPrimary,),
                  Space.w8,
                  Text(
                    'طرح ترافیک ( ویژه تهران )',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(),
                  Icon(
                    IconManager.arrowForward,
                    size: AppSize.s18,
                    color: Theme.of(context).colorScheme.onSurface,
                  )
                ],
              ),
            ),
          ),
          Space.h16,
          Container(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: AppSize.s60,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12))
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
              child: Row(
                children: [
                  SVGWidget(svgPath: SvgManager.carReport, size: AppSize.s32, color: Theme.of(context).colorScheme.onPrimary,),
                  Space.w8,
                  Text(
                    'خدمات گواهی نامه',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(),
                  Icon(
                    IconManager.arrowForward,
                    size: AppSize.s18,
                    color: Theme.of(context).colorScheme.onSurface,
                  )
                ],
              ),
            ),
          ),
          Space.h16,
          InkWell(
            onTap: () {
              context.push(WebViewPage.webViewScreenPath, extra: AidCarEntity(
                title: 'امداد خودروی سایپا',
                url: 'https://emdad.behpardaz.net'
              ));
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: AppSize.s60,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
                child: Row(
                  children: [
                    SVGWidget(svgPath: SvgManager.carRepair, size: AppSize.s32, color: Theme.of(context).colorScheme.onPrimary,),
                    Space.w8,
                    Text(
                      'امداد خودروی سایپا',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Spacer(),
                    Icon(
                      IconManager.arrowForward,
                      size: AppSize.s18,
                      color: Theme.of(context).colorScheme.onSurface,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
