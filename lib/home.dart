import 'package:flutter/material.dart';
import 'package:moofli_fullstack/diary_entry.dart';
import 'package:moofli_fullstack/sidebar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:moofli_fullstack/utils/appbar.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  bool _isCalendarVisible = true;




  final List<Post> posts = [
    Post(
        date: DateTime(2023, 7, 16),
        content: 'We are so glad that you are here'),
    Post(
        date: DateTime(2023, 7, 15),
        content:
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus ipsum temporibus dolorem omnis sunt!'),
    Post(
        date: DateTime(2023, 7, 14),
        content:
            'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Provident nihil beatae pariatur fuga suscipit perferendis unde commodi amet vitae asperior ......'),
  ];

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
  }

  void _updateSelectedDay(DateTime selectedDay, DateTime focusedDay) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    });
  }

  void _updateFocusedDay(DateTime focusedDay) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _focusedDay = focusedDay;
      });
    });
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Sort posts by date in descending order
    posts.sort((a, b) => b.date.compareTo(a.date));

    return Scaffold(
      drawer: Sidebar(),
      appBar: Appbar(),
      

        
           
       
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 16.0),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: _isCalendarVisible ? 330 : 125,
                child: SingleChildScrollView(
                  child: TableCalendar(
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    availableGestures: AvailableGestures.all,
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      _updateSelectedDay(selectedDay, focusedDay);
                    },
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      _updateFocusedDay(focusedDay);
                    },
                    calendarStyle: const CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Color.fromRGBO(16, 140, 255, 1),
                        shape: BoxShape.circle,
                      ),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekendStyle: TextStyle(color: Colors.red),
                    ),
                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, day, focusedDay) {
                        if (day.isBefore(DateTime.now())) {
                          return Container(
                            margin: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${day.day}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        } else {
                          return Center(
                            child: Text('${day.day}'),
                          );
                        }
                      },
                      todayBuilder: (context, day, focusedDay) {
                        return Container(
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '${day.day}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Center(
                child: IconButton(
                  icon: Icon(
                    _isCalendarVisible
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                  ),
                  onPressed: () {
                    setState(() {
                      _isCalendarVisible = !_isCalendarVisible;
                    });
                  },
                ),
              ),
              SizedBox(height: 15),
              PostList(posts: posts), // Integrate PostList widget
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        // padding: EdgeInsets.symmetric(horizontal: 20.0), 
        child: Container(
          height: 60.0,
          color: Colors.white,
          // padding: EdgeInsets.only(left: 20, right: 20), // Add some padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                padding: EdgeInsets.only(left: 35),
                icon: Icon(
                  Icons.home,
                  color: _selectedIndex == 0 ? Colors.black : Colors.grey,
                  size: 30.0, 
                ),
                onPressed: () {
                  _onItemTapped(0);
                },
              ),

              SizedBox(width: 40), // Space for the floating action button

              IconButton(
                padding: EdgeInsets.only(right: 35),
                icon: CircleAvatar(
                  radius: 20,
                   // Adjust the radius to fit your design
                  backgroundImage: AssetImage(
                      'images/croc2.jpeg'), // Path to your profile image
                     
                ),
                
                onPressed: () {
                   Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => DiaryEntry()));
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, right: 20.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () {
              // Handle action here
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            backgroundColor: Color.fromRGBO(16, 155, 255, 1),
            child: Icon(
              Icons.add,
              color: Colors.black,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}

class PostList extends StatelessWidget {
  final List<Post> posts;

  PostList({required this.posts});

  @override
  Widget build(BuildContext context) {
    // Sort posts by date in descending order
    posts.sort((a, b) => b.date.compareTo(a.date));

    return ListView.builder(
      shrinkWrap: true, // Add this line
      physics: NeverScrollableScrollPhysics(), // Add this line
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return PostCard(post: post);
      },
    );
  }
}

class Post {
  final DateTime date;
  final String content;

  Post({required this.date, required this.content});
}

class PostCard extends StatelessWidget {
  final Post post;

  PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    final dayOfWeek = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
    final day = dayOfWeek[post.date.weekday % 7];
    final date = post.date.day.toString().padLeft(2, '0');

    return Card(
      color: Colors.indigoAccent[100],
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  day,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                SizedBox(height: 4.0),
                Text(
                  date,
                  style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ],
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'This is your Moofli',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Text(post.content),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
