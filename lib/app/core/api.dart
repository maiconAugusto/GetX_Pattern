import 'package:flutter_dotenv/flutter_dotenv.dart';

class API {
  final String? _url = dotenv.env['URL'];
  get url => _url;
}
