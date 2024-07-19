// lib/services/plant_storage_service.dart
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/plant_model.dart';

class PlantStorageService {
  static const String _keyPlants = 'plants';

  Future<void> savePlants(List<Plant> plants) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = plants.map((plant) => jsonEncode(plant.toJson())).toList();
    await prefs.setStringList(_keyPlants, jsonList);
  }

  Future<List<Plant>> loadPlants() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_keyPlants) ?? [];
    return jsonList.map((json) => Plant.fromJson(jsonDecode(json))).toList();
  }
}
