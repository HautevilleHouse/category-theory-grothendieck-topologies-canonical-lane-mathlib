import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

structure ComparisonPackage (C D : GrothendieckSite) where
  continuousFunctor : Functor C.underlyingCategory D.underlyingCategory
  coverPreserving : Prop
  cocontinuous : Prop
  inducedTopology : Prop

structure ComparisonEvidence {C D : GrothendieckSite} (P : ComparisonPackage C D) where
  coverPreservingClosed : P.coverPreserving
  cocontinuousClosed : P.cocontinuous
  inducedTopologyClosed : P.inducedTopology

def ComparisonClosed {C D : GrothendieckSite} (P : ComparisonPackage C D) : Prop :=
  P.coverPreserving ∧ P.cocontinuous ∧ P.inducedTopology

theorem comparison_closed_from_evidence {C D : GrothendieckSite} (P : ComparisonPackage C D) (E : ComparisonEvidence P) : ComparisonClosed P := by
  exact And.intro E.coverPreservingClosed (And.intro E.cocontinuousClosed E.inducedTopologyClosed)

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse
