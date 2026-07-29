import CategoryTheoryGrothendieckTopologiesCanonicalLaneLean.SiteDefinition

namespace HautevilleHouse
namespace CategoryTheoryGrothendieckTopologiesCanonicalLaneLean

structure Presheaf (S : GrothendieckSite) where
  objs : S.carrier → Type
  res : ∀ {U V : S.carrier}, (V → U) → objs U → objs V
  functoriality : Prop

structure SheafCondition (S : GrothendieckSite) (P : SitePackage S) (F : Presheaf S) where
  descent : Prop
  gluing : Prop
  uniqueness : Prop

structure SheafPackage (S : GrothendieckSite) (P : SitePackage S) where
  sheaf : Presheaf S
  sheafCondition : SheafCondition S P sheaf

structure SheafEvidence (S : GrothendieckSite) (P : SitePackage S) (Sh : SheafPackage S P) where
  descentClosed : Sh.sheafCondition.descent
  gluingClosed : Sh.sheafCondition.gluing
  uniquenessClosed : Sh.sheafCondition.uniqueness

def SheafClosed (S : GrothendieckSite) (P : SitePackage S) (Sh : SheafPackage S P) : Prop :=
  Sh.sheafCondition.descent ∧
  Sh.sheafCondition.gluing ∧
  Sh.sheafCondition.uniqueness

theorem sheaf_closed_from_evidence (S : GrothendieckSite) (P : SitePackage S)
    (Sh : SheafPackage S P) (E : SheafEvidence S P Sh) : SheafClosed S P Sh :=
  And.intro E.descentClosed (And.intro E.gluingClosed E.uniquenessClosed)

end CategoryTheoryGrothendieckTopologiesCanonicalLaneLean
end HautevilleHouse
