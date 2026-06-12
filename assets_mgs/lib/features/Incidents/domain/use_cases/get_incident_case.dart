
import '../entities/incident_entity.dart';
import '../repository/incident_repo.dart';

class GetIncidentCase {

  final IncidentRepo incidentRepo;

  GetIncidentCase(this.incidentRepo);

  Future<List<IncidentEntity>> call(){
    return incidentRepo.getIncident();
  }
}