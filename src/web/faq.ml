
let dancers = [

  "Dans quelle division puis-je m’inscrire ?",
  {|
  <ul>
    <li>
      Si vous participez pour la première fois à une compétition
      adoptant le SCR4T, vous devez vous inscrire dans la division Initié.
    </li>
    <li>
      Si vous avez accumulé au moins 15 points en division Initié dans
      un rôle donné, vous pouvez participer en division Intermédiaire
      dans ce rôle. Si vous avez accumulé 25 points ou plus en division
      Initié dans un rôle, vous devez compétiter en division Intermédiaire dans ce rôle. 
      Entre 15 et 24 points inclus, et tant que vous n’avez pas
      marqué de points Intermédiaire, vous avez le choix entre ces deux
      divisions. Si vous avez moins de 15 points Initié, vous devez
      continuer à participer en division Initié jusqu’à obtenir au moins
      15 points dans un rôle donné. Si vous avez au moins 1 point
      Intermédiaire, vous devez participer en Intermédiaire.
    </li>
    <li>
      Si vous avez accumulé au moins 30 points en division Intermédiaire
      dans un rôle donné, vous pouvez participer en division Avancé dans
      ce rôle. Si vous avez accumulé 40 points ou plus en division Intermédiaire 
      dans un rôle donné, vous devez compétiter en division Avancé dans ce rôle. 
      Entre 30 et 39 points inclus, et tant que vous n’avez pas marqué de points 
      Avancé, vous avez le choix entre ces deux divisions. Si vous avez au moins 
      1 point Avancé, vous devez participer en Avancé. S’il n’y a pas assez
      d’inscrit-e-s pour ouvrir la division Avancé à une compétition donnée, 
      les danseur-euse-s de cette division pourront exceptionnellement participer 
      en division Intermédiaire.
    </li>
  </ul>
  |};

  "Je suis professeur, je souhaiterais ne pas faire concurrence à mes élèves;
  pourrais-je exceptionnellement participer en division Intermédiaire ?",
  Format.asprintf {|
  Il est possible de faire une demande de dérogation pour participer dans
  la division suivante à la sienne uniquement. Cette demande doit être
  transmise au SCR4T et à la compétition en question au moins une semaine
  avant la compétition. La demande est soumise au SCR4T et au président-e
  du jury qui l’acceptent ou non. Vous pouvez en lire plus %s.
  |} (Links.rules_petition "ici");

  "J’ai très souvent été juge ou scoreur-euse lors de compétition SCR4T.
  Je n’ai donc pas pu compétiter et marquer des points dans ma division.
  Puis-je exceptionnellement participer dans une autre division ?",
  Format.asprintf {|
  Il est possible de faire une demande de dérogation pour participer
  dans la division suivante à la sienne uniquement. Cette demande doit
  être transmise au SCR4T et à la compétition en question au moins une
  semaine avant la compétition. La demande est soumise au SCR4T et au
  président-e du jury qui l’acceptent ou non. Vous pouvez en lire plus %s.
  |} (Links.rules_petition "ici");

  "Ça fait longtemps que je n’ai pas compétité, dois-je m’inscrire dans
  mon ancienne division ?",
  Format.asprintf {|
  Les points SCR4T restent en mémoire sans limite de temps, la division
  d’inscription ne change pas. Cependant, si ça fait 3 ans ou plus que
  vous n’avez pas participé à une division SCR4T, il est possible de faire
  une demande de dérogation pour participer dans la division précédante à
  la sienne. Cette demande doit être transmise au SCR4T et à la compétition
  en question au moins une semaine avant la compétition. La demande est
  soumise au SCR4T et au président-e du jury qui l’acceptent ou non. Vous
  pouvez en lire plus %s.
  |} (Links.rules_petition "ici");

  "Je ne suis pas débutant mais je n’ai pas 15 points en division Initié, dans
  quelle division dois-je m’inscrire ?",
  {|
  À l’exception du lancement du SCR4T au Printemps 4 Temps 2022, vous devez
  vous inscrire en division Initié. Il suffira de marquer 15 points dans cette
  division pour pouvoir participer par la suite en division Intermédiaire. <br />

  En effet, la division Initié n’est pas une division débutante, mais est
  adaptée à des danseur-euse-s de niveaux variés qui commencent leur parcours 
  compétitif SCR4T. Les divisions Intermédiaire et Avancé
  sont réservées aux danseur-euse-s ayant fait leur preuves dans d’autres
  compétitions par l’accumulation de points.
  |};

  "Je pratique les deux rôles (leader et follower), dans quelle division
  puis-je participer avec chaque rôle ?",
  {|
  Les points accumulés dans chaque rôle sont indépendants. Par exemple, si vous
  avez 10 points Initié en leader et 5 points Initié en follower, bien que le total fasse 15
  points, vous n’avez pas accès à la division Intermédiaire pour l’instant. Il
  faut gagner 15 points avec un rôle donné pour pouvoir le faire.
  |};


  "Je pratique les deux rôles (leader et follower), puis-je m’inscrire dans les deux rôles ?",
  {|
  Les règles ayant trait à la pratique des deux rôles sont déterminées par
  chaque événement, et non par le SCR4T, nous vous invitons à prendre contact
  avec les organisateurs de la compétition concernée. Dans tous les cas, pour
  pouvoir prétendre participer à une division donnée dans un rôle donné, il
  faut remplir les prérequis de points dans le rôle concerné.
  |};

  "Je participe en division Initié, à quoi servent mes points ?",
  {|
  Vos points en division Initié s’accumulent de compétition en compétition.
  Quand vous accumulez 15 points, vous devenez éligible à la division
  Intermédiaire avec ce rôle. A partir de 25 points Initié vous ne pouvez plus
  compétiter dans cette division, il faudra participer en division
  Intermédiaire. De plus, ils permettent d’avoir une concrétisation tangible de
  votre progression en tant que danseur-euse et compétiteur-ice, et constituent
  un aspect ludique de la compétition !
  |};

  "Je viens de passer de la division Initié à la division Intermédiaire, que
  deviennent mes points ?",
  {|
  Vos points Initié restent en mémoire dans le système. Néanmoins vos points
  Initié et Intermédiaire sont disjoints, vous commencez à 0 points en
  Intermédiaire et devrez donc accumuler des points propres à cette division.
  |};


  "Je participe en division Intermédiaire, à quoi servent mes points ?",
  {|
  Vos points en division Intermédiaire s’accumulent de compétition en compétition
  depuis la création du SCR4T. Quand vous accumulez 30 points dans un rôle, 
  vous devenez éligible à la division Avancé avec ce rôle. 
  A partir de 40 points Intermédiaire dans un rôle, vous ne pouvez plus compétiter 
  dans cette division, il faudra participer en division Avancé.
  De plus, ils permettent d’avoir une concrétisation tangible de votre progression
  en tant que danseur-euse et compétiteur-ice, et constituent un aspect ludique
  de la compétition !
  |};

  "Je viens de passer de la division Intermédiaire à la division Avancé,
  que deviennent mes points ?",
  {|
  Vos points Intermédiaire restent en mémoire dans le système.
  Néanmoins vos points Intermédiaire et Avancé sont disjoints, vous commencez
  à 0 points en Avancé et devrez donc accumuler des points propres à cette division.
  |};

  "Je participe en division Avancé, à quoi servent mes points ?",
  {|
  Pour l’instant, vos points en division Avancé s’accumulent de
  compétition en compétition. Ils constituent un aspect ludique de la compétition !
  Ils permettent en plus d’avoir une concrétisation tangible de votre progression
  en tant que danseur-euse et compétiteur-ice.
  Il n’est pour l’instant pas envisagé de créer une division au-dessus d’Avancé 
  dans le SCR4T, c’est donc la division la plus élevée. 
  Si tu l’as atteinte, bravo !
  |};


  "Comment puis-je savoir combien de points j’ai accumulé ?",
  {|
  Votre nom apparait sur ce site dès le premier point gagné dans une
  compétition SCR4T. Vous pouvez alors suivre l’évolution de vos points, soit
  en cherchant les compétitions où vous avez participé, dans l’onglet « Évènements »,
  soit en cherchant votre nom dans l’onglet « Compétiteurs ». Les nombres de
  point et la division sont mis à jour après chaque compétition SCR4T.
  |};

  "Quelles sont les compétitions dans lesquelles je peux accumuler des points ?",
  Format.asprintf {|
  Vous ne pouvez marquer des points que dans les Jack N' Jill (compétition à inscription
  individuelle, partenaires et musiques tirés au hasard tout au long des étapes)
  adoptant le SCR4T. Les compétitions participant au système l’annonceront. 
  Vous pouvez également suivre les nouvelles compétitions adoptant le SCR4T 
  et donnant accès à des points dans l’onglet “Évènements”, ou en consultant %s. <br />

  Les Strictly et concours de chorégraphies ne donnent pas accès à des points
  compatibles avec le SCR4T, mais peuvent avoir des divisions basées sur le SCR4T,
  pour lesquelles les mêmes règles d’inscription décrites ci-dessus s’appliquent.

  Que la compétition donne accès aux points SCR4T ou utilisent ses divisions nous
  vous conseillons de consulter le règlement de la compétition en question avant
  de vous inscrire.
  |} (Links.fb_page "la page FB du SCR4T");

]

