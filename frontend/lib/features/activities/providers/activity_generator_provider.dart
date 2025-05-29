
// // 3. Create the Riverpod Notifier
// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:firebase_vertexai/firebase_vertexai.dart';
// import 'package:hpc/features/activities/states/activity_generate_state.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// // Import your models: HpcActivity, LearningGoal, Competency

// part 'activity_generator_provider.g.dart';

// @riverpod
// class ActivityGenerator extends _$ActivityGenerator {
//   @override
//   ActivityGeneratorState build() {
//     return ActivityGeneratorState();
//   }



//   // Method to trigger the activity generation
//   Future<Map<String,dynamic>?> generateActivity({
//     required String text,
//     required List<MapEntry<String,String>> learningGoals,
//     required List<MapEntry<String,String>> competencies,
//     // required List<String> learningOutcomes,
//   }) async {
  
//       // Set loading state and clear previous results/errors
//     state = state.copyWith(isLoading: true, clearActivity: true, clearError: true);


//     // 🚨 **SECURITY RISK AREA** 🚨
//     // Direct client-side calls are insecure. Use Cloud Functions for production.
//     try {
//       // Initialize Vertex AI Service
//       final vertexAI = FirebaseVertexAI.instance;

//       // Select the Model
//       final model = vertexAI.generativeModel(
//         model: 'gemini-2.0-flash', // Adjust model as needed
//         generationConfig: GenerationConfig(
//           temperature: 0.7,
//           maxOutputTokens: 2048,
//           responseMimeType: "application/json",
//         ),
        
//         // safetySettings: [...] // Optional: Add safety settings
//       );

//       // Construct the Prompt (Ensure this is identical to your tested prompt)
//       String prompt = _buildPrompt(text, learningGoals, competencies);

//       // Generate Content
//       print("Notifier: Sending request directly to Vertex AI...");
//       final response = await model.generateContent([Content.text(prompt)]);
//       print("Notifier: Received response from Vertex AI.");

//       // Process Response
//       final jsonString = response.text;

//       if (jsonString != null && jsonString.isNotEmpty) {
//         //  log("Notifier: Raw Response Text: $jsonString");
//          try {
//             // Attempt to parse the JSON string
//             final decodedJson = jsonDecode(jsonString);
//             if (decodedJson is Map<String, dynamic>) {
//               log('Decoded: ${jsonEncode(decodedJson)}');
//               //  final generatedActivity = HpcActivity.fromJson(decodedJson);
//               //  // SUCCESS: Update state with the parsed activity
//                state = state.copyWith(isLoading: false, activity: decodedJson);
//                print("Notifier: Successfully parsed activity.");

//                return decodedJson;
//             } else {
               
//                throw Exception("AI response was not a valid JSON object.");
//             }
//          } catch (e) {

//             // Handle JSON parsing errors
//             print("Notifier: Failed to parse JSON response: $e");
//             print("Notifier: Offending JSON string: $jsonString");
//             state = state.copyWith(isLoading: false, errorMessage: "Failed to parse AI response: $e. Raw output: $jsonString");


//          }

//       } else {
//         // Handle cases where response text is null or empty, or content was blocked
//         final blockReason = response.promptFeedback?.blockReason;
//         final safetyRatings = response.candidates?.first?.safetyRatings;
//         print("Notifier: AI response was empty or null.");
//         if (blockReason != null) {
//           final errorMessage = "Content generation blocked by safety filters: $blockReason. Ratings: $safetyRatings";
//           print("Notifier: $errorMessage");
//           state = state.copyWith(isLoading: false, errorMessage: errorMessage);
//         } else {
//           print("Notifier: Received an empty response from the AI model.");
//           state = state.copyWith(isLoading: false, errorMessage: "Received an empty response from the AI model.");
//         }
//       }

//     } catch (e) {
//       print(e);
//       // Catch general errors (network, API issues, etc.)
//       state = state.copyWith(isLoading: false, errorMessage: "An error occurred: $e");
//     }
//   }

//   // Helper function to build the prompt consistently
//   String _buildPrompt(
//       String text,
//       List<MapEntry<String,String>> learningGoals,
//       List<MapEntry<String,String>> competencies,

//       // List<String> learningOutcomes
      
//       ) {

