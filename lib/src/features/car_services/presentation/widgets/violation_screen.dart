import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:super_app_behpardaz/src/shared/resources/assets_manager.dart';
import 'package:super_app_behpardaz/src/shared/resources/value_manager.dart';
import 'package:super_app_behpardaz/src/shared/ui_kit/inkwell_button/inkwell_button.dart';
import 'package:super_app_behpardaz/src/shared/ui_kit/svg_widget/svg_widget.dart';

import 'car_plate_widget.dart';

class ViolationScreen extends StatefulWidget {
  static const violationScreenPath = '/violation-services';
  static const violationScreenName = 'violation-services';
  const ViolationScreen({super.key});

  @override
  State<ViolationScreen> createState() => _ViolationScreenState();
}

class _ViolationScreenState extends State<ViolationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'خلافی خودرو',
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
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p12),
                    child: SVGWidget(svgPath: SvgManager.traffic, size: AppSize.s42, color: Theme.of(context).colorScheme.onPrimary,),
                  ),
              ),
              Space.h8,
              Text(
                'پرداخت خلافی خودرو',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Space.h32,
              Container(
                width: double.infinity,
                height: AppSize.s60,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12, vertical: AppPadding.p8),
                  child: Row(
                    children: [
                      Text('BMW', style: Theme.of(context).textTheme.titleMedium,),
                      const Spacer(),
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
              Space.h16,
              Container(
                width: double.infinity,
                height: AppSize.s120,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
                      child: Row(
                        children: [
                          Text(
                            '1403/6/30',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
                          ),
                          const Spacer(),
                          Text(
                              '13,650,000 ریال',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                    Space.h8,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
                      child: InkwellButton(
                        onTap: () {},
                        borderColor: Theme.of(context).colorScheme.onPrimary,
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        child: Text(
                          'پرداخت',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              InkwellButton(
                onTap: () {
                  context.pop();
                },
                borderColor: Theme.of(context).colorScheme.onPrimary,
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                child: Text(
                  'استعلام خلافی',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
