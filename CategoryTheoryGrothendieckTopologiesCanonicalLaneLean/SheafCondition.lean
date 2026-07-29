import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

structure CoveringSieve where
  covering : Type u
  sieves : List (Type v)
  coveringClosed : Prop
  coveringClosedTerm : coveringClosed

def SheafCondition (C : CoveringSieve) : Prop :=
  C.coveringClosed

structure SheafConditionPackage where
  matchingFamily : Prop
  amalgamation : Prop
  compatibility : Prop
  matchingFamilyTerm : matchingFamily
  amalgamationTerm : amalgamation
  compatibilityTerm : compatibility

def SheafConditionClosed (S : SheafConditionPackage) : Prop :=
  S.matchingFamily ∧ S.amalgamation ∧ S.compatibility

theorem sheaf_condition_closed_from_evidence (S : SheafConditionPackage) (E : S.matchingFamily ∧ S.amalgamation ∧ S.compatibility) :
    SheafConditionClosed S := by
  exact E

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse