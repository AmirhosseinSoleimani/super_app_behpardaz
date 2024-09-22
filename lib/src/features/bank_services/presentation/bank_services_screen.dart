import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:super_app_behpardaz/src/features/bank_services/presentation/widgets/card_to_card_screen.dart';
import 'package:super_app_behpardaz/src/shared/resources/assets_manager.dart';
import 'package:super_app_behpardaz/src/shared/resources/value_manager.dart';

class BankServicesScreen extends StatefulWidget {
  static const bankServicesScreenPath = '/bank_services';
  static const bankServicesScreenName = 'bank_services';
  const BankServicesScreen({super.key});

  @override
  State<BankServicesScreen> createState() => _BankServicesScreenState();
}

class _BankServicesScreenState extends State<BankServicesScreen> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: DurationConstant.d1000,
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'خدمات بانکی',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildAnimatedButton('کارت به کارت', Icons.swap_horiz, onTap: () {context.push(CardToCardScreen.cardToCardScreenPath);}),
            _buildAnimatedButton('موجودی کارت', Icons.account_balance_wallet),
            _buildAnimatedButton('تبدیل کارت به شبا', Icons.credit_card),
            _buildAnimatedButton('چک صیادی', Icons.check_circle),
            _buildAnimatedButton('پیگیری انتقال پول', Icons.search),
          ],
        ),
      ),
    );
  }
  Widget _buildAnimatedButton(String title, IconData icon, {VoidCallback? onTap}) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
        child: Center(
          child: SizedBox(
            width: AppSize.s220,
            child: ElevatedButton.icon(
              icon: Icon(icon, size: AppSize.s32, color: Theme.of(context).colorScheme.onPrimary,),
              label: Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary,)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.1),
                padding: const EdgeInsets.symmetric(vertical: AppPadding.p16, horizontal: AppPadding.p16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                ),
              ),
              onPressed: onTap,
            ),
          ),
        ),
      ),
    );
  }
}
