import 'package:dio/dio.dart';

class APICaller {
  APICaller({this.text = ''});

  final String text;

  Future<Response<dynamic>> getSentiment() async {
    final dio = Dio();

    final response = await dio.post(
        'https://kukretiadi.pythonanywhere.com/get-sentiment',
        data: {'text': text});
    return response;
  }
}
