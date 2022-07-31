
let dancers = [

  "Dans quelle division puis-je m’inscrire ?",
  {|
  <ul>
    <li>
      Si vous participez pour la première fois à une compétition adoptant le
      SCR4T, vous devez vous inscrire dans la division initée (voir cas
      particulier du lancement du SCR4T).
    </li>
    <li>
      Si vous avez accumulé au moins 6 points en division initiée dans un rôle
      donné, vous pouvez participer en division intermédiaire avec ce rôle. Si
      vous avez accumulé 12 points ou plus en division initiée vous devez
      compétiter en intermédiaire dans votre rôle principal. Entre 6 et 12
      points, tant que vous n’avez pas marqué de points intermédiaires, vous
      avez le choix entre les deux divisions. Si vous avez moins de 6 points
      initiés, vous devez continuer à participer en division initiée jusqu’à obtenir
      au moins 6 points dans un rôle donné.
    </li>
    <li>
      Si vous appartenez aux groupes suivants (danseurs invités au JNJ invité
      du P4T en 2022 ou 2019, JNJ vétéran du Club de Rock 4 Temps de l’ENS en
      2018, finaliste en division confirmé du P4T 2019) vous devez vous
      inscrire dans la division intermédiaire dans votre rôle principal.
    </li>
  </ul>
  |};

  "Je suis professeur, je n’ai jamais participé à une compétition utilisant le
  SCR4T, je souhaiterais ne pas faire concurrence à mes élèves ; pourrais-je
  exceptionnellement participer en division intermédiaire ?",
  Format.asprintf {|
  Vous pouvez effectuer une demande de dérogation au SCR4T en justifiant de
  votre statut de professeur. Le SCR4T vous donnera une dérogation pour
  participer à une compétition en intermédiaire et une seule. Si vous marquez
  des points au cours de cette compétition, vous serez définitivement admis en
  division intermédiaire. Si vous ne marquez pas de points au cours de cette
  division, il faudra soit marquer vos points en initiée à la prochaine
  compétition soit demander une autre dérogation. La dérogation doit être
  demandée par mail à l’adresse suivante au plus tard une semaine avant la
  compétition considérée : %s.
  |} Links.contact;

  "Je ne suis pas débutant mais je n’ai pas 6 points en division initiée, dans
  quelle division dois-je m’inscrire ?",
  {|
  À l’exception du lancement du SCR4T au Printemps 4 Temps 2022, vous devez
  vous inscrire en division initiée. Il suffira de marquer 6 points dans cette
  division pour pouvoir participer par la suite en division intermédiaire. <br />

  En effet, la division initiée n’est pas une division débutante, mais est
  adaptée aux danseur-euse-s de tous les niveaux. La division intermédiaire est
  réservée aux danseur-euse-s ayant fait leur preuves dans d’autres
  compétitions par l’accumulation de points.
  |};

  "Je pratique les deux rôles, dans quelle division puis-je participer avec chaque rôle ?",
  {|
  Les points accumulés dans chaque rôle sont indépendants. Par exemple, si vous
  avez 3 points en leader et 3 points en follower, bien que le total fasse 6
  points, vous n’avez pas accès à la division intermédiaire pour l’instant. Il
  faut gagner 6 points avec un rôle donné pour pouvoir le faire.
  |};


  "Je pratique les deux rôles (leader et follower), puis-je m’inscrire dans les deux rôles ?",
  {|
  Les règles ayant trait à la pratique des deux rôles sont déterminées par
  chaque événement, et non par le SCR4T, nous vous invitons à prendre contact
  avec les organisateurs de la compétition concernée. Dans tous les cas, pour
  pouvoir prétendre participer à une division donnée dans un rôle donnée, il
  faut remplir les prérequis de points dans le rôle concerné.
  |};

  "Je participe en division initiée, à quoi servent mes points ?",
  {|
  Vos points en division initiée s’accumulent de compétition en compétition.
  Quand vous accumulez 6 points, vous devenez éligible à la division
  intermédiaire avec ce rôle. A partir de 12 points initiés vous ne pouvez plus
  compétiter dans cette division, il faudra participer en division
  intermédiaire. De plus, ils permettent d’avoir une concrétisation tangible de
  votre progression en tant que danseur-euse et compétiteur-ice, et constituent
  un aspect ludique de la compétition !
  |};

  "Je viens de passer de la division initiée à la division intermédiaire, que
  deviennent mes points ?",
  {|
  Vos points initiés restent en mémoire dans le système. Néanmoins vos points
  initiés et intermédiaires sont disjoints, vous commencez à 0 points en
  intermédiaire et devrez donc accumuler des points propres à cette division.
  |};


  "Je participe en division intermédiaire, à quoi servent mes points ?",
  {|
  Pour l’instant, vos points en division intermédiaire s’accumulent de
  compétition en compétition. Ils constituent un aspect ludique de la
  compétition ! Ils permettent en plus d’avoir une concrétisation tangible de
  votre progression en tant que danseur-euse et compétiteur-ice. <br />

  Lorsque suffisamment de compétitions adopteront le SCR4T et suffisamment de
  danseur-euse-s formeront la division intermédiaire, les points de cette
  division serviront à mettre en place une division avancée. Il faudra avoir
  accumulé un certain nombre de points en division intermédiaire pour pouvoir
  s’inscrire en division avancée.
  |};

  "Comment puis-je savoir combien de points j’ai accumulé ?",
  {|
  Vous pouvez suivre l’évolution de votre point sur ce site internet, soit en
  cherchant les compétitions où vous avez participé, dans l’onglet
  « Events », soit en cherchant votre nom dans l’onglet « Compétiteurs ».
  |};

  "Quelles sont les compétitions dans lesquelles je peux accumuler des points ?",
  {|
  Vous ne pouvez marquer des points que dans les JNJ adoptant le SCR4T. Les
  compétitions participant au système l’annonceront. Vous pouvez également
  suivre les nouvelles compétitions adoptant le SCR4T et donnant accès à des
  points dans l’onglet “compétition”, ou en consultant la page FB du SCR4T. <br />

  Les Strictly et concours de chorégraphies ne donnent pas accès à des points
  compatibles avec le SCR4T, mais peuvent avoir des divisions, pour lesquelles
  les mêmes règles d’inscription décrites ci-dessus s’appliquent.
  |};

]

