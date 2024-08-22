import 'package:get/get.dart';
import 'package:getx_app/app/data/local/storage_db.dart';

mixin userDataMixin {
  final StorageDB storageDB = Get.find<StorageDB>();

  Future<void> checkStudent() async {
    final dataUser = await storageDB.getStudentPicked();
  }

  Future<void> userLogin() async{
    
  }
}
