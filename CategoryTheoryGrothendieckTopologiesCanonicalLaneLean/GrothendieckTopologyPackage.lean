import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

structure GrothendieckTopologyPackage where
  site : Type u
  covering : site → Set (Set site)
  identityCover : Prop
  pullbackCover : Prop
  transitiveCover : Prop
  identityCoverTerm : identityCover
  pullbackCoverTerm : pullbackCover
  transitiveCoverTerm : transitiveCover

structure GrothendieckTopologyEvidence (G : GrothendieckTopologyPackage) where
  identityCoverClosed : G.identityCover
  pullbackCoverClosed : G.pullbackCover
  transitiveCoverClosed : G.transitiveCover

def GrothendieckTopologyClosed (G : GrothendieckTopologyPackage) : Prop :=
  G.identityCover ∧ G.pullbackCover ∧ G.transitiveCover

theorem grothendieck_topology_closed_from_evidence
    (G : GrothendieckTopologyPackage) (E : GrothendieckTopologyEvidence G) :
    GrothendieckTopologyClosed G := by
  exact And.intro E.identityCoverClosed (And.intro E.pullbackCoverClosed E.transitiveCoverClosed)

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse