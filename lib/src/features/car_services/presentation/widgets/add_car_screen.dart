import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:super_app_behpardaz/src/shared/resources/assets_manager.dart';
import 'package:super_app_behpardaz/src/shared/resources/value_manager.dart';
import 'package:super_app_behpardaz/src/shared/ui_kit/inkwell_button/inkwell_button.dart';

import 'car_plate_number.dart';

class AddCarScreen extends StatelessWidget {
  static const addCarScreenPath = '/add-car-services';
  static const addCarScreenName = 'add-car-services';
  const AddCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'افزودن خودرو',
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
            Align(
              alignment: Alignment.center,
              child: Text(
                'اطلاعات مورد نیاز را وارد کنید',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.start,
              ),
            ),
            Space.h16,
            const CarPlateNumber(),
            Space.h16,
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).colorScheme.secondary,
                hintText: 'نام وسیله نقلیه ( اختیاری )',
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
            ),
            Space.h8,
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'از این نام برای تفکیک بین پلاک ها استفاده کنید',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.start,
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
                'افزودن وسیله نقلیه',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
