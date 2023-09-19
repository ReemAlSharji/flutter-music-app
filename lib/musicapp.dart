import 'package:audioplayers/audioplayers.dart';
import 'package:music_app/custom_playist.dart';
import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';

class PlayMusic extends StatefulWidget {
  const PlayMusic({super.key});

  @override
  State<PlayMusic> createState() => _PlayMusicState();
}

class _PlayMusicState extends State<PlayMusic> {
  String currentTitle = '';
  String currentSinger = '';
  String curretCover = '';
  // ignore: prefer_typing_uninitialized_variables
  var playIcon;
  bool isPlaying = false;

  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  List music = [
    {
      'title': 'Tech House vibes',
      'singer': 'Alejandro Magaña',
      'url':
          'https://assets.mixkit.co/music/preview/mixkit-tech-house-vibes-130.mp3',
      'cover_url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSgiknv5AT4-5usBSrynfY1Q5W9uUTxMpuBw&usqp=CAU'
    },
    {
      'title': 'Hazy after hours',
      'singer': 'Eugenio Mininni',
      'url':
          'https://assets.mixkit.co/music/preview/mixkit-hazy-after-hours-132.mp3',
      'cover_url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiWgRc0s_cLTM0urpK_soMiG_2YUlUOWhwPw&usqp=CAU'
    },
    {
      'title': 'Hip hop     ',
      'singer': 'Michael Ramir',
      'url': 'https://assets.mixkit.co/music/preview/mixkit-hip-hop-02-738.mp3',
      'cover_url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfVJUVmtYK9sIoJc3zEhwCEIgFdmdK2TK6dw&usqp=CAU'
    },
    {
      'title': 'Happy christmas',
      'singer': 'Arulo',
      'url':
          'https://assets.mixkit.co/music/preview/mixkit-a-very-happy-christmas-897.mp3',
      'cover_url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHIgmC_c0Xb2yFGA9_DRVkBjDgfOLAh0HN2w&usqp=CAU'
    },
    {
      'title': 'Driving ambition',
      'singer': 'Diego Nava',
      'url':
          'https://assets.mixkit.co/music/preview/mixkit-driving-ambition-32.mp3',
      'cover_url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmbbSDMwyj8wavbl5vqkDvtFnscl7Mu22X7g&usqp=CAU'
    },
    {
      'title': 'Serene View',
      'singer': 'Ahjay Stelino',
      'url':
          'https://assets.mixkit.co/music/preview/mixkit-serene-view-443.mp3',
      'cover_url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3hL-5Imwxdqc3k1Gph2UGptRrCxnSwnLP3w&usqp=CAU'
    },
    {
      'title': 'Dreaming big',
      'singer': 'Grigoriy Nuzhny',
      'url':
          'https://assets.mixkit.co/music/preview/mixkit-dreaming-big-31.mp3',
      'cover_url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwbFIeqIi8YlX1FJmI3hlaVFYdluqa4zW8lg&usqp=CAU'
    },
    {
      'title': 'Complicated',
      'singer': 'Francisco Alvear',
      'url':
          'https://assets.mixkit.co/music/preview/mixkit-complicated-281.mp3',
      'cover_url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO-RJoyWwvL5Q2zHo1UE0K03GisHZldnh5Bg&usqp=CAU'
    },
    {
      'title': 'Raising me higher',
      'singer': 'Grigoriy Nuzhny',
      'url':
          'https://assets.mixkit.co/music/preview/mixkit-raising-me-higher-34.mp3',
      'cover_url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzf9kniBbmmgD8j3uCJkbcQ8Ncvk96Z2QVxg&usqp=CAU'
    },
  ];
  AudioPlayer player = AudioPlayer();

  playmusic(String url) async {
    await player.play(UrlSource(url));
  }

  pausemusic(String url) async {
    await player.pause();
  }

  var pauseIcon =
      IconButton(onPressed: () {}, icon: const Icon(Icons.pause_circle));

  //position and duration of audio
  @override
  void initState() {
    super.initState();
    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'My playist',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Andika-Regular'),
          ),
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomLeft,
                  colors: <Color>[
                    Color.fromARGB(216, 134, 125, 125),
                    Color.fromARGB(255, 100, 28, 112)
                  ]),
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 8),
          child: Column(
            children: [
              Expanded(
                  child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: music.length,
                separatorBuilder: ((context, index) => const Divider(
                      endIndent: 50,
                      indent: 50,
                    )),
                itemBuilder: ((context, index) => customPlayist(
                      ontap: () {
                        playmusic(music[index]['url']);
                        setState(() {
                          currentTitle = music[index]['title'];
                          currentSinger = music[index]['singer'];
                          curretCover = music[index]['cover_url'];
                          playIcon = IconButton(
                              onPressed: () {
                                pausemusic(music[index]['url']);
                                setState(() {
                                  playIcon = pauseIcon;
                                });
                              },
                              icon: const Icon(Icons.play_arrow),
                              iconSize: 20);
                        });
                      },
                      title: music[index]['title'],
                      singer: music[index]['singer'],
                      cover: music[index]['cover_url'],
                    )),
              )),
              Slider.adaptive(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: ((value) {
                    final position = Duration(seconds: value.toInt());
                    player.seek(position);
                    player.resume();
                  }),
                  activeColor: const Color.fromARGB(111, 105, 98, 98),
                  thumbColor: Colors.black,
                  inactiveColor: const Color.fromARGB(83, 105, 98, 98)),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Row(children: [
                  const SizedBox(width: 50),
                  Expanded(child: Text(position.toString().split('.')[0])),
                  const SizedBox(width: 50),
                  Expanded(child: Text(duration.toString().split('.')[0]))
                ]),
              ),
              Row(children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 13, bottom: 7),
                    height: 70,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image:
                            DecorationImage(image: NetworkImage(curretCover))),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        currentTitle,
                        style: const TextStyle(
                            fontSize: 12.5, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        currentSinger,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container(child: playIcon))
              ])
            ],
          ),
        ));
  }
}
