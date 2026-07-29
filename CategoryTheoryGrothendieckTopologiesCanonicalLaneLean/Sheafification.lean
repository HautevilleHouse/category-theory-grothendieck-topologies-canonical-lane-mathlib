import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

structure SheafificationPackage where
  presheaf : Type u → Type v
  sheafification : Type u → Type v
  unit : Prop
  universalProperty : Prop

structure SheafificationEvidence (S : SheafificationPackage) where
  unitClosed : S.unit
  universalPropertyClosed : S.universalProperty

def SheafificationClosed (S : SheafificationPackage) : Prop :=
  S.unit ∧ S.universalProperty

theorem sheafification_closed_from_evidence (S : SheafificationPackage)
    (E : SheafificationEvidence S) : SheafificationClosed S := by
  exact And.intro E.unitClosed E.universalPropertyClosed

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse