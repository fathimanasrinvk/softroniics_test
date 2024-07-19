// lib/presentation/HomePage/controller/homescreencontroller.dart
import 'package:get/get.dart';
import '../../../repository/model/plant_model.dart';
import '../../../repository/service/plant_service.dart';

class PlantController extends GetxController {
  var plants = <Plant>[].obs;
  final PlantStorageService _storageService = PlantStorageService();

  @override
  void onInit() {
    super.onInit();
    _loadPlants();
  }

  Future<void> _loadPlants() async {
    plants.value = await _storageService.loadPlants();
  }

  Future<void> addPlant(Plant plant) async {
    plants.add(plant);
    await _storageService.savePlants(plants);
  }
}