//     String prompt = "Generate an HPC activity based on the following details:\n\n";
//     prompt += "Text: ${text}\n\n";
//     prompt += "Learning Goals:\n";
//     learningGoals.forEach((goal) {
//       prompt +="- ${goal.key}: ${goal.value}\n";
//     });
//     prompt += "\nCompetencies:\n";
//     competencies.forEach((comp) {
//       prompt += "- ${comp.key}: ${comp.value}\n";
//     });
//     // prompt += "\nLearning Outcomes:\n";
//     // learningOutcomes.forEach((outcome) {
//     //   prompt += "- ${outcome}\n";
//     // });
//     prompt += "\nPlease provide ONLY the following structure in valid JSON format:\n\n"; // Emphasize JSON format
//     prompt += "{\n";
//     prompt += '  "title": "Activity Title",\n';
//     prompt += '  "description": "Activity Description containing detailed steps (Step 1:, Step 2:, etc., up to 10 steps)",\n'; // Clarified description content
//     prompt += '  "questions": ["Question 1", "Question 2", "...up to 10 questions"],\n';
//     prompt += '  "duration": "Total duration in minutes (e.g., \'30 minutes\')",\n'; // Added example format
//     prompt += '  "stepDurations": ["Duration for step 1 (e.g., \'5 minutes\')", "Duration for step 2", "...up to 10 steps"],\n'; // Added example format
//     prompt += '  "rubric": {\n';
//     prompt += '    "awareness": {\n';
//     prompt += '      "beginner": "Description for beginner awareness",\n';
//     prompt += '      "proficient": "Description for proficient awareness",\n';
//     prompt += '      "advanced": "Description for advanced awareness"\n';
//     prompt += "    },\n";
//     prompt += '    "sensitivity": {\n';
//     prompt += '      "beginner": "Description for beginner sensitivity",\n';
//     prompt += '      "proficient": "Description for proficient sensitivity",\n';
//     prompt += '      "advanced": "Description for advanced sensitivity"\n';
//     prompt += "    },\n";
//     prompt += '    "creativity": {\n';
//     prompt += '      "beginner": "Description for beginner creativity",\n';
//     prompt += '      "proficient": "Description for proficient creativity",\n';
//     prompt += '      "advanced": "Description for advanced creativity"\n';
//     prompt += "    }\n";
//     prompt += "  },\n";
//     prompt += '  "competencyMapping": {\n';
//     prompt += '    "awareness.beginner": "comp_id | null",\n'; // Show null is allowed
//     prompt += '    "awareness.proficient": "comp_id | null",\n';
//     prompt += '    "awareness.advanced": "comp_id | null",\n';
//     prompt += '    "sensitivity.beginner": "comp_id | null",\n';
//     prompt += '    "sensitivity.proficient": "comp_id | null",\n';
//     prompt += '    "sensitivity.advanced": "comp_id | null",\n';
//     prompt += '    "creativity.beginner": "comp_id | null",\n';
//     prompt += '    "creativity.proficient": "comp_id | null",\n';
//     prompt += '    "creativity.advanced": "comp_id | null"\n';
//     prompt += "  }\n";
//     prompt += "}\n\n";
//     prompt += "Constraints and Guidelines:\n";
//     prompt += "- The number of steps in the 'description' should be between 1 and 10.\n";
//     prompt += "- The number of 'questions' should be between 1 and 10.\n";
//     prompt += "- Generate an appropriate number of steps and questions based on the activity's complexity derived from the input text, goals, and outcomes.\n";
//     prompt += "- The 'stepDurations' array must have the exact same number of elements as the number of steps identified in the 'description'.\n";
//     prompt += "- For 'competencyMapping', assign one of the provided competency IDs (from the Competencies list above) ONLY if it is directly relevant and applicable to that specific ability level (e.g., awareness.beginner). \n";
//     prompt += "- Use ONLY the competency IDs provided: [${competencies.map((c) => c.key).join(", ")}].\n";
//     prompt += "- If no provided competency ID is relevant for a specific 'ability.level' key, set its value to `null`.\n";
//     prompt += "- Ensure the entire output is a single, valid JSON object adhering strictly to this structure. Do not include any text before or after the JSON braces.";

//     return prompt;
//   }
// }
