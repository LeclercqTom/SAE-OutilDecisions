------------------------------------------
-- Ensemble des requêtes pour la SAE2.4 --
-- Membres : Ogès Florian               --
--           Leclercq Tom               --
--           Brunel Bastien             --
--           Amzil Marwane              --
--                                      --
-- Groupe numéro : 10                   --
--                                      --
-- Le 12/06/2022                        --  
------------------------------------------

-- Requête 1 : Afficher les acteurs principaux et la moyenne de leurs bénéfices si celui-ci est supérieur à 5 millions de dollars --

select avg(gross), star from movies 
group by star 
having avg(gross) > 5000000;

-- Résultat--       

        avg         |           star
--------------------+--------------------------
         44782913.6 | Scott Glenn
         30509565.8 | Cillian Murphy
         13353150.5 | Christina Applegate
           19206236 | Billy Zane
           11300653 | Sophia Loren
           11156836 | Agata Kulesza
          198051400 | Constance Wu
           10123353 | Noémie Merlant
          6985855.5 | Edward Furlong
           22593408 | Melissa Joan Hart
[...]

-- Requête 2 : Afficher les genres ainsi que la moyenne des bénéfices --

select avg(gross), genre from movies 
group by genre;

-- Résultat --

        avg         |   genre
--------------------+-----------
         23549374.5 | Romance
            1067629 | Sport
       101183528.65 | Mystery
                    | History
            2595346 | Musical
             110014 | Music
  38709328.53488372 | Fantasy
   47372408.8534202 | Horror
  38930959.55653951 | Drama
 47874322.799076214 | Biography
  145508580.8475792 | Action
           26935259 | Thriller
 10675295.666666666 | Western
       32561233.625 | Sci-Fi
  44331874.24954379 | Comedy
 109325229.92380953 | Adventure
 196172493.27272728 | Family
  235619627.5225225 | Animation
 39401196.280442804 | Crime
(19 rows)

-- Requête 3 : Afficher les genres ainsi que la moyenne des bénéfices pour l'ensemble des films des deux dernières années --

select avg(gross), genre from movies 
where year >= 2020 
group by genre;

-- Résultat --

        avg        |   genre
-------------------+-----------
 323281938.6666667 | Action
         178296628 | Adventure
         191306880 | Animation
            413378 | Comedy
              3661 | Crime
          84484945 | Drama
             13266 | Horror
                   | Sci-Fi
(8 rows)

-- Requête 4 : Afficher les écrivaints et la moyenne de leurs bénéfices si celui-ci est supérieur à 5 millions de dollars --

select avg(gross), writer from movies 
group by writer 
having avg(gross) > 5000000;

-- Résultat --

        avg         |              writer
--------------------+----------------------------------
          176600208 | Tom O''Connor
          459242240 | Marianne Wibberley
           18225518 | Barry Michael Cooper
           14358033 | H.F. Saint
 12190727.666666666 | Tom Ropelewski
          422798024 | Etan Cohen
  81537791.66666667 |
        26623849.75 | Richard Matheson
            7312209 | Vijay Krishna Acharya
  338195261.3333333 | J. David Stem
          132563928 | Scott M. Gimple
           25837112 | Robert Kurtzman
            7603766 | Seth Margolis
           82225646 | Louis Venosta
         11797111.6 | Dan Gordon
          235283704 | Josh Goldsmith
           30787356 | Sabrina Dhawan
           48030253 | Dick Clement
           61601280 | Matthew Sand
           13097915 | Doug Taylor
           15887466 | Eric Bernt
[...]

-- Requête 5 : Afficher le nom des 9 films ayant effectué les plus gros bénéfices, ces films doivent être classé par bénéfice décroissant -- 

select name, (gross - budget) as bénéfice from movies 
where gross is not null and budget is not null 
order by (gross - budget) desc limit 9;

-- Résultat --

                       name                        |   bénéfice
---------------------------------------------------+---------------
 Avatar                                            | 2.6102461e+09
 Avengers: Endgame                                 | 2.4415014e+09
 Titanic                                           | 2.0016474e+09
 Star Wars: Episode VII - The Force Awakens (2015) | 1.8245217e+09
 Avengers: Infinity War                            | 1.7273597e+09
 Jurassic World                                    | 1.5205165e+09
 Furious 7                                         | 1.3253414e+09
 Frozen II                                         | 1.3000269e+09
 The Avengers                                      | 1.2988155e+09
(9 rows)


-- Requête 6 : Afficher le titre, le budget internationnal et mondial pour l'ensemble des pirates des Caraïbes dans l'ordre croissant d'apparition --

select mb."Title", mb."InternationalSales(in$)", mb."WorldSales(in$)" from movies_base mb 
inner join movies m on m.name = mb."Title" 
where m.name like 'Pirates of%' 
order by m.year;

-- Résultat --

                             Title                             | InternationalSales(in$) | WorldSales(in$)
---------------------------------------------------------------+-------------------------+-----------------
 Pirates of the Caribbean: The Curse of the Black Pearl (2003) |               348850097 |       654264015
 Pirates of the Caribbean: Dead Man''s Chest (2006)             |               642863935 |      1066179747
 Pirates of the Caribbean: At World''s End (2007)               |               651576067 |       960996492
 Pirates of the Caribbean: On Stranger Tides (2011)            |               804642000 |      1045713802
(4 rows)


-- Requête 7 : Afficher le titre, le budget internationnal et mondial pour l'ensemble des Stars Wars dans l'ordre croissant d'apparition --

