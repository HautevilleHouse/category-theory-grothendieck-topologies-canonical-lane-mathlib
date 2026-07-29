import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

structure SheafificationPackage (C : GrothendieckSite) (A : Type w) [Category A] [Limits A] where
  plusConstruction : Functor (Presheaves C.underlyingCategory A) (Presheaves C.underlyingCategory A)
  plusIdempotent : Prop
  sheafificationFunctor : Functor (Presheaves C.underlyingCategory A) (Sheaves C A)
  adjunctionCounit : Prop
  adjunctionUnit : Prop
  triangleIdentities : Prop

structure SheafificationEvidence {C : GrothendieckSite} {A : Type w} [Category A] [Limits A] (P : SheafificationPackage C A) where
  plusIdempotentClosed : P.plusIdempotent
  adjunctionCounitClosed : P.adjunctionCounit
  adjunctionUnitClosed : P.adjunctionUnit
  triangleIdentitiesClosed : P.triangleIdentities

def SheafificationClosed {C : GrothendieckSite} {A : Type w} [Category A] [Limits A] (P : SheafificationPackage C A) : Prop :=
  P.plusIdempotent ∧ P.adjunctionCounit ∧ P.adjunctionUnit ∧ P.triangleIdentities

theorem sheafification_closed_from_evidence {C : GrothendieckSite} {A : Type w} [Category A] [Limits A] (P : SheafificationPackage C A) (E : SheafificationEvidence P) : SheafificationClosed P := by
  exact And.intro E.plusIdempotentClosed (And.intro E.adjunctionCounitClosed (And.intro E.adjunctionUnitClosed E.triangleIdentitiesClosed))

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse
