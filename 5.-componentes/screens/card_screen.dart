import 'package:fl_components/widgets/custom_card_type_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/widgets.dart';

import '../widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("tarjetas"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          //
          CustomCardType1(),
          SizedBox(
            height: 10,
          ),
          CustomCardType2(
              name: "halo 1",
              imageUrl:
                  "https://static.wikia.nocookie.net/halo/images/e/e3/Halo_Infinite_-_Logotipo.png/revision/latest?cb=20180611021938&path-prefix=es"),
          SizedBox(
            height: 10,
          ),
          CustomCardType2(
            name: null,
            imageUrl:
                "https://static.wikia.nocookie.net/halo/images/e/e1/Halo_infinite_arte_caratula.png/revision/latest/scale-to-width-down/1000?cb=20200722153219&path-prefix=es",
          ),
          SizedBox(
            height: 10,
          ),
          CustomCardType2(
            name: "y otroo hermoso halo",
            imageUrl:
                "https://static.wikia.nocookie.net/halo/images/f/f5/Halo_Infinite_fecha_oficial.jpeg/revision/latest/scale-to-width-down/1000?cb=20210828090107&path-prefix=es",
          ),
        ],
      ),
    );
  }
}
