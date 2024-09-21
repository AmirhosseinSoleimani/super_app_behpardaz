import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:super_app_behpardaz/src/shared/resources/assets_manager.dart';
import 'package:super_app_behpardaz/src/shared/resources/value_manager.dart';

String formatPrice(double price) {
  final formatter = NumberFormat('#,##0');
  return formatter.format(price);
}

class InternetPackage {
  final String name;
  final int days;
  final double data;
  final double price;

  InternetPackage({required this.name, required this.days, required this.data, required this.price});
}

class BuyInternetScreen extends StatefulWidget {
  static const buyInternetScreenPath = '/buy_internet';
  static const buyInternetScreenName = 'buy_internet';
  const BuyInternetScreen({super.key});

  @override
  State<BuyInternetScreen> createState() => _BuyInternetScreenState();
}

class _BuyInternetScreenState extends State<BuyInternetScreen> with SingleTickerProviderStateMixin{
  final List<InternetPackage> packages = [
    InternetPackage(name: 'Package 1', days: 7, data: 5, price: 253000),
    InternetPackage(name: 'Package 2', days: 30, data: 10, price: 896000),
    InternetPackage(name: 'Package 3', days: 60, data: 15, price: 911000),
    InternetPackage(name: 'Package 4', days: 1, data: 1, price: 83000),
  ];
  String searchTerm = '';
  String filter = 'all';
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<InternetPackage> filteredPackages = packages.where((p) {
      if (filter == 'less') return p.days < 30;
      if (filter == 'more') return p.days >= 30;
      return true;
    }).toList();

    List<InternetPackage> displayedPackages = filteredPackages.where((p) {
      return p.name.toLowerCase().contains(searchTerm.toLowerCase());
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'خرید بسته اینترنت',
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
            TextFormField(
              onChanged: (value) {
                setState(() {
                  searchTerm = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'جستجو',
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(AppSize.s28)),
                  borderSide: BorderSide(
                    width: AppSize.s1,
                    color: Theme.of(context).colorScheme.onSecondary
                  )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(AppSize.s28)),
                    borderSide: BorderSide(
                        width: AppSize.s1,
                        color: Theme.of(context).colorScheme.onSurface
                    )
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(AppSize.s28)),
                    borderSide: BorderSide(
                        width: AppSize.s1,
                        color: Theme.of(context).colorScheme.onSecondary
                    )
                ),
                prefixIcon: Icon(IconManager.search, size: AppSize.s24, color: Theme.of(context).colorScheme.onSurface,),
              ),
            ),
            Space.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterButton(
                  text: 'همه',
                  isSelected: filter == 'all',
                  onTap: () => setState(() => filter = 'all'),
                ),
                FilterButton(
                  text: 'کمتر از یک ماه',
                  isSelected: filter == 'less',
                  onTap: () => setState(() => filter = 'less'),
                ),
                FilterButton(
                  text: 'بیشتر از یک ماه',
                  isSelected: filter == 'more',
                  onTap: () => setState(() => filter = 'more'),
                ),
              ],
            ),
            Space.h16,
        Expanded(
          child: ListView.builder(
            itemCount: displayedPackages.length,
            itemBuilder: (context, index) {
              final package = displayedPackages[index];
              return FadeTransition(
                opacity: _fadeAnimation,
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PackageDetailPage(package: package),
                    ),
                  ),
                  child: Card(
                    color: Theme.of(context).colorScheme.secondary,
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(IconManager.wifi, color: Theme.of(context).colorScheme.onSurface,),
                      title: Text(package.name, style: Theme.of(context).textTheme.titleMedium,),
                      subtitle: Text('${package.days} روز | ${package.data} گیگابایت', style: Theme.of(context).textTheme.bodyMedium,),
                      trailing: Text('${formatPrice(package.price)} ریال', style: Theme.of(context).textTheme.titleMedium),
                    ),
                  ),
                ),
              );
            },
          ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterButton({super.key, required this.text, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: DurationConstant.d300,
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p18, vertical: AppPadding.p12),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(AppSize.s28),
        ),
        child: Text(
          text,
          style: isSelected ? Theme.of(context).textTheme.titleMedium : Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}

class PackageDetailPage extends StatelessWidget {
  final InternetPackage package;

  const PackageDetailPage({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('جزئیات بسته'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'package_${package.name}',
              child: Material(
                child: Text(
                  package.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('مدت: ${package.days} روز'),
            Text('حجم: ${package.data} گیگابایت'),
            Text('قیمت: ${package.price} ریال'),
          ],
        ),
      ),
    );
  }
}
