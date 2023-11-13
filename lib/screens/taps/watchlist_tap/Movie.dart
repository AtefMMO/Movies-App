class Movie{
  static const String  collectionName='Movie';
  String ?id;


  Movie({required this.id,

   });

  Movie.fromFireStore(Map<String,dynamic>data){
    id=data['id'];


  }

  Map<String,dynamic> toFireStore(){
    return{
      'id':id,

    };
  }

}