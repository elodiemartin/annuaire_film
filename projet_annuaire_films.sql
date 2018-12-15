-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Lun 03 Décembre 2018 à 13:56
-- Version du serveur :  10.3.11-MariaDB-1:10.3.11+maria~bionic-log
-- Version de PHP :  7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projet_annuaire_films`
--

-- --------------------------------------------------------

--
-- Structure de la table `director`
--

CREATE TABLE `director` (
  `lastname` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Contenu de la table `director`
--

INSERT INTO `director` (`lastname`, `name`, `id`) VALUES
('Nolan', 'Christopher', 1),
('Tarantino', 'Quentin', 2),
('Berberian', 'Alain', 3),
('Docter', 'Pete', 4),
('Fincher', 'David', 5),
('Lazarov', 'Milko', 6),
('Chazelle', 'Damien', 7),
('Alvarez', 'Fede', 8),
('Fleisher', 'Ruben', 9),
('Shinkai', 'Makoto', 10),
('Desagnat', 'François', 11),
('Chabat', 'Alain', 12),
('Spielberg', 'Steven', 13),
('Columbus', 'Chris', 14),
('Jackson', 'Peter', 15),
('Wallace', 'Tommy Lee', 16);

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `name` varchar(40) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Contenu de la table `genre`
--

INSERT INTO `genre` (`name`, `id`) VALUES
('Drame', 1),
('Thriller', 2),
('Action', 3),
('Comédie', 4),
('Fantaisie', 5),
('Horreur', 6),
('Science-Fiction', 7),
('Animation', 8),
('Fantastique', 9);

-- --------------------------------------------------------

--
-- Structure de la table `id_movie_director`
--

CREATE TABLE `id_movie_director` (
  `id_movie` int(11) NOT NULL,
  `id_director` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Contenu de la table `id_movie_director`
--

INSERT INTO `id_movie_director` (`id_movie`, `id_director`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(6, 5),
(7, 6),
(8, 7),
(9, 8),
(10, 9),
(11, 10),
(12, 11),
(13, 12),
(14, 13),
(15, 14),
(16, 15),
(17, 16);

-- --------------------------------------------------------

--
-- Structure de la table `id_movie_genre`
--

CREATE TABLE `id_movie_genre` (
  `id_movie` int(4) NOT NULL,
  `id_genre` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Contenu de la table `id_movie_genre`
--

INSERT INTO `id_movie_genre` (`id_movie`, `id_genre`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 3),
(7, 1),
(8, 1),
(9, 2),
(10, 3),
(10, 6),
(10, 7),
(11, 8),
(11, 9),
(12, 4),
(1, 7),
(2, 7),
(5, 8),
(6, 1),
(6, 2),
(9, 1),
(13, 4),
(14, 3),
(14, 7),
(15, 9),
(15, 14),
(16, 9),
(17, 6),
(17, 9);

-- --------------------------------------------------------

--
-- Structure de la table `movie`
--

CREATE TABLE `movie` (
  `id` int(11) DEFAULT NULL,
  `title` varchar(60) DEFAULT NULL,
  `description` varchar(942) DEFAULT NULL,
  `releaseDate` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Contenu de la table `movie`
--

INSERT INTO `movie` (`id`, `title`, `description`, `releaseDate`) VALUES
(1, 'Interstellar', 'Dans un futur proche, la Terre est de moins en moins accueillante pour l\'humanité qui connaît une grave crise alimentaire. Le film raconte les aventures d\'un groupe d\'explorateurs qui utilise une faille récemment découverte dans l\'espace-temps afin de repousser les limites humaines et partir à la conquête des distances astronomiques dans un voyage interstellaire.', 2014),
(2, 'Inception', 'Dom Cobb est un voleur expérimenté dans l\'art périlleux de `l\'extraction\' : sa spécialité consiste à s\'approprier les secrets les plus précieux d\'un individu, enfouis au plus profond de son subconscient, pendant qu\'il rêve et que son esprit est particulièrement vulnérable. Très recherché pour ses talents dans l\'univers trouble de l\'espionnage industriel, Cobb est aussi devenu un fugitif traqué dans le monde entier. Cependant, une ultime mission pourrait lui permettre de retrouver sa vie d\'avant.', 2010),
(3, 'Inglourious Basterds', 'Dans la France occupée de 1940, Shosanna Dreyfus assiste à l\'exécution de sa famille tombée entre les mains du colonel nazi Hans Landa. Shosanna s\'échappe de justesse et s\'enfuit à Paris où elle se construit une nouvelle identité en devenant exploitante d\'une salle de cinéma. Quelque part ailleurs en Europe, le lieutenant Aldo Raine forme un groupe de soldats juifs américains pour mener des actions punitives particulièrement sanglantes contre les nazis.', 2009),
(4, 'La Cité De La Peur', 'Odile Deray, attachée de presse, vient au Festival de Cannes pour présenter le film `Red is Dead\'. Malheureusement, celui-ci est d\'une telle faiblesse que personne ne souhaite en faire l\'écho. Cependant, lorsque les projectionnistes du long-métrage en question meurent chacun leur tour dans d\'étranges circonstances, `Red is dead\' bénéficie d\'une incroyable publicité. Serge Karamazov est alors chargé de protéger le nouveau projectionniste du film.', 1994),
(5, 'Là Haut', 'Un vendeur de ballons un peu bougon de 78 ans, Carl Fredricksen, craint de perdre la maison qu\'il a lui-même construite. Pour y échapper, il réalise enfin le rêve de sa vie : attacher des milliers de ballons à sa maison et s\'envoler vers les régions sauvages de l\'Amérique du Sud.', 2009),
(6, 'Fight Club', 'Jack est un jeune expert en assurance insomniaque, désillusionné par sa vie personnelle et professionnelle. Lorsque son médecin lui conseille de suivre une thérapie afin de relativiser son mal-être, il rencontre dans un groupe d\'entraide Marla avec qui il parvient à trouver un équilibre.', 1999),
(7, 'Aga', 'La cinquantaine, Nanouk et Sedna vivent harmonieusement le quotidien traditionnel d’un couple du Grand Nord. Jour après jour, le rythme séculaire qui ordonnait leur vie et celle de leurs ancêtres vacille. Nanouk et Sedna vont devoir se confronter à un nouveau monde qui leur est inconnu.', 2018),
(8, 'First Man', 'Pilote jugé « un peu distrait » par ses supérieurs en 1961, Neil Armstrong sera, le 21 juillet 1969, le premier homme à marcher sur la lune. Durant huit ans, il subit un entraînement de plus en plus difficile, assumant courageusement tous les risques d’un voyage vers l’inconnu total. Meurtri par des épreuves personnelles qui laissent des traces indélébiles, Armstrong tente d’être un mari aimant auprès d’une femme qui l’avait épousé en espérant une vie normale.', 2018),
(9, 'Millenium', 'Frans Balder, éminent chercheur suédois en intelligence artificielle fait appel à Lisbeth Salander afin de récupérer un logiciel qu\'il a créé et permettant de prendre le contrôle d\'armes nucléaires. Mais la NSA ainsi qu\'un groupe de terroristes mené par Jan Holster sont également sur la piste du logiciel. Traquée, Lisbeth va faire appel à son ami le journaliste Mikael Blomkvist qu\'elle n\'a pas vu depuis 3 ans.', 2018),
(10, 'Venom', 'L\'un des personnages les plus célèbres et les plus complexes de Marvel occupe le devant de la scène alors qu\'Eddie Brock (Tom Hardy) devient l\'hôte du symbiote alien Venom. En tant que journaliste, Eddie a essayé de faire tomber le célèbre fondateur de la Life Foundation, le génie Carlton Drake (Riz Ahmed) et cette obsession a ruiné sa carrière et sa relation avec sa petite amie, Anne Weying (Michelle Williams). Où Eddie finit-il et Venom commence-t-il ?', 2018),
(11, 'Kimi no na wa', 'Mitsuha, adolescente coincée dans une famille traditionnelle, rêve de quitter ses montagnes natales pour découvrir la vie trépidante de Tokyo. Elle est loin d’imaginer pouvoir vivre l’aventure urbaine dans la peau de… Taki, un jeune lycéen vivant à Tokyo, occupé entre son petit boulot dans un restaurant italien et ses nombreux amis. À travers ses rêves, Mitsuha se voit littéralement propulsée dans la vie du jeune garçon au point qu’elle croit vivre la réalité... ', 2016),
(12, 'La Beuze', 'Alphonse Brown, fils caché de James Brown, et Scotch sont amis depuis l\'enfance. Ils vivent au Havre de petits deals minables jusqu\'au jour où Alphonse se fait serrer. Après un an de prison, il retrouve Scotch et la liberté avec la ferme intention de tirer un trait sur les galères du passé pour suivre les traces de son père dans la musique. Le soir de la libération d\'Alphonse, sa vie et celle de Scotch vont basculer quand ils découvrent dans un bunker, une vieille malle au contenu mystérieux. Alors qu\'ils débarquent à Paris dans l\'espoir d\'entamer une grande carrière dans la musique, ils vont vite se rendre compte que leur trésor est l\'objet de toutes les convoitises...', 2003),
(13, 'Astérix et Obélix', 'Cléopâtre, la reine d’Égypte, décide, pour défier l\'Empereur romain Jules César, de construire en trois mois un palais somptueux en plein désert. Si elle y parvient, celui-ci devra concéder publiquement que le peuple égyptien est le plus grand de tous les peuples. Pour ce faire, Cléopâtre fait appel à Numérobis, un architecte d\'avant-garde plein d\'énergie. S\'il réussit, elle le couvrira d\'or. S\'il échoue, elle le jettera aux crocodiles.\r\nCelui-ci, conscient du défi à relever, cherche de l\'aide auprès de son vieil ami Panoramix. Le druide fait le voyage en Égypte avec Astérix et Obélix.', 2002),
(14, 'Ready Player One', '2045. Le monde est au bord du chaos. Les êtres humains se réfugient dans l\'OASIS, univers virtuel mis au point par le brillant et excentrique James Halliday. Avant de disparaître, celui-ci a décidé de léguer son immense fortune à quiconque découvrira l\'œuf de Pâques numérique qu\'il a pris soin de dissimuler dans l\'OASIS. L\'appât du gain provoque une compétition planétaire. Mais lorsqu\'un jeune garçon, Wade Watts, qui n\'a pourtant pas le profil d\'un héros, décide de participer à la chasse au trésor, il est plongé dans un monde parallèle à la fois mystérieux et inquiétant…', 2018),
(15, 'Harry Potter', 'Orphelin, Harry Potter a été recueilli à contrecœur par son oncle Vernon et sa tante Pétunia. À l\'approche de ses 11 ans, Harry ne s\'attend à rien de particulier – ni carte, ni cadeau, ni même un goûter d\'anniversaire. Et pourtant, c\'est à cette occasion qu\'il découvre qu\'il est le fils de deux puissants magiciens et qu\'il possède lui aussi d\'extraordinaires pouvoirs. Quand on lui propose d\'intégrer Poudlard, la prestigieuse école de sorcellerie, il trouve enfin le foyer et la famille qui lui ont toujours manqué… et s\'engage dans l\'aventure de sa vie.', 2001),
(16, 'Le seigneur des anneaux', 'Dans ce chapitre de la trilogie, le jeune et timide Hobbit, Frodon Sacquet, hérite d\'un anneau. Bien loin d\'être une simple babiole, il s\'agit de l\'Anneau Unique, un instrument de pouvoir absolu qui permettrait à Sauron, le Seigneur des ténèbres, de régner sur la Terre du Milieu et de réduire en esclavage ses peuples. À moins que Frodon, aidé d\'une Compagnie constituée de Hobbits, d\'Hommes, d\'un Magicien, d\'un Nain, et d\'un Elfe, ne parvienne à emporter l\'Anneau à travers la Terre du Milieu jusqu\'à la Crevasse du Destin, lieu où il a été forgé, et à le détruire pour toujours.\r\n                                                            L\'issue de l\'histoire à venir est intimement liée au sort de la Compagnie.', 2001),
(17, 'Ca', 'Une créature sans nom, Ca, répand la terreur et la mort dans la petite ville de Derry. Jusqu\'à ce qu\'une bande d\'enfants mette fin aux agissements du monstre. Trente plus tard, les sept amis se réunissent à Derry : Ca est revenu...', 1990);

