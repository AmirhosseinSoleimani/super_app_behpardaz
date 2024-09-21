import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:super_app_behpardaz/src/shared/resources/assets_manager.dart';
import 'package:super_app_behpardaz/src/shared/resources/color_manager.dart';
import 'package:super_app_behpardaz/src/shared/resources/value_manager.dart';
import 'package:super_app_behpardaz/src/shared/ui_kit/inkwell_button/inkwell_button.dart';
import 'package:super_app_behpardaz/src/shared/ui_kit/svg_widget/svg_widget.dart';

class BuyChargeScreen extends StatelessWidget {
  static const buyChargeScreenPath = '/buy_charge';
  static const buyChargeScreenName = 'buy_charge';
  const BuyChargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'خرید شارژ',
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
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: AppSize.s42,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(AppSize.s28)),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
                child: Row(
                  children: [
                    SVGWidget(svgPath: SvgManager.simCard, color: Theme.of(context).colorScheme.onSurface, size: AppSize.s24,),
                    Space.w8,
                    Text(
                      '09383202865',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      'امیرحسین',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
                    ),
                  ],
                ),
              ),
            ),
            Space.h16,
            Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 250,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p12),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: InkwellButton(
                                onTap: () {},
                                backgroundColor: ColorDarkManager.transparent,
                                borderColor: Theme.of(context).colorScheme.onSurface,
                                child: Text('20,000 ریال', style: Theme.of(context).textTheme.bodyMedium,),
                              ),
                            ),
                            Space.w8,
                            Expanded(
                              child: InkwellButton(
                                onTap: () {},
                                backgroundColor: ColorDarkManager.transparent,
                                borderColor: Theme.of(context).colorScheme.onSurface,
                                child: Text('50,000 ریال', style: Theme.of(context).textTheme.bodyMedium,),
                              ),
                            ),
                            Space.w8,
                            Expanded(
                              child: InkwellButton(
                                onTap: () {},
                                backgroundColor: ColorDarkManager.transparent,
                                borderColor: Theme.of(context).colorScheme.onSurface,
                                child: Text('100,000 ریال', style: Theme.of(context).textTheme.bodyMedium,),
                              ),
                            ),
                          ],
                        ),
                        Space.h8,
                        Row(
                          children: [
                            Expanded(
                              child: InkwellButton(
                                onTap: () {},
                                backgroundColor: ColorDarkManager.transparent,
                                borderColor: Theme.of(context).colorScheme.onSurface,
                                child: Text('200,000 ریال', style: Theme.of(context).textTheme.bodyMedium,),
                              ),
                            ),
                            Space.w4,
                            Expanded(
                              child: InkwellButton(
                                onTap: () {},
                                backgroundColor: ColorDarkManager.transparent,
                                borderColor: Theme.of(context).colorScheme.onSurface,
                                child: Text('500,000 ریال', style: Theme.of(context).textTheme.bodyMedium,),
                              ),
                            ),
                            Space.w4,
                            Expanded(
                              child: InkwellButton(
                                onTap: () {},
                                backgroundColor: ColorDarkManager.transparent,
                                borderColor: Theme.of(context).colorScheme.onSurface,
                                child: Text('1,000,000 ریال', style: Theme.of(context).textTheme.bodyMedium,),
                              ),
                            ),
                          ],
                        ),
                        Space.h8,
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text('لطفا مبلغ مورد نظر را وارد نمائید', style: Theme.of(context).textTheme.titleMedium,)),
                        Space.h12,
                        TextFormField(
                          decoration: InputDecoration(
                            label: Text('مبلغ داخواه', style: Theme.of(context).textTheme.bodyMedium,),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: AppSize.s1,
                                color: Theme.of(context).colorScheme.onSurface
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: AppSize.s1,
                                  color: Theme.of(context).colorScheme.onSurface
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: AppSize.s1,
                                  color: Theme.of(context).colorScheme.onSurface
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Space.h16,
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'مبلغ شارژ باید ضریبی از 10000 ریال باشد',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Space.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'مبلغ قابل پرداخت',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  '50,000 ریال',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ],
            ),
            const Spacer(),
            InkwellButton(
              onTap: () {
              },
              borderColor: Theme.of(context).colorScheme.onPrimary,
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              child: Text(
                'ادامه',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )


          ],
        ),
      ),
    );
  }
}
