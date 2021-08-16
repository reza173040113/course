import 'package:dio/dio.dart';
import 'package:course/core/models/kos_model.dart';
import 'package:course/core/services/base_service.dart';

class CourseService extends BaseService {
  Future getNews() async {
    Response resp = await dio.get(baseUrl + "api/v2/my-offerings/new");
    if (resp.statusCode == 200) {
      return newsModelFromJson(resp.data);
    }
  }
  Future getImprovement() async {
    Response resp = await dio.get(baseUrl + "api/v2/my-offerings");
    if (resp.statusCode == 200) {
      return improvementModelFromJson(resp.data);
    }
  }
  Future getProfile() async {
    Response resp = await dio.get(baseUrl + "api/v2/me/profile");
    if (resp.statusCode == 200) {
      return profileModelFromJson(resp.data);
    }
  }
  Future getLeonizateScroll() async {
    Response resp = await dio.get(baseUrl + "api/v2/me/ranking_position_medal");
    if (resp.statusCode == 200) {
      return leonizateModelFromJson(resp.data);
    }
  }
  Future getLeonizateDetails() async {
    Response resp = await dio.get(baseUrl + "api/v2/me/leonizate");
    if (resp.statusCode == 200) {
      return leonizateModelFromJson(resp.data);
    }
  }
  Future getLeonizateTrainingHours() async {
    Response resp = await dio.get(baseUrl + "api/v2/me/training_hours");
    if (resp.statusCode == 200) {
      return leonizateModelFromJson(resp.data);
    }
  }
  Future getLeonizateTrainingIndicators() async {
    Response resp = await dio.get(baseUrl + "api/v2/me/training_indicators");
    if (resp.statusCode == 200) {
      return leonizateModelFromJson(resp.data);
    }
  }
  Future getSearch() async {
    Response resp = await dio.get(baseUrl + "api/v2/search");
    if (resp.statusCode == 200) {
      return searchModelFromJson(resp.data);
    }
  }
  Future getSearchAreas() async {
    Response resp = await dio.get(baseUrl + "api/v2/search/areas");
    if (resp.statusCode == 200) {
      return searchModelFromJson(resp.data);
    }
  }
  Future getTrainingPassport() async {
    Response resp = await dio.get(baseUrl + "/api/v2/me/training_passport/$idUser");
    if (resp.statusCode == 200) {
      return passportModelFromJson(resp.data);
    }
  }
  Future getNewOffering() async {
    Response resp = await dio.get(baseUrl + "/api/v2/my-offerings/new");
    if (resp.statusCode == 200) {
      return offeringModelFromJson(resp.data);
    }
  }
  Future getPopularOffering() async {
    Response resp = await dio.get(baseUrl + "/api/v2/my-offerings/popular");
    if (resp.statusCode == 200) {
      return offeringModelFromJson(resp.data);
    }
  }
  Future getValuedOffering() async {
    Response resp = await dio.get(baseUrl + "/api/v2/my-offerings/valued");
    if (resp.statusCode == 200) {
      return offeringModelFromJson(resp.data);
    }
  }
  Future getPopularOffering() async {
    Response resp = await dio.get(baseUrl + "/api/v2/my-offerings/popular");
    if (resp.statusCode == 200) {
      return offeringModelFromJson(resp.data);
    }
  }
  Future getMediaSupport() async {
    Response resp = await dio.get(baseUrl + "/api/v2/media-support/${idSupport}");
    if (resp.statusCode == 200) {
      return supportModelFromJson(resp.data);
    }
  }
}