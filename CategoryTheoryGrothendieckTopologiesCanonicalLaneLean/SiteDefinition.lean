import CategoryTheoryGrothendieckTopologiesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

structure CoveringFamily (S : GrothendieckSite) where
  index : Type
  maps : index → S.carrier → S.carrier
  coveringProperty : Prop

structure SitePackage (S : GrothendieckSite) where
  coverings : Set (CoveringFamily S)
  maximalCover : CoveringFamily S
  stabilityUnderPullback : Prop
  transitivity : Prop
  coveringLaw : Prop

structure SiteEvidence (S : GrothendieckSite) (P : SitePackage S) where
  maximalCoverClosed : P.coverings.contains P.maximalCover
  stabilityUnderPullbackClosed : P.stabilityUnderPullback
  transitivityClosed : P.transitivity
  coveringLawClosed : P.coveringLaw

def SiteClosed (S : GrothendieckSite) (P : SitePackage S) : Prop :=
  P.coverings.contains P.maximalCover ∧
  P.stabilityUnderPullback ∧
  P.transitivity ∧
  P.coveringLaw

theorem site_closed_from_evidence (S : GrothendieckSite) (P : SitePackage S)
    (E : SiteEvidence S P) : SiteClosed S P :=
  And.intro E.maximalCoverClosed
    (And.intro E.stabilityUnderPullbackClosed
      (And.intro E.transitivityClosed E.coveringLawClosed))

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse
