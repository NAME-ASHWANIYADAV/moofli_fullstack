import 'package:flutter/material.dart';
import 'package:moofli_fullstack/screens/signup3.dart';
// import 'package:moofli_fullstack/screens/signup3.dart';
import 'package:moofli_fullstack/widgets/custom_text_field.dart';

class SignupPage2 extends StatelessWidget {
   SignupPage2({super.key, required Map<String, dynamic> formData});

  final Map<String, dynamic> formData = {};

  // SignupPage2({required this.formData});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Sign up', style: TextStyle(color: Colors.purple)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.purple),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey.shade300,
                child: IconButton(
                  icon: const Icon(Icons.camera_alt, size: 30),
                  onPressed: () {
                    // Add functionality to capture or select a photo
                  },
                ),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hint: 'First name',
                onSaved: (value) => formData['first_name'] = value,
                allowNumbers: false, // Disallow numbers in first name
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hint: 'Last name',
                onSaved: (value) => formData['last_name'] = value,
                allowNumbers: false, // Disallow numbers in last name
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hint: 'DD',
                      onSaved: (value) => formData['birth_day'] = value,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomTextField(
                      hint: 'MM',
                      onSaved: (value) => formData['birth_month'] = value,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomTextField(
                      hint: 'YYYY',
                      onSaved: (value) => formData['birth_year'] = value,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hint: 'Phone number (Optional)',
                icon: Icons.phone,
                onSaved: (value) => formData['phone'] = value,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    
                    style: ElevatedButton.styleFrom(
                      // primary: Colors.white,
                      // onPrimary: Colors.blue,
                      side: BorderSide(color: Colors.blue),
                    ),
                    child: const Text('Back'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp3(formData: formData),
                          ),
                        );
                      }
                    },
                    child: Text('Next', style: TextStyle(color: Colors.white)),
                    // style: ElevatedButton.styleFrom(primary: Colors.purple),
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
