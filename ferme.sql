create database ferme;
use ferme;

create table animal
(
id_animal int(10),
nom varchar(45),
primary key (id_animal)
);

create table production
(
fk_elevage int(10),
annee tinyint(4),
quantite int(10),
primary key (annee)
);

create table type_terre
(
id_type_terre int(10),
nom varchar(45),
primary key (id_type_terre)
);

create table terrain
(
id_terrain int(10),
surface float,
longitude float,
latitude float,
fk_type_terre int(10),
primary key (id_terrain),
constraint fk_type_terre_terrain foreign key (fk_type_terre) references type_terre(id_type_terre)
);
 

create table elevage
(
id_elevage int(10),
capacite int(10),
fk_animal int(10),
fk_terrain int(10),
primary key (id_elevage),
constraint fk_animal_elevage foreign key (fk_animal) REFERENCES animal(id_animal),
constraint fk_terrain_elevage foreign key (fk_terrain) REFERENCES terrain(id_terrain)
);

ALTER TABLE production add foreign key (fk_elevage) references elevage(id_elevage);

create table type_plante
(
id_type_plante int(10),
nom varchar(45),
primary key (id_type_plante)
);

create table plante
(
id_plante int(10),
nom varchar(45),
fk_type_plante int(10),
primary key (id_plante),
constraint fk_type_plante_plante foreign key (fk_type_plante) references type_plante(id_type_plante)
);

create table alimentation
(
annee tinyint(4),
qtx smallint (6),
fk_plante int(10),
fk_animal int(10),
constraint fk_plante_alimentation foreign key (fk_plante) references plante(id_plante),
constraint fk_animal_alimentation foreign key (fk_animal) references animal(id_animal)
);

create table produit
(
id_produit int(10),
nom varchar (45),
primary key (id_produit)
);

create table poste 
(
id_poste smallint(5),
nom varchar(45),
primary key (id_poste)
);

create table employe
(
id_employe int(10),
nom varchar(45),
fk_poste smallint(5),
primary key (id_employe),
constraint fk_poste_employe foreign key (fk_poste) references poste(id_poste)
);

create table culture
(
id_culture int(10),
annee tinyint (3),
rendement int(10),
fk_plante int(10),
fk_terrain int(10),
fk_employe int(10),
primary key (id_culture),
constraint fk_plante_culture foreign key (fk_plante) references plante(id_plante),
constraint fk_terrain_culture foreign key (fk_terrain) references terrain(id_terrain),
constraint fk_employe_culture foreign key (fk_employe) references employe(id_employe)
);

create table traitement
(
qtx smallint (6),
fk_produit int(10),
fk_culture int(10),
constraint fk_produit_traitement foreign key (fk_produit) references produit(id_produit),
constraint fk_culture_traitement foreign key (fk_culture) references culture(id_culture)
);