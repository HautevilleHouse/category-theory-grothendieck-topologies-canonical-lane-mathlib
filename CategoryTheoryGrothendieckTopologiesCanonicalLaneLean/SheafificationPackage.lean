import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryGrothendieckTopologiesCanonicalLaneLean.SiteCoveragePackage

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

structure SheafificationPackage {O : GrothendieckToposObject}
    (C : SiteCoveragePackage O) where
  presheafCategory : Type u
  sheafSubcategory : Type u
  plusConstruction : Type u
  sheafificationFunctor : Type u
  plusConstructionDefined : Prop
  sheafificationAdjunction : Prop
  sheafificationExact : Prop

structure SheafificationEvidence {O : GrothendieckToposObject}
    {C : SiteCoveragePackage O} (S : SheafificationPackage C) where
  plusConstructionDefinedClosed : S.plusConstructionDefined
  sheafificationAdjunctionClosed : S.sheafificationAdjunction
  sheafificationExactClosed : S.sheafificationExact

def SheafificationClosed {O : GrothendieckToposObject}
    {C : SiteCoveragePackage O} (S : SheafificationPackage C) : Prop :=
  S.plusConstructionDefined ∧ S.sheafificationAdjunction ∧ S.sheafificationExact

theorem sheafification_closed_from_evidence {O : GrothendieckToposObject}
    {C : SiteCoveragePackage O} (S : SheafificationPackage C)
    (E : SheafificationEvidence S) : SheafificationClosed S := by
  exact And.intro E.plusConstructionDefinedClosed
    (And.intro E.sheafificationAdjunctionClosed E.sheafificationExactClosed)

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse
