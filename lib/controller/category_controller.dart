import 'package:aliyamart/models/catergory_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _fetchCategories(); // Fetch categories when the controller is initialized
  }

  void _fetchCategories() {
    _firestore
        .collection('categories')
        .snapshots()
        .listen((QuerySnapshot querySnapshot) {
      categories.assignAll(
        querySnapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return CategoryModel(
            categoryName: data['categoryName'] ?? 'Unknown', // Handle null case
            categoryImage: data['categoryImage'] ?? '', // Handle null case
          );
        }).toList(),
      );
    });
  }
}
