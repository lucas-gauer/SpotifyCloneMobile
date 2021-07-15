import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //* App bar
    Widget appBar = Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Good afternoon',
            style: Theme.of(context).textTheme.headline5,
          ),
          IconButton(
            icon: Icon(Icons.settings_outlined),
            onPressed: () {},
          )
        ],
      ),
    );

    //* Playlist tile
    Widget playlistTile = Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.grey[700]!.withOpacity(.5),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Center(
              child: Icon(Icons.playlist_play),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text('Playlist name'),
            ),
          ),
        ],
      ),
    );

    //* Suggested playlists
    Widget suggestedPlaylists = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: List.generate(
          5,
          (index) {
            if (index % 2 == 1) return SizedBox(height: 8);
            //* Row of 2 tiles
            return Row(
              children: [
                //* Tile 1
                Flexible(child: playlistTile),

                VerticalDivider(width: 8),

                //* Tile 2
                Flexible(child: playlistTile),
              ],
            );
          }
        ),
      ),
    );

    //* Section item
    Widget sectionItem = Padding(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 156,
            decoration: BoxDecoration(
              color: Colors.grey[700],
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: Center(child: Icon(Icons.search)),
            ),
          ),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  'Subtitle',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );

    //* Section
    Widget section = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //* Section head
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.centerLeft,
          height: 56,
          child: Text(
            'Section title',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        //* Section body
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: 6,
            primary: false,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              if (index == 5) return Padding(
                padding: EdgeInsets.only(right: 16),
                child: sectionItem,
              );
              return sectionItem;
            },
          ),
        ),
      ],
    );

    //* Fake sections
    List<Widget> manySections = List.generate(3, (_) => section);

    //* Page
    return Scaffold(
      backgroundColor: Color(0xFF101010),
      body: SingleChildScrollView(
        child: Container(
          //* Background gradient
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topLeft,
              radius: 1.1,
              colors: [
                Colors.deepPurple[800]!,
                Color(0xFF101010),
              ],
            ),
          ),
          //* Body
          child: SafeArea(
            child: Column(
              children: [
                appBar,
                suggestedPlaylists,

                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Column(children: manySections),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
