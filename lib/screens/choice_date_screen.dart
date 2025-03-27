import 'package:flutter/material.dart';
import '../screens/payment_method_screen.dart';
import '../screens/chat_screen.dart';
import '../widgets/choice_date_orange_button.dart';
import '../widgets/choice_date_persons_button.dart';
import '../widgets/choice_date_travel_days_button.dart';
import '../widgets/choice_date_travel_time_button.dart';

class ChoiceDatePage extends StatefulWidget {
  const ChoiceDatePage({super.key});

  @override
  _ChoiceDatePageState createState() => _ChoiceDatePageState();
}

class _ChoiceDatePageState extends State<ChoiceDatePage> {
  // State for ChoiceDateOrangeButtons in the search bar
  bool isEuropeSelected = true;
  bool isFiveStarSelected = true;
  bool isFebruarySelected = true;
  bool isOnePersonSelected = true;

  // State for Travel Time buttons
  String? selectedTravelTime = 'February';

  // State for Travel Days buttons
  String? selectedTravelDays = '7-4 day';

  // State for Persons buttons
  String? selectedPersons = '3';

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
          "Choice Date",
          style: TextStyle(
            fontFamily: "Marcellus",
            fontSize: 26.0,
            fontWeight: FontWeight.w400,
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 16.0,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ChoiceDateOrangeButton(
                          text: "Europe",
                          isSelected: isEuropeSelected,
                          onTap: () {
                            setState(() {
                              isEuropeSelected = !isEuropeSelected;
                            });
                          },
                        ),
                        const SizedBox(width: 13.0),
                        ChoiceDateOrangeButton(
                          text: "5 Star",
                          isSelected: isFiveStarSelected,
                          onTap: () {
                            setState(() {
                              isFiveStarSelected = !isFiveStarSelected;
                            });
                          },
                        ),
                        const SizedBox(width: 13.0),
                        ChoiceDateOrangeButton(
                          text: "February",
                          isSelected: isFebruarySelected,
                          onTap: () {
                            setState(() {
                              isFebruarySelected = !isFebruarySelected;
                            });
                          },
                        ),
                        const SizedBox(width: 13.0),
                        ChoiceDateOrangeButton(
                          text: "1",
                          isSelected: isOnePersonSelected,
                          onTap: () {
                            setState(() {
                              isOnePersonSelected = !isOnePersonSelected;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            // Travel Time Section
            const Text(
              "Travel Time",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Gilroy-Bold",
              ),
            ),
            const SizedBox(height: 30.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ChoiceDateTravelTimeButton(
                    text: "January",
                    isSelected: selectedTravelTime == "January",
                    onTap: () {
                      setState(() {
                        selectedTravelTime = "January";
                      });
                    },
                  ),
                  const SizedBox(width: 13.0),
                  ChoiceDateTravelTimeButton(
                    text: "February",
                    isSelected: selectedTravelTime == "February",
                    onTap: () {
                      setState(() {
                        selectedTravelTime = "February";
                      });
                    },
                  ),
                  const SizedBox(width: 13.0),
                  ChoiceDateTravelTimeButton(
                    text: "March",
                    isSelected: selectedTravelTime == "March",
                    onTap: () {
                      setState(() {
                        selectedTravelTime = "March";
                      });
                    },
                  ),
                  const SizedBox(width: 13.0),
                  ChoiceDateTravelTimeButton(
                    text: "April",
                    isSelected: selectedTravelTime == "April",
                    onTap: () {
                      setState(() {
                        selectedTravelTime = "April";
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            // Travel Days Section
            const Text(
              "Travel Days",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Gilroy-Bold",
              ),
            ),
            const SizedBox(height: 30.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ChoiceDateTravelDaysButton(
                    text: "30 day's or less",
                    isSelected: selectedTravelDays == "30 day's or less",
                    onTap: () {
                      setState(() {
                        selectedTravelDays = "30 day's or less";
                      });
                    },
                  ),
                  const SizedBox(width: 13.0),
                  ChoiceDateTravelDaysButton(
                    text: "15-7 day",
                    isSelected: selectedTravelDays == "15-7 day",
                    onTap: () {
                      setState(() {
                        selectedTravelDays = "15-7 day";
                      });
                    },
                  ),
                  const SizedBox(width: 13.0),
                  ChoiceDateTravelDaysButton(
                    text: "7-4 day",
                    isSelected: selectedTravelDays == "7-4 day",
                    onTap: () {
                      setState(() {
                        selectedTravelDays = "7-4 day";
                      });
                    },
                  ),
                  const SizedBox(width: 13.0),
                  ChoiceDateTravelDaysButton(
                    text: "5-2 day",
                    isSelected: selectedTravelDays == "5-2 day",
                    onTap: () {
                      setState(() {
                        selectedTravelDays = "5-2 day";
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            // Persons Section
            const Text(
              "Persons",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Gilroy-Bold",
              ),
            ),
            const SizedBox(height: 30.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ChoiceDatePersonsButton(
                    text: "1",
                    isSelected: selectedPersons == "1",
                    onTap: () {
                      setState(() {
                        selectedPersons = "1";
                      });
                    },
                  ),
                  const SizedBox(width: 13.0),
                  ChoiceDatePersonsButton(
                    text: "3",
                    isSelected: selectedPersons == "3",
                    onTap: () {
                      setState(() {
                        selectedPersons = "3";
                      });
                    },
                  ),
                  const SizedBox(width: 13.0),
                  ChoiceDatePersonsButton(
                    text: "7",
                    isSelected: selectedPersons == "7",
                    onTap: () {
                      setState(() {
                        selectedPersons = "7";
                      });
                    },
                  ),
                  const SizedBox(width: 13.0),
                  ChoiceDatePersonsButton(
                    text: "10",
                    isSelected: selectedPersons == "10",
                    onTap: () {
                      setState(() {
                        selectedPersons = "10";
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
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