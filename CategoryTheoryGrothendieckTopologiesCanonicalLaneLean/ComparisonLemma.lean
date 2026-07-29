import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryGrothendieckTopologiesCanonicalLaneLean.GrothendieckSite

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

structure ComparisonLemma (S T : GrothendieckSite) where
  morphism : S.C ⥤ T.C
  continuous : ∀ (X : S.C) (R : Sieve (morphism.obj X)), R ∈ T.topology.covering (morphism.obj X) → (R.pullback (morphism.map (𝟙 X))) ∈ S.topology.covering X
  cocontinuous : ∀ (X : S.C) (S' : Sieve X), S' ∈ S.topology.covering X → (S'.map morphism) ∈ T.topology.covering (morphism.obj X)

structure ComparisonLemmaEvidence (S T : GrothendieckSite) (L : ComparisonLemma S T) where
  continuousClosed : L.continuous
  cocontinuousClosed : L.cocontinuous

def ComparisonLemmaClosed (S T : GrothendieckSite) (L : ComparisonLemma S T) : Prop :=
  L.continuous ∧ L.cocontinuous

theorem comparison_lemma_closed_from_evidence (S T : GrothendieckSite) (L : ComparisonLemma S T) (E : ComparisonLemmaEvidence S T L) :
  ComparisonLemmaClosed S T L := by
  exact And.intro E.continuousClosed E.cocontinuousClosed

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse
