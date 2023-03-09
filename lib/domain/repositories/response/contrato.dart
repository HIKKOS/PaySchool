class ContratoDto {
  int vecesContratado;
  List<dynamic> horario;

  ContratoDto({
    required this.vecesContratado,
    required this.horario,
  });

  Map<String, dynamic> toJson() {
    return {
      "VecesContratado": vecesContratado,
      "Horario": horario.map((h) => h.toJson()).toList(),
    };
  }
}

class HorarioDto {
  String dia;
  int inicio;
  int fin;

  HorarioDto({
    required this.dia,
    required this.inicio,
    required this.fin,
  });

  Map<String, dynamic> toJson() {
    return {
      "Dia": dia,
      "Inicio": inicio,
      "Fin": fin,
    };
  }
}