let orgas = [

  "J’organise un Jack and Jill, est-ce que je peux adopter le SCR4T ?",
  {|
  Oui ! Nous en serions ravis. Tout Jack and Jill peut accéder à la base de
  données des danseurs par division du SCR4T et donner accès à des points aux
  conditions suivantes :
  <ul>
    <li>
      Adopter une organisation phase préliminaire, demi-finale et finale,
      cohérente avec les tableaux dans l’onglet “Règles du SCR4T” [avec
      hyperlien]. L’ajout de quart de finale peut être envisagé en cas de forte
      affluence de participants dans une division sur discussion avec
      l’association gérant le SCR4T.
    </li>
    <li>
      Proposer un jury divers (ne pas avoir une majorité de juges provenant
      d’une seule école) et paritaire (autant de juges leader que follower),
      formé et expérimenté dans la mesure du possible.
    </li>
    <li>
      Accepter la présence d’un membre de l’association administrant le SCR4T
      lors de la compétition qui pourra être témoin du respect par les
      organisateur-ice-s des conditions ci-dessus.
    </li>
    <li>
      Dans la limite des règles limitant la pratique des deux roles pour votre
      compétition, ne pas refuser l’accès à sa division à un compétiteur sur
      d’autres motifs que ceux de la mise en danger d’autrui. Au contraire ne
      pas donner de dérogation pour la participation à une division s’il
      n’appartient pas à cette dernière d’après notre base de donnée et que la
      dérogation "professeur" (voire FAQ compétiteur) n'a pas été accordée par
      le SCR4T
    </li>
    <li>
      Le non-respect de ces règles pendant l’événement peut aboutir à
      l’annulation des points de votre compétition.
    </li>
  </ul>

  Si vous ne pouvez pas appliquer ces critères, votre JnJ ne donnera pas accès
  à des points enregistrés pour le SCR4T. Vous pourrez tout de même demander
  accès à la base de données des danseurs par division pour définir les
  divisions dans votre compétition.
  |};


  "Je veux que mon Jack and Jill utilise le SCR4T, que faire ?",
  Format.asprintf {|
  Pour avoir accès aux ressources du SCR4T et/ou garantir l’accès de vos
  danseurs aux points à l’issue de votre compétition, il suffit d’entrer en
  contact avec l’association gérant le SCR4T au moins un mois avant votre
  compétition. Pour cela vous pouvez nous écrire à l’adresse : %s ou via
  Messenger en vous adressant à notre page FB (lien : XXXX). <br />

  Ce que le SCR4T vous demandera :
  <ul>
    <li>
      si vous respectez les conditions précisées ci-dessus, c’est le prérequis
      nécessaire à la validation des points de votre compétition ;
    </li>
    <li>
      communiquer sur vos réseaux sociaux l’utilisation du SCR4T par votre
      compétition ;
    </li>
    <li>
      demander aux participants le droit à l’utilisation de leur nom dans la base
      de donnée du SCR4T
    </li>
    <li>
      nous communiquer les résultats de votre compétition après cette dernière,
      partager le lien vers notre site internet sur vos réseaux sociaux quand ces
      résultats et les points qui en découlent seront mis en ligne dessus.
    </li>
  </ul>

  Ce que le SCR4T vous donnera :
  <ul>
    <li>l’accès à ses listes de danseurs par divisions ;</li>
    <li>le SCR4T communiquera sur votre compétition sur sa page FB et son site internet ;</li>
    <li>le SCR4T mettra en ligne sur son site les résultats de vos compétitions
        et les points qui auront été gagnés seront enregistrés.</li>
  </ul>
  |} Links.contact;

  "Quels critères doit remplir le règlement de mon JnJ pour pouvoir adopter le SCR4T ?",
  {|
  Le SCR4T ne prétend pas à un droit de regard sur les critères de jugement
  appliqués par une compétition. Les seules conditions portent sur la structure
  de la compétition (division, étapes de compétitions) et non les critères de
  jugement ou des points d’organisations tels que la longueur de vos musiques
  par exemple.<br />

  Nous pouvons fournir sur demande aux compétitions qui le souhaiteraient :
  <ul>
    <li>
      Le règlement de certaines compétitions ayant adopté le SCR4T. Nous
      recommandons des barèmes évoluant avec les divisions, dans lesquels les
      attentes en division initiée mettent l’accent sur ce qui devrait selon
      nous être prioritaire lorsque l’on débute.
    </li>
    <li>
      Une formation à l’éthique du jugement pour vos juges si vous le demandez.
    </li>
  </ul>
  |};

  "J’organise un Strictly ou un concours de chorégraphie, est-ce que je peux
   quand même adopter le SCR4T ?",
  {|
  Ces formats de compétition ne donnent pas accès à des points compatibles avec
  le SCR4T car ils ne reflètent pas une évolution individuelle de chaque
  danseur-euse (inscription et notation par couple dès le début de la
  compétition). <br />

  Cependant, vous pouvez demander accès à la base de données pour définir des
  divisions dans votre compétition. Dans une compétition à couples fixes la
  division d’un couple est déterminée par la division la plus avancée à
  laquelle un des danseurs appartient. Ex : si un follower intermédiaire
  compétite en couple avec un leader initié, le couple devra compétiter en
  division intermédiaire.
  |};

]

let t =
  Page.mk
    ~page:"faq"
    ~title:"FAQ"
    ~body:(fun _req _st ->
        Faq_html.render ~dancers ~orgas
      )