select mb."Title", mb."InternationalSales(in$)", mb."WorldSales(in$)" from movies_base mb 
inner join movies m on m.name = mb."Title" 
where m.name like 'Star Wars%' 
order by m.year;

-- Résultat --

                         Title                         | InternationalSales(in$) | WorldSales(in$)
-------------------------------------------------------+-------------------------+-----------------
 Star Wars: Episode V - The Empire Strikes Back (1980) |               190685234 |       538375067
 Star Wars: Episode VI - Return of the Jedi (1983)     |               122009457 |       475106177
 Star Wars: Episode I - The Phantom Menace (1999)      |               552538030 |      1027082707
 Star Wars: Episode II - Attack of the Clones (2002)   |               343103230 |       653779970
 Star Wars: Episode III - Revenge of the Sith (2005)   |               488119983 |       868390560
 Star Wars: Episode VII - The Force Awakens (2015)     |              1132859475 |      2069521700
 Star Wars: Episode VIII - The Last Jedi (2017)        |               712517448 |      1332698830
 Star Wars: Episode IX - The Rise of Skywalker (2019)  |               558946737 |      1074149279
(8 rows)

-- Requête 8 : Afficher le titre et l'ensemble des votes du publique pour l'ensemble des films Men in Black --

select name, votes from movies 
where name like 'Men in%' 
order by year;

-- Résultat --

            name             | votes
-----------------------------+--------
 Men in Black                | 529000
 Men in Black II             | 351000
 Men in Black 3              | 342000
 Men in Black: International | 119000
(4 rows)

-- Requête 9 : Afficher le titre et la moyenne des bénéfices pour l'ensemble des films Ocean's par date de sortie --

select name, (gross - budget) as bénéfice from movies 
where name like 'Ocean%' 
order by year;

-- Résultat --

       name       |   bénéfice
------------------+---------------
 Ocean''s Eleven   | 3.6571715e+08
 Ocean''s Twelve   | 2.5274429e+08
 Ocean''s Thirteen | 2.2631264e+08
 Ocean''s Eight    | 2.2771872e+08
(4 rows)

-- Requête 10 : Afficher le titre et la moyenne des bénéfices pour l'ensemble des films Jurassic Park et Jurassic World par date de sortie --

select name, (gross - budget) as bénéfice from movies 
where name like '%Jurassic%' 
order by year;

-- Résultat --

              name              |   bénéfice
--------------------------------+---------------
 Jurassic Park                  |  9.709283e+08
 The Lost World: Jurassic Park  |   5.45639e+08
 Jurassic Park III              |  2.757808e+08
 Jurassic World                 | 1.5205165e+09
 Jurassic World: Fallen Kingdom | 1.1404663e+09
(5 rows)

-- Requête 11 : Afficher le titre et la moyenne des bénéfices pour l'ensemble des films Harry Potter par date de sortie --

select name, (gross - budget) as bénéfice from movies 
where name like 'Harry Potter%' 
order by year;

-- Résultat --

----------------------------------------------+---------------
 Harry Potter and the Sorcerer''s Stone        |  8.819682e+08
 Harry Potter and the Chamber of Secrets      | 7.7960237e+08
 Harry Potter and the Prisoner of Azkaban     |  6.673616e+08
 Harry Potter and the Goblet of Fire          |  7.466783e+08
 Harry Potter and the Order of the Phoenix    |  7.921724e+08
 Harry Potter and the Half-Blood Prince       |  6.844541e+08
 Harry Potter and the Deathly Hallows: Part 1 |
 Harry Potter and the Deathly Hallows: Part 2 | 1.2173217e+09
(8 rows)

-- Requête 12 : Afficher le titre, le vote du public et la moyenne des bénéfices pour l'ensemble des films Spider-Man par date de sortie --

select name, votes, (gross - budget) as bénéfice from movies 
where name like '%Spider-Man%' 
order by year;

-- Résultat --

               name                | votes  |   bénéfice
-----------------------------------+--------+---------------
 Spider-Man                        | 706000 |   6.86025e+08
 Spider-Man 2                      | 559000 | 5.8897645e+08
 Spider-Man 3                      | 513000 | 6.3698336e+08
 The Amazing Spider-Man            | 571000 |  5.279307e+08
 The Amazing Spider-Man 2          | 427000 | 5.0898234e+08
 Spider-Man: Homecoming            | 540000 |  7.051669e+08
 Spider-Man: Into the Spider-Verse | 411000 | 2.8554083e+08
 Spider-Man: Far from Home         | 359000 | 9.7192794e+08
(8 rows)

-- Requête 13 : Afficher le résultat et nom du film par année décroissante lorsque son genre est de type Horror --

select (gross-budget) as résultat, name from movies 
where genre like 'Horror' and gross is not null and budget is not null 
order by year DESC;

    résultat    |                     name
----------------+-----------------------------------------------
 1.14133736e+08 | The Curse of la Llorona
  2.0125259e+08 | Annabelle Comes Home
  5.6105744e+07 | Ma
  2.3518458e+08 | Us
    -2.4496e+06 | Clinton Road
  9.2118224e+07 | Pet Sematary
  4.1738548e+07 | Slender Man
  2.6039126e+07 | The Strangers: Prey at Night
  -4.444797e+06 | Mandy
  3.4355168e+08 | The Nun
  3.5316528e+07 | The Possession of Hannah Grace
   1.266093e+07 | Hell Fest
  1.5024987e+07 | Unfriended: Dark Web
  1.5788558e+08 | Insidious: The Last Key
[...]