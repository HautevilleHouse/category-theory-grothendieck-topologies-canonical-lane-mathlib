import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryGrothendieckTopologiesCanonicalLaneLean.GrothendieckTopologyBridgeLemmas
import CategoryTheoryGrothendieckTopologiesCanonicalLaneLean.SheafConditionGateLemmas

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

def ConstrainedGrothendieckTopologyClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_grothendieck_topology_endgame (A : AdmissibleClass) :
    ConstrainedGrothendieckTopologyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse
