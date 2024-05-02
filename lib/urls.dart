import 'package:http/http.dart' as http;

class URLs {
  static final Uri baseUrl = Uri.parse("https://siddhant742.pythonanywhere.com");

  // Example URIs for different API endpoints
  static final Uri notes = baseUrl.resolve("/notes");
  static final Uri create = baseUrl.resolve("/notes/create");
  static Uri deleteNoteUrl(int id) => baseUrl.resolve("/notes/$id/delete");
  static Uri updateNoteUrl(int id) => baseUrl.resolve("/notes/$id/update");
  static Uri getNoteById(int id) => baseUrl.resolve("/note/$id");
// Add more endpoints as needed
}

