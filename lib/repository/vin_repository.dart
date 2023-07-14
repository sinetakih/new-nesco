import 'package:dartz/dartz.dart';
import 'package:nesco/model/api/vin.model.dart';
import 'package:nesco/service/api/vin.service.dart';

import '../core/failure.dart';

class VinRepository {
  final VinService vinService;

  VinRepository({required this.vinService});

  Future<Either<Failure, VinResponse>> getVinData(VinRequest parameters) async {
    try {
      final VinResponse result = await vinService.get(parameters);
      return Right(result);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
