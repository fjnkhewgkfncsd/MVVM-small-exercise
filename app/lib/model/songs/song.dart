class Song {
  final String id;
  final String title;
  final String artist;
  final Duration duration;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.duration,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Song && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
