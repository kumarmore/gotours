import 'package:flutter/material.dart';
import '../screens/payment_method_screen.dart';
import '../screens/chat_screen.dart';
import '../widgets/TourCard.dart';

class UpcomingTourPage extends StatefulWidget {
  const UpcomingTourPage({super.key});

  @override
  _UpcomingTourPageState createState() => _UpcomingTourPageState();
}

class _UpcomingTourPageState extends State<UpcomingTourPage> {
  // State for the slider
  double _sliderValue = 0.0;

  // State for BottomNavigationBar
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ChatScreen()),
      );
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PaymentMethodScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text(
          "Upcoming Tour",
          style: TextStyle(
            fontFamily: "Marcellus",
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Next Tour Section
            const Text(
              "7 day to the next tour",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Gilroy-Bold",
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "19 Feb",
                  style: TextStyle(
                    fontFamily: "Gilroy-Medium",
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const Text(
                  "➡️",
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  "22 Feb",
                  style: TextStyle(
                    fontFamily: "Gilroy-Medium",
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  height: 4,
                  color: const Color(0xffFF7D0D),
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 4,
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
                    trackShape: const RectangularSliderTrackShape(),
                    activeTrackColor: Colors.transparent,
                    inactiveTrackColor: Colors.transparent,
                  ),
                  child: Slider(
                    value: _sliderValue,
                    min: 0.0,
                    max: 1.0,
                    onChanged: (value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    },
                  ),
                ),
                Positioned(
                  left: _sliderValue * (MediaQuery.of(context).size.width - 60),
                  child: const Text(
                    "✈️",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // History Section
            const Text(
              "History",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Gilroy-Bold",
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: const [
                  TourCard(
                    imageUrl: "https://images.pexels.com/photos/290141/pexels-photo-290141.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", // Placeholder, replace with actual link
                    title: "Winter in Portugal",
                    location: "Lisbon",
                    duration: "7 day",
                    price: "6000",
                    currency: "\$",
                  ),
                  SizedBox(height: 20),
                  TourCard(
                    imageUrl: "https://images.pexels.com/photos/2363/france-landmark-lights-night.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", // Placeholder, replace with actual link
                    title: "Sesimbra & Arrábida",
                    location: "Lisbon",
                    duration: "5 day",
                    price: "6000",
                    currency: "£",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xffFF7D0D),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: ''),
        ],
      ),
    );
  }
}