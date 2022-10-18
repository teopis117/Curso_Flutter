void main()
{
  
  //siempre es bueno poner el tipo de retorno
  
  
  final nombre= "pepe";
  
  //saludar(nombre,"holis");
  saludar2(nombre:nombre,mensaje:"holis");
  
}



//si no  especificamos el tipo de retorno
//siempre sera dynamic

//los arguementos en dart no necesitan llevar 
//el mismo nombre de la variable que enviamos

//para poder colocar un argumento por defecto o no obligatorio
//utilizamos los corchetes
void saludar(String nombre,[String mensaje = 'Hola'])
{
  
  
  print("$mensaje $nombre" );
}

//required nos sirve para que sea requerido o obligatorio
void saludar2({required String nombre,required String mensaje})
{
  print("hola mundo"); 
}