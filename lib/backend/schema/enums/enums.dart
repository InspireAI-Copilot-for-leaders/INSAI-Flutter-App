import 'package:collection/collection.dart';

enum SocialPlatforms {
  LinkedIn,
  Twitter,
  Instagram,
  Facebook,
  Reddit,
}

enum NewsCategories {
  business,
  crime,
  education,
  technology,
  entertainment,
  environment,
  food,
  health,
  politics,
  science,
  sports,
  tourism,
}

enum PastelColors {
  fcd5ce,
  fae1dd,
  f8edeb,
  e8e8e4,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (SocialPlatforms):
      return SocialPlatforms.values.deserialize(value) as T?;
    case (NewsCategories):
      return NewsCategories.values.deserialize(value) as T?;
    case (PastelColors):
      return PastelColors.values.deserialize(value) as T?;
    default:
      return null;
  }
}
