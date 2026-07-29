import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

structure SiteCoveragePackage where
  site : GrothendieckSite
  coverageFullyDefined : Prop
  sieveGenerated : Prop
  closureUnderIsomorphism : Prop

structure SiteCoverageEvidence (P : SiteCoveragePackage) where
  coverageFullyDefinedClosed : P.coverageFullyDefined
  sieveGeneratedClosed : P.sieveGenerated
  closureUnderIsomorphismClosed : P.closureUnderIsomorphism

def SiteCoverageClosed (P : SiteCoveragePackage) : Prop :=
  P.coverageFullyDefined ∧ P.sieveGenerated ∧ P.closureUnderIsomorphism

theorem site_coverage_closed_from_evidence (P : SiteCoveragePackage) (E : SiteCoverageEvidence P) : SiteCoverageClosed P := by
  exact And.intro E.coverageFullyDefinedClosed (And.intro E.sieveGeneratedClosed E.closureUnderIsomorphismClosed)

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse
