import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
  const CustomCardType2(
      {super.key, required this.imageUrl, required this.name});

  final String? name;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      shadowColor: Colors.red.withOpacity(0.6),
      elevation: 10,
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(imageUrl),
            width: double.infinity,
            height: 230,
            placeholder: const AssetImage('assets/jar-loading.gif'),
            fit: BoxFit.fill,
            fadeInDuration: const Duration(milliseconds: 1000),
          ),
          if (name != null)
            Container(
                alignment: AlignmentDirectional.centerEnd,
                padding: const EdgeInsets.all(20),
                child: Text(name ?? 'No Tittle')),
        ],
      ),
    );
  }
}
