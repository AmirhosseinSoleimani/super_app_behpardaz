import 'package:flutter/material.dart';
import 'package:super_app_behpardaz/src/shared/resources/assets_manager.dart';
import 'package:super_app_behpardaz/src/shared/resources/color_manager.dart';
import 'package:super_app_behpardaz/src/shared/resources/value_manager.dart';

class CarPlateWidget extends StatelessWidget {
  const CarPlateWidget({super.key, required this.width, this.height, this.backgroundColor, required this.firstNumber, required this.areaCode, required this.secondNumber, required this.countryCode});
  final double width;
  final double? height;
  final Color? backgroundColor;
  final String firstNumber;
  final String areaCode;
  final String secondNumber;
  final String countryCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? AppSize.s80,
      decoration: BoxDecoration(
        color: backgroundColor ?? ColorDarkManager.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        border: Border.all(
          width: AppSize.s1,
          color: Theme.of(context).colorScheme.onSurface
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p4),
        child: Row(
          children: [
            Expanded(
              child: Text(
                  countryCode,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p4, horizontal: AppPadding.p4),
              child: VerticalDivider(
                thickness: AppSize.s1,
                color: Theme.of(context).colorScheme.onSecondary,
                width: AppSize.s1,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                  '$secondNumber $areaCode $firstNumber',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Expanded(
                child: Image.asset(ImageManager.iranFlag, fit: BoxFit.fill,)),
          ],
        ),
      ),
    );
  }
}
