import 'package:get/get.dart';
import '../../../repository/model/plant_model.dart';
import '../../../repository/service/plant_service.dart';

class PlantController extends GetxController {
  var plants = <Plant>[].obs;
  final PlantStorageService storageService = PlantStorageService();

  @override
  void onInit() {
    super.onInit();
    loadPlants();
  }

  Future<void> loadPlants() async {
    plants.value = await storageService.loadPlants();
  }

  Future<void> addPlant(Plant plant) async {
    plants.add(plant);
    await storageService.savePlants(plants);
  }


  // void removePlant(int index) {
  //   plants.removeAt(index);
  //   storageService.savePlants(plants); // Save changes to storage
  // }
}
