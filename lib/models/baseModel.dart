abstract class BaseModel {
  Map<String, dynamic> toJson();

  static T fromJson<T extends BaseModel>(Map<String, dynamic> json, T model) {
    throw UnimplementedError('fromJson method not implemented');
  }
}
