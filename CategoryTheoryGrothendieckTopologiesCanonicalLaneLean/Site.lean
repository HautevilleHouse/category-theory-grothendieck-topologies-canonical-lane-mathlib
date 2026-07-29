import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

structure Site where
  topology : GrothendieckTopology
  topologyClosed : GrothendieckTopologyClosed topology
  presheaf : Presheaf
  presheafClosed : PresheafClosed presheaf
  compatibility : Prop
  compatibilityTerm : compatibility

def SiteClosed (S : Site) : Prop :=
  S.topologyClosed ∧ S.presheafClosed ∧ S.compatibility

theorem site_closed_from_evidence (S : Site) (E : SiteClosed S) :
    SiteClosed S := by
  exact E

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse