import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

structure GrothendieckSite where
  underlyingCategory : Type u
  coverage : Type v
  coveringFamilies : coverage → underlyingCategory → Set (Set (Morphism underlyingCategory))
  stabilityUnderPullback : Prop
  stabilityUnderComposition : Prop
  localityCondition : Prop

structure SheafOnSite (C : GrothendieckSite) (A : Type w) [Category A] where
  functor : Functor (Opposite C.underlyingCategory) A
  sheafCondition : ∀ (U : C.underlyingCategory) (S : C.coveringFamilies C.coverage U), LimitPreserving (functor ∘ (Yoneda.embedding).op) S

structure GrothendieckTopologyEvidence (C : GrothendieckSite) where
  stabilityUnderPullbackClosed : C.stabilityUnderPullback
  stabilityUnderCompositionClosed : C.stabilityUnderComposition
  localityConditionClosed : C.localityCondition

def GrothendieckTopologyClosed (C : GrothendieckSite) : Prop :=
  C.stabilityUnderPullback ∧ C.stabilityUnderComposition ∧ C.localityCondition

theorem grothendieck_topology_closed_from_evidence (C : GrothendieckSite) (E : GrothendieckTopologyEvidence C) : GrothendieckTopologyClosed C := by
  exact And.intro E.stabilityUnderPullbackClosed (And.intro E.stabilityUnderCompositionClosed E.localityConditionClosed)

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse
