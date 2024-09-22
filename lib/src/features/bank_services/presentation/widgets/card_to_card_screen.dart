import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:super_app_behpardaz/src/features/bank_services/domain/entity/payment_details_entity.dart';
import 'package:super_app_behpardaz/src/shared/resources/assets_manager.dart';
import 'package:super_app_behpardaz/src/shared/resources/value_manager.dart';
import 'package:super_app_behpardaz/src/shared/ui_kit/inkwell_button/inkwell_button.dart';

import 'confirm_card_to_card_screen.dart';

class CardInfo {
  final String? number;
  final String? imagePath;
  CardInfo({this.number, this.imagePath});
}

class CardToCardScreen extends StatefulWidget {
  static const cardToCardScreenPath = '/card-to-card';
  static const cardToCardScreenName = 'card-to-card';
  const CardToCardScreen({super.key});

  @override
  State<CardToCardScreen> createState() => _CardToCardScreenState();
}

class _CardToCardScreenState extends State<CardToCardScreen> with SingleTickerProviderStateMixin{

  final TextEditingController _sourceCardController = TextEditingController();
  final TextEditingController _destinationCardController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  List<CardInfo> previousCards = [
    CardInfo(
      number: '6037-9911-1111-2222',
      imagePath: ImageManager.tejarat
    ),
    CardInfo(
        number: '6219-8611-1111-3333',
        imagePath: ImageManager.resalat
    ),
    CardInfo(
        number: '5047-6101-4444-5555',
        imagePath: ImageManager.shahr
    ),
  ];

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
    _sourceCardController.dispose();
    _destinationCardController.dispose();
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _showCardSelectionModal(TextEditingController controller) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSize.s18)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'انتخاب شماره کارت',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Space.h16,
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'شماره کارت',
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
                keyboardType: TextInputType.number,
              ),
              Space.h16,
              Text(
                'کارت‌های قبلی شما:',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Space.h8,
              Expanded(
                child: ListView.builder(
                  itemCount: previousCards.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
                      child: ListTile(
                        title: Text(previousCards[index].number ?? ''),
                        leading: Container(
                          width: AppSize.s48,
                          height: AppSize.s48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                            child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(AppSize.s28)),
                                child: Image.asset(previousCards[index].imagePath ?? '', width: AppSize.s32, height: AppSize.s32,))),
                        onTap: () {
                          controller.text = previousCards[index].number ?? '';
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              _buildCardField('کارت مبدا', _sourceCardController, Icons.credit_card),
              Space.h16,
              _buildCardField('کارت مقصد', _destinationCardController, Icons.credit_card),
              Space.h16,
              _buildAmountField('مبلغ', _amountController, Icons.money),
              Space.h16,
              _buildDescriptionField('توضیحات (اختیاری)', _descriptionController, Icons.note),
              const Spacer(),
              InkwellButton(
                onTap: () {
                  context.push(ConfirmCardToCardScreen.confirmCardToCardScreenPath, extra: PaymentDetailsEntity(
                      sourceCard: _sourceCardController.text,
                      destinationCard: _destinationCardController.text));
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
      ),
    );
  }
  Widget _buildCardField(String label, TextEditingController controller, IconData icon) {
    return InkWell(
      onTap: () => _showCardSelectionModal(controller),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: AppSize.s24, color: Theme.of(context).colorScheme.onSurface,),
            Space.w4,
            Expanded(
              child: Text(
                controller.text.isEmpty ? 'انتخاب کنید' : controller.text,
                style: controller.text.isEmpty ? Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey) : Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountField(String label, TextEditingController controller, IconData icon) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
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

  Widget _buildDescriptionField(String label, TextEditingController controller, IconData icon) {
    return TextField(
      controller: controller,
      maxLines: 4,
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
}
