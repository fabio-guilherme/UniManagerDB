package pt.iade.unimanagerdb.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import pt.iade.unimanagerdb.models.Unit;
import pt.iade.unimanagerdb.models.repositories.UnitRepository;
import pt.iade.unimanagerdb.models.views.UnitPlanView;

@RestController
@RequestMapping(path = "/api/units")
public class UnitController {
    private Logger logger = LoggerFactory.getLogger(UnitController.class);
    @Autowired
    private UnitRepository unitRepository;
    @GetMapping(path = "", produces = MediaType.APPLICATION_JSON_VALUE)
    public Iterable<Unit> getUnits() {
        logger.info("Sending all units");
        return unitRepository.findAll();
    }

 @GetMapping(path = "/plans/", produces = MediaType.APPLICATION_JSON_VALUE )
public Iterable<UnitPlanView> getUnitPlans() {
  logger.info("Sending all plans of units");
  return unitRepository.findAllUnitPlans();
}

@GetMapping(path="/plans/{unitId}",produces = MediaType.APPLICATION_JSON_VALUE )
public Iterable<UnitPlanView> getUnitPlan(@PathVariable int unitId) {
  logger.info("Plans of unit with id "+unitId);
  return unitRepository.findUnitPlansById(unitId);
}



}
