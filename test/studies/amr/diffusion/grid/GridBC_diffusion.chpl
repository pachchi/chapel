use GridBC_def;


//===> ZeroFluxDiffusionGridBC derived class ===>
//==============================================>
class ZeroFluxDiffusionGridBC: GridBC {
  
  //===> applyBoundaryCondition method ===>
  //==============================>
  def applyBoundaryCondition(q: GridArray, t: real) {
    applyBoundaryConditionHomogeneous(q);
  }
  //<=== applyBoundaryCondition method <===
  //<==============================


  //===> applyBoundaryConditionHomogeneous method ===>
  //=========================================>
  def applyBoundaryConditionHomogeneous(q: GridArray) {
    
    for loc in ghost_locations {
      var shift: dimension*int;

      for d in dimensions {
	if loc(d) == loc1d.low then
	  shift(d) = 2;
	else if loc(d) == loc1d.high then
	  shift(d) = -2;
      }

      forall precell in grid.ghost_domain_set(loc) {
	var cell = tuplify(precell);
	q.value(cell) = q.value(cell+shift);
      }

    }

  }
  //<=== applyBoundaryConditionHomogeneous method <===
  //<=========================================

  
}
//<=== ZeroFluxDiffusionGridBC derived class <===
//<==============================================