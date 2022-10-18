//las clases en dart pueden ser clases
void main() {
  //wolverine es de tipo heroe
  final wolverine = new Heroe();

  wolverine.nombre = "logan";
  wolverine.poder = "regeneracion";

  //una instancia de heroe
  print(wolverine);
}

//creamos una clase y podriamos decir que es un tipo
//de dato
class Heroe {
  //metodos,propiedades,getters,setters
  //hay muchos tipos de constructores

  //creamos propiedades de la clase
  //si definimos un String nos marara error
  //si no le definimos un valor

  //con el "?" especificamos que puede ser null
  String? nombre;
  String? poder;

  //override es sobreescribir
  // @override
  //   // String toString()
  //   {
  //     // return 'nombre:'
  //   }

}
