import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

structure PlusConstructionPackage where
  presheaf : Type u → Type v
  plusPresheaf : Type u → Type v
  universalProperty : Prop
  functoriality : Prop

structure PlusConstructionEvidence (P : PlusConstructionPackage) where
  universalPropertyClosed : P.universalProperty
  functorialityClosed : P.functoriality

def PlusConstructionClosed (P : PlusConstructionPackage) : Prop :=
  P.universalProperty ∧ P.functoriality

theorem plus_construction_closed_from_evidence (P : PlusConstructionPackage)
    (E : PlusConstructionEvidence P) : PlusConstructionClosed P := by
  exact And.intro E.universalPropertyClosed E.functorialityClosed

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse