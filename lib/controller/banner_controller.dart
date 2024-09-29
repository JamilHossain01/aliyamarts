import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var bannerImages = <String>[].obs; // Observable list of banner images
  DocumentSnapshot? _lastDocument; // Last fetched document
  var isLoading = false.obs; // Loading state

  @override
  void onInit() {
    super.onInit();
    fetchBanners(); // Fetch initial banners
  }

  // Fetch banners from Firestore
  Future<void> fetchBanners() async {
    if (isLoading.value) return; // Prevent duplicate requests
    isLoading.value = true;

    Query query = _firestore.collection("banners").limit(5);
    if (_lastDocument != null) {
      query = query.startAfterDocument(_lastDocument!);
    }

    try {
      QuerySnapshot querySnapshot = await query.get();
      if (querySnapshot.docs.isNotEmpty) {
        bannerImages.addAll(
            querySnapshot.docs.map((doc) => doc['image'])); // Add images
        _lastDocument = querySnapshot.docs.last; // Update last document
      }
    } catch (error) {
      print("Error fetching banners: $error"); // Error handling
    } finally {
      isLoading.value = false; // Reset loading state
    }
  }

  // Load more banners
  void loadMore() => fetchBanners();
}
