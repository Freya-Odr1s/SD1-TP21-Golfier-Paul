
# EXERCICE 1 : IRIS


# Chargement du jeu de données
data(iris)

# Afficher le dataframe iris
iris

# Afficher la classe de l'objet iris
class(iris)

# Visualiser le dataframe dans une fenêtre dédiée
View(iris)

# Nombre de lignes
nrow(iris)

# Nombre de colonnes
ncol(iris)

# Dimensions
dim(iris)

# Noms des colonnes
colnames(iris)

# Résumé statistique du dataframe
summary(iris)

# Sélection uniquement des colonnes Sepal.Length et Species
iris[, c("Sepal.Length", "Species")]

# Sélection des lignes 100, 103 et 105
iris[c(100, 103, 105), ]

# Sélection des lignes de 50 à 100
iris[50:100, ]

# Moyenne de Sepal.Length
mean(iris$Sepal.Length)

# Médiane de Sepal.Width
median(iris$Sepal.Width)

# Écart-type de Petal.Length
sd(iris$Petal.Length)

# Déciles de Petal.Width
quantile(iris$Petal.Width, probs = seq(0.1, 0.9, 0.1))



# EXERCICE 2 : IMPORT / EXPORT


# Importation des fichiers CSV
# ⚠️ Adapter le chemin selon votre ordinateur

manga <- read.csv("C:/Users/pgolfier/Downloads/manga.csv", header = TRUE, sep = ",", dec = ".")
anime <- read.csv("C:/Users/pgolfier/Downloads/anime.csv", header = TRUE, sep = ",", dec = ".")

# Vérifier la classe des objets
class(manga)
class(anime)

# Visualisation des données
View(manga)
View(anime)

# Dimensions des dataframes
dim(manga)
dim(anime)

# Moyenne des scores
mean(manga$Score)
mean(anime$Score)

# Somme totale des votes
sum(manga$Vote)
sum(anime$Vote)

# Écart-type des scores
sd(manga$Score)
sd(anime$Score)

# Déciles des scores
quantile(manga$Score, probs = seq(0.1, 0.9, 0.1))
quantile(anime$Score, probs = seq(0.1, 0.9, 0.1))



# FILTRES AVEC subset()


# --- Mangas ---

# Manga avec une note strictement supérieure à 9
mangasup9 <- subset(manga, Score > 9)
nrow(mangasup9)

# Manga avec au moins 200000 votes
manga200k <- subset(manga, Vote >= 200000)
nrow(manga200k)

# Manga avec plus de 200000 votes et score >= 8
manga_votes_score <- subset(manga, Vote >= 200000 & Score >= 8)
nrow(manga_votes_score)

# Manga avec score entre 7 et 8
manga7_8 <- subset(manga, Score >= 7 & Score <= 8)
nrow(manga7_8)


# Effectifs de la variable Rating
effectifRating <- table(anime$Rating)
effectifRating

# Nombre de modalités
length(effectifRating)

# Effectifs en pourcentage
prop.table(effectifRating)

# Anime Rating - 17+
anime17 <- subset(anime, Rating == "R - 17+ (violence & profanity)")
nrow(anime17)

# Anime Rating - 17+ avec score >= 8
anime_r17_score <- subset(anime, Rating == "R - 17+ (violence & profanity)" & Score >= 8)
nrow(anime_r17_score)

# Anime sans le Rating - 17+
anime_not_17 <- subset(anime, Rating != "R - 17+ (violence & profanity)")
nrow(anime_not_17)

# Anime Rating PG - Children ou G - All Ages
anime_pg_g <- subset(anime, Rating %in% c("PG - Children", "G - All Ages"))
nrow(anime_pg_g)

# Anime n'appartenant PAS à PG ou G
anime_not_pg_g <- subset(anime, !Rating %in% c("PG - Children", "G - All Ages"))
nrow(anime_not_pg_g)

# Anime avec score >= 9 OU plus de 400000 votes
anime_score_votes <- subset(anime,
                            Score >= 9 | Vote > 400000)
nrow(anime_score_votes)


# rbind() ET EXPORT

# Conserver uniquement certaines colonnes
anime <- anime[, c("Title", "Score", "Vote", "Ranked")]
manga <- manga[, c("Title", "Score", "Vote", "Ranked")]

# Ajouter une colonne Type
anime$Type <- "Anime"
manga$Type <- "Manga"

# Fusion des deux dataframes
concat <- rbind(manga, anime)

# Vérification visuelle
View(concat)

# Export du dataframe final
write.table(x = concat,file = "ExportTp1.csv",sep = ";",row.names = FALSE)
