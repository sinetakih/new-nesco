import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:nesco/core/failure.dart';
import 'package:nesco/model/api/vin.model.dart';
import 'package:nesco/repository/vin_repository.dart';
import 'package:nesco/service/api/api.client.dart';
import 'package:nesco/service/api/vin.service.dart';

enum AppState { intitial, submitting, success, error }

class VinProvider extends ChangeNotifier {
  AppState state = AppState.intitial;
  String? errorMessage;
  VinResponse vinResponse = VinResponse.empty;

  final VinRepository vinRepository;

  VinProvider({required this.vinRepository});

  Future<void> getVin(VinRequest parameters) async {
    state = AppState.submitting;
    notifyListeners();
    final Either<Failure, VinResponse> response =
        await vinRepository.getVinData(parameters);

    response.fold((failure) {
      state = AppState.error;
      errorMessage = failure.errorMessage;
      notifyListeners();
    }, (vin) {
      state = AppState.success;
      vinResponse = vin;
      notifyListeners();
    });
  }
}
