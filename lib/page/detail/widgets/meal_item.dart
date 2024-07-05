import 'package:flutter/material.dart';
import 'package:flutter_demo/util/app_style.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../bean/search/search_bean.dart';

class MealItem extends StatefulWidget {
  const MealItem({
    super.key,
    this.data,
  });

  final SearchBean? data;

  @override
  State<MealItem> createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    final youtubeUrl = Uri.parse(widget.data?.strYoutube ?? '');
    final youtubeId = youtubeUrl.queryParameters['v'];

    _controller = YoutubePlayerController(
      initialVideoId: youtubeId ?? '',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.3),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              widget.data?.strMealThumb ?? '',
              loadingBuilder: (_, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              },
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.data?.strInstructions ?? '',
            style: AppStyle.content,
          ),
          const SizedBox(height: 10),
          Text(
            '#${widget.data?.strCategory ?? ' '}',
            style: AppStyle.hashtag,
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: YoutubePlayer(controller: _controller),
          ),
        ],
      ),
    );
  }
}
