enum MediaType {
  image,
  video,
  text,
}

class UserStory {
  DateTime? timePosted;
  bool? haveWatched;
  late MediaType mediaType;
  int? timeLapse;
  UserStory({
    required this.mediaType,
    this.haveWatched,
    this.timePosted,
    this.timeLapse,
  });
}
