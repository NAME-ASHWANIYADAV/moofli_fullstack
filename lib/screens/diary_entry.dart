import 'package:flutter/material.dart';
import 'package:moofli_fullstack/constants/global_variables.dart';
import 'package:moofli_fullstack/provider_class/userprovider.dart';
import 'package:moofli_fullstack/utils/appbar.dart';
import 'package:moofli_fullstack/utils/sidebar.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;


class Diaryentry extends StatefulWidget {
  @override
  _DiaryentryState createState() => _DiaryentryState();
}

class _DiaryentryState extends State<Diaryentry> with WidgetsBindingObserver {

quill.QuillController _controller = quill.QuillController.basic();

 final FocusNode _focusNode = FocusNode();
  final ImagePicker _picker = ImagePicker();
  bool _showHint = true;

  
 TextEditingController _contentController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.addListener(_handleTextChange);
    WidgetsBinding.instance.addObserver(this);
     _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _showHint = false;
        });
      } else if (_controller.document.isEmpty()) {
        setState(() {
          _showHint = true;
        });
      }
    });
  }
     
  

  @override
  void dispose() {
    _controller.removeListener(_handleTextChange);
    _controller.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    
  }

  void _handleTextChange() {
    setState(() {
      _showHint = _controller.document.isEmpty();
    });
  }
   
  
  // Function to pick an image
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // Handle the selected image (e.g., display it or upload it)
      print('Image selected: ${image.path}');
    }
  }
   DateTime _selectedDay = DateTime.now();
  // DateTime _focusedDay = DateTime.now();
  // CalendarFormat _calendarFormat = CalendarFormat.month;

  // void _updateSelectedDay(DateTime selectedDay, DateTime focusedDay) {
  //   setState(() {
  //     _selectedDay = selectedDay;
  //     _focusedDay = focusedDay;
  //   });
  // }

  // void _updateFocusedDay(DateTime focusedDay) {
  //   setState(() {
  //     _focusedDay = focusedDay;
  //   });
  // }
  //  Future<void> _pickImage() async {
  //   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     final bytes = await image.readAsBytes();
  //     final img = quill.ImageEmbed(imgBytes: bytes);
  //     _controller.insertEmbed(_controller.selection.baseOffset, img);
  //   }
  // }
  

 

  
  // @override
  // void initState() {
  //   super.initState();
   
  // }

  // @override
  // void dispose() {
  //   WidgetsBinding.instance.removeObserver(this);
  //   super.dispose();
  // }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _saveDiaryEntry();
    }
  }

  void _saveDiaryEntry() async {
     final userProvider = Provider.of<UserProvider>(context, listen: false);
    final user = userProvider.user;

    String content = _contentController.text.trim();

    if (content.isNotEmpty) {
      var url = Uri.parse('$uri/diary/entries');
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${user.token}',
        },
        body: jsonEncode({'content': content}),
        
      );

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        if (responseBody['result'] == true) {
          // Diary entry submitted successfully
          print('Diary entry submitted: $content');

          // Optionally, show a success message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Diary entry saved successfully!')),
          );
        } else {
          // Show an error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to save diary entry.')),
          );
        }
      } else {
        // Show an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save diary entry.')),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    String day = DateFormat.d().format(_selectedDay); // Day number
    String month = DateFormat.MMMM().format(_selectedDay).toUpperCase(); // Full month name
    String year = DateFormat.y().format(_selectedDay); // Year
    String weekday = DateFormat.EEEE().format(_selectedDay); // Full weekday name

    return Scaffold(
      drawer: Sidebar(),
      appBar: Appbar_screen(),
      body: SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '$day ',
                      style: TextStyle(
                        color: Colors.green.shade700,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '$month',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Text(
                  '$year, $weekday',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 25),
        quill.QuillToolbar.simple(controller: _controller),
        SizedBox(height: 16), // Add some spacing
        Stack(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 550,
              maxWidth: double.infinity,
            ),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF4E6CD7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  quill.QuillEditor.basic(
                    controller: _controller,
                    focusNode: _focusNode,
                  ),
                   if (_showHint)
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                         child: Text(
                          'What\'s on your mind?',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: IconButton(
              icon: Icon(Icons.photo_size_select_actual_outlined),
              onPressed: _pickImage,
              color: Colors.red,
            ),
          ),
        ],
      ),
    
      ],
    ),
  ),


        
      ),
    );
  }
}
