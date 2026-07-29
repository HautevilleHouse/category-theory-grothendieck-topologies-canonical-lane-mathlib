import categoryTheoryGrothendieckTopologiesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

structure Site where
  Obj : Type u
  Arrows : Type v
  domain : Arrows → Obj
  codomain : Arrows → Obj
  identity : (X : Obj) → Arrows
  composition : (f g : Arrows) → (domain g = codomain f) → Arrows
  coveringFamilies : (X : Obj) → Set (Set Arrows)
  sieve : (X : Obj) → Set Arrows
  coveringSieve : (X : Obj) → Set (Set Arrows)
  pullbackSieve : (f : Arrows) → (S : Set Arrows) → Set Arrows
  baseChange : ∀ (f : Arrows) (S : coveringFamilies (codomain f)), coveringFamilies (domain f)
  localization : ∀ (X : Obj) (S : coveringFamilies X), ∀ (f : Arrows) (domain f = X), coveringFamilies (codomain f)
  transitivity : ∀ (X : Obj) (S : coveringFamilies X) (T : coveringFamilies X), S ∪ T ∈ coveringFamilies X
  identityCover : ∀ (X : Obj), {identity X} ∈ coveringFamilies X

structure Sheaf (S : Site) where
  presheaf : Type w → (S.Obj → Type w)
  restriction : ∀ {X Y : S.Obj} (f : S.Arrows) (domain f = X) (codomain f = Y), presheaf Y → presheaf X
  glueing : ∀ {X : S.Obj} (cover : S.coveringFamilies X) (sections : (f : S.Arrows) → (hf : f ∈ cover) → presheaf (S.domain f)),
    (∀ f g : S.Arrows, (hf : f ∈ cover) (hg : g ∈ cover) (h : S.domain f = S.codomain g) →
      restriction f (sections f hf) = restriction g (sections g hg)) → presheaf X
  locality : ∀ {X : S.Obj} (cover : S.coveringFamilies X) (s t : presheaf X),
    (∀ (f : S.Arrows) (hf : f ∈ cover), restriction f s = restriction f t) → s = t

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse