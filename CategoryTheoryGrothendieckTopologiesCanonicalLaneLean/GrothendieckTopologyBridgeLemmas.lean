import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryGrothendieckTopologiesCanonicalLaneLean.GrothendieckTopologyAdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GrothendieckWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse
