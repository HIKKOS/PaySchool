class Service {
  final int id;
  final String name;
  final String description;
  final double cost;
  final String priority;
  final DateTime startDate;
  final DateTime cutOffDate;
  final String urlImagen;
  final String urlIcon;

  Service(
      {required this.id,
      required this.name,
      required this.description,
      required this.cost,
      required this.priority,
      required this.startDate,
      required this.cutOffDate,
      required this.urlImagen,
      required this.urlIcon});
}
