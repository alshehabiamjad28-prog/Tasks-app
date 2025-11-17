import 'package:get/get.dart';

import '../Srevices/Curd.dart';
import '../Srevices/Links.dart';
import '../models/FavoriteModel.dart';

class FavoriteController extends GetxController {
  final Crud _crud = Crud();

  // قائمة المفضلات باستخدام الموديل
  var favorites = <Favoritemodel>[].obs;

  // حالة التحميل
  var isLoading = false.obs;

  /// ==========================
  /// عرض جميع المفضلات
  /// ==========================
  Future<void> getFavorites(String userId) async {
    try {
      isLoading.value = true;

      var response = await _crud.postrequest(linkFavoriteView, {
        "id": userId.toString(),
      });

      if (response['success'] == true) {
        favorites.assignAll((response['data'] as List)
            .map((json) => Favoritemodel.fromJson(json))
            .toList());
      } else {
        favorites.clear();
      }
    } catch (e) {
      print("Error fetching favorites: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// ==========================
  /// إضافة ملاحظة إلى المفضلات (مع التحقق إذا كانت موجودة)
  /// ==========================
  Future<void> addFavorite(String noteId, String userId) async {
    if (isFavorite(noteId)) return;

    try {
      var response = await _crud.postrequest(linkFavoriteadd, {
        "id": noteId.toString(),
      });

      if (response['success'] == true) {
        // إعادة تحميل المفضلات للتحديث التلقائي
        await getFavorites(userId);
      }
    } catch (e) {
      print("Error adding favorite: $e");
    }
  }

  /// ==========================
  /// حذف ملاحظة من المفضلات
  /// ==========================
  Future<void> deleteFavorite(String favoriteId, String userId) async {
    try {
      var response = await _crud.postrequest(linkFavoriteDelet, {
        "id": favoriteId,
      });

      if (response['success'] == true) {
        // إعادة تحميل المفضلات للتحديث التلقائي
        await getFavorites(userId);
      }
    } catch (e) {
      print("Error deleting favorite: $e");
    }
  }

  /// ==========================
  /// التحقق إذا الملاحظة موجودة في المفضلات
  /// ==========================
  bool isFavorite(String noteId) {
    return favorites.any((element) =>
    element.id.toString() == noteId.toString());
  }

  /// ==========================
  /// إرجاع عدد المفضلات
  /// ==========================
  int favoritesCount() {
    return favorites.length;
  }
}