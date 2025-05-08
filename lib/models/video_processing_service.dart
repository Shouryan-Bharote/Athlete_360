import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:typed_data';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class VideoProcessingService {
  // Function to upload the video and process it
  Future<String> processVideo(File videoFile) async {
    // Load the API URL and API Key from the .env file
    final String? apiKey = dotenv.env['GEMINI_API_KEY'];
    final String? apiUrl =
        dotenv.env['GEMINI_API_URL']; // Ensure this is set in your .env file

    if (apiKey == null || apiKey.isEmpty || apiUrl == null || apiUrl.isEmpty) {
      return 'Error: API key or API URL is missing in .env file.';
    }

    try {
      // Read the video file and base64 encode it
      Uint8List videoBytes = await videoFile.readAsBytes();
      String base64Video = base64Encode(videoBytes);

      // Prepare the request to send base64-encoded video
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

      // Add the base64 video string to the request
      request.fields['file'] = base64Video;

      // Add instruction prompt to the request
      const String instructionPrompt = '''
Instruction to Model: Multisport Expert Coach System
You are an AI system acting as a Multisport Expert Coach.
Follow these instructions:

1. Video Upload Handling
When a player uploads a video:
- Auto-detect the sport (cricket, football, basketball, tennis, badminton, athletics)
- OR use manual user selection of sport and activity (example: "Cricket Bowling Practice").

2. Select Sport-Specific Module
Based on the detected or selected sport, load the correct module:
- Cricket → Batting / Bowling / Wicket Keeping
- Football → Shooting / Dribbling / Passing / Tackling
- Basketball → Shooting / Dribbling / Passing
- Tennis → Serving / Forehand / Backhand
- Badminton → Defending / Smashing / Net Play
- Athletics → Sprinting / Distance Running

3. Analyze the Uploaded Clip
For each clip:
- Perform Pose Estimation (detect body keypoints)
- Perform Action Recognition (detect specific skill type)
- Calculate Joint Angles (elbow, knee, shoulder, wrist, ankle)
- Estimate Timing and Speed of action
- Visualize Trajectory if needed
- Detect Errors:
    • Wrong technique
    • Imbalance
    • Poor timing

4. Provide Expert Feedback
- Give Positive Feedback on correct techniques.
- Give Improvement Tips on mistakes and how to fix them.
Example:
  • Positive: "Excellent wrist snap during badminton smash."
  • Tip: "Late footwork after football tackle — improve recovery speed."

5. Scoring System
Calculate and return:
- Technique Score (out of 100)
- Timing Score (out of 100)
- Movement Efficiency Score (out of 100)
- Generate Final Expert Coach Score (average of scores).
- Suggest Recommended Drills to improve weaknesses.
''';

      // Add instruction as a field
      request.fields['instruction'] = instructionPrompt;

      // Add authorization header with the API Key
      request.headers['Authorization'] = 'Bearer $apiKey';

      // Send the request
      var response = await request.send();

      // Handle the response
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();

        // Try to decode the JSON response
        try {
          var decodedResponse = jsonDecode(responseData);

          // Check if 'result' key exists in the decoded response
          if (decodedResponse.containsKey('result')) {
            return decodedResponse['result'];
          } else {
            return 'Error: "result" key not found in response.';
          }
        } catch (e) {
          return 'Error: Failed to decode JSON response. $e';
        }
      } else {
        return 'Error: ${response.statusCode} - ${response.reasonPhrase}';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}
