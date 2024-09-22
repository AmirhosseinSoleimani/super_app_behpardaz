import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:super_app_behpardaz/src/features/bank_services/presentation/widgets/result_card_to_card.dart';
import 'package:super_app_behpardaz/src/shared/resources/assets_manager.dart';
import 'package:super_app_behpardaz/src/shared/resources/value_manager.dart';
import 'package:super_app_behpardaz/src/shared/ui_kit/inkwell_button/inkwell_button.dart';

class CardInfo {
  final String? number;
  final String? imagePath;
  CardInfo({this.number, this.imagePath});
}

class ConfirmCardToCardScreen extends StatefulWidget {
  static const confirmCardToCardScreenPath = '/confirm-card-to-card';
  static const confirmCardToCardScreenName = 'confirm-card-to-card';
  final String sourceCard;
  final String destinationCard;
  const ConfirmCardToCardScreen({super.key, required this.sourceCard, required this.destinationCard});

  @override
  State<ConfirmCardToCardScreen> createState() => _ConfirmCardToCardScreenState();
}

class _ConfirmCardToCardScreenState extends State<ConfirmCardToCardScreen> with SingleTickerProviderStateMixin{

  final TextEditingController _cvv2Controller = TextEditingController();
  final TextEditingController _dynamicPasswordController = TextEditingController();
  final TextEditingController _expirationDateController = TextEditingController();

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
    _cvv2Controller.dispose();
    _dynamicPasswordController.dispose();
    _expirationDateController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'کارت به کارت',
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
      body: SlideTransition(
        position: _offsetAnimation,
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                height: AppSize.s150,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12)),
                  border: Border.all(
                    width: AppSize.s1,
                    color: Theme.of(context).colorScheme.onSecondary
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p12),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(ImageManager.shahr, width: AppSize.s60, height: AppSize.s60,),
                            Space.w8,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('کارت مبدا', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),),
                                Space.h4,
                                Text('بانک شهر', style: Theme.of(context).textTheme.bodyMedium,),
                              ]
                            ),
                            const Spacer(),
                            Text('5047-0610-6182-8758', style: Theme.of(context).textTheme.bodyMedium,)
                          ],
                        ),
                      ),
                      Divider(
                        thickness: AppSize.s1,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(ImageManager.tejarat, width: AppSize.s60, height: AppSize.s60,),
                            Space.w8,
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('کارت مقصد', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),),
                                  Space.h4,
                                  Text('بانک تجارت', style: Theme.of(context).textTheme.bodyMedium,),
                                ]
                            ),
                            const Spacer(),
                            Text('5859-8312-4753-2020', style: Theme.of(context).textTheme.bodyMedium,)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Space.h16,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('مبلغ انتقال: ', style: Theme.of(context).textTheme.titleMedium,),
                  Text('2,000,000 ', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary),),
                  Text(' ریال', style: Theme.of(context).textTheme.titleMedium,),
                ],
              ),
              Space.h16,
              _buildTextField('CVV2', _cvv2Controller, isNumber: true),
              Space.h16,
              _buildDynamicPasswordField(),
              Space.h16,
              _buildTextField('تاریخ انقضا (MM/YY)', _expirationDateController, isNumber: true),
              const Spacer(),
              InkwellButton(
                onTap: () {
                  context.go(ResultCardToCard.resultCardToCardScreenPath);
                },
                borderColor: Theme.of(context).colorScheme.onPrimary,
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                child: Text(
                  'انتقال',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoField(String label, String value, IconData icon) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 24),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildTextField(String label, TextEditingController controller, {bool isNumber = false}) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
          borderSide: BorderSide(
            width: AppSize.s1,
            color: Theme.of(context).colorScheme.onSurface
          )
        ),
      ),
    );
  }

  Widget _buildDynamicPasswordField() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _dynamicPasswordController,
            decoration: InputDecoration(
              labelText: 'رمز پویا',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.s12),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                  borderSide: BorderSide(
                      width: AppSize.s1,
                      color: Theme.of(context).colorScheme.onSurface
                  )
              ),
            ),
          ),
        ),
        Space.w8,
        InkwellButton(
          width: AppSize.s60,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('رمز پویا ارسال شد')),
            );
          },
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          borderColor: Theme.of(context).colorScheme.onPrimary,
          child: Text(
            'رمز پویا',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
