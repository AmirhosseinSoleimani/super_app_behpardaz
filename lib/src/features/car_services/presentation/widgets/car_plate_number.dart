import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:super_app_behpardaz/src/shared/resources/assets_manager.dart';
import 'package:super_app_behpardaz/src/shared/resources/color_manager.dart';
import 'package:super_app_behpardaz/src/shared/resources/value_manager.dart';

class CarPlateNumber extends StatefulWidget {
  const CarPlateNumber({super.key});

  @override
  State<CarPlateNumber> createState() => _CarPlateNumberState();
}

class _CarPlateNumberState extends State<CarPlateNumber> {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> carTagCode = {
      '02': 'ب',
      '03': 'ت',
      '04': 'ج',
      '05': 'د',
      '06': 'س',
      '07': 'ص',
      '08': 'ط',
      '10': 'ق',
      '09': 'ع',
      '11': 'ل',
      '12': 'م',
      '13': 'ن',
      '14': 'و',
      '15': 'ه',
      '16': 'ی',
      '19': 'ژ',
    };
    return Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                height: AppSize.s60,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(2),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                        hintText: '--',
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary)
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'ایران',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
        Space.w8,
        Expanded(
          child: Container(
            height: AppSize.s60,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
            ),
            child: TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: '---',
                hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(3),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ),
        Space.w8,
        Expanded(
          child: Container(
              height: AppSize.s60,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
              ),
              child: GestureDetector(
                onTap: () {
                  showAlertDialog(
                    ctx: context,
                    carTagCode: carTagCode,
                    carTagCodeValue: 'tt',
                    carTagCodeKey: 'gg',
                    onTap: (val,t) {},
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ب',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p4),
                        child: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Theme.of(context).colorScheme.onSurface,
                          size: AppSize.s18,
                        ),
                      )
                    ],
                  ),
                ),
              )
          ),
        ),
        Space.w8,
        Expanded(
          child: Container(
            height: AppSize.s60,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
            ),
            child: TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: '--',
                  hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(2),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ),
        Space.w8,
        Expanded(
          child: Container(
            height: AppSize.s60,
            decoration: BoxDecoration(
                color: ColorDarkManager.blue,
                borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
              child: Image.asset(
                ImageManager.iranFlag,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
  void showAlertDialog(
      {required BuildContext ctx,
        required Map<String, String> carTagCode,
        required String carTagCodeValue,
        required String carTagCodeKey,
        required Function(String key, String value) onTap}) {
    List<MapEntry<String, String>> myMapEntries = carTagCode.entries.toList();
    showDialog(
        context: ctx,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s8),
            ), //this right here
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(AppSize.s8)),
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'انتخاب حرف پلاک',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: Icon(
                              IconManager.close,
                              color: Theme.of(context).colorScheme.onSurface,
                              size: AppSize.s18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // number of items in each row
                        mainAxisSpacing: 12, // spacing between rows
                        crossAxisSpacing: 12, // spacing between columns
                      ),
                      padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: myMapEntries.length, // total number of items
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            onTap(myMapEntries[index].key,
                                myMapEntries[index].value);
                            // FocusScope.of(ctx)
                            //     .requestFocus(_secondNumberNode);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surfaceContainer,
                                borderRadius: BorderRadius.circular(AppSize.s8)), // color of grid items
                            child: Center(
                              child: (myMapEntries[index].value == 'ژ')
                                  ? Icon(
                                IconManager.wheelchair,
                                size: AppSize.s18,
                                color: Theme.of(context).colorScheme.onSurface,
                              )
                                  : Text(
                                myMapEntries[index].value,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium,
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}



