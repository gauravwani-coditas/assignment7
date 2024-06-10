import 'package:assignment7/features/home/domain/entities/rating_entity.dart';

class RatingModel extends Rating{

  RatingModel({required double rate, required int count }):super(rate: rate,count: count);

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
    rate: json['rate'],
    count:  json['count']
      );


}