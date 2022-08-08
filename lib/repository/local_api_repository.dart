import 'package:twoh/models/machines.dart';
import 'package:twoh/service/local_api.dart';

class LocalApiRepository {
  final LocalApi _localApi;

  LocalApiRepository(this._localApi);

  Future<List<Machines>?> fetchData() async {
    final response = await _localApi.fetchData();
    return response;
  }



  Future<bool> patchMachineData(bool isFailure, int id) async {
    var machineObj = {"isFailure": isFailure.toString()};
    return await _localApi.patchData(machineObj, id);
  }
}
