import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

structure ToposCharacterizationPackage {C : Type u} [Category C] (G : GrothendieckTopologyPackage C) where
  toposCategory : Type (max u v)
  toposStructure : Topos toposCategory
  giraudAxioms : List Prop
  equivalence : (Sheaf G (Type v)) ≃ toposCategory
  preservesColimits : (sheafForget G) PreservesColimits
  hasFiniteLimits : HasFiniteLimits (Sheaf G (Type v))

structure ToposCharacterizationEvidence {C : Type u} [Category C] {G : GrothendieckTopologyPackage C} (P : ToposCharacterizationPackage G) where
  giraudAxiomsClosed : ∀ (ax : Prop) (hax : ax ∈ P.giraudAxioms), ax
  equivalenceClosed : (Sheaf G (Type v)) ≃ P.toposCategory
  preservesColimitsClosed : (sheafForget G) PreservesColimits
  hasFiniteLimitsClosed : HasFiniteLimits (Sheaf G (Type v))

def ToposCharacterizationClosed {C : Type u} [Category C] {G : GrothendieckTopologyPackage C} (P : ToposCharacterizationPackage G) : Prop :=
  (∀ (ax : Prop) (hax : ax ∈ P.giraudAxioms), ax) ∧
  (Sheaf G (Type v)) ≃ P.toposCategory ∧
  (sheafForget G) PreservesColimits ∧
  HasFiniteLimits (Sheaf G (Type v))

theorem topos_characterization_closed_from_evidence
    {C : Type u} [Category C] {G : GrothendieckTopologyPackage C} (P : ToposCharacterizationPackage G) (E : ToposCharacterizationEvidence P) :
    ToposCharacterizationClosed P := by
  exact And.intro E.giraudAxiomsClosed (And.intro E.equivalenceClosed (And.intro E.preservesColimitsClosed E.hasFiniteLimitsClosed))

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse