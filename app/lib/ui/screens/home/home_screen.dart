import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './view_model/home_view_model.dart';
import './widgets/home_content.dart';
import '../../../data/repositories/songs/song_repository.dart';
import '../../states/player_state.dart';
import '../../../data/repositories/user_history/user_history_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    SongRepository songRepo = context.read<SongRepository>();
    PlayerState playerstate = context.read<PlayerState>();
    UserHistoryRepository userHistoryRepo = context
        .read<UserHistoryRepository>();
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(
        userHistoryRepo: userHistoryRepo,
        songRepo: songRepo,
        playerState: playerstate,
      )..init(),
      child: HomeContent(),
    );
  }
}
