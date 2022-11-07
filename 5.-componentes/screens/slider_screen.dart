import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders & checks'),
      ),
      body: Column(
        children: [
          //el slider es un widget que nos sirve para poder recorrer un elemento y escoger un valor y como este widget necesita ser redibujado necesitamos trabajarlo con un statefullwidget
          Slider.adaptive(
              min: 50,
              max: 1000,
              //activecolor es para seleccionar el color
              activeColor: AppTheme.primary,
              value: _sliderValue,
              onChanged: _sliderEnabled
                  ? (value) {
                      _sliderValue = value;
                      //recordemos que el setstate hace que redibuje nuestro widget
                      setState(() {});
                    }
                  : null),

          Checkbox(
            value: _sliderEnabled,
            onChanged: (value) {
              _sliderEnabled = value ?? true;
              setState(() {});
            },
          ),

          CheckboxListTile(
            title: Text("habilitar constante"),
            activeColor: AppTheme.primary,
            value: _sliderEnabled,
            onChanged: (value) {
              setState(() {
                _sliderEnabled = value ?? true;
              });
            },
          ),
          Switch(
            value: _sliderEnabled,
            onChanged: (value) {
              setState(() {
                _sliderEnabled = value;
              });
            },
          ),

          SwitchListTile(
            title: Text("switchlisttile"),
            value: _sliderEnabled,
            onChanged: (value) {
              _sliderEnabled = value;
              setState(() {});
            },
          ),
          const AboutListTile(),

          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: NetworkImage(
                    'https://static.wikia.nocookie.net/halo/images/c/c0/HI_-_E3_2019_Img_2.jpg/revision/latest/scale-to-width-down/1000?cb=20190610013948&path-prefix=es'),
                fit: BoxFit.contain,
                width: _sliderValue,
                height: _sliderValue,
              ),
            ),
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
