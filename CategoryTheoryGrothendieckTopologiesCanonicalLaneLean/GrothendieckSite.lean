import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

open CategoryTheory

structure GrothendieckSite where
  C : Type u
  [cat : Category C]
  topology : GrothendieckTopology C

structure GrothendieckTopology (C : Type u) [Category C] where
  covering : (X : C) → Set (Sieve X)
  stab : ∀ (X Y : C) (f : Y ⟶ X) (S : Sieve X), S ∈ covering X → (S.pullback f) ∈ covering Y
  trans : ∀ (X : C) (S : Sieve X), S ∈ covering X →
    ∀ (R : Sieve X), (∀ (f : Y ⟶ X) (_ : f ∈ S), R.pullback f ∈ covering Y) → R ∈ covering X

structure GrothendieckAdmittedObject where
  site : GrothendieckSite
  sheafConditionVerified : Prop
  plusConstructionClosed : Prop
  comparisonLemmaSatisfied : Prop
  conclusion : sheafConditionVerified ∧ plusConstructionClosed ∧ comparisonLemmaSatisfied

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse
