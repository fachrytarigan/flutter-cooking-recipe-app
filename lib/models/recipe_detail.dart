part of 'models.dart';

class RecipeDetail extends Equatable {
  final String title;
  final String thumbnail;
  final String servings;
  final String times;
  final String difficult;
  final Author author;
  final String desc;
  final List<NeedItem> needItem;
  final List<String> ingredient;
  final List<String> step;

  RecipeDetail(
      {this.title = '',
      this.thumbnail = '',
      this.servings = '',
      this.times = '',
      this.difficult = '',
      this.author,
      this.desc,
      this.needItem,
      this.ingredient,
      this.step});

  factory RecipeDetail.fromJson(Map<String, dynamic> jsonObject) =>
      RecipeDetail(
        title: jsonObject['title'],
        thumbnail: jsonObject['thumb'],
        servings: jsonObject['servings'],
        times: jsonObject['times'],
        difficult: jsonObject['dificulty'],
        author: Author.fromJson(jsonObject['author']),
        desc: jsonObject['desc'],
        needItem: List<NeedItem>.from(
            jsonObject['needItem'].map((x) => NeedItem.fromJson(x))),
        ingredient: List<String>.from(jsonObject['ingredient'].map((x) => x)),
        step: List<String>.from(jsonObject['step'].map((x) => x)),
      );

  @override
  List<Object> get props => [
        title,
        thumbnail,
        servings,
        times,
        difficult,
        author,
        desc,
        needItem,
        ingredient,
        step
      ];

  String get descInString {
    // Merapihkan deskripsi
    String s = desc.splitMapJoin(RegExp(r'[.|!|?][\s]'),
        onMatch: (m) => m.group(0),
        onNonMatch: (n) => n.splitMapJoin(
              RegExp(r'[.|!|?]'),
              onMatch: (m) {
                return '${m.group(0)}\n\n';
              },
              // onNonMatch: (n) => n.splitMapJoin(RegExp(r'[.]'),
              //     onMatch: (m) => '${m.group(0)}\n'),
            ));

    return s;
  }

  List<String> get stepInString {
    List<String> s = step.map((e) => e.substring(2)).toList();
    return s;
  }
}

class Author extends Equatable {
  final String user;
  final String datePublished;

  Author({this.user, this.datePublished});

  factory Author.fromJson(Map<String, dynamic> jsonObject) => Author(
        user: jsonObject['user'],
        datePublished: jsonObject['datePublished'],
      );

  @override
  List<Object> get props => [user, datePublished];
}

class NeedItem extends Equatable {
  final String itemName;
  final String thumbnailItem;

  NeedItem({this.itemName, this.thumbnailItem});

  factory NeedItem.fromJson(Map<String, dynamic> jsonObject) => NeedItem(
      itemName: jsonObject['item_name'],
      thumbnailItem: jsonObject['thumb_item']);

  @override
  List<Object> get props => [itemName, thumbnailItem];
}
