void main(List<String> args) {
//un future es una tarea asincrona que se resolvera en un futuro , es uma promesa

//el future resuelve un String
  Future<String> timeout = Future.delayed(Duration(seconds: 3), () {
    print("3 segundos despues");
    return 'Retorno del future';
  });

  timeout.then((texto) => print(texto));

  print("fin del main");
}
