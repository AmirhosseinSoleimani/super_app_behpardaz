import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:super_app_behpardaz/src/features/home/presentation/home_screen.dart';
import 'package:super_app_behpardaz/src/shared/resources/assets_manager.dart';
import 'package:super_app_behpardaz/src/shared/resources/value_manager.dart';

class ResultCardToCard extends StatefulWidget {
  static const resultCardToCardScreenPath = '/result-card-to-card';
  static const resultCardToCardScreenName = 'result-card-to-card';
  const ResultCardToCard({super.key});

  @override
  State<ResultCardToCard> createState() => _ResultCardToCardState();
}

class _ResultCardToCardState extends State<ResultCardToCard> with SingleTickerProviderStateMixin{

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
      begin: const Offset(0.0, 1.0),
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'کارت به کارت',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            context.go(HomeScreen.homeScreenPath);
          },
          child: Icon(IconManager.arrowBack, size: AppSize.s20, color: Theme.of(context).colorScheme.onSurface,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(IconManager.check, size: AppSize.s80, color: Theme.of(context).colorScheme.onPrimary,),
            Space.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    thickness: AppSize.s1,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
                  child: Text('تراکنش موفق', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary),),
                ),
                Expanded(
                  child: Divider(
                    thickness: AppSize.s1,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            Space.h16,
            SlideTransition(
                position: _offsetAnimation,
                child: Column(
                  children: [
                    Image.asset(ImageManager.transaction),
                    Space.h16,
                    Row(
                      children: [
                        Expanded(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(IconManager.copy, size: AppSize.s28, color: Theme.of(context).colorScheme.onPrimary,),
                            Space.h4,
                            Text(
                              'کپی',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary,),
                            )
                          ],
                        )),
                        Space.w16,
                        Expanded(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(IconManager.share, size: AppSize.s28, color: Theme.of(context).colorScheme.onPrimary,),
                            Space.h4,
                            Text(
                              'اشتراک گذاری',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary,),
                            )
                          ],
                        ))
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
