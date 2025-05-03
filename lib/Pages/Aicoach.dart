import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Aicoach extends StatefulWidget {
  const Aicoach({super.key});

  @override
  State<Aicoach> createState() => _AicoachState();
}

class _AicoachState extends State<Aicoach> {
  File? _videoFile;
  double fileSizeMB = 0;
  bool isProcessing = false;
  String analysisResult = '';

  // Pick video from gallery
  Future<void> pickVideoFromGallery() async {
    final pickedFile = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final size = await file.length();
      if (size <= 500 * 1024 * 1024) {
        // Check size under 500MB
        setState(() {
          _videoFile = file;
          fileSizeMB = size / (1024 * 1024); // Convert to MB
          isProcessing = false; // Reset processing flag
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please upload a video under 500MB")),
        );
      }
    }
  }

  // Start analysis
  Future<void> startAnalysis() async {
    if (_videoFile != null) {
      setState(() {
        isProcessing = true;
        analysisResult = ''; // Clear previous result
      });

      String result = await sendVideoForAnalysis(_videoFile!);

      setState(() {
        analysisResult = result;
        isProcessing = false;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(analysisResult)));
    }
  }

  Future<String> sendVideoForAnalysis(File videoFile) async {
    // Ensure there's no extra space at the beginning or the end of the URL
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
        'http://192.168.7.14:5000/analyze_video',
      ), // Correct URL without extra space
    );
    request.files.add(
      await http.MultipartFile.fromPath('video', videoFile.path),
    );

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var data = json.decode(responseData);
        return data['result']; // Assuming the result is returned in the "result" field
      } else {
        return 'Error: Unable to process the video. Status code: ${response.statusCode}';
      }
    } catch (e) {
      return 'Error: Unable to connect to the server';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/Aicoach/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 100),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 30,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.white10, Colors.white12],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.pinkAccent.withOpacity(0.7),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Text(
                              "Upload your video\nfor AI Analysis",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Image.asset('assets/Aicoach/logo.png', width: 60),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: pickVideoFromGallery,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  32,
                                  30,
                                  30,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text("Browse files"),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Support MP4, AVI, Max Size 500MB",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 20),
                            if (_videoFile != null)
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.pinkAccent),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _videoFile!.path.split('/').last,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "${fileSizeMB.toStringAsFixed(1)} MB",
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed:
                                  _videoFile != null && !isProcessing
                                      ? startAnalysis
                                      : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    _videoFile != null && !isProcessing
                                        ? const Color.fromARGB(255, 56, 53, 54)
                                        : const Color.fromARGB(
                                          255,
                                          197,
                                          184,
                                          184,
                                        ),
                                foregroundColor: const Color.fromARGB(
                                  255,
                                  34,
                                  33,
                                  33,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child:
                                  isProcessing
                                      ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                      : const Text("Start Analysis"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "Result",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      analysisResult.isEmpty ? 'No result yet' : analysisResult,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "Event"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Trainmap"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
        ],
      ),
    );
  }
}
