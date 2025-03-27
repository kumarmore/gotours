import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../screens/payment_method_screen.dart';
import '../screens/chat_screen.dart';

class SelectDatePage extends StatefulWidget {
  const SelectDatePage({super.key});

  @override
  _SelectDatePageState createState() => _SelectDatePageState();
}

class _SelectDatePageState extends State<SelectDatePage> {
  // State for calendar
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  int _selectedYear = DateTime.now().year;
  int _selectedMonthIndex = 0; // 0 = Jan, 1 = Feb, etc.
  final List<String> _months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"];

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
          "Select Date",
          style: TextStyle(
            fontFamily: "Marcellus",
            fontSize: 32, // Updated to match MainScreen
            fontWeight: FontWeight.bold, // Updated to match MainScreen
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
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownButton<int>(
                        value: _selectedYear,
                        onChanged: (int? newValue) {
                          if (newValue != null) {
                            setState(() {
                              _selectedYear = newValue;
                              _focusedDay = DateTime(
                                _selectedYear,
                                _selectedMonthIndex + 1,
                                _focusedDay.day,
                              );
                            });
                          }
                        },
                        items: List.generate(10, (index) {
                          int year = DateTime.now().year - 5 + index;
                          return DropdownMenuItem(
                            value: year,
                            child: Text(
                              "$year",
                              style: const TextStyle(
                                fontFamily: "Gilroy-Medium",
                                fontSize: 16,
                              ),
                            ),
                          );
                        }),
                      ),
                      const Text(
                        "Calendar",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Gilroy-Bold", // Matches MainScreen
                        ),
                      ),
                      const SizedBox(width: 40), // Spacer to align with UI
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _months.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedMonthIndex = index;
                                  _focusedDay = DateTime(
                                    _selectedYear,
                                    _selectedMonthIndex + 1,
                                    1, // Start at the 1st of the month
                                  );
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  _months[index],
                                  style: TextStyle(
                                    fontFamily: "Gilroy-Medium", // Matches MainScreen
                                    color: _selectedMonthIndex == index
                                        ? const Color(0xffFF7D0D) // Matches MainScreen
                                        : Colors.black,
                                    fontWeight: _selectedMonthIndex == index
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: TableCalendar(
                          firstDay: DateTime.utc(2020, 1, 1),
                          lastDay: DateTime.utc(2030, 12, 31),
                          focusedDay: _focusedDay,
                          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                          onDaySelected: (selectedDay, focusedDay) {
                            setState(() {
                              _selectedDay = selectedDay;
                              _focusedDay = focusedDay;
                              _selectedMonthIndex = focusedDay.month - 1;
                              _selectedYear = focusedDay.year;
                            });
                          },
                          onPageChanged: (focusedDay) {
                            setState(() {
                              _focusedDay = focusedDay;
                              _selectedMonthIndex = focusedDay.month - 1;
                              _selectedYear = focusedDay.year;
                            });
                          },
                          calendarFormat: CalendarFormat.month,
                          headerVisible: false,
                          daysOfWeekStyle: const DaysOfWeekStyle(
                            weekdayStyle: TextStyle(
                              fontFamily: "Gilroy-Medium", // Matches MainScreen
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            weekendStyle: TextStyle(
                              fontFamily: "Gilroy-Medium", // Matches MainScreen
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.red,
                            ),
                          ),
                          calendarStyle: const CalendarStyle(
                            defaultTextStyle: TextStyle(
                              fontFamily: "Gilroy-Medium", // Matches MainScreen
                              fontSize: 16,
                            ),
                            weekendTextStyle: TextStyle(
                              fontFamily: "Gilroy-Medium", // Matches MainScreen
                              fontSize: 16,
                              color: Colors.red,
                            ),
                            todayTextStyle: TextStyle(
                              fontFamily: "Gilroy-Medium", // Matches MainScreen
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            todayDecoration: BoxDecoration(
                              color: Color(0xffFF7D0D), // Matches MainScreen
                              shape: BoxShape.circle,
                            ),
                            selectedTextStyle: TextStyle(
                              fontFamily: "Gilroy-Medium", // Matches MainScreen
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            selectedDecoration: BoxDecoration(
                              color: Color(0xffFF7D0D), // Matches MainScreen
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFF7D0D), // Matches MainScreen
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "START NOW TOUR", // Updated to match image
                  style: TextStyle(
                    fontSize: 16.5,
                    color: Colors.white,
                    fontFamily: "Gilroy-Bold", // Matches MainScreen
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xffFF7D0D), // Matches MainScreen
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