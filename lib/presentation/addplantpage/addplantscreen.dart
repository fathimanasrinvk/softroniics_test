import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:softroniics_test/presentation/HomePage/view/home_screen.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_style.dart';
import '../../repository/model/plant_model.dart';
import '../HomePage/controller/homescreencontroller.dart';

class AddPlantScreen extends StatefulWidget {
  @override
  State<AddPlantScreen> createState() => _AddPlantScreenState();
}

class _AddPlantScreenState extends State<AddPlantScreen> {
  final nameController = TextEditingController();
  final desController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  XFile? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    final PlantController plantController = Get.find();

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: ColorTheme.secondarycolor,
        child: Stack(
          children: [
            Positioned(
                top: 30,
                left: 120,
                child: Image.asset(
                  "assets/images/icon_img.png",
                  height: 100,
                )),
            Positioned(
                top: 145,
                left: 160,
                child: Text(
                  "Add Plants",
                  style: GlobalTextStyles.secondTittle,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 200),
              child: Container(
                height: 550,
                width: 310,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorTheme.white,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Center(
                        child: Column(children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: size * 35, right: size * 35, top: size * 40),
                            child: TextFormField(
                              controller: nameController,
                              textInputAction: TextInputAction.next,
                              validator: (name) {
                                if (name!.isEmpty) {
                                  return "Field is required";
                                } else {
                                  return null;
                                }
                              },
                              style: TextStyle(color: ColorTheme.maincolor),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorTheme.secondarycolor,
                                hintText: 'Plant name',
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: size * 20),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(size * 7),
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: size * 35, right: size * 35, top: size * 30),
                            child: TextFormField(
                              maxLines:2,
                              controller: desController,
                              textInputAction: TextInputAction.next,
                              validator: (name) {
                                if (name!.isEmpty) {
                                  return "Field is required";
                                } else {
                                  return null;
                                }
                              },
                              style: TextStyle(color: ColorTheme.maincolor),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorTheme.secondarycolor,
                                hintText: 'About',
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: size * 20),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(size * 7),
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: size * 35, right: size * 35, top: size * 30),
                            child: GestureDetector(
                              onTap: _pickImage,
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: ColorTheme.secondarycolor,
                                  borderRadius: BorderRadius.circular(size * 7),
                                ),
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8, top: 10),
                                  child: Text(
                                    "Upload Image",
                                    style: TextStyle(color: ColorTheme.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (_image != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Image.file(
                                File(_image!.path),
                                height: 100,
                                width: 100,
                              ),
                            ),
                          SizedBox(
                            height: size * 40,
                          ),
                          Container(
                            width: size * 250,
                            decoration: BoxDecoration(
                                color: ColorTheme.maincolor,
                                borderRadius: BorderRadius.circular(size * 7)),
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  final newPlant = Plant(
                                    name: nameController.text,
                                    description: desController.text,
                                    imagePath: _image?.path ?? 'assets/images/default_plant.png',
                                  );
                                  plantController.addPlant(newPlant);
                                  Get.off(HomeScreen());
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorTheme.maincolor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(size * 7))),
                              child: Text("Add", style: GlobalTextStyles.buttonText),
                            ),
                          ),
                        ])),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
