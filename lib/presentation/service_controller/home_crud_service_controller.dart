
import '../model/home_crud_model.dart';
import '../repo/home_crud_repo.dart';

class HomeCrudServiceController {
  // Create Instance Class
  HomeCrudRepo homeCrudRepo = HomeCrudRepo();

  Future<List<UserData>> homeCrudControllerApi() async {
    try {
      var resData = await homeCrudRepo.geUserInfoReposApi();
      print("User Info Service response data : $resData");

      var dataList = resData['usersData'] ?? resData;

      if (dataList is List) {
        List<UserData> userInfoDataList = dataList
            .map<UserData>((item) =>
            UserData.fromJson(item))
            .toList();

        print("Fetched data list length: ${userInfoDataList.length}");
        print("here for multiple data");
        return userInfoDataList;
      }
      else if (dataList is Map<String, dynamic>) {
        print("here for single item ");
        return [UserData.fromJson(dataList)];
      }
      print("Error: Status code is not 200 or data format is unexpected");
      return [];
    }
    catch (e) {
      print("Error in getWayInfoControllerApi: $e");
      return [];
    }
  }

  Future<bool> createUserControllerApi(String userName, String userContact, String userEmail, userAddress) async {
    final requestBody = {
        "name": userName,
        "contact": userContact,
        "email": userEmail,
        "address": userAddress
      };

    print("Body Parameter : $requestBody");
    try {
      var resData = await homeCrudRepo.createUserInfoReposApi(requestBody);
      print("User Info Service response data : $resData");
      var dataList = resData['msg'];
      print("Create User ::::::::::::::: $dataList");
      return true;
    }
    catch (e) {
      print("Error in getWayInfoControllerApi: $e");
      return false;
    }
  }


}
