import 'package:nhsbpmonitor/Data/services/api_result.dart';
import 'package:nhsbpmonitor/Data/services/dio_client.dart';
import 'package:nhsbpmonitor/Data/services/network_exceptions.dart';

class LocaleRepository {
  late DioClient dioClient;

  LocaleRepository() {
    dioClient = DioClient();
  }

  Future<ApiResult<Map<String, dynamic>>> fetchTranslations() async {
    try {
      final response = await dioClient.get("/translations");
      Map<String, dynamic> localeResponse = response;
      return ApiResult.success(data: localeResponse);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
