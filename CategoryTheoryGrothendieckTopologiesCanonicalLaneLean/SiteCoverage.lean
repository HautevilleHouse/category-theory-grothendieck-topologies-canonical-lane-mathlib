import HautevilleHouse.CategoryTheoryGrothendieckTopologiesCanonicalLaneLean.AdmissibleClass

/-!
# Site and Coverage Package
-/

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

structure CoveragePackage where
  site : Type u
  coveringFamilies : site → Set (Set site)
  stabilityUnderPullback : Prop
  compositionCondition : Prop
  localityCondition : Prop
  coverageAxioms : Prop

structure CoverageEvidence (C : CoveragePackage) where
  stabilityUnderPullbackClosed : C.stabilityUnderPullback
  compositionConditionClosed : C.compositionCondition
  localityConditionClosed : C.localityCondition
  coverageAxiomsClosed : C.coverageAxioms

def CoverageClosed (C : CoveragePackage) : Prop :=
  C.stabilityUnderPullback ∧ C.compositionCondition ∧ C.localityCondition ∧ C.coverageAxioms

theorem coverage_closed_from_evidence (C : CoveragePackage) (E : CoverageEvidence C) :
    CoverageClosed C := by
  exact And.intro E.stabilityUnderPullbackClosed
    (And.intro E.compositionConditionClosed
      (And.intro E.localityConditionClosed E.coverageAxiomsClosed))

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse