import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/rxdart.dart';
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

class _ViolationScreenState extends State<ViolationScreen> with SingleTickerProviderStateMixin {
  final BehaviorSubject<bool> _checkboxSubject = BehaviorSubject<bool>.seeded(false);

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: DurationConstant.d800,
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _checkboxSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'خلافی خودرو',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: Icon(
            IconManager.arrowBack,
            size: AppSize.s20,
            color: Theme.of(context).colorScheme.onSurface,
          ),
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
                    shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p12),
                  child: SVGWidget(
                    svgPath: SvgManager.traffic,
                    size: AppSize.s42,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
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
                    borderRadius:
                        const BorderRadius.all(Radius.circular(AppSize.s8))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p12, vertical: AppPadding.p8),
                  child: Row(
                    children: [
                      Text(
                        'BMW',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
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
              SlideTransition(
                position: _offsetAnimation,
                child: Container(
                  width: double.infinity,
                  height: AppSize.s120,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(AppSize.s8)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p12),
                        child: Row(
                          children: [
                            Text(
                              '1403/6/30',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p12),
                        child: InkwellButton(
                          onTap: () {},
                          borderColor: Theme.of(context).colorScheme.onPrimary,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          child: Text(
                            'پرداخت',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(),
              InkwellButton(
                onTap: () {
                  showModalBottomSheet(
                    isDismissible: true,
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return _buildAnimatedBottomSheet(context);
                    },
                  );
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

  Widget _buildAnimatedBottomSheet(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.5,
      maxChildSize: 0.8,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(AppSize.s18)),
          ),
          padding: const EdgeInsets.all(AppSize.s16),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: const Icon(
                        Icons.close,
                        size: AppSize.s28,
                        color: Colors.grey,
                      ),
                    ),
                    const Icon(
                      Icons.drag_handle,
                      size: AppSize.s28,
                      color: Colors.grey,
                    ),
                    const Icon(
                      Icons.drag_handle,
                      size: AppSize.s28,
                      color: Colors.transparent,
                    ),
                  ],
                ),
                Space.h16,
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'استعلام خلافی',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Space.h16,
                Container(
                  width: double.infinity,
                  height: AppSize.s60,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(AppSize.s12)),
                      border: Border.all(
                          width: AppSize.s1,
                          color: Theme.of(context).colorScheme.onSecondary)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'هزینه استعلام',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          '62,000 ریال',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                        ),
                      ],
                    ),
                  ),
                ),
                Space.h16,
                StreamBuilder<bool>(
                  stream: _checkboxSubject.stream,
                  initialData: _checkboxSubject.value,
                  builder: (BuildContext context, snapshot) {
                    final isChecked = snapshot.data ?? false;
                    return GestureDetector(
                      onTap: () {
                        _checkboxSubject.add(!isChecked);
                      },
                      child: AnimatedContainer(
                        duration: DurationConstant.d500,
                        padding:
                        const EdgeInsets.symmetric(vertical: AppPadding.p8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              activeColor: Theme.of(context).colorScheme.onPrimary,
                              checkColor: Theme.of(context).colorScheme.onSurface,
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _checkboxSubject.add(value!);
                                });
                              },
                            ),
                            Space.w8,
                            Text('استعلام با جزئیات می خواهم', style: Theme.of(context).textTheme.bodyMedium,),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Space.h12,
                Text('با انتخاب این گزینه، امکان مشاهده لیست جرایم به همراه جزئیات وجود دارد', style: Theme.of(context).textTheme.bodyMedium,),
                Space.h16,
                InkwellButton(
                  borderColor: Theme.of(context).colorScheme.onPrimary,
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'تائید',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
