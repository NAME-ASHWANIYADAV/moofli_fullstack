import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:moofli_fullstack/constants/global_variables.dart';
import 'package:moofli_fullstack/screens/diary_entry.dart';
import 'package:moofli_fullstack/provider_class/userprovider.dart';
import 'package:moofli_fullstack/utils/sidebar.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:moofli_fullstack/utils/appbar.dart';

class home_page extends StatefulWidget {
  static const String routeName = '/home';
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}


class _home_pageState extends State<home_page> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  bool _isCalendarVisible = true;

  List<Post> posts = [];
  int postCount = 0;
  bool newPost = false;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final user = userProvider.user;

    // if (user == null) {
    //   print('User is not logged in');
      // return;
    // }

    final url =
        Uri.parse('$uri/diary/entries/user/${user.id}');
    try {
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer ${user.token}',
      });

      if (response.statusCode == 200) {
        final List<dynamic> responseBody = jsonDecode(response.body);
        if (mounted) {
          setState(() {
            posts = responseBody.map((data) => Post.fromJson(data)).toList();
            postCount = posts.length;
            newPost = posts.isNotEmpty;
          });
        }
      } else {
        print(
            'Failed to fetch diary entries. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Exception occurred: $e');
    }
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

  @override
  Widget build(BuildContext context) {
    // Sort posts by date in descending order
    posts.sort((a, b) => b.date.compareTo(a.date));

    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: CircleAvatar(
                radius: 15, // Adjust the radius to fit your design
                backgroundImage: AssetImage(
                    'images/croc2.jpeg'), // Path to your profile image
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
            Row(
              children: [
                Image.asset('images/moofli_logo.jpg',
                    height: 24), // Change this to your logo
                SizedBox(width: 8),
                Text('MOOFLI'),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.local_fire_department,
                  color: newPost ? Colors.red : Colors.black,
                ),
                SizedBox(width: 4),
                Text('$postCount'),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
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
              PostList(posts: posts),
              // Integrate PostList widget
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: GNav(
          rippleColor: Colors.grey[300]!,
          hoverColor: Colors.grey[100]!,
          gap: 8,
          activeColor: Colors.black,
          iconSize: 24,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          duration: Duration(milliseconds: 400),
          tabBackgroundColor: Colors.grey[100]!,
          color: Colors.black,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
              iconSize: 40,
              padding: EdgeInsets.only(left: 50, bottom: 20),
              onPressed: () {},
            ),
            GButton(
              padding: EdgeInsets.only(right: 50, bottom: 10),
              icon: Icons.circle,
              // Placeholder icon
              leading: CircleAvatar(
                radius: 20, // Adjust the radius as needed
                backgroundImage: AssetImage(
                    'images/croc2.jpeg'), // Path to your profile image
              ),
              text: 'Profile',
              iconColor:
                  Colors.transparent, // Make the placeholder icon transparent

              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, right: 20.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Diaryentry()));
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
    List<Post> sortedPosts = List.from(posts);
    sortedPosts.sort((a, b) => b.date.compareTo(a.date));

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: sortedPosts.length,
      itemBuilder: (context, index) {
        final post = sortedPosts[index];
        return PostCard(post: post);
      },
    );
  }
}

class Post {
  final DateTime date;
  final String content;

  Post({required this.date, required this.content});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      date: DateTime.parse(json['__created']),
      content: json['content'],
    );
  }
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
