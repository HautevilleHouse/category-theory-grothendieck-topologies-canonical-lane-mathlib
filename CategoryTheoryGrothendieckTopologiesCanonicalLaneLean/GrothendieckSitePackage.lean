import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

structure GrothendieckSitePackage where
  category : Type u
  coverage : Type v
  sievesDefined : Prop
  topologyAxioms : Prop
  sheafCondition : Prop

structure GrothendieckSiteEvidence (G : GrothendieckSitePackage) where
  sievesDefinedClosed : G.sievesDefined
  topologyAxiomsClosed : G.topologyAxioms
  sheafConditionClosed : G.sheafCondition

def GrothendieckSiteClosed (G : GrothendieckSitePackage) : Prop :=
  G.sievesDefined ∧ G.topologyAxioms ∧ G.sheafCondition

theorem grothendieck_site_closed_from_evidence
    (G : GrothendieckSitePackage) (E : GrothendieckSiteEvidence G) :
    GrothendieckSiteClosed G := by
  exact And.intro E.sievesDefinedClosed
    (And.intro E.topologyAxiomsClosed E.sheafConditionClosed)

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse