import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/songs/song.dart';
import '../../../states/settings_state.dart';
import '../../../theme/theme.dart';
import '../view_model/home_view_model.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    final settings = context.watch<AppSettingsState>();

    return Container(
      color: settings.theme.backgroundColor,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          Center(child: Text("Home", style: AppTextStyles.heading)),
          const SizedBox(height: 50),

          Text('Your recent songs', style: AppTextStyles.label),
          const SizedBox(height: 20),
          ...vm.recentSongs.map(
            (song) => SongTile(
              song: song,
              isPlaying: vm.isPlaying(song),
              onTap: () => vm.toggleSong(song),
            ),
          ),

          const SizedBox(height: 30),
          const Text('You might also like'),
          const SizedBox(height: 20),
          ...vm.suggestionSongs.map(
            (song) => SongTile(
              song: song,
              isPlaying: vm.isPlaying(song),
              onTap: () => vm.toggleSong(song),
            ),
          ),
        ],
      ),
    );
  }
}

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(song.title),
      trailing: Text(
        isPlaying ? "Playing" : "",
        style: TextStyle(color: Colors.amber),
      ),
    );
  }
}
