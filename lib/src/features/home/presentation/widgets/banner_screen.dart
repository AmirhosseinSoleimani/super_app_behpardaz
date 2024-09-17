import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:super_app_behpardaz/src/features/home/domain/entity/grid_view_entity.dart';
import 'package:super_app_behpardaz/src/shared/resources/assets_manager.dart';
import 'package:super_app_behpardaz/src/shared/resources/value_manager.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  final PageController _pageController = PageController();
  final int _totalPages = 2;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      int nextPage = _pageController.page!.toInt() + 1;
      if (nextPage == _totalPages) {
        nextPage = 0;
      }
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: _totalPages,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                child: _buildBannerItem(index),
              );
            },
          ),
        ),
        Space.h8,
        SmoothPageIndicator(
          controller: _pageController, // PageController
          count: _totalPages,
          effect: WormEffect(
            dotHeight: AppSize.s12,
            dotWidth: AppSize.s12,
            activeDotColor: Theme.of(context).colorScheme.onSurface,
            dotColor: Theme.of(context).colorScheme.secondary,
          ),
        ),
        Space.h8,
      ],
    );
  }

  Widget _buildBannerItem(int index) {
    List<GridViewEntity> image = [
      GridViewEntity(
        svgPath: ImageManager.image2,
        title: 'خرید بسته اینترنت',
      ),
      GridViewEntity(
        svgPath: ImageManager.image3,
        title: 'شارژ سیم کارت',
      ),
    ];
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12)),
          child: Image.asset(
            image[index].svgPath ?? '',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: AppPadding.p12),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                image[index].title ?? '',
                style: (index == 0) ? Theme.of(context).textTheme.headlineMedium:
                Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.primary),)),
        )
      ],
    );
  }
}