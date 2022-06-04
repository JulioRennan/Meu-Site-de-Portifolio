import 'tech.dart';

class Project {
  String title;
  String description;
  String? urlImageRepo;
  StatusRepo statusRepo;
  String urlRepo;
  List<Tech> techs;
  Project({
    required this.title,
    required this.description,
    required this.statusRepo,
    required this.techs,
    this.urlImageRepo,
    this.urlRepo = '',
  }) : assert(!(statusRepo == StatusRepo.public && urlRepo.isEmpty),
            "Repositorios Públicos devem possuir Url para o repo.");
}

enum StatusRepo {
  private,
  public,
}
