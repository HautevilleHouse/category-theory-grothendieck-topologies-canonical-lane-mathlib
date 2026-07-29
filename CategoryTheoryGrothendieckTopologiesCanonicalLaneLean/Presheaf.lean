import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

structure Presheaf where
  category : Type u
  target : Type v
  functoriality : Prop
  contravariance : Prop
  functorialityTerm : functoriality
  contravarianceTerm : contravariance

def PresheafClosed (P : Presheaf) : Prop :=
  P.functoriality ∧ P.contravariance

theorem presheaf_closed_from_evidence (P : Presheaf) (E : P.functoriality ∧ P.contravariance) :
    PresheafClosed P := by
  exact E

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse