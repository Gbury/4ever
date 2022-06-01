
let l = [

  "A quoi sert ce site ?",
  "Ce site a pour but de fournir une archive des résultats des compétition
  de 4 temps. Cette archive a ensuite pour but à la fois d'aider à se souvenir
  de ces différents résultats, mais aussi de servir de support au système
  compétitif à points développé par le SCR4T.";

  "Pourquoi ce site contient-il un mélange d'anglais et de Français ?",
  "Très simplement parce que son auteur est un informaticien fatigué
  qui fallback sur de l'anglais dès qu'il mets plus d'une demie-seconde
  à trouver le mot français qu'il cherche.";

  "Division badges",
  Format.asprintf "%s %s blabla"
    (Badge.division Fourever.Division.Novice)
    (Badge.division Fourever.Division.Intermediate);

]

let t =
  Page.mk
    ~page:"faq"
    ~title:"FAQ"
    ~body:(fun _req _st ->
        Faq_html.render l
      )