-- --------------------------------------------------------

--
-- Structure de la table `poster`
--

CREATE TABLE `poster` (
  `id` int(2) NOT NULL,
  `path` varchar(140) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `poster`
--

INSERT INTO `poster` (`id`, `path`) VALUES
(1, '../img/affiches/interstellar.jpg'),
(2, '../img/affiches/inception.jpg'),
(3, '../img/affiches/inglorious_basterds.jpg'),
(4, '../img/affiches/la_cite_de_la_peur.jpg'),
(5, '../img/affiches/la_haut.jpg'),
(6, '../img/affiches/fight_club.jpg'),
(7, '../img/affiches/aga.jpg'),
(8, '../img/affiches/first_man.jpg'),
(9, '../img/affiches/millenium.jpg'),
(10, '../img/affiches/venom.jpg'),
(11, '../img/affiches/kimi_no_na_wa.jpg'),
(12, '../img/affiches/la_beuze.jpg'),
(13, '../img/affiches/asterix_et_obelix.jpg'),
(14, '../img/affiches/ready_player_one.jpg'),
(15, '../img/affiches/harry_potter_a_l_ecole_des_sorciers.jpg'),
(16, '../img/affiches/le_seigneur_des_anneaux.jpg'),
(17, '../img/affiches/ca.jpg');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `poster`
--
ALTER TABLE `poster`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `director`
--
ALTER TABLE `director`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `poster`
--
ALTER TABLE `poster`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
