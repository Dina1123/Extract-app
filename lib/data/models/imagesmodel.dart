// class ImageModel {
//   final String images;
//   final String texts;
//   final String user_identifier;
//   int id;

//   ImageModel({
//     required this.images,
//     required this.texts,
//     required this.id,
//     required this.user_identifier,
//   });

//   factory ImageModel.fromJson(Map<String, dynamic> json) {
//     String images = json['images'];
//     String texts = json['texts'];
//     String userIdentifier = json['user_identifier'];
//     int id;

//     try {
//       id = int.parse(json['id']);
//     } catch (e) {
//       print(e);
//       // Handle the error when 'id' is not a valid integer
//       // You can choose to assign a default value or handle it as needed
//       id = 0; // Assign a default value of 0, for example
//     }

//     return ImageModel(
//       images: images,
//       texts: texts,
//       id: id,
//       user_identifier: userIdentifier,
//     );
//   }
// }
class ImageModel {
  final String images;
  final String texts;
  final String user_identifier;
  int id;

  ImageModel({
    required this.images,
    required this.texts,
    required this.id,
    required this.user_identifier,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    String images = json['images'];
    String texts = json['texts'];
    String userIdentifier = json['user_identifier'];
    int id;

    try {
      // Check if the ID is already an int or a String that can be parsed
      if (json['id'] is int) {
        id = json['id'];  // If it's already an integer, use it directly
      } else if (json['id'] is String) {
        id = int.parse(json['id']);  // If it's a string, try parsing it to an integer
      } else {
        id = 0;  // Default value if it's neither an int nor a valid string
      }
    } catch (e) {
      print('Error parsing ID: $e');
      id = 0;  // Default to 0 if an error occurs during parsing
    }

    return ImageModel(
      images: images,
      texts: texts,
      id: id,
      user_identifier: userIdentifier,
    );
  }
}

