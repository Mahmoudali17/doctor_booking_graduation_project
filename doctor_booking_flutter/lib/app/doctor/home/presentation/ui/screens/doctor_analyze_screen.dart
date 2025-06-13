import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // for image/jpeg content type
import 'dart:convert';
//arabic language
import 'package:flutter/material.dart';
import 'package:doctor_booking_flutter/l10n/app_localizations.dart';

class DoctorAnalyzeScreen extends StatefulWidget {
  const DoctorAnalyzeScreen({super.key});

  @override
  State<DoctorAnalyzeScreen> createState() => _DoctorAnalyzeScreenState();
}

class _DoctorAnalyzeScreenState extends State<DoctorAnalyzeScreen> {
  File? _image;
  String? _analysisResult;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _analysisResult = null; // Reset previous result
      });
    }
  }

  Future<void> _analyzeImage() async {
    if (_image == null) return;

    final request = http.MultipartRequest(
      'POST',
      // Uri.parse('http://192.168.1.7:8000/analyze'),
        Uri.parse('http://192.168.1.7:5001/predict')

    );
    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        _image!.path,
        contentType: MediaType('image', 'jpeg'),
      ),
    );

    try {
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final data = json.decode(responseBody);
        setState(() {
          // _analysisResult = data['result']; // adjust based on your API
          _analysisResult = '${data['prediction']} (${data['confidence']})';

        });
      } else {
        setState(() {
          _analysisResult = 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _analysisResult = 'Error analyzing image: $e';
      });
    }

    // // Simulated delay and response - replace with your AI model logic later
    // await Future.delayed(const Duration(seconds: 2));
    // setState(() {
    //   _analysisResult = 'Diagnosis: Possible skin lesion (AI placeholder result)';
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.upload),
                label: const Text('Upload Image'),
              ),
              const SizedBox(height: 20),
              _image != null
                  ? Image.file(_image!, height: 200)
                  : const Text('No image selected'),
              const SizedBox(height: 20),
              if (_image != null)
                ElevatedButton.icon(
                  onPressed: _analyzeImage,
                  icon: const Icon(Icons.analytics),
                  label: const Text('Analyze Image'),
                ),
              const SizedBox(height: 20),
              if (_analysisResult != null)
                Text(
                  _analysisResult!,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
