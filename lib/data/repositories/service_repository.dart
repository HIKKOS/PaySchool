
import 'package:hola_mundo/core/enties/service.dart';

class ServiceRepository {
  static List<Service> getServices() {
    List<Service> services = [];

    services.add(Service(
        id: 1,
        name: "Transporte",
        description: "Consequat adipisicing non ullamco elit culpa ipsum ea voluptate laboris qui sit commodo. Id id duis velit irure velit sint cupidatat enim elit sint proident. Proident id nostrud ex consequat cillum qui magna deserunt ex ea.",
        cost: 499.00,
        priority: "Cancelable",
        startDate: DateTime.parse("2023-01-01"),
        cutOffDate: DateTime.parse("2023-01-31"),
        urlImagenes: [
        "https://cdn.pixabay.com/photo/2020/01/17/20/03/school-bus-4773905_960_720.jpg", 
        "https://media.istockphoto.com/id/1257065028/es/foto/vista-de-%C3%A1ngulo-bajo-de-los-autobuses-escolares-amarillos-desde-la-parte-trasera-derecha-al.jpg?s=612x612&w=0&k=20&c=xirKO_nsbHHdiO952v3rT3GEtXEHpLzMdTMFKFNjngQ=",
        "https://media.istockphoto.com/id/530766151/es/foto/autob%C3%BAs-de-colegio.jpg?s=612x612&w=0&k=20&c=0uRZsFBY0XmLkTIC3ZqHbtjwBoXXiSQEQfVn0ZDq8q4=",
        ],
        urlIcon: 'assets/icons/bus.svg'));

    services.add(Service(
        id: 2,
        name: "Colegiatura",
        description: "Pago mensual de la colegiatura escolar",
        cost: 499.00,
        priority: "No cancelable",
        startDate: DateTime.parse("2022-08-01"),
        cutOffDate: DateTime.parse("2023-01-31"),
        urlImagenes: [
        "https://www.elcontribuyente.mx/wp-content/uploads/2020/08/ajustes-de-colegiaturas.jpg", 
        "https://cdn.pixabay.com/photo/2017/10/14/09/56/journal-2850091_640.jpg",
        ],
        urlIcon: 'assets/icons/colegiatura.svg'));


    return services;
  }
}