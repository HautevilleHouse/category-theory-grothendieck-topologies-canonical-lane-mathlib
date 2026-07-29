import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

structure SheafConditionPackage where
  presheaf : Type u → Type v
  site : GrothendieckTopologyPackage
  sheafCondition : Prop
  locality : Prop
  gluing : Prop
  localityTerm : locality
  gluingTerm : gluing

structure SheafConditionEvidence (S : SheafConditionPackage) where
  localityClosed : S.locality
  gluingClosed : S.gluing

def SheafConditionClosed (S : SheafConditionPackage) : Prop :=
  S.locality ∧ S.gluing

theorem sheaf_condition_closed_from_evidence
    (S : SheafConditionPackage) (E : SheafConditionEvidence S) :
    SheafConditionClosed S := by
  exact And.intro E.localityClosed E.gluingClosed

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse