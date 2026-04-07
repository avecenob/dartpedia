import 'dart:io';
import 'package:http/http.dart' as http;

const version = '0.0.1';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version: $version');
  } else if (arguments.first == 'search') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage(); // Catch all unrecognized commands and show usage.
  }
}

void searchWikipedia(List<String>? arguments) {
  final String articleTitle;

  // If no article title is provided as an argument, prompt the user to enter one.
  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');

    // Await user input from the console.
    articleTitle = stdin.readLineSync() ?? '';
  } else {
    // Join the arguments to form the full article title.
    articleTitle = arguments.join(' ');
  }

  print('Looking up article: $articleTitle');
  print('Here is the summary of the article:');
  print('(Pretend this is the summary of the article $articleTitle.)');
}

void printUsage() {
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'",
  );
}

Future<String> getWikipediaArticle(String articleTitle) async {
  final url = Uri.https(
    'en.wikipedia.org', // Wikipedia API domain
    '/api/rest_v1/page/summary/$articleTitle', // Endpoint for fetching article summary
  );

  final response = await http.get(url); // Make HTTP GET request

  if (response.statusCode == 200) {
    return response.body; // Return the response body if the request was successful
  }

  // Return an error message if the request failed
  return 'Error fetching article $articleTitle. Status code: ${response.statusCode}';
}