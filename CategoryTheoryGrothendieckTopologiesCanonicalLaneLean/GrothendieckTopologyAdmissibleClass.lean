import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

structure GrothendieckToposObject where
  site : Type u
  coveringSieves : site -> Set (Set (site))
  satisfiesGrothendieckAxioms : Prop
  conclusion : satisfiesGrothendieckAxioms

structure AdmissibleClass where
  object : GrothendieckToposObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  GrothendieckWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse
