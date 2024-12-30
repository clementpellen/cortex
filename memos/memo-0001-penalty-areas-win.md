# MEMO 0001 : Gagner dans les 2 surfaces de réparation

date: 13-12-2024

auteur: Clément

Lors du week-end geek du 7 décembre, Quentin et moi avons démarré le projet `NextCloud`.
Ce projet vise à monter un serveur NextCloud pour stocker et partager nos fichiers
sans être dépendants des GAFAM.

Une des grandes problématiques dont Quentin et moi discutions
depuis depuis plusieurs semaines est le décalage entre
**valeur perçue** et **valeur réelle** d'un projet IT.

Cette problématique est courante mais nous deux l'évoquons
particulièrement souvent car elle s'applique tout à fait
à nos *weekends geek*, *side-projects*, *hackathons* *or whatever*...
vous appellerez ces travaux comme vous voudrez 😉

Je vais donc essayer ici de retranscrire les maux qui nous conduisent
à ce décalage entre **valeur perçue** et **valeur réelle**
à partir de nos multiples échanges,
puis je proposerai des remèdes (ou du moins des anti-douleurs).

## Les maux

Premièrement, je citerais notre **Manque d'expérience**
dans les métiers IT. On considérera ici que les nuances
entre développeurs, admins systèmes ou devops sont anecdotiques.

Il est tout à fait normal qu'une seule année d'expérience
ne nous permette pas de maîtriser tous les sujets.
Pour autant, c'est factuel de dire que ce manque d'expérience des métiers IT
entraîne systèmatiquement des blocages et des retards dans la réalisation de nos projets.
Ces difficultés nous empêchent de dégager de la valeur perceptible à l'extérieur.

Deuxièmement, le **Manque de temps** à consacrer aux *side projects*
est un facteur qui a une grande importance dans le rendu final.
Ce problème va de pair avec le manque d'expérience et amplifie
le sentiment d'inachever de chaque projet.

Bien que le manque de temps à consacrer à nos projets
soit peut-être le problème majeur,
nous n'avons pas beaucoup d'autres solutions que de s'en accommoder.
Les week-ends ne font et ne feront toujours que 48 heures...

Enfin, le troisième facteur est **l'absence de persévérence**. Depuis le premier week-end geek
organisé, nous n'avons jamais repris le
même sujet d'un week-end à l'autre. De plus, il nous arrive régulièrement de changer le plan initial/sprint backlog à cause d'hypothèses trouvées en cours de route.

## Les remèdes

Concernant le **manque d'expérience**, à ma connaissance,
il n'y a pas de remède miracle. C'est un peu comme le sport,
s'entraîner fait mal tant que l'on n'a pas
d'expérience mais l'expérience ne vient qu'en s'entraînant.

Malgré tout, il est possible de maximiser la progression d'un
projet sur l'autre en évaluant les réussites et les échecs et
en les **documentant**.

C'est pour cette raison que je propose de documenter nos projets selon 3 axes :

- les recherches dans le `Notion`
- les aspects techniques au travers des `README.md`
- les aspects méthodologiques au travers des `memo.md` comme celui-ci

Concernant le **manque de temps**, je ne reviens pas dessus.
Ca ne sert à rien d'en rediscuter tant qu'on n'aura pas
décidé de faire d'un de ces projets notre activité principale.

En revanche, le dernier point, **l'absence de persévérance**, est
intéressant à analyser.

**1️⃣ Pourquoi ne trouvons-nous jamais la motivation de reprendre un projet ?**

Mon postulat est qu'une des raisons principales de perte de motivation est
due au fait que nous ne portons pas
d'attention au "backlog lifecycle" de nos projets.
Dans le domaine des méthodes agiles, le "backlog lifecycle" est la suite
d'étapes (ou colonnes) que doit suivre une tâche pour être considérée comme terminée.

Je m'explique : Voici le fil conducteur classique d'un de nos projets :

1. nous partons bien souvent bille en tête sur l'implémentation
d'une idée
2. passons beaucoup de temps à essayer de la réaliser en raison du manque
d'expérience cité plus haut
3. ne parvenons pas à la réaliser en raison du manque de temps également cité
4. puis commençons à douter de la pertinence de l'idée
5. et enfin abandonnons.

Si on devait prendre une analogie sportive, on pourrait dire que nous
ne pensons qu'à faire des jolies actions, des jolis dribbles, des jolies passes
pendant tout le match en pensant que cela suffira à gagner.

Mais ne préparons jamais de tactique pour marquer et ne pas encaisser de buts.
Donc on perd à chaque fois.

Pourtant, tous les entraîneurs vous le diront :
**la victoire se décide dans les deux surfaces de réparation**.

**C'est pour cette raison que j'ai nommé ce mémo "Gagner dans les 2 surfaces de réparation"**.

Ma solution pour remédier à ce problème est d'enrichir notre backlog avec
les étapes de préparation, notre surface de réparation et les étapes de finalisation, la surface de
réparation adverse.

Trève de métaphores, voici le plan :

- **Spécification** : définir clairement le besoin et les objectifs
- **Architecture** : définir les grandes lignes de l'implémentation
- **Implémentation** : réaliser l'implémentation
- **Documentation** : documenter le projet

> L'objectif de ce plan est d'arrêter de faire de l'implémentation 
> lorsqu'il faut faire de l'architecture, de l'architecture lorsqu'il
> faut faire de la spécification et de la spécification lorsqu'il faut
> faire de l'implémentaiton... Ou encore pire les trois en même temps...
>
> ( Sans oublier la documentation mais ça on ne le faisait jamais donc bon... )

Comme évoqué à plusieurs reprises, les ressources dont nous disposons
sont très limitées. Il est donc important de suivre le plan établi :

- La **spécification** et l'**architecture** doivent être définies en amont
du week-end geek. Le besoin auquel répond le projet doit être clair pour tous les deux.
L'architecture, quand à elle, doit absolument définir la zone d'intéraction des parties de chacun.

- L'**implémentation** doit être **`TIMEBOXÉE !!!`** à **`4h`**.
  - Si une tâche n'est pas terminée au bout de 4h, on met en prod ce qui peut l'être,
    on documente et on repart dans une phase de spécification et d'architecture.
  - Si une tâche est terminée avant la timebox, en général c'est que tout se passe comme prévu
    (Y a quand même quelques fois où ça se passe bien 😉)
  - Si une hypothèse supposé bloquante est trouvé il faut poser la problématique et puis la valider ou l'infirmer méthodiquement !

De cette façon, on devrait pouvoir réaliser 2 **backlog lifecycle** chacun par week-end geek !
Et terminer un week-end avec un projet terminé, documenté et prêt à être incrémenté lors du prochain
week-end geek.
