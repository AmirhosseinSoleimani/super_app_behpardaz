import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_behpardaz/src/shared/resources/assets_manager.dart';
import 'package:super_app_behpardaz/src/shared/resources/value_manager.dart';
import 'package:super_app_behpardaz/src/shared/theme/provider/theme_controller.dart';
import 'package:super_app_behpardaz/src/shared/theme/provider/theme_provider.dart';
import 'package:super_app_behpardaz/src/shared/ui_kit/inkwell_button/inkwell_button.dart';
import 'package:super_app_behpardaz/src/shared/ui_kit/svg_widget/svg_widget.dart';

class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeControllerProvider);
    return Container(
      color: Theme
          .of(context)
          .colorScheme
          .secondary,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          children: [
            Space.h64,
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'شماره موبایل',
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineMedium,
              ),
            ),
            Space.h4,
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                '09123456789',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall,
              ),
            ),
            Space.h8,
            SizedBox(
              width: double.infinity,
              height: AppSize.s60,
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('امتیاز شما:', style: Theme
                              .of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Theme
                              .of(context)
                              .colorScheme
                              .onSecondary)),
                          Space.h8,
                          Text('1625', style: Theme
                              .of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: Theme
                              .of(context)
                              .colorScheme
                              .secondaryContainer))
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppPadding.p12),
                    child: VerticalDivider(
                      thickness: AppSize.s1,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .onSecondary,
                      width: AppSize.s1,
                    ),
                  ),
                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('اشتراک', style: Theme
                              .of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Theme
                              .of(context)
                              .colorScheme
                              .onSecondary)),
                          Space.h8,
                          Text('اشتراک', style: Theme
                              .of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: Theme
                              .of(context)
                              .colorScheme
                              .onPrimary)),
                        ],
                      )),
                ],
              ),
            ),
            Space.h12,
            InkwellButton(
              onTap: () {},
              backgroundColor: Theme
                  .of(context)
                  .colorScheme
                  .secondary,
              borderColor: Theme
                  .of(context)
                  .colorScheme
                  .onSecondary,
              borderRadius: AppSize.s28,
              child: Row(
                children: [
                  Text(
                    'باشگاه مشتریان',
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium,
                  ),
                  Space.w4,
                  Icon(IconManager.arrowForward, color: Theme
                      .of(context)
                      .colorScheme
                      .onSecondary, size: AppSize.s20,)
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: Text('حالت تاریک', style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium),
                    leading: AnimatedSwitcher(
                        duration: DurationConstant.d300,
                        child: themeState.maybeWhen(
                            data: (theme) =>
                            theme.appTheme == AppTheme.light
                                ? SVGWidget(svgPath: SvgManager.sun,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onSecondary,
                              size: AppSize.s24,) :
                            SVGWidget(svgPath: SvgManager.moon, color: Theme.of(context).colorScheme.onSecondary, size: AppSize.s24,),
                            orElse: () =>
                                SVGWidget(svgPath: SvgManager.brightnessAuto,
                                  color: Theme
                                      .of(context)
                                      .colorScheme
                                      .onSecondary,
                                  size: AppSize.s24,))),
                    trailing: Transform.scale(
                      scale: 1.1,
                      child: Switch(
                        value: themeState.maybeWhen(
                          data: (theme) => theme.appTheme == AppTheme.dark,
                          orElse: () => false,
                        ),
                        inactiveThumbColor: Theme
                            .of(context)
                            .colorScheme
                            .onSecondary,
                        inactiveTrackColor: Theme
                            .of(context)
                            .colorScheme
                            .secondary,
                        activeColor: Theme
                            .of(context)
                            .colorScheme
                            .onPrimary,
                        onChanged: (value) {
                          ref.read(themeControllerProvider.notifier)
                              .toggleTheme(
                              themeState.maybeWhen(
                                  data: (theme) =>
                                  theme.appTheme == AppTheme.light ? AppTheme
                                      .dark : AppTheme.light,
                                  orElse: () => AppTheme.light
                              ));
                        },
                      ),
                    ),
                    onTap: () {
                      // Handle item tap
                    },
                  ),
                  ListTile(
                    title: Text('فهرست تراکنش ها', style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium),
                    leading: SVGWidget(svgPath: SvgManager.history, color: Theme
                        .of(context)
                        .colorScheme
                        .onSecondary, size: AppSize.s24,),
                    onTap: () {
                      // Handle item tap
                    },
                  ),
                  ListTile(
                    title: Text('درباره ما', style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium),
                    leading: SVGWidget(svgPath: SvgManager.info, color: Theme
                        .of(context)
                        .colorScheme
                        .onSecondary, size: AppSize.s24,),
                    onTap: () {
                      // Handle item tap
                    },
                  ),
                  ListTile(
                    title: Text('خروج از حساب کاربری', style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Theme
                        .of(context)
                        .colorScheme
                        .error)),
                    leading: SVGWidget(svgPath: SvgManager.logOut, color: Theme
                        .of(context)
                        .colorScheme
                        .error, size: AppSize.s24,),
                    onTap: () {
                      // Handle item tap
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
