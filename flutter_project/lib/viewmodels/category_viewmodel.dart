import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Plant_collection/models/category_model.dart';
import 'package:Plant_collection/models/user_model.dart';
import 'package:Plant_collection/repositories/auth_repositories.dart';
import 'package:Plant_collection/services/firebase_service.dart';
import 'package:Plant_collection/viewmodels/global_ui_viewmodel.dart';

import '../repositories/category_repositories.dart';

class CategoryViewModel with ChangeNotifier {
  CategoryRepository _categoryRepository = CategoryRepository();
  List<CategoryModel> _categories = [];
  List<CategoryModel> get categories => _categories;
  Future<void> getCategories() async{
    _categories=[];
    try{
      var response = await _categoryRepository.getCategories();
      for (var element in response) {

        print(element.id);
        _categories.add(element.data());
      }
      notifyListeners();
    }catch(e){
      print(e);
      _categories = [];
      notifyListeners();
    }
  }

}
