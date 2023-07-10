import 'package:nesco/model/api/years.model.dart';
import 'package:nesco/service/api/api.client.dart';

class YearsService {
  final ApiClient client;
  YearsService({required this.client});

  Future<YearResponse?> get(YearRequest? request) async {
    Future<YearResponse> yearsResponse = await client.get(
        path: "/years",
        converter: YearResponse.fromJson,
        queryParameters: YearRequest.toMap(request));
    return yearsResponse;
  }
}
