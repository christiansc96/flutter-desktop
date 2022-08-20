class CharacterDTO {
  String name;
  String image;

  CharacterDTO.fromJson(Map<dynamic, dynamic> json)
      : name = json['name'],
        image = (json['sprites'] == null)
            ? "https://plantillasdememes.com/img/plantillas/imagen-no-disponible01601774755.jpg"
            : json['sprites']['back_default'];
}
