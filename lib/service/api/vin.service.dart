import 'package:nesco/model/api/years.model.dart';
import 'package:nesco/service/api/api.client.dart';

import '../../model/api/vin.model.dart';

class VinService {
  final ApiClient client;

  VinService({required this.client});

  Future<VinResponse> get(VinRequest request) async {
    Future<VinResponse> vinResponse = await client.get(
        path: "/vin/${request.vin}",
        converter: VinResponse.fromJson,
        queryParameters: VinRequest.toMap(request));
    return vinResponse;
  }
}
