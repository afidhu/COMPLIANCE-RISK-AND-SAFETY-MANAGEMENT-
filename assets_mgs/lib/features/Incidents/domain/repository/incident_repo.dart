

import '../entities/incident_entity.dart';

abstract class IncidentRepo {
   Future<List<IncidentEntity>> getIncident();
   Future<bool> addIncident(IncidentEntity incident);
}