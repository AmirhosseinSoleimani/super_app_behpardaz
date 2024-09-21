import 'package:flutter/material.dart';

class Hotel {
  final String name;
  final String offer;
  final String imageUrl;
  final double price;

  Hotel({required this.name, required this.offer, required this.imageUrl, required this.price});
}

class HotelScreen extends StatefulWidget {
  static const hotelScreenPath = '/hotel_internet';
  static const hotelScreenName = 'hotel_internet';
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {

  final List<Hotel> hotels = [
    Hotel(name: 'Hotel 1', offer: '50% تخفیف', imageUrl: 'https://z.cdrst.com/foto/hotel-sf/4bad2/granderesp/espinas-hotel-general-d11af18.jpg', price: 200),
    Hotel(name: 'Hotel 2', offer: '30% تخفیف', imageUrl: 'https://hotelyar.com/static/img/page/offer/%D8%AA%D9%87%D8%B1%D8%A7%D9%86.jpg', price: 300),
    Hotel(name: 'Hotel 3', offer: '10% تخفیف', imageUrl: 'https://hotelyar.com/static/img/page/offer/%D8%AA%D9%87%D8%B1%D8%A7%D9%86.jpg', price: 400),
    Hotel(name: 'Hotel 4', offer: '20% تخفیف', imageUrl: 'https://hotelyar.com/static/img/page/offer/%D8%AA%D9%87%D8%B1%D8%A7%D9%86.jpg', price: 150),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('انتخاب هتل'),
      ),
      body: ListView.builder(
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          final hotel = hotels[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HotelDetailPage(hotel: hotel),
                ),
              );
            },
            child: Hero(
              tag: hotel.name,
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image.network(hotel.imageUrl, fit: BoxFit.cover, height: 180, width: double.infinity),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(hotel.name, style: Theme.of(context).textTheme.titleMedium),
                          SizedBox(height: 8),
                          Text(hotel.offer, style: TextStyle(color: Colors.green)),
                          SizedBox(height: 8),
                          Text('قیمت: ${hotel.price} \$', style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class HotelDetailPage extends StatelessWidget {
  final Hotel hotel;

  const HotelDetailPage({required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hotel.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: hotel.name,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(hotel.imageUrl, height: 300, width: double.infinity, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(hotel.name, style: Theme.of(context).textTheme.titleMedium),
                  SizedBox(height: 10),
                  Text(hotel.offer, style: TextStyle(color: Colors.green, fontSize: 20)),
                  SizedBox(height: 10),
                  Text('قیمت: ${hotel.price} \$', style: Theme.of(context).textTheme.titleMedium),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                    ),
                    child: Text('رزرو', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
