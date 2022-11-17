import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
  const BasicDesignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image(image: AssetImage('assets/image.jpg')),
          //!title section
          Tittle(),
          //!button section
          buttonSection(),
          //!description section
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: Text(
                "Adipisicing aliqua sit amet eiusmod sint Lorem ut duis cupidatat. Elit nisi veniam ad et id reprehenderit consectetur tempor culpa. Cupidatat id mollit labore magna pariatur ipsum est velit cillum. Tempor incididunt sunt excepteur deserunt qui proident ullamco sit magna et culpa incididunt. Tempor voluptate dolore ex proident in adipisicing amet culpa officia exercitation exercitation excepteur. Aliqua ex amet elit esse quis nisi ea ea consectetur veniam fugiat."),
          )
        ],
      ),
    );
  }
}

class Tittle extends StatelessWidget {
  const Tittle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Oeachinen lake campground",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "andersteg Switzerland",
                style: TextStyle(color: Colors.black45),
              ),
            ],
          ),
          //el expanded es un widget que empuja los elementos
          Expanded(child: Container()),
          Icon(
            Icons.star,
            color: Colors.red,
          ),
          Text("41"),
        ],
      ),
    );
  }
}

class buttonSection extends StatelessWidget {
  const buttonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CusttomButton(icon: Icons.call, texto: "CALL"),
          CusttomButton(icon: Icons.map, texto: "ROUTE"),
          CusttomButton(icon: Icons.share, texto: "SHARE"),
        ],
      ),
    );
  }
}

class CusttomButton extends StatelessWidget {
  final IconData icon;
  final String texto;
  const CusttomButton({
    Key? key,
    required this.icon,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          this.icon,
          color: Colors.blueAccent,
          size: 30,
        ),
        Text(
          this.texto,
          style: TextStyle(color: Colors.blueAccent),
        )
      ],
    );
  }
}
