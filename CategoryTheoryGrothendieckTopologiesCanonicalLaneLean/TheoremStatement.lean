import HautevilleHouse.CategoryTheoryGrothendieckTopologiesCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  grothendieckConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String
  deriving Repr

def sourceTheoremStatement : TheoremStatement :=
  { sourceKey := "grothendieck-topologies-canonical-lane",
    theoremName := "Grothendieck Topologies",
    theoremObject := "GrothendieckAdmittedObject",
    classicalBoundary := "classical boundary carried by GrothendieckWitnessClosed",
    grothendieckConstrainedStatement := "Grothendieck topology closure under admissible sieves",
    certificateLane := "grothendieck_constrained",
    carriedRemainder := "remainder carried by AdmissibleClass.remainderRecorded"
  }

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse