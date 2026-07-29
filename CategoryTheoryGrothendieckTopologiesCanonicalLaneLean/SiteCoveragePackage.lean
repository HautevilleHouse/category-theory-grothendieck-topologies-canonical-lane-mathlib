import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryGrothendieckTopologiesCanonicalLaneLean.GrothendieckTopologyAdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

structure SiteCoveragePackage (O : GrothendieckToposObject) where
  coveringFamilies : O.site -> Set (Set (O.site -> O.site))
  stabilityUnderPullback : Prop
  transitivity : Prop
  locality : Prop
  coverageAxioms : Prop

structure SiteCoverageEvidence {O : GrothendieckToposObject} (C : SiteCoveragePackage O) where
  stabilityUnderPullbackClosed : C.stabilityUnderPullback
  transitivityClosed : C.transitivity
  localityClosed : C.locality
  coverageAxiomsClosed : C.coverageAxioms

def SiteCoverageClosed {O : GrothendieckToposObject} (C : SiteCoveragePackage O) : Prop :=
  C.stabilityUnderPullback ∧ C.transitivity ∧ C.locality ∧ C.coverageAxioms

theorem site_coverage_closed_from_evidence {O : GrothendieckToposObject}
    (C : SiteCoveragePackage O) (E : SiteCoverageEvidence C) :
    SiteCoverageClosed C := by
  exact And.intro E.stabilityUnderPullbackClosed
    (And.intro E.transitivityClosed
      (And.intro E.localityClosed E.coverageAxiomsClosed))

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse
