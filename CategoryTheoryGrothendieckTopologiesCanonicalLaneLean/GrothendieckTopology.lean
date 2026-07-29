import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

structure GrothendieckTopology where
  category : Type u
  sieves : Type v
  maximality : Prop
  stability : Prop
  transitivity : Prop
  maximalityTerm : maximality
  stabilityTerm : stability
  transitivityTerm : transitivity

def GrothendieckTopologyClosed (G : GrothendieckTopology) : Prop :=
  G.maximality ∧ G.stability ∧ G.transitivity

theorem grothendieck_topology_closed_from_evidence (G : GrothendieckTopology) (E : G.maximality ∧ G.stability ∧ G.transitivity) :
    GrothendieckTopologyClosed G := by
  exact E

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse