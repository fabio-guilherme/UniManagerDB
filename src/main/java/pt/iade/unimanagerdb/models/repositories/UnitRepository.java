package pt.iade.unimanagerdb.models.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import pt.iade.unimanagerdb.models.Unit;
////import pt.iade.unimanagerdb.models.views.UnitPlanView;

public interface UnitRepository extends CrudRepository<Unit, Integer> {
    // Queries de filtragem
/* 
    // Custom queries
    String QueryFindUnitPlans = "SELECT u.cla_id AS id, u.cla_name AS name, " +
            "u.cla_credits AS credits, " +
            "p.plan_semester AS semester, " +
            "c.cour_name AS courseName, c.cour_id AS courseId " +
            "FROM classes u " +
            "INNER JOIN studyplans p ON u.cla_id=p.plan_cla_id " +
            "INNER JOIN courses c ON p.plan_cour_id=c.cour_id";

    @Query(value=QueryFindUnitPlans, nativeQuery=true) 
            Iterable<UnitPlanView> findAllUnitPlans();

    @Query(value = QueryFindUnitPlans +
                   " Where u.cla_id=:id", nativeQuery = true) 
            Iterable<UnitPlanView> findUnitPlansById(
                                        @Param("id") int id);
*/
}