let orgas = [

  "J’organise un Jack and Jill, est-ce que je peux adopter le SCR4T ?",
  Format.asprintf {|
  Oui ! Nous en serions ravis. Tout Jack and Jill peut accéder à la base de
  données des danseurs par division du SCR4T et donner accès à des points aux
  conditions suivantes :
  <ul>
    <li>
      Adopter une organisation phase préliminaire, demi-finale et finale,
      cohérente avec les tableaux de la page <a href="/rules">Règles du SCR4T</a>.
      L’ajout de quart de finale peut être envisagé en cas de forte
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
      Dans la limite des règles limitant la pratique des deux rôles pour votre
      compétition, ne pas refuser l’accès à sa division à un-e compétiteur-ice sur
      d’autres motifs que ceux de la mise en danger d’autrui. Au contraire ne
      pas donner de dérogation pour la participation à une division s’iel
      n’appartient pas à cette dernière d’après notre base de donnée, sauf si
      d'éventuelles demandes de dérogation (voir %s) ont été validées par le SCR4T
      et le-a président-e du jury.
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

  Les évènements utilisant le SCR4T s’engagent à mettre en place un environnement
  inclusif et bienveillant, en ligne avec les objectifs du SCR4T de créer un système
  motivant et épanouissant pour tout le monde et de promouvoir l’aspect ludique de
  la compétition.
  |} (Links.rules_petition "ici");


  "Je veux que mon Jack and Jill utilise le SCR4T, que faire ?",
  Format.asprintf {|
  Pour avoir accès aux ressources du SCR4T et/ou garantir l’accès de vos
  danseurs aux points à l’issue de votre compétition, il suffit d’entrer en
  contact avec l’association gérant le SCR4T au moins un mois avant votre
  compétition. Pour cela vous pouvez nous écrire à l’adresse : %s ou via
  Messenger en vous adressant à %s. <br />

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
    <li>si vous le souhaitez, nous mettons à votre disposition le logiciel de scoring
        intégré à la base de données, basé sur les règlements précédemment utilisés par
        des compétitions SCR4T. Nous vous encourageons à envisager de rémunérer les
        scoreur-euses qui vous aideront, si votre trésorerie le permet;</li>
    <li>Le maintien de la base de données en ligne et son amélioration repose sur le
        travail de bénévoles, mais encourt des frais (droits de domaine, espace sur
        les serveurs permettant le stockage des informations relatives aux points et
        aux compétitions). Ces frais annuels sont divisés entre les compétitions ayant
        adopté le SCR4T qui y allouent une partie de leurs bénéfices. La part payée par
        chaque compétition bénéficiaire est déterminée de façon proportionnelle à ces
        bénéfices.</li>
  </ul>
  |} Links.contact (Links.fb_page "notre page FB");

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

  "J’organise un Jack and Jill, puis-je proposer d’autres divisions que
  les divisions SCR4T ?",
  {|
  Dans tous les cas, seules les divisions officielles du SCR4T peuvent
  donner des points. Vous pouvez si vous le souhaitez proposer d’autres
  divisions, à condition que les personnes éligibles à celles-ci aient le
  choix de s’inscrire dans leur division SCR4T (et donc ne pas être empéchées
  de participer dans leur division SCR4T et d’éventuellement y gagner des points).
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

