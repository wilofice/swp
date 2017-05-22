-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Dim 21 Mai 2017 à 22:06
-- Version du serveur :  10.1.13-MariaDB
-- Version de PHP :  7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `swp`
--

-- --------------------------------------------------------

--
-- Structure de la table `comptes`
--

CREATE TABLE `comptes` (
  `IdUser` varchar(45) NOT NULL,
  `motdepasse` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `comptes`
--

INSERT INTO `comptes` (`IdUser`, `motdepasse`) VALUES
('anwar@emi.ac.ma', 'anwar2017'),
('bakkoury@emi.ac.ma', 'bakkoury2017'),
('belouadha@emi.ac.ma', 'belouadha2017'),
('benhlima@emi.ac.ma', 'benhlima2017'),
('bouchikhi@emi.ac.ma', 'bouchikhi2017'),
('bouzoubaa@emi.ac.ma', 'bouzoubaa2017'),
('chiadmi@emi.ac.ma', 'chiadmi2017'),
('diouri@emi.ac.ma', 'diouri2017'),
('eleuldj@emi.ac.ma', 'eleudji2017'),
('elfaddouli@emi.ac.ma', 'elfaddouli2017'),
('elghanami@emi.ac.ma', 'elghanami2017'),
('elhadri@emi.ac.ma', 'elhadri2017'),
('g.ofice@hotmail.com', 'swp2017'),
('hasbi@emi.ac.ma', 'hasbi2017'),
('kabbaj@emi.ac.ma', 'kabbaj2017'),
('khalidi@emi.ac.ma', 'khalidi2017'),
('maach@emi.ac.ma', 'maach2017'),
('mehdiazough@gmail.com', 'swp2017'),
('ntounsi@emi.ac.ma', 'ntounsi2017'),
('oumaima.belahsen212@gmail.com', 'swp2017'),
('retbi@emi.ac.ma', 'retbi2017'),
('roudies@emi.ac.ma', 'roudies2017'),
('sara.bennani26@gmail.com', 'swp2017'),
('sbennani@emi.ac.ma', 'bennani2017'),
('slimane.bah@emi.ac.ma', 'bah2017'),
('wilofice@gmail.com', 'swp2017');

-- --------------------------------------------------------

--
-- Structure de la table `creneau`
--

CREATE TABLE `creneau` (
  `NumC` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Heure` time NOT NULL,
  `id_semaine` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `creneau`
--

INSERT INTO `creneau` (`NumC`, `Date`, `Heure`, `id_semaine`) VALUES
(1, '2017-05-01', '08:00:00', '15'),
(602, '2017-02-20', '08:00:00', '15'),
(603, '2017-02-20', '10:00:00', '15'),
(604, '2017-02-20', '14:00:00', '15'),
(605, '2017-02-20', '16:00:00', '15'),
(606, '2017-02-21', '08:00:00', '15'),
(607, '2017-02-21', '10:00:00', '15'),
(608, '2017-02-21', '14:00:00', '15'),
(609, '2017-02-21', '16:00:00', '15'),
(610, '2017-02-22', '08:00:00', '15'),
(611, '2017-02-22', '10:00:00', '15'),
(612, '2017-02-22', '14:00:00', '15'),
(613, '2017-02-22', '16:00:00', '15'),
(614, '2017-02-23', '08:00:00', '15'),
(615, '2017-02-23', '10:00:00', '15'),
(616, '2017-02-23', '14:00:00', '15'),
(617, '2017-02-23', '16:00:00', '15'),
(618, '2017-02-24', '08:00:00', '15'),
(619, '2017-02-24', '10:00:00', '15'),
(620, '2017-02-24', '14:00:00', '15'),
(621, '2017-02-24', '16:00:00', '15'),
(622, '2017-02-27', '08:00:00', '16'),
(623, '2017-02-27', '10:00:00', '16'),
(624, '2017-02-27', '14:00:00', '16'),
(625, '2017-02-27', '16:00:00', '16'),
(626, '2017-02-28', '08:00:00', '16'),
(627, '2017-02-28', '10:00:00', '16'),
(628, '2017-02-28', '14:00:00', '16'),
(629, '2017-02-28', '16:00:00', '16'),
(630, '2017-03-01', '08:00:00', '16'),
(631, '2017-03-01', '10:00:00', '16'),
(632, '2017-03-01', '14:00:00', '16'),
(633, '2017-03-01', '16:00:00', '16'),
(634, '2017-03-02', '08:00:00', '16'),
(635, '2017-03-02', '10:00:00', '16'),
(636, '2017-03-02', '14:00:00', '16'),
(637, '2017-03-02', '16:00:00', '16'),
(638, '2017-03-03', '08:00:00', '16'),
(639, '2017-03-03', '10:00:00', '16'),
(640, '2017-03-03', '14:00:00', '16'),
(641, '2017-03-03', '16:00:00', '16'),
(642, '2017-03-06', '08:00:00', '17'),
(643, '2017-03-06', '10:00:00', '17'),
(644, '2017-03-06', '14:00:00', '17'),
(645, '2017-03-06', '16:00:00', '17'),
(646, '2017-03-07', '08:00:00', '17'),
(647, '2017-03-07', '10:00:00', '17'),
(648, '2017-03-07', '14:00:00', '17'),
(649, '2017-03-07', '16:00:00', '17'),
(650, '2017-03-08', '08:00:00', '17'),
(651, '2017-03-08', '10:00:00', '17'),
(652, '2017-03-08', '14:00:00', '17'),
(653, '2017-03-08', '16:00:00', '17'),
(654, '2017-03-09', '08:00:00', '17'),
(655, '2017-03-09', '10:00:00', '17'),
(656, '2017-03-09', '14:00:00', '17'),
(657, '2017-03-09', '16:00:00', '17'),
(658, '2017-03-10', '08:00:00', '17'),
(659, '2017-03-10', '10:00:00', '17'),
(660, '2017-03-10', '14:00:00', '17'),
(661, '2017-03-10', '16:00:00', '17'),
(662, '2017-03-13', '08:00:00', '18'),
(663, '2017-03-13', '10:00:00', '18'),
(664, '2017-03-13', '14:00:00', '18'),
(665, '2017-03-13', '16:00:00', '18'),
(666, '2017-03-14', '08:00:00', '18'),
(667, '2017-03-14', '10:00:00', '18'),
(668, '2017-03-14', '14:00:00', '18'),
(669, '2017-03-14', '16:00:00', '18'),
(670, '2017-03-15', '08:00:00', '18'),
(671, '2017-03-15', '10:00:00', '18'),
(672, '2017-03-15', '14:00:00', '18'),
(673, '2017-03-15', '16:00:00', '18'),
(674, '2017-03-16', '08:00:00', '18'),
(675, '2017-03-16', '10:00:00', '18'),
(676, '2017-03-16', '14:00:00', '18'),
(677, '2017-03-16', '16:00:00', '18'),
(678, '2017-03-17', '08:00:00', '18'),
(679, '2017-03-17', '10:00:00', '18'),
(680, '2017-03-17', '14:00:00', '18'),
(681, '2017-03-17', '16:00:00', '18'),
(682, '2017-03-20', '08:00:00', '19'),
(683, '2017-03-20', '10:00:00', '19'),
(684, '2017-03-20', '14:00:00', '19'),
(685, '2017-03-20', '16:00:00', '19'),
(686, '2017-03-21', '08:00:00', '19'),
(687, '2017-03-21', '10:00:00', '19'),
(688, '2017-03-21', '14:00:00', '19'),
(689, '2017-03-21', '16:00:00', '19'),
(690, '2017-03-22', '08:00:00', '19'),
(691, '2017-03-22', '10:00:00', '19'),
(692, '2017-03-22', '14:00:00', '19'),
(693, '2017-03-22', '16:00:00', '19'),
(694, '2017-03-23', '08:00:00', '19'),
(695, '2017-03-23', '10:00:00', '19'),
(696, '2017-03-23', '14:00:00', '19'),
(697, '2017-03-23', '16:00:00', '19'),
(698, '2017-03-24', '08:00:00', '19'),
(699, '2017-03-24', '10:00:00', '19'),
(700, '2017-03-24', '14:00:00', '19'),
(701, '2017-03-24', '16:00:00', '19'),
(702, '2017-03-27', '08:00:00', '20'),
(703, '2017-03-27', '10:00:00', '20'),
(704, '2017-03-27', '14:00:00', '20'),
(705, '2017-03-27', '16:00:00', '20'),
(706, '2017-03-28', '08:00:00', '20'),
(707, '2017-03-28', '10:00:00', '20'),
(708, '2017-03-28', '14:00:00', '20'),
(709, '2017-03-28', '16:00:00', '20'),
(710, '2017-03-29', '08:00:00', '20'),
(711, '2017-03-29', '10:00:00', '20'),
(712, '2017-03-29', '14:00:00', '20'),
(713, '2017-03-29', '16:00:00', '20'),
(714, '2017-03-30', '08:00:00', '20'),
(715, '2017-03-30', '10:00:00', '20'),
(716, '2017-03-30', '14:00:00', '20'),
(717, '2017-03-30', '16:00:00', '20'),
(718, '2017-03-31', '08:00:00', '20'),
(719, '2017-03-31', '10:00:00', '20'),
(720, '2017-03-31', '14:00:00', '20'),
(721, '2017-03-31', '16:00:00', '20'),
(722, '2017-04-10', '08:00:00', '21'),
(723, '2017-04-10', '10:00:00', '21'),
(724, '2017-04-10', '14:00:00', '21'),
(725, '2017-04-10', '16:00:00', '21'),
(726, '2017-04-11', '08:00:00', '21'),
(727, '2017-04-11', '10:00:00', '21'),
(728, '2017-04-11', '14:00:00', '21'),
(729, '2017-04-11', '16:00:00', '21'),
(730, '2017-04-12', '08:00:00', '21'),
(731, '2017-04-12', '10:00:00', '21'),
(732, '2017-04-12', '14:00:00', '21'),
(733, '2017-04-12', '16:00:00', '21'),
(734, '2017-04-13', '08:00:00', '21'),
(735, '2017-04-13', '10:00:00', '21'),
(736, '2017-04-13', '14:00:00', '21'),
(737, '2017-04-13', '16:00:00', '21'),
(738, '2017-04-14', '08:00:00', '21'),
(739, '2017-04-14', '10:00:00', '21'),
(740, '2017-04-14', '14:00:00', '21'),
(741, '2017-04-14', '16:00:00', '21'),
(742, '2017-04-24', '08:00:00', '22'),
(743, '2017-04-24', '10:00:00', '22'),
(744, '2017-04-24', '14:00:00', '22'),
(745, '2017-04-24', '16:00:00', '22'),
(746, '2017-04-25', '08:00:00', '22'),
(747, '2017-04-25', '10:00:00', '22'),
(748, '2017-04-25', '14:00:00', '22'),
(749, '2017-04-25', '16:00:00', '22'),
(750, '2017-04-26', '08:00:00', '22'),
(751, '2017-04-26', '10:00:00', '22'),
(752, '2017-04-26', '14:00:00', '22'),
(753, '2017-04-26', '16:00:00', '22'),
(754, '2017-04-27', '08:00:00', '22'),
(755, '2017-04-27', '10:00:00', '22'),
(756, '2017-04-27', '14:00:00', '22'),
(757, '2017-04-27', '16:00:00', '22'),
(758, '2017-04-28', '08:00:00', '22'),
(759, '2017-04-28', '10:00:00', '22'),
(760, '2017-04-28', '14:00:00', '22'),
(761, '2017-04-28', '16:00:00', '22'),
(762, '2017-05-01', '08:00:00', '23'),
(763, '2017-05-01', '10:00:00', '23'),
(764, '2017-05-01', '14:00:00', '23'),
(765, '2017-05-01', '16:00:00', '23'),
(766, '2017-05-02', '08:00:00', '23'),
(767, '2017-05-02', '10:00:00', '23'),
(768, '2017-05-02', '14:00:00', '23'),
(769, '2017-05-02', '16:00:00', '23'),
(770, '2017-05-03', '08:00:00', '23'),
(771, '2017-05-03', '10:00:00', '23'),
(772, '2017-05-03', '14:00:00', '23'),
(773, '2017-05-03', '16:00:00', '23'),
(774, '2017-05-04', '08:00:00', '23'),
(775, '2017-05-04', '10:00:00', '23'),
(776, '2017-05-04', '14:00:00', '23'),
(777, '2017-05-04', '16:00:00', '23'),
(778, '2017-05-05', '08:00:00', '23'),
(779, '2017-05-05', '10:00:00', '23'),
(780, '2017-05-05', '14:00:00', '23'),
(781, '2017-05-05', '16:00:00', '23'),
(782, '2017-05-08', '08:00:00', '24'),
(783, '2017-05-08', '10:00:00', '24'),
(784, '2017-05-08', '14:00:00', '24'),
(785, '2017-05-08', '16:00:00', '24'),
(786, '2017-05-09', '08:00:00', '24'),
(787, '2017-05-09', '10:00:00', '24'),
(788, '2017-05-09', '14:00:00', '24'),
(789, '2017-05-09', '16:00:00', '24'),
(790, '2017-05-10', '08:00:00', '24'),
(791, '2017-05-10', '10:00:00', '24'),
(792, '2017-05-10', '14:00:00', '24'),
(793, '2017-05-10', '16:00:00', '24'),
(794, '2017-05-11', '08:00:00', '24'),
(795, '2017-05-11', '10:00:00', '24'),
(796, '2017-05-11', '14:00:00', '24'),
(797, '2017-05-11', '16:00:00', '24'),
(798, '2017-05-12', '08:00:00', '24'),
(799, '2017-05-12', '10:00:00', '24'),
(800, '2017-05-12', '14:00:00', '24'),
(801, '2017-05-12', '16:00:00', '24'),
(802, '2017-05-15', '08:00:00', '25'),
(803, '2017-05-15', '10:00:00', '25'),
(804, '2017-05-15', '14:00:00', '25'),
(805, '2017-05-15', '16:00:00', '25'),
(806, '2017-05-16', '08:00:00', '25'),
(807, '2017-05-16', '10:00:00', '25'),
(808, '2017-05-16', '14:00:00', '25'),
(809, '2017-05-16', '16:00:00', '25'),
(810, '2017-05-17', '08:00:00', '25'),
(811, '2017-05-17', '10:00:00', '25'),
(812, '2017-05-17', '14:00:00', '25'),
(813, '2017-05-17', '16:00:00', '25'),
(814, '2017-05-18', '08:00:00', '25'),
(815, '2017-05-18', '10:00:00', '25'),
(816, '2017-05-18', '14:00:00', '25'),
(817, '2017-05-18', '16:00:00', '25'),
(818, '2017-05-19', '08:00:00', '25'),
(819, '2017-05-19', '10:00:00', '25'),
(820, '2017-05-19', '14:00:00', '25'),
(821, '2017-05-19', '16:00:00', '25'),
(822, '2017-05-22', '08:00:00', '26'),
(823, '2017-05-22', '10:00:00', '26'),
(824, '2017-05-22', '14:00:00', '26'),
(825, '2017-05-22', '16:00:00', '26'),
(826, '2017-05-23', '08:00:00', '26'),
(827, '2017-05-23', '10:00:00', '26'),
(828, '2017-05-23', '14:00:00', '26'),
(829, '2017-05-23', '16:00:00', '26'),
(830, '2017-05-24', '08:00:00', '26'),
(831, '2017-05-24', '10:00:00', '26'),
(832, '2017-05-24', '14:00:00', '26'),
(833, '2017-05-24', '16:00:00', '26'),
(834, '2017-05-25', '08:00:00', '26'),
(835, '2017-05-25', '10:00:00', '26'),
(836, '2017-05-25', '14:00:00', '26'),
(837, '2017-05-25', '16:00:00', '26'),
(838, '2017-05-26', '08:00:00', '26'),
(839, '2017-05-26', '10:00:00', '26'),
(840, '2017-05-26', '14:00:00', '26'),
(841, '2017-05-26', '16:00:00', '26'),
(842, '2017-05-29', '08:00:00', '27'),
(843, '2017-05-29', '10:00:00', '27'),
(844, '2017-05-29', '14:00:00', '27'),
(845, '2017-05-29', '16:00:00', '27'),
(846, '2017-05-30', '08:00:00', '27'),
(847, '2017-05-30', '10:00:00', '27'),
(848, '2017-05-30', '14:00:00', '27'),
(849, '2017-05-30', '16:00:00', '27'),
(850, '2017-05-31', '08:00:00', '27'),
(851, '2017-05-31', '10:00:00', '27'),
(852, '2017-05-31', '14:00:00', '27'),
(853, '2017-05-31', '16:00:00', '27'),
(854, '2017-06-01', '08:00:00', '27'),
(855, '2017-06-01', '10:00:00', '27'),
(856, '2017-06-01', '14:00:00', '27'),
(857, '2017-06-01', '16:00:00', '27'),
(858, '2017-06-02', '08:00:00', '27'),
(859, '2017-06-02', '10:00:00', '27'),
(860, '2017-06-02', '14:00:00', '27'),
(861, '2017-06-02', '16:00:00', '27'),
(862, '2017-06-05', '08:00:00', '28'),
(863, '2017-06-05', '10:00:00', '28'),
(864, '2017-06-05', '14:00:00', '28'),
(865, '2017-06-05', '16:00:00', '28'),
(866, '2017-06-06', '08:00:00', '28'),
(867, '2017-06-06', '10:00:00', '28'),
(868, '2017-06-06', '14:00:00', '28'),
(869, '2017-06-06', '16:00:00', '28'),
(870, '2017-06-07', '08:00:00', '28'),
(871, '2017-06-07', '10:00:00', '28'),
(872, '2017-06-07', '14:00:00', '28'),
(873, '2017-06-07', '16:00:00', '28'),
(874, '2017-06-08', '08:00:00', '28'),
(875, '2017-06-08', '10:00:00', '28'),
(876, '2017-06-08', '14:00:00', '28'),
(877, '2017-06-08', '16:00:00', '28'),
(878, '2017-06-09', '08:00:00', '28'),
(879, '2017-06-09', '10:00:00', '28'),
(880, '2017-06-09', '14:00:00', '28'),
(881, '2017-06-09', '16:00:00', '28'),
(882, '2017-05-09', '08:00:00', '29'),
(883, '2017-05-09', '10:00:00', '29'),
(884, '2017-05-09', '14:00:00', '29'),
(885, '2017-05-09', '16:00:00', '29'),
(886, '2017-05-10', '08:00:00', '29'),
(887, '2017-05-10', '10:00:00', '29'),
(888, '2017-05-10', '14:00:00', '29'),
(889, '2017-05-10', '16:00:00', '29'),
(890, '2017-05-11', '08:00:00', '29'),
(891, '2017-05-11', '10:00:00', '29'),
(892, '2017-05-11', '14:00:00', '29'),
(893, '2017-05-11', '16:00:00', '29'),
(894, '2017-05-12', '08:00:00', '29'),
(895, '2017-05-12', '10:00:00', '29'),
(896, '2017-05-12', '14:00:00', '29'),
(897, '2017-05-12', '16:00:00', '29'),
(898, '2017-05-13', '08:00:00', '29'),
(899, '2017-05-13', '10:00:00', '29'),
(900, '2017-05-13', '14:00:00', '29'),
(901, '2017-05-13', '16:00:00', '29');

-- --------------------------------------------------------

--
-- Structure de la table `emp`
--

CREATE TABLE `emp` (
  `NumEmp` int(11) NOT NULL,
  `NumM` varchar(255) NOT NULL,
  `NumG` int(11) NOT NULL,
  `NumE` int(11) NOT NULL,
  `Jour` int(11) NOT NULL,
  `Heure` time NOT NULL,
  `DateD` date NOT NULL,
  `DateF` date NOT NULL,
  `Id_semestre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `emp`
--

INSERT INTO `emp` (`NumEmp`, `NumM`, `NumG`, `NumE`, `Jour`, `Heure`, `DateD`, `DateF`, `Id_semestre`) VALUES
(1, 'jee2017s4', 1, 1, 2, '08:00:00', '2017-05-01', '2017-05-29', 2),
(6, 'jee2017s4', 1, 1, 5, '10:00:00', '2017-02-20', '2017-04-10', 2),
(7, 'jee2017s4', 1, 1, 5, '10:00:00', '2017-02-20', '2017-03-20', 2),
(52, 'jee2017s4', 1, 1, 2, '08:00:00', '2017-05-15', '2017-05-15', 2);

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

CREATE TABLE `enseignant` (
  `id` int(11) NOT NULL,
  `Nom` varchar(45) NOT NULL,
  `Prenom` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Tel` varchar(255) NOT NULL,
  `Rôle` varchar(45) NOT NULL,
  `IdUser` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `enseignant`
--

INSERT INTO `enseignant` (`id`, `Nom`, `Prenom`, `Email`, `Tel`, `Rôle`, `IdUser`) VALUES
(1, 'ALAHASSA', 'Genereux', 'wilofice@gmail.com', '680479349', 'Enseignant', 'wilofice@gmail.com'),
(2, 'Belhsen', 'Oumaima', 'oumaima.belahsen212@gmail.com', '', 'Chef dÃ©partement', 'oumaima.belahsen212@gmail.com'),
(3, 'Azough', 'Mehdi', 'mehdiazough@gmail.com', '', 'Coordinateur de filiÃ¨re ', 'mehdiazough@gmail.com'),
(4, 'Wilofice', 'Genereux', 'g.ofice@hotmail.com', '', 'Chef departement', 'g.ofice@hotmail.com'),
(5, 'Anwar', 'Adil', 'anwar@emi.ac.ma', '', 'Enseignant', 'anwar@emi.ac.ma'),
(6, 'Bah', 'Slimane', 'slimane.bah@emi.ac.ma', '', 'Enseignant', 'slimane.bah@emi.ac.ma'),
(7, 'Bakkoury', 'Zohra', 'bakkoury@emi.ac.ma', '', 'Enseignant', 'bakkoury@emi.ac.ma'),
(8, 'Belouadha', 'Fatima Zahra', 'belouadha@emi.ac.ma', '', 'Enseignant', 'belouadha@emi.ac.ma'),
(9, 'Benhlima', 'Laila', 'benhlima@emi.ac.ma', '', 'Enseignant', 'benhlima@emi.ac.ma'),
(10, 'Bennani ', 'Samir	', 'sbennani@emi.ac.ma', '', 'Enseignant', 'sbennani@emi.ac.ma'),
(11, 'Bensalah', 'Noureddine', 'bensalah@emi.ac.ma', '', 'Enseignant', 'bouchikhi@emi.ac.ma'),
(12, 'Bouchikhi', 'Sara', 'bouchikhi@emi.ac.ma', '', 'Enseignant', 'bouchikhi@emi.ac.ma'),
(13, 'Bouzoubaa', 'Karim', 'bouzoubaa@emi.ac.ma', '', 'Enseignant', 'bouzoubaa@emi.ac.ma'),
(14, 'Chiadmi', 'Dalila', 'chiadmi@emi.ac.ma', '', 'Enseignant', 'chiadmi@emi.ac.ma'),
(15, 'Diouri', 'Ouafae', 'diouri@emi.ac.ma', '', 'Enseignant', 'diouri@emi.ac.ma'),
(16, 'EL EULDJ', 'Mohsine', 'eleuldj@emi.ac.ma', '', '', 'eleuldj@emi.ac.ma'),
(17, 'EL EULDJ ', 'Mohsine', 'eleuldj@emi.ac.ma', '', 'Chef departement', 'eleuldj@emi.ac.ma'),
(18, 'EL FADDOULI', 'Noureddine', 'elfaddouli@emi.ac.ma', '', 'Enseignant', 'elfaddouli@emi.ac.ma'),
(19, 'EL GHANAMI', 'Driss', 'elghanami@emi.ac.ma', '', 'Enseignant', 'elghanami@emi.ac.ma'),
(20, 'EL HADRI', 'Abdellah	', 'elhadri@emi.ac.ma', '', 'Enseignant', 'elhadri@emi.ac.ma'),
(21, 'Hasbi', 'Abderrahim', 'hasbi@emi.ac.ma', '', 'Enseignant', 'hasbi@emi.ac.ma'),
(22, 'Kabbaj', 'Mohammed Issam', 'kabbaj@emi.ac.ma', '', 'Enseignant', 'kabbaj@emi.ac.ma'),
(23, 'Khalidi Idrissi', 'Mohamed', 'khalidi@emi.ac.ma', '', 'Coordinateur de filiere', 'khalidi@emi.ac.ma'),
(24, 'Maach', 'Abdelilah', 'maach@emi.ac.ma', '', 'Enseignant', 'maach@emi.ac.ma'),
(25, 'Retbi', 'Asmaa', 'retbi@emi.ac.ma', '', 'Enseignant', 'retbi@emi.ac.ma'),
(26, 'Roudies', 'Ounsa', 'roudies@emi.ac.ma', '', 'Enseignant', 'roudies@emi.ac.ma'),
(27, 'Tounsi', 'Najib', 'ntounsi@emi.ac.ac', '', 'Enseignant', 'ntounsi@emi.ac.ma');

-- --------------------------------------------------------

--
-- Structure de la table `filiere`
--

CREATE TABLE `filiere` (
  `NumF` int(11) NOT NULL,
  `NomF` varchar(45) NOT NULL,
  `chef` int(11) NOT NULL,
  `coordinateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `filiere`
--

INSERT INTO `filiere` (`NumF`, `NomF`, `chef`, `coordinateur`) VALUES
(1, 'Informatique', 4, 3);

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE `groupe` (
  `NumG` int(11) NOT NULL,
  `NomG` varchar(45) NOT NULL,
  `Niveau` int(11) NOT NULL,
  `NomFiliere` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `groupe`
--

INSERT INTO `groupe` (`NumG`, `NomG`, `Niveau`, `NomFiliere`, `Email`) VALUES
(1, 'A', 1, 'Informatique', 'bouayadsalma94@gmail.com'),
(2, 'B', 1, 'Informatique', 'ginf2019@gmail.com'),
(3, 'IQL', 3, 'Informatique', 'ginf2017@gmail.com'),
(4, 'SI', 3, 'Informatique', 'ginf2017@gmail.com'),
(5, 'A', 2, 'Informatique', 'ginf2018@gmail.com'),
(6, 'B', 2, 'Informatique', 'ginf2018@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE `matiere` (
  `CodeM` varchar(255) NOT NULL,
  `NomM` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `matiere`
--

INSERT INTO `matiere` (`CodeM`, `NomM`) VALUES
('algo2017s4', 'Algorithmique'),
('ap2017s4', 'Analyse de projet'),
('dotnet2017s4', 'Developpement envirt Net'),
('gest2017s4', 'Gestion de Projets'),
('ihm2017s4', 'IHM'),
('innov2017s4', 'Innovation'),
('jee2017s4', 'JAVA EE'),
('moo220017s4', 'Moo2'),
('ms2017s4', 'Methodologie de conception'),
('pi2017s4', 'Projet integre'),
('rl2017s4', 'resaux locaux'),
('sr2017s4', 'Systemes repartis'),
('tcp2017s4', 'TCP/IP'),
('uml2012S4', 'UML Design Pattern'),
('web2017s4', 'Technologies de web'),
('xml2017s4', 'XML');

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id_msg` int(11) NOT NULL,
  `text` text NOT NULL,
  `objet` varchar(255) NOT NULL,
  `sender` int(11) NOT NULL,
  `type_receiver` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `message`
--

INSERT INTO `message` (`id_msg`, `text`, `objet`, `sender`, `type_receiver`, `receiver`, `date`, `time`) VALUES
(1, 'Bonjour chers eleves, je ne pourrai pas assurer la seance de JAVA EE du Lundi de 08h a 10h Une seance de rattrapage sera programmee plus tard!\r\nCordialement.', 'Report de la seance de JAVA EE du Lundi', 1, 'groupe', 'bouayadsalma94@gmail.com', '2017-04-30', '12:11:32'),
(2, 'Bonjour chers ÃƒÂ©lÃƒÂ¨ves, je ne pourrai pas assurer la sÃƒÂ©ance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une sÃƒÂ©ance de rattrapage sera programmÃƒÂ©e plus tard!Cordialement.', 'Report de la sÃƒÂ©ance de JAVA EE du Lundi Mon May 01 00:00:00 WEST 2017', 1, 'groupe', 'bouayadsalma94@gmail.com', '2017-04-30', '12:54:02'),
(3, 'Bonjour chers ÃƒÂ©lÃƒÂ¨ves, je ne pourrai pas assurer la sÃƒÂ©ance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une sÃƒÂ©ance de rattrapage sera programmÃƒÂ©e plus tard!Cordialement.', 'Report de la sÃƒÂ©ance de JAVA EE du Lundi Mon May 01 00:00:00 WEST 2017', 1, 'groupe', 'bouayadsalma94@gmail.com', '2017-05-02', '16:05:01'),
(4, 'Bonjour chers ÃƒÂ©lÃƒÂ¨ves, je ne pourrai pas assurer la sÃƒÂ©ance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une sÃƒÂ©ance de rattrapage sera programmÃƒÂ©e plus tard!Cordialement.', 'Report de la sÃƒÂ©ance de JAVA EE du Lundi Mon May 01 00:00:00 WEST 2017', 1, 'groupe', 'bouayadsalma94@gmail.com', '2017-05-02', '16:08:15'),
(5, 'Bonjour chers ÃƒÂ©lÃƒÂ¨ves, je ne pourrai pas assurer la sÃƒÂ©ance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une sÃƒÂ©ance de rattrapage sera programmÃƒÂ©e plus tard!Cordialement.', 'Report de la sÃƒÂ©ance de JAVA EE du Lundi Mon May 01 00:00:00 WEST 2017', 1, 'groupe', 'bouayadsalma94@gmail.com', '2017-05-02', '16:12:18'),
(6, 'Bonjour chers ÃƒÂ©lÃƒÂ¨ves, je ne pourrai pas assurer la sÃƒÂ©ance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une sÃƒÂ©ance de rattrapage sera programmÃƒÂ©e plus tard!Cordialement.', 'Report de la sÃƒÂ©ance de JAVA EE du Lundi Mon May 01 00:00:00 WEST 2017', 1, 'groupe', 'bouayadsalma94@gmail.com', '2017-05-02', '17:47:28'),
(7, 'Bonjour chers ÃƒÂ©lÃƒÂ¨ves, je ne pourrai pas assurer la sÃƒÂ©ance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une sÃƒÂ©ance de rattrapage sera programmÃƒÂ©e plus tard!Cordialement.', 'Report de la sÃƒÂ©ance de JAVA EE du Lundi Mon May 01 00:00:00 WEST 2017', 1, 'groupe', 'bouayadsalma94@gmail.com', '2017-05-07', '10:59:15'),
(8, '                                                          \r\n                                   kjnjk', 'Report de la sÃƒÂ©ance de JAVA EE du Lundi Mon May 01 00:00:00 WEST 2017', 1, 'groupe', 'bouayadsalma94@gmail.com', '2017-05-07', '11:17:17'),
(9, 'Bonjour chers eleves, je ne pourrai pas assurer la sÃƒÂ©ance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une sÃƒÂ©ance de rattrapage sera programmee plus tard!\r\nCordialement.', 'Report de la sÃƒÂ©ance de JAVA EE du Lundi Mon May 01 00:00:00 WEST 2017', 1, 'groupe', 'bouayadsalma94@gmail.com', '2017-05-07', '11:44:12'),
(10, 'Bonjour chers ÃƒÂ©lÃƒÂ¨ves, je ne pourrai pas assurer la sÃƒÂ©ance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une sÃƒÂ©ance de rattrapage sera programmÃƒÂ©e plus tard!Cordialement.', 'Report de la sÃƒÂ©ance de JAVA EE du Lundi Mon May 01 00:00:00 WEST 2017', 1, 'groupe', 'bouayadsalma94@gmail.com', '2017-05-07', '12:27:54'),
(11, 'Bonjour chers ÃƒÂ©lÃƒÂ¨ves, je ne pourrai pas assurer la sÃƒÂ©ance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une sÃƒÂ©ance de rattrapage sera programmÃƒÂ©e plus tard!Cordialement.', 'Report de la sÃƒÂ©ance de JAVA EE du Lundi Mon May 01 00:00:00 WEST 2017', 1, 'groupe', 'bouayadsalma94@gmail.com', '2017-05-07', '12:36:00'),
(12, 'Bonjour chers eleves, je ne pourrai pas assurer la seance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une seance de rattrapage sera programmee plus tard!\r\nCordialement.', 'Report de la seance de JAVA EE du Lundi', 1, 'groupe', 'bouayadsalma94@gmail.com', '2017-05-07', '22:41:42'),
(13, 'Bonjour chers eleves, je ne pourrai pas assurer la seance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une seance de rattrapage sera programmee plus tard!\r\nCordialement.', 'Report de la seance de JAVA EE du Lundi', 1, 'groupe', 'bouayadsalma94@gmail.com', '2017-05-07', '23:20:00'),
(14, 'Bonjour chers eleves, je ne pourrai pas assurer la seance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une seance de rattrapage sera programmee plus tard!\r\nCordialement.', 'Report de la seance de JAVA EE du Lundi', 1, 'groupe', 'bouayadsalma94@gmail.com', '2017-05-07', '23:40:50'),
(15, 'Bonjour chers eleves, je ne pourrai pas assurer la seance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une seance de rattrapage sera programmee plus tard!\r\nCordialement.', 'Report de la seance de JAVA EE du Lundi', 1, 'Chef Departement', 'g.ofice@hotmail.com', '2017-05-07', '23:40:50'),
(16, 'Bonjour chers eleves, je ne pourrai pas assurer la seance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une seance de rattrapage sera programmee plus tard!\r\nCordialement.', 'Report de la seance de JAVA EE du Lundi', 1, 'Coordinateur Filiere', 'mehdiazough@gmail.com', '2017-05-07', '23:40:50'),
(17, 'Bonjour chers eleves, je ne pourrai pas assurer la seance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une seance de rattrapage sera programmee plus tard!\r\nCordialement.', 'Report de la seance de JAVA EE du Lundi', 1, 'groupe', 'bouayadsalma94@gmail.com', '2017-05-07', '23:44:35'),
(18, 'Bonjour chers eleves, je ne pourrai pas assurer la seance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une seance de rattrapage sera programmee plus tard!\r\nCordialement.', 'Report de la seance de JAVA EE du Lundi', 1, 'Chef Departement', 'g.ofice@hotmail.com', '2017-05-07', '23:44:35'),
(19, 'Bonjour chers eleves, je ne pourrai pas assurer la seance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une seance de rattrapage sera programmee plus tard!\r\nCordialement.', 'Report de la seance de JAVA EE du Lundi', 1, 'Coordinateur Filiere', 'mehdiazough@gmail.com', '2017-05-07', '23:44:35'),
(20, 'Bonjour chers eleves, je ne pourrai pas assurer la seance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une seance de rattrapage sera programmee plus tard!\r\nCordialement.', 'Report de la seance de JAVA EE du Lundi', 1, 'groupe', 'bouayadsalma94@gmail.com', '2017-05-07', '23:47:04'),
(21, 'Bonjour chers eleves, je ne pourrai pas assurer la seance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une seance de rattrapage sera programmee plus tard!\r\nCordialement.', 'Report de la seance de JAVA EE du Lundi', 1, 'Chef Departement', 'g.ofice@hotmail.com', '2017-05-07', '23:47:04'),
(22, 'Bonjour chers eleves, je ne pourrai pas assurer la seance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une seance de rattrapage sera programmee plus tard!\r\nCordialement.', 'Report de la seance de JAVA EE du Lundi', 1, 'Coordinateur Filiere', 'mehdiazough@gmail.com', '2017-05-07', '23:47:04'),
(23, 'Bonjour chers eleves, je ne pourrai pas assurer la seance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une seance de rattrapage sera programmee plus tard!\r\nCordialement.', 'Report de la seance de JAVA EE du Lundi', 1, 'groupe', 'bouayadsalma94@gmail.com', '2017-05-07', '23:52:43'),
(24, 'Bonjour chers eleves, je ne pourrai pas assurer la seance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une seance de rattrapage sera programmee plus tard!\r\nCordialement.', 'Report de la seance de JAVA EE du Lundi', 1, 'Chef Departement', 'g.ofice@hotmail.com', '2017-05-07', '23:52:43'),
(25, 'Bonjour chers eleves, je ne pourrai pas assurer la seance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une seance de rattrapage sera programmee plus tard!\r\nCordialement.', 'Report de la seance de JAVA EE du Lundi', 1, 'Coordinateur Filiere', 'mehdiazough@gmail.com', '2017-05-07', '23:52:43'),
(26, 'Bonjour chers eleves, je ne pourrai pas assurer la seance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une seance de rattrapage sera programmee plus tard!\r\nCordialement.', 'Report de la seance de JAVA EE du Lundi', 1, 'groupe', 'bouayadsalma94@gmail.com', '2017-05-09', '14:34:36'),
(27, 'Bonjour chers eleves, je ne pourrai pas assurer la seance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une seance de rattrapage sera programmee plus tard!\r\nCordialement.', 'Report de la seance de JAVA EE du Lundi', 1, 'Chef Departement', 'g.ofice@hotmail.com', '2017-05-09', '14:34:36'),
(28, 'Bonjour chers eleves, je ne pourrai pas assurer la seance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une seance de rattrapage sera programmee plus tard!\r\nCordialement.', 'Report de la seance de JAVA EE du Lundi', 1, 'Coordinateur Filiere', 'mehdiazough@gmail.com', '2017-05-09', '14:34:36'),
(29, 'Bonjour chers eleves, je ne pourrai pas assurer la seance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une seance de rattrapage sera programmee plus tard!\r\nCordialement.', 'Report de la seance de JAVA EE du Lundi', 1, 'groupe', 'bouayadsalma94@gmail.com', '2017-05-09', '16:30:20'),
(30, 'Bonjour chers eleves, je ne pourrai pas assurer la seance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une seance de rattrapage sera programmee plus tard!\r\nCordialement.', 'Report de la seance de JAVA EE du Lundi', 1, 'Chef Departement', 'g.ofice@hotmail.com', '2017-05-09', '16:30:20'),
(31, 'Bonjour chers eleves, je ne pourrai pas assurer la seance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une seance de rattrapage sera programmee plus tard!\r\nCordialement.', 'Report de la seance de JAVA EE du Lundi', 1, 'Coordinateur Filiere', 'mehdiazough@gmail.com', '2017-05-09', '16:30:20'),
(32, 'Bonjour chers eleves, je ne pourrai pas assurer la seance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une seance de rattrapage sera programmee plus tard!\r\nCordialement.', 'Report de la seance de JAVA EE du Lundi', 1, 'groupe', 'bouayadsalma94@gmail.com', '2017-05-09', '16:31:17'),
(33, 'Bonjour chers eleves, je ne pourrai pas assurer la seance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une seance de rattrapage sera programmee plus tard!\r\nCordialement.', 'Report de la seance de JAVA EE du Lundi', 1, 'Chef Departement', 'g.ofice@hotmail.com', '2017-05-09', '16:31:17'),
(34, 'Bonjour chers eleves, je ne pourrai pas assurer la seance de JAVA EE du Lundi de 08h ÃƒÂ  10h Une seance de rattrapage sera programmee plus tard!\r\nCordialement.', 'Report de la seance de JAVA EE du Lundi', 1, 'Coordinateur Filiere', 'mehdiazough@gmail.com', '2017-05-09', '16:31:17');

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

CREATE TABLE `seance` (
  `NumS` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `NumC` int(11) NOT NULL,
  `NumEmp` int(11) NOT NULL,
  `EtatS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `seance`
--

INSERT INTO `seance` (`NumS`, `type`, `NumC`, `NumEmp`, `EtatS`) VALUES
(10, 'seance', 615, 7, 1),
(11, 'seance', 635, 7, 1),
(12, 'seance', 655, 7, 1),
(13, 'seance', 675, 7, 1),
(14, 'seance', 695, 7, 1),
(59, 'seance', 802, 52, 1);

-- --------------------------------------------------------

--
-- Structure de la table `semaine`
--

CREATE TABLE `semaine` (
  `Id_semaine` varchar(20) NOT NULL,
  `Date_debut` date NOT NULL,
  `id_semestre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `semaine`
--

INSERT INTO `semaine` (`Id_semaine`, `Date_debut`, `id_semestre`) VALUES
('15', '2017-02-20', 2),
('16', '2017-02-27', 2),
('17', '2017-03-06', 2),
('18', '2017-03-13', 2),
('19', '2017-03-20', 2),
('20', '2017-03-27', 2),
('21', '2017-04-10', 2),
('22', '2017-04-24', 2),
('23', '2017-05-01', 2),
('24', '2017-05-08', 2),
('25', '2017-05-15', 2),
('26', '2017-05-22', 2),
('27', '2017-05-29', 2),
('28', '2017-06-05', 2),
('29', '2017-05-09', 5);

-- --------------------------------------------------------

--
-- Structure de la table `semestre`
--

CREATE TABLE `semestre` (
  `Id_semestre` int(11) NOT NULL,
  `Semaine_debut` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `semestre`
--

INSERT INTO `semestre` (`Id_semestre`, `Semaine_debut`) VALUES
(1, '1'),
(2, '15'),
(4, '15'),
(5, '1'),
(6, '15');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `comptes`
--
ALTER TABLE `comptes`
  ADD PRIMARY KEY (`IdUser`);

--
-- Index pour la table `creneau`
--
ALTER TABLE `creneau`
  ADD PRIMARY KEY (`NumC`),
  ADD KEY `Semaine_Creneau` (`id_semaine`);

--
-- Index pour la table `emp`
--
ALTER TABLE `emp`
  ADD PRIMARY KEY (`NumEmp`),
  ADD KEY `EnsEmp` (`NumE`),
  ADD KEY `GrEmp` (`NumG`),
  ADD KEY `MatEmp` (`NumM`);

--
-- Index pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IdUser` (`IdUser`) USING BTREE;

--
-- Index pour la table `filiere`
--
ALTER TABLE `filiere`
  ADD PRIMARY KEY (`NumF`),
  ADD KEY `ChefDept` (`chef`),
  ADD KEY `Coordinateur` (`coordinateur`);

--
-- Index pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`NumG`),
  ADD KEY `FiliereGroupe` (`NomFiliere`);

--
-- Index pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`CodeM`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id_msg`),
  ADD KEY `Enseignant_Message` (`sender`);

--
-- Index pour la table `seance`
--
ALTER TABLE `seance`
  ADD PRIMARY KEY (`NumS`),
  ADD KEY `CreS` (`NumC`),
  ADD KEY `Emp_S` (`NumEmp`);

--
-- Index pour la table `semaine`
--
ALTER TABLE `semaine`
  ADD PRIMARY KEY (`Id_semaine`),
  ADD KEY `id_semestre` (`id_semestre`);

--
-- Index pour la table `semestre`
--
ALTER TABLE `semestre`
  ADD PRIMARY KEY (`Id_semestre`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `creneau`
--
ALTER TABLE `creneau`
  MODIFY `NumC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=902;
--
-- AUTO_INCREMENT pour la table `emp`
--
ALTER TABLE `emp`
  MODIFY `NumEmp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT pour la table `enseignant`
--
ALTER TABLE `enseignant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT pour la table `filiere`
--
ALTER TABLE `filiere`
  MODIFY `NumF` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `NumG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id_msg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT pour la table `seance`
--
ALTER TABLE `seance`
  MODIFY `NumS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `creneau`
--
ALTER TABLE `creneau`
  ADD CONSTRAINT `Semaine_Creneau` FOREIGN KEY (`id_semaine`) REFERENCES `semaine` (`Id_semaine`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `emp`
--
ALTER TABLE `emp`
  ADD CONSTRAINT `EnsEmp` FOREIGN KEY (`NumE`) REFERENCES `enseignant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `GrEmp` FOREIGN KEY (`NumG`) REFERENCES `groupe` (`NumG`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `MatEmp` FOREIGN KEY (`NumM`) REFERENCES `matiere` (`CodeM`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD CONSTRAINT `ComptesEnseignant` FOREIGN KEY (`IdUser`) REFERENCES `comptes` (`IdUser`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `filiere`
--
ALTER TABLE `filiere`
  ADD CONSTRAINT `ChefDept` FOREIGN KEY (`chef`) REFERENCES `enseignant` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Coordinateur` FOREIGN KEY (`coordinateur`) REFERENCES `enseignant` (`id`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `Enseignant_Message` FOREIGN KEY (`sender`) REFERENCES `enseignant` (`id`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `seance`
--
ALTER TABLE `seance`
  ADD CONSTRAINT `CreS` FOREIGN KEY (`NumC`) REFERENCES `creneau` (`NumC`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Emp_S` FOREIGN KEY (`NumEmp`) REFERENCES `emp` (`NumEmp`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `semaine`
--
ALTER TABLE `semaine`
  ADD CONSTRAINT `Semaine_Semestre` FOREIGN KEY (`id_semestre`) REFERENCES `semestre` (`Id_semestre`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
