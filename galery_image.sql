-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 28, 2020 lúc 01:32 PM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `galery_image`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_blog`
--

DROP TABLE IF EXISTS `morp_blog`;
CREATE TABLE `morp_blog` (
  `fBlogID` int(11) NOT NULL,
  `fTitle` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `fSubtitle` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `fText` text CHARACTER SET utf8 NOT NULL,
  `fAbstr` text CHARACTER SET utf8 NOT NULL,
  `fVon` date NOT NULL DEFAULT '0000-00-00',
  `fBis` date NOT NULL DEFAULT '0000-00-00',
  `fDatum` date NOT NULL DEFAULT '0000-00-00',
  `edit` int(1) NOT NULL DEFAULT 1,
  `fAuthor` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `fLink` varchar(250) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `fBlogKatID` varchar(100) COLLATE latin1_general_ci NOT NULL DEFAULT '1',
  `pid` int(11) NOT NULL DEFAULT 0,
  `img1` varchar(150) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `img2` varchar(150) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `img3` varchar(150) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `img4` varchar(150) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `sichtbar` int(1) NOT NULL DEFAULT 1,
  `multisel` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `fLanguage` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_blog_kat`
--

DROP TABLE IF EXISTS `morp_blog_kat`;
CREATE TABLE `morp_blog_kat` (
  `fBlogKatID` int(11) NOT NULL,
  `fKat` varchar(255) NOT NULL,
  `fLanguage` int(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_angebote`
--

DROP TABLE IF EXISTS `morp_cms_angebote`;
CREATE TABLE `morp_cms_angebote` (
  `aid` int(11) NOT NULL,
  `aTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `aDesc` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `aPreis` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `img1` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `img2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `img3` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `img4` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sichtbar` int(11) NOT NULL,
  `datumende` varchar(10) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `fon` varchar(255) NOT NULL,
  `mid` int(11) NOT NULL,
  `isAngebot` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_angebote`
--

INSERT INTO `morp_cms_angebote` (`aid`, `aTitle`, `aDesc`, `aPreis`, `img1`, `img2`, `img3`, `img4`, `sichtbar`, `datumende`, `mail`, `fon`, `mid`, `isAngebot`) VALUES
(1, 'Mein erstes Angebot', 'äöü ----\r\n\r\n eueuiazg uqwegzwd ', '111,99 € plus 10,- Versand', '20190405-1-maxresdefault-1.jpg', '20190405-1-maxresdefault.jpg', '20190405-1-meitzler-biobetrieb-film.jpg', '20190405-1-module2.jpg', 1, '', 'post@pixel-dusche.de', '12345', 1, 1),
(2, 'Mein zweites Angebot', 'äöü\r\n\r\n eueuiazg uqwegzwd ', 'kostenlos', '20190405-1-maxresdefault.jpg', '20190405-1-logo_stiftung_warentest_165x285.jpg', '20190405-1-kronabyhybridsmartwatch-55-640x427-c.jpg', '20190405-1-kronaby_uhr_1.jpg', 1, '', 'post@pixel-dusche.de', '12345', 1, 1),
(3, 'Meine alte Uhr', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. \r\n\r\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', '999,99 €', '20190405-1-kronaby_uhr_1.jpg', '', '', '', 1, '', 'post@pixel-dusche.de', '12345', 1, 1),
(14, 'Ich suche ein Buch', 'Hat jemand den 2. Teil von \"Game of Thrones\"?', '', '', '', '', '', 1, '', 'post@pixel-dusche.de', '12345', 1, 0),
(5, 'Meine andere alte Uhr', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. \r\n\r\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', '999,99 €', '', '', '', '', 1, '', 'post@pixel-dusche.de', '12345', 1, 1),
(12, 'Buch zu verkaufen', 'Das ist ein schönes Buch !!!!', 'zu verschenken', '20190405-1-kapiteleinstieg_1000x247_6-1.jpg', '20190405-1-inverness-ness-river-bank-street-kostenlos-norden-kirche-viktorianischen-stil-st-columba-s-kirche-senkrecht-gotische-highland-scotland-uk-b6rx3d.jpg', '20190405-1-img-20180205-wa0003.jpg', '', 1, '', 'post@pixel-dusche.de', '12345', 1, 1),
(13, 'Ein Bürostuhl', 'Test', 'Kostenlos zur Abholung', '20190405-1-fotolia_168095725_l.jpg', '20190405-1-ford-classic-car-automobile-car-47358.jpg', '20190405-1-elysee_uhren_bei_faszinationzeit.jpg', '20190405-1-e881201eb349ce9c2fc3427fef963521-victorinox-uhren-victorinox-watch.jpg', 1, '', 'post@pixel-dusche.de', '12345', 1, 1),
(9, 'Das ist eine Tasse', 'jzgluzföf', '5', '20190405-1-dji_0066.jpg', '20190405-1-diesel-smartwatch_mf_pr.jpg', '20190405-1-btk_2861.jpg', '20190405-1-b8eb2b3d809d1196114388ed297d8599-silicone-rubber-apple-watch.jpg', 1, '', 'post@pixel-dusche.de', '12345', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_content`
--

DROP TABLE IF EXISTS `morp_cms_content`;
CREATE TABLE `morp_cms_content` (
  `cid` int(11) NOT NULL,
  `navid` int(11) NOT NULL,
  `vid` int(11) NOT NULL,
  `vorlage` int(1) NOT NULL,
  `vorl_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `edit` int(1) NOT NULL DEFAULT 1,
  `pos` int(11) NOT NULL DEFAULT 1,
  `img0` int(11) DEFAULT NULL,
  `img1` int(11) DEFAULT NULL,
  `img2` int(11) DEFAULT NULL,
  `img3` int(11) DEFAULT NULL,
  `layout` int(1) NOT NULL DEFAULT 1,
  `img4` int(11) NOT NULL DEFAULT 0,
  `img5` int(11) NOT NULL DEFAULT 0,
  `img6` int(11) NOT NULL DEFAULT 0,
  `tid` int(11) NOT NULL,
  `ton` int(1) NOT NULL DEFAULT 1,
  `tpos` int(11) NOT NULL,
  `tlink` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tbackground` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timage` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `theadl` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `theight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `tcolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `tref` int(11) NOT NULL,
  `tende` int(1) NOT NULL,
  `tabstand` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci PACK_KEYS=0 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_content`
--

INSERT INTO `morp_cms_content` (`cid`, `navid`, `vid`, `vorlage`, `vorl_name`, `content`, `edit`, `pos`, `img0`, `img1`, `img2`, `img3`, `layout`, `img4`, `img5`, `img6`, `tid`, `ton`, `tpos`, `tlink`, `tbackground`, `timage`, `theadl`, `theight`, `twidth`, `tcolor`, `tref`, `tende`, `tabstand`) VALUES
(1, 1, 0, 0, '', 't2__subheadline_H2@@Letzte Neuigkeiten##t2__farbe@@3##t2__modul_news@@1##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 2, 2, 1, '', '', '', '', 0, 0, '', 2, 0, 0),
(2, 2, 0, 0, '', 't1__news_modul@@1##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, '', '', '', '', 0, 0, '', 3, 0, 0),
(3, 3, 0, 0, '', 't1__page@@calendar_woche.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '', '', 0, 0, '', 0, 0, 0),
(4, 4, 0, 0, '', 't1__galerie@@3##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, '', '', '', '', 0, 0, '', 3, 0, 0),
(5, 5, 0, 0, '', 't2__headline_H1@@Infos zum Intranet##t2__subheadline_H2@@Subline zur Info äöüß##t2__fliesstext@@Frühstück Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\r\n\r\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 2, 1, 1, '', '', '', '', 0, 0, '', 3, 0, 0),
(6, 6, 0, 0, '', 't1__page@@profile.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '', '', 0, 0, '', 0, 0, 0),
(7, 7, 0, 0, '', 't1__page@@gallery_new.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '', '', 0, 0, '', 0, 0, 0),
(8, 8, 0, 0, '', 't1__page@@gallery_edit.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '', '', 0, 0, '', 0, 0, 0),
(9, 9, 0, 0, '', 't1__page@@gallery_my.php##t1__galerie@@3##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '', '', 0, 0, '', 0, 0, 0),
(10, 10, 0, 0, '', 't1__page@@gallery_upload.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '', '', 0, 0, '', 0, 0, 0),
(11, 11, 0, 0, '', 't1__page@@angebote.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '', '', 0, 0, '', 0, 0, 0),
(18, 16, 0, 0, '', 't1__news_modul@@1##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '', '', 0, 0, '', 0, 0, 0),
(19, 17, 0, 0, '', 't1__news_modul@@2##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '', '', 0, 0, '', 0, 0, 0),
(20, 18, 0, 0, '', 't1__news_modul@@3##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '', '', 0, 0, '', 0, 0, 0),
(21, 19, 0, 0, '', 't1__page@@angebot_neu.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '', '', 0, 0, '', 0, 0, 0),
(22, 20, 0, 0, '', 't1__page@@angebot_liste.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '', '', 0, 0, '', 0, 0, 0),
(23, 21, 0, 0, '', 't1__page@@angebot_edit.php##', 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, '', '', '', '', 0, 0, '', 0, 0, 0),
(24, 22, 0, 0, '', 't1__page@@telegram.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '', '', 0, 0, '', 0, 0, 0),
(25, 23, 0, 0, '', NULL, 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '', '', 0, 0, '', 0, 0, 0),
(26, 24, 0, 0, '', 't1__page@@gallery_comment.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '', '', 0, 0, '', 0, 0, 0),
(27, 25, 0, 0, '', 't1__page@@telegram.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '', '', 0, 0, '', 0, 0, 0),
(29, 1, 0, 0, '', 't2__subheadline_H2@@Aktuelle Galerien##t2__farbe@@1##t2__modul_galerien@@3##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 2, 2, 2, '', '', '', '', 0, 0, '', 2, 0, 0),
(30, 1, 0, 0, '', 't2__subheadline_H2@@Hashtags##t2__farbe@@5##t2__modul_hashtags@@##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 2, 2, 3, '', '', '', '', 0, 0, '', 2, 1, 0),
(33, 26, 0, 0, '', 't1__page@@suche.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '', '', 0, 0, '', 0, 0, 0),
(39, 29, 0, 0, '', 't1__headline_H1@@HashTag Suche##t1__page@@hashtag.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, '', '', '', '', 0, 0, '', 2, 0, 0),
(40, 30, 0, 0, '', 't1__page@@telegram-comment.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '', '', 0, 0, '', 0, 0, 0),
(43, 32, 0, 0, '', 't1__page@@meinungen.php##', 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, '', '', '', '', 0, 0, '', 0, 0, 0),
(42, 31, 0, 0, '', 't1__page@@meinungen.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, '', '', '', '', 0, 0, '', 0, 0, 0),
(44, 33, 0, 0, '', 't1__page@@meinungen-comment.php##', 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, '', '', '', '', 0, 0, '', 0, 0, 0),
(45, 34, 0, 0, '', 't1__download_gruppe@@3##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '', '', 0, 0, '', 0, 0, 0),
(47, 35, 0, 0, '', 't1__news_modul@@4##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, '', '', '', '', 0, 0, '', 0, 0, 0),
(35, 5, 0, 0, '', 't2__headline_H1@@So funktioniert die Galerie##t2__subheadline_H2@@Ihre Fotos##t2__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\r\n\r\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 2, 1, 2, '', '', '', '', 0, 0, '', 3, 1, 0),
(36, 27, 0, 0, '', 't1__page@@teilnahme.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, '', '', '', '', 0, 0, '', 3, 0, 0),
(37, 28, 0, 0, '', 't1__page@@teilnahme_liste.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, '', '', '', '', 0, 0, '', 3, 0, 0),
(13, 12, 0, 0, '', 't1__download_gruppe@@1##t1__download_gruppe@@2##t1__download_gruppe@@3##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '', '', 0, 0, '', 0, 0, 0),
(14, 13, 0, 0, '', 't1__page@@calendar_woche.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '', '', 0, 0, '', 0, 0, 0),
(15, 14, 0, 0, '', 't1__page@@calendar_liste.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '', '', 0, 0, '', 0, 0, 0),
(17, 15, 0, 0, '', 't1__page@@calendar_monat.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, '', '', '', '', 0, 0, '', 0, 0, 0),
(48, 1, 0, 0, '', 't1__galerie@@3##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 4, '', '', '', '', 0, 0, '', 3, 0, 0),
(50, 37, 0, 0, '', 't1__headline_H1@@Organize TAG(S)##t1__page@@tag.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '', '', 0, 0, '', 0, 0, 0),
(51, 38, 0, 0, '', 't1__headline_H1@@Organize TAG-GROUPS##t1__page@@tag_group.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, '', '', '', '', 0, 0, '', 0, 0, 0),
(52, 36, 0, 0, '', 't1__headline_H1@@Organize Kategory(S)##t1__page@@category.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '', '', 0, 0, '', 0, 0, 0),
(53, 5, 0, 0, '', 't2__headline_H1@@So funktioniert die Galerie##t2__subheadline_H2@@Ihre Fotos##t2__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\r\n\r\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 2, 1, 3, '', '', '', '', 0, 0, '', 3, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_content_history`
--

DROP TABLE IF EXISTS `morp_cms_content_history`;
CREATE TABLE `morp_cms_content_history` (
  `id` int(11) NOT NULL,
  `datum` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `cid` int(11) NOT NULL,
  `navid` int(11) NOT NULL,
  `vid` int(11) NOT NULL,
  `vorlage` int(1) NOT NULL,
  `vorl_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `edit` int(1) NOT NULL DEFAULT 1,
  `pos` int(11) NOT NULL DEFAULT 1,
  `img0` int(11) DEFAULT NULL,
  `img1` int(11) DEFAULT NULL,
  `img2` int(11) DEFAULT NULL,
  `img3` int(11) DEFAULT NULL,
  `layout` int(1) NOT NULL DEFAULT 1,
  `img4` int(11) NOT NULL DEFAULT 0,
  `img5` int(11) NOT NULL DEFAULT 0,
  `img6` int(11) NOT NULL DEFAULT 0,
  `tid` int(11) NOT NULL,
  `ton` int(1) NOT NULL DEFAULT 1,
  `tpos` int(11) NOT NULL,
  `tlink` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tbackground` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timage` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `theadl` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `theight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `tcolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `tref` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci PACK_KEYS=0 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_content_history`
--

INSERT INTO `morp_cms_content_history` (`id`, `datum`, `timestamp`, `cid`, `navid`, `vid`, `vorlage`, `vorl_name`, `content`, `edit`, `pos`, `img0`, `img1`, `img2`, `img3`, `layout`, `img4`, `img5`, `img6`, `tid`, `ton`, `tpos`, `tlink`, `tbackground`, `timage`, `theadl`, `theight`, `twidth`, `tcolor`, `tref`) VALUES
(1, '', '2019-03-29 12:43:23', 4, 4, 0, 0, '', 't1__bildergalerie@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(2, '', '2019-03-29 12:43:27', 4, 4, 0, 0, '', '', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(3, '', '2019-03-29 12:43:40', 4, 4, 0, 0, '', '', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(4, '', '2019-03-29 12:43:46', 4, 4, 0, 0, '', '', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(5, '', '2019-03-29 12:45:02', 4, 4, 0, 0, '', '', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(6, '', '2019-03-29 12:45:06', 4, 4, 0, 0, '', 't1__galerie@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(7, '', '2019-03-29 12:45:07', 4, 4, 0, 0, '', 't1__galerie@@3##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(8, '', '2019-04-01 08:33:51', 7, 7, 0, 0, '', 't1__page@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(9, '', '2019-04-01 08:34:22', 7, 7, 0, 0, '', 't1__page@@gallery_new.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(10, '', '2019-04-01 09:57:13', 8, 8, 0, 0, '', 't1__page@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(11, '', '2019-04-01 09:57:23', 8, 8, 0, 0, '', 't1__page@@galery_edit.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(12, '', '2019-04-01 09:57:39', 8, 8, 0, 0, '', 't1__page@@gallery_edit.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(13, '', '2019-04-01 10:17:56', 9, 9, 0, 0, '', 't1__page@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(14, '', '2019-04-01 10:18:06', 9, 9, 0, 0, '', 't1__page@@gallery_my.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(15, '', '2019-04-01 10:18:57', 9, 9, 0, 0, '', 't1__page@@gallery_my.php##t1__galerie@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(16, '', '2019-04-01 10:18:59', 9, 9, 0, 0, '', 't1__page@@gallery_my.php##t1__galerie@@3##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(17, '', '2019-04-01 13:05:00', 10, 10, 0, 0, '', 't1__page@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(18, '', '2019-04-01 13:05:13', 10, 10, 0, 0, '', 't1__page@@gallery_upload.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(19, '', '2019-04-02 10:24:15', 6, 6, 0, 0, '', 't1__page@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(20, '', '2019-04-02 10:24:23', 6, 6, 0, 0, '', 't1__page@@profile.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(21, '', '2019-04-02 12:11:34', 5, 5, 0, 0, '', 't1__headline_H1@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(22, '', '2019-04-02 12:11:46', 5, 5, 0, 0, '', 't1__headline_H1@@Infos zum Intranet##t1__fliesstext@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(23, '', '2019-04-02 12:12:03', 5, 5, 0, 0, '', 't1__headline_H1@@Infos zum Intranet##t1__headline_H1@@Infos zum Intranet##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\r\n\r\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(24, '', '2019-04-02 12:12:19', 5, 5, 0, 0, '', 't1__headline_H1@@Infos zum Intranet##t1__headline_H1@@Subline zur Info##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\r\n\r\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(25, '', '2019-04-02 13:25:55', 3, 3, 0, 0, '', 't1__page@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(26, '', '2019-04-02 13:26:03', 3, 3, 0, 0, '', 't1__page@@calendar.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(27, '', '2019-04-02 14:14:30', 12, 3, 0, 0, '', 't1__headline_H1@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(28, '', '2019-04-02 14:14:32', 12, 3, 0, 0, '', 't1__headline_H1@@adcadcdas##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(29, '', '2019-04-02 14:16:09', 12, 3, 0, 0, '', 't1__headline_H1@@adcadcdas##t1__fliesstext@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(30, '', '2019-04-02 14:16:13', 12, 3, 0, 0, '', 't1__headline_H1@@adcadcdas##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(31, '', '2019-04-02 14:16:13', 12, 3, 0, 0, '', 't1__headline_H1@@adcadcdas##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(32, '', '2019-04-02 14:16:14', 12, 3, 0, 0, '', 't1__headline_H1@@adcadcdas##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(33, '', '2019-04-02 14:16:14', 12, 3, 0, 0, '', 't1__headline_H1@@adcadcdas##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(34, '', '2019-04-02 14:16:14', 12, 3, 0, 0, '', 't1__headline_H1@@adcadcdas##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(35, '', '2019-04-02 14:16:22', 12, 3, 0, 0, '', 't1__headline_H1@@adcadcdas##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(36, '', '2019-04-02 14:16:23', 12, 3, 0, 0, '', 't1__headline_H1@@adcadcdas##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(37, '', '2019-04-02 14:16:23', 12, 3, 0, 0, '', 't1__headline_H1@@adcadcdas##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(38, '', '2019-04-02 14:16:23', 12, 3, 0, 0, '', 't1__headline_H1@@adcadcdas##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(39, '', '2019-04-02 14:16:24', 12, 3, 0, 0, '', 't1__headline_H1@@adcadcdas##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0);
INSERT INTO `morp_cms_content_history` (`id`, `datum`, `timestamp`, `cid`, `navid`, `vid`, `vorlage`, `vorl_name`, `content`, `edit`, `pos`, `img0`, `img1`, `img2`, `img3`, `layout`, `img4`, `img5`, `img6`, `tid`, `ton`, `tpos`, `tlink`, `tbackground`, `timage`, `theadl`, `theight`, `twidth`, `tcolor`, `tref`) VALUES
(40, '', '2019-04-02 14:16:24', 12, 3, 0, 0, '', 't1__headline_H1@@adcadcdas##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(41, '', '2019-04-02 14:16:25', 12, 3, 0, 0, '', 't1__headline_H1@@adcadcdas##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t1__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(42, '', '2019-04-02 15:17:36', 3, 3, 0, 0, '', 't1__page@@calendar_monat.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(43, '', '2019-04-02 15:18:17', 14, 13, 0, 0, '', 't1__page@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(44, '', '2019-04-02 15:18:25', 14, 13, 0, 0, '', 't1__page@@calendar_woche.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(45, '', '2019-04-02 15:18:33', 15, 14, 0, 0, '', 't1__page@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(46, '', '2019-04-02 15:18:40', 15, 14, 0, 0, '', 't1__page@@calendar_liste.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(47, '', '2019-04-02 16:45:00', 3, 3, 0, 0, '', 't1__page@@calendar_woche.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(48, '', '2019-04-03 11:49:15', 13, 12, 0, 0, '', 't1__download_gruppe@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(49, '', '2019-04-03 11:49:19', 13, 12, 0, 0, '', 't1__download_gruppe@@1##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(50, '', '2019-04-03 11:49:20', 13, 12, 0, 0, '', 't1__download_gruppe@@1##t1__download_gruppe@@1##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(51, '', '2019-04-03 11:49:21', 13, 12, 0, 0, '', 't1__download_gruppe@@1##t1__download_gruppe@@1##t1__download_gruppe@@1##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(52, '', '2019-04-03 11:49:26', 13, 12, 0, 0, '', 't1__download_gruppe@@1##t1__download_gruppe@@2##t1__download_gruppe@@3##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(53, '', '2019-04-04 10:02:57', 2, 2, 0, 0, '', 't1__news_modul@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(54, '', '2019-04-04 10:03:19', 18, 16, 0, 0, '', 't1__news_modul@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(55, '', '2019-04-04 10:03:22', 18, 16, 0, 0, '', 't1__news_modul@@1##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(56, '', '2019-04-04 10:03:28', 19, 17, 0, 0, '', 't1__news_modul@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(57, '', '2019-04-04 10:03:32', 19, 17, 0, 0, '', 't1__news_modul@@2##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(58, '', '2019-04-04 10:03:40', 20, 18, 0, 0, '', 't1__news_modul@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(59, '', '2019-04-04 10:03:44', 20, 18, 0, 0, '', 't1__news_modul@@3##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(60, '', '2019-04-04 10:17:24', 2, 2, 0, 0, '', 't1__news_modul@@1##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(61, '', '2019-04-04 14:37:54', 3, 3, 0, 0, '', 't1__page@@calendar_woche.php##t1__headline_H1@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(62, '', '2019-04-04 14:38:07', 3, 3, 0, 0, '', 't1__headline_H1@@Termin Zusagen erstellen##t1__page@@calendar_woche.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(63, '', '2019-04-04 14:39:35', 21, 19, 0, 0, '', 't1__page@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(64, '', '2019-04-04 14:39:46', 21, 19, 0, 0, '', 't1__page@@angebot_neu.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(65, '', '2019-04-04 15:32:14', 23, 21, 0, 0, '', 't1__page@@angebot_edit.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(66, '', '2019-04-04 16:04:36', 22, 20, 0, 0, '', 't1__page@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(67, '', '2019-04-04 16:05:04', 22, 20, 0, 0, '', 't1__page@@angebot_liste.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(68, '', '2019-04-04 16:05:43', 22, 20, 0, 0, '', 't1__page@@angebot_liste.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(69, '', '2019-04-04 16:05:44', 22, 20, 0, 0, '', 't1__page@@angebot_liste.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(70, '', '2019-04-05 10:41:44', 11, 11, 0, 0, '', 't1__page@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(71, '', '2019-04-05 10:41:58', 11, 11, 0, 0, '', 't1__page@@angebote.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(72, '', '2019-04-08 08:50:36', 26, 24, 0, 0, '', 't1__page@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(73, '', '2019-04-08 08:50:46', 26, 24, 0, 0, '', 't1__page@@galerie_kommentar.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(74, '', '2019-04-08 08:53:39', 26, 24, 0, 0, '', 't1__page@@gallery_comment.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(75, '', '2019-04-08 11:58:43', 24, 22, 0, 0, '', 't1__page@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(76, '', '2019-04-08 11:58:51', 24, 22, 0, 0, '', 't1__page@@telegram.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(77, '', '2019-04-08 12:04:05', 24, 22, 0, 0, '', 't1__page@@telegram.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(78, '', '2019-04-08 13:19:29', 27, 25, 0, 0, '', 't1__page@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(79, '', '2019-04-08 13:19:36', 27, 25, 0, 0, '', 't1__page@@telegram.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(80, '', '2019-04-09 16:30:29', 1, 1, 0, 0, '', 't1__page@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(81, '', '2019-04-09 16:30:37', 1, 1, 0, 0, '', 't1__page@@dashboard.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(82, '', '2019-04-09 16:30:49', 1, 1, 0, 0, '', '', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(83, '', '2019-04-09 16:39:37', 1, 1, 0, 0, '', 't2__headline_H1@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(84, '', '2019-04-09 16:39:44', 1, 1, 0, 0, '', 't2__headline_H1@@Letzte News##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(85, '', '2019-04-09 16:39:56', 28, 1, 0, 0, '', 't2__headline_H1@@Telegram##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(86, '', '2019-04-09 16:40:05', 29, 1, 0, 0, '', 't2__headline_H1@@Galerien##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(87, '', '2019-04-09 16:45:18', 30, 1, 0, 0, '', 't2__subheadline_H2@@Tags##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(88, '', '2019-04-09 16:45:54', 31, 1, 0, 0, '', 't1__headline_H1@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(89, '', '2019-04-09 16:45:58', 31, 1, 0, 0, '', 't1__headline_H1@@Termine##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(90, '', '2019-04-10 14:54:29', 1, 1, 0, 0, '', 't2__headline_H1@@Letzte News##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(91, '', '2019-04-10 14:54:33', 1, 1, 0, 0, '', 't2__headline_H1@@Letzte News##t2__farbe@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(92, '', '2019-04-10 14:54:38', 1, 1, 0, 0, '', 't2__headline_H1@@Letzte News##t2__farbe@@1##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(93, '', '2019-04-10 15:02:30', 28, 1, 0, 0, '', 't2__subheadline_H3@@Telegram##t2__farbe@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(94, '', '2019-04-10 15:02:33', 28, 1, 0, 0, '', 't2__subheadline_H3@@Telegram##t2__farbe@@4##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(95, '', '2019-04-10 15:02:40', 29, 1, 0, 0, '', 't2__subheadline_H2@@Galerien##t2__farbe@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(96, '', '2019-04-10 15:02:45', 29, 1, 0, 0, '', 't2__subheadline_H2@@Galerien##t2__farbe@@5##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(97, '', '2019-04-10 15:02:59', 30, 1, 0, 0, '', 't2__headline_H1@@Tags##t2__farbe@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(98, '', '2019-04-10 15:03:09', 30, 1, 0, 0, '', 't2__headline_H1@@Tags##t2__farbe@@3##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(99, '', '2019-04-10 15:03:18', 31, 1, 0, 0, '', 't1__subheadline_H2@@Termine##t2__farbe@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(100, '', '2019-04-10 15:03:21', 31, 1, 0, 0, '', 't1__subheadline_H2@@Termine##t2__farbe@@6##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(101, '', '2019-04-10 15:07:48', 1, 1, 0, 0, '', 't2__headline_H1@@Letzte News##t2__farbe@@3##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(102, '', '2019-04-10 15:07:54', 28, 1, 0, 0, '', 't2__subheadline_H3@@Telegram##t2__farbe@@3##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(103, '', '2019-04-10 15:08:00', 29, 1, 0, 0, '', 't2__subheadline_H2@@Galerien##t2__farbe@@3##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(104, '', '2019-04-10 15:08:13', 31, 1, 0, 0, '', 't1__subheadline_H2@@Termine##t2__farbe@@3##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(105, '', '2019-04-10 15:22:12', 29, 1, 0, 0, '', 't2__subheadline_H2@@Galerien##t2__farbe@@3##t2__modul_galerien@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(106, '', '2019-04-10 15:22:40', 29, 1, 0, 0, '', 't2__subheadline_H2@@Aktuelle Galerien##t2__farbe@@3##t2__modul_galerien@@3##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(107, '', '2019-04-10 15:40:44', 1, 1, 0, 0, '', 't2__subheadline_H2@@Letzte News##t2__farbe@@3##t2__modul_news@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(108, '', '2019-04-10 15:47:40', 28, 1, 0, 0, '', 't2__subheadline_H2@@Telegram##t2__farbe@@3##t2__modul_telegram@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(109, '', '2019-04-10 15:56:31', 32, 1, 0, 0, '', 't2__subheadline_H2@@Schwarzes Brett##t2__farbe@@3##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(110, '', '2019-04-10 15:56:38', 32, 1, 0, 0, '', 't2__subheadline_H2@@Schwarzes Brett##t2__farbe@@1##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(111, '', '2019-04-10 15:59:35', 32, 1, 0, 0, '', 't2__subheadline_H2@@Schwarzes Brett##t2__farbe@@1##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(112, '', '2019-04-10 15:59:38', 32, 1, 0, 0, '', 't2__subheadline_H2@@Schwarzes Brett##t2__farbe@@1##t2__modul_schwarzes_brett@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(113, '', '2019-04-10 15:59:47', 31, 1, 0, 0, '', 't2__subheadline_H2@@Termine##t2__farbe@@3##t2__modul_termine@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(114, '', '2019-04-10 16:00:01', 30, 1, 0, 0, '', 't2__subheadline_H2@@Hashtags##t2__farbe@@3##t2__modul_hashtags@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(115, '', '2019-04-10 16:02:07', 32, 1, 0, 0, '', 't2__subheadline_H2@@Schwarzes Brett##t2__farbe@@1##t2__modul_schwarzes_brett@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(116, '', '2019-04-10 16:03:57', 32, 1, 0, 0, '', 't2__subheadline_H2@@Schwarzes Brett##t2__farbe@@2##t2__modul_schwarzes_brett@@##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(117, '', '2019-04-10 16:12:34', 30, 1, 0, 0, '', 't2__subheadline_H2@@Hashtags##t2__farbe@@3##t2__modul_hashtags@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(118, '', '2019-04-10 16:13:33', 30, 1, 0, 0, '', 't2__subheadline_H2@@Hashtags##t2__farbe@@3##t2__modul_hashtags@@##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(119, '', '2019-04-10 16:14:55', 33, 26, 0, 0, '', 't1__page@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(120, '', '2019-04-10 16:15:01', 33, 26, 0, 0, '', 't1__page@@suche.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(121, '', '2019-04-10 16:21:20', 3, 3, 0, 0, '', 't1__headline_H1@@Termin Zusagen erstellen##t1__page@@calendar_woche.php##t1__umbruch@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(122, '', '2019-04-10 16:21:24', 3, 3, 0, 0, '', 't1__headline_H1@@Termin Zusagen erstellen##t1__page@@calendar_woche.php##t1__umbruch@@umbruch##t1__umbruch@@umbruch##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(123, '', '2019-04-10 16:21:32', 3, 3, 0, 0, '', 't1__headline_H1@@Termin Zusagen erstellen##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__page@@calendar_woche.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(124, '', '2019-04-10 16:21:40', 3, 3, 0, 0, '', 't1__headline_H1@@Termin Zusagen erstellen##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__page@@calendar_woche.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(125, '', '2019-04-10 16:21:40', 3, 3, 0, 0, '', 't1__headline_H1@@Termin Zusagen erstellen##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__page@@calendar_woche.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(126, '', '2019-04-10 16:21:41', 3, 3, 0, 0, '', 't1__headline_H1@@Termin Zusagen erstellen##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__page@@calendar_woche.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(127, '', '2019-04-10 16:21:41', 3, 3, 0, 0, '', 't1__headline_H1@@Termin Zusagen erstellen##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__page@@calendar_woche.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(128, '', '2019-04-10 16:21:41', 3, 3, 0, 0, '', 't1__headline_H1@@Termin Zusagen erstellen##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__page@@calendar_woche.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(129, '', '2019-04-10 16:21:42', 3, 3, 0, 0, '', 't1__headline_H1@@Termin Zusagen erstellen##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__page@@calendar_woche.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(130, '', '2019-04-10 16:21:42', 3, 3, 0, 0, '', 't1__headline_H1@@Termin Zusagen erstellen##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__page@@calendar_woche.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(131, '', '2019-04-10 16:21:42', 3, 3, 0, 0, '', 't1__headline_H1@@Termin Zusagen erstellen##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__umbruch@@umbruch##t1__page@@calendar_woche.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(132, '', '2019-04-11 07:05:39', 34, 5, 0, 0, '', 't2__headline_H1@@Infos zum Intranet##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(133, '', '2019-04-11 07:07:02', 5, 5, 0, 0, '', 't2__headline_H1@@##@@Infos zum Intranet##t2__subheadline_H2@@Subline zur Info##t2__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\r\n\r\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(134, '', '2019-04-11 07:07:08', 5, 5, 0, 0, '', 't2__headline_H1@@Infos zum Intranet##@@##t2__subheadline_H2@@Subline zur Info##t2__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\r\n\r\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(135, '', '2019-04-11 07:07:11', 5, 5, 0, 0, '', 't2__headline_H1@@Infos zum Intranet##t2__subheadline_H2@@Subline zur Info##t2__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\r\n\r\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(136, '', '2019-04-11 07:07:47', 35, 5, 0, 0, '', 't2__headline_H1@@So funktioniert die Galerie##t2__subheadline_H2@@Ihre Fotos##t2__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\r\n\r\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(137, '', '2019-04-11 07:07:58', 35, 5, 0, 0, '', 't2__headline_H1@@So funktioniert die Galerie##t2__subheadline_H2@@Ihre Fotos##t2__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\r\n\r\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(138, '', '2019-04-11 07:09:47', 30, 1, 0, 0, '', 't2__subheadline_H2@@Hashtags##t2__farbe@@5##t2__modul_hashtags@@##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(139, '', '2019-04-11 07:10:10', 29, 1, 0, 0, '', 't2__subheadline_H2@@Aktuelle Galerien##t2__farbe@@1##t2__modul_galerien@@3##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(140, '', '2019-04-11 07:16:48', 36, 27, 0, 0, '', 't1__page@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(141, '', '2019-04-11 07:16:55', 36, 27, 0, 0, '', 't1__page@@teinahme.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(142, '', '2019-04-11 07:23:15', 36, 27, 0, 0, '', 't1__page@@teilnahme.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(143, '', '2019-04-11 12:19:41', 37, 28, 0, 0, '', 't1__page@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(144, '', '2019-04-11 12:19:50', 37, 28, 0, 0, '', 't1__page@@teilnahme_liste.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(145, '', '2019-04-11 12:24:17', 3, 3, 0, 0, '', 't1__page@@calendar_woche.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(146, '', '2019-04-12 15:13:46', 5, 5, 0, 0, '', 't2__headline_H1@@Infos zum Intranet##t2__subheadline_H2@@Subline zur Info äöüß##t2__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\r\n\r\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(147, '', '2019-04-17 09:24:11', 5, 5, 0, 0, '', 't2__headline_H1@@Infos zum Intranet##t2__subheadline_H2@@Subline zur Info äöüß##t2__fliesstext@@Frühstück Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\r\n\r\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(148, '', '2019-04-17 12:57:23', 39, 29, 0, 0, '', 't1__page@@hashtag.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(149, '', '2019-04-17 12:59:26', 39, 29, 0, 0, '', 't1__headline_H1@@##t1__page@@hashtag.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(150, '', '2019-04-17 12:59:32', 39, 29, 0, 0, '', 't1__headline_H1@@HashTag Suche##t1__page@@hashtag.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(151, '', '2019-04-18 15:50:15', 40, 30, 0, 0, '', 't1__page@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(152, '', '2019-04-18 15:50:25', 40, 30, 0, 0, '', 't1__page@@telegram-comment.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(153, '', '2019-05-09 06:03:52', 31, 1, 0, 0, '', 't2__subheadline_H2@@Termine##t2__farbe@@3##t2__modul_termine@@##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(154, '', '2019-05-09 06:03:58', 31, 1, 0, 0, '', 't2__interner_link_Box@@##t2__subheadline_H2@@Termine##t2__farbe@@3##t2__modul_termine@@##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(155, '', '2019-05-09 06:04:02', 31, 1, 0, 0, '', 't2__interner_link_Box@@3|##t2__subheadline_H2@@Termine##t2__farbe@@3##t2__modul_termine@@##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(156, '', '2019-05-09 12:22:01', 42, 31, 0, 0, '', 't1__page@@meinungen.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0);
INSERT INTO `morp_cms_content_history` (`id`, `datum`, `timestamp`, `cid`, `navid`, `vid`, `vorlage`, `vorl_name`, `content`, `edit`, `pos`, `img0`, `img1`, `img2`, `img3`, `layout`, `img4`, `img5`, `img6`, `tid`, `ton`, `tpos`, `tlink`, `tbackground`, `timage`, `theadl`, `theight`, `twidth`, `tcolor`, `tref`) VALUES
(157, '', '2019-05-09 12:30:46', 43, 32, 0, 0, '', 't1__page@@meinungen.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(158, '', '2019-05-09 12:30:57', 44, 33, 0, 0, '', 't1__page@@meinungen-comment.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(159, '', '2019-05-21 06:18:25', 45, 34, 0, 0, '', 't1__download_gruppe@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(160, '', '2019-05-21 06:18:28', 45, 34, 0, 0, '', 't1__download_gruppe@@3##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(161, '', '2019-05-21 15:49:41', 1, 1, 0, 0, '', 't2__subheadline_H2@@Letzte Neuigkeiten##t2__farbe@@3##t2__modul_news@@1##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(162, '', '2019-05-21 16:30:42', 47, 35, 0, 0, '', 't1__news_modul@@4##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(163, '', '2020-06-04 16:35:35', 50, 37, 0, 0, '', 't1__page@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(164, '', '2020-06-04 16:36:02', 50, 37, 0, 0, '', 't1__page@@tag.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(165, '', '2020-06-04 16:36:33', 50, 37, 0, 0, '', 't1__headline_H1@@##t1__page@@tag.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(166, '', '2020-06-04 16:36:48', 50, 37, 0, 0, '', 't1__headline_H1@@Organize TAG(S)##t1__page@@tag.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(167, '', '2020-06-04 16:37:30', 50, 37, 0, 0, '', 't1__headline_H1@@Organize TAG(S)##t1__page@@tag.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(168, '', '2020-06-04 16:38:02', 51, 38, 0, 0, '', 't1__headline_H1@@Organize TAG(S)##t1__page@@tag_group.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(169, '', '2020-06-04 16:38:09', 51, 38, 0, 0, '', 't1__headline_H1@@Organize TAG-GROUPS##t1__page@@tag_group.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(170, '', '2020-06-17 11:05:53', 52, 36, 0, 0, '', 't1__headline_H1@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(171, '', '2020-06-17 11:06:29', 52, 36, 0, 0, '', 't1__headline_H1@@Organize Kategory(S)##t1__page@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(172, '', '2020-06-17 11:06:46', 52, 36, 0, 0, '', 't1__headline_H1@@Organize Kategory(S)##t1__page@@category.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(173, '', '2020-06-19 05:37:01', 53, 5, 0, 0, '', 't2__headline_H1@@So funktioniert die Galerie##t2__subheadline_H2@@Ihre Fotos##t2__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\r\n\r\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t2__page@@', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(174, '', '2020-06-19 05:37:09', 53, 5, 0, 0, '', 't2__headline_H1@@So funktioniert die Galerie##t2__subheadline_H2@@Ihre Fotos##t2__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\r\n\r\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##t2__page@@test-info.php##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0),
(175, '', '2020-06-19 06:54:30', 53, 5, 0, 0, '', 't2__headline_H1@@So funktioniert die Galerie##t2__subheadline_H2@@Ihre Fotos##t2__fliesstext@@Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\r\n\r\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.##', 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, '', '', 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_form`
--

DROP TABLE IF EXISTS `morp_cms_form`;
CREATE TABLE `morp_cms_form` (
  `fid` int(11) NOT NULL,
  `fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inpnm` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `edit` int(1) NOT NULL DEFAULT 1,
  `fform` text COLLATE utf8_unicode_ci NOT NULL,
  `fval` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `post` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `betreff` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `antwort` text COLLATE utf8_unicode_ci NOT NULL,
  `extended` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_form_auswertung`
--

DROP TABLE IF EXISTS `morp_cms_form_auswertung`;
CREATE TABLE `morp_cms_form_auswertung` (
  `aid` int(11) NOT NULL,
  `vorname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `wahrnehmung` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `arbeiter` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `beruf` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alter` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `newsletter` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `wahrnehmungX` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `wohnort` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `newsletter_topic` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `malsehen` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `come` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ggggg` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `morp_cms_news` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nachricht` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `anrede` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `anruf` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `vname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `organisation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `anzahl_teilnehmer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bemerkung` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `geo3_4` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prof_sql` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mapping_01` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `spatial_sql` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tile_services` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_form_field`
--

DROP TABLE IF EXISTS `morp_cms_form_field`;
CREATE TABLE `morp_cms_form_field` (
  `ffid` int(11) NOT NULL,
  `fid` int(11) NOT NULL,
  `art` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `feld` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hilfe` text COLLATE utf8_unicode_ci NOT NULL,
  `spalte` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `reihenfolge` int(11) NOT NULL,
  `pflicht` int(1) NOT NULL,
  `email` int(1) NOT NULL,
  `auswahl` text COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `parent` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `fehler` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `klasse` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cont` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `fmin` int(11) NOT NULL,
  `fmax` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_galerie`
--

DROP TABLE IF EXISTS `morp_cms_galerie`;
CREATE TABLE `morp_cms_galerie` (
  `gid` int(11) NOT NULL,
  `gname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tn` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gnid` int(11) NOT NULL DEFAULT 0,
  `gtextde` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gtexten` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gpix` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gsize` int(11) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 1,
  `gdatum` date NOT NULL,
  `tags` text COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `another_infor` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_galerie`
--

INSERT INTO `morp_cms_galerie` (`gid`, `gname`, `tn`, `gnid`, `gtextde`, `gtexten`, `gpix`, `gsize`, `sort`, `gdatum`, `tags`, `keyword`, `another_infor`) VALUES
(179, 'IMG_9.jpg', NULL, 1, 'aa', '', '', 0, 2, '2020-06-20', ',57,,56,', 'ccc', '{\"type\":\"jpeg\",\"width\":1638,\"height\":1092,\"mb\":398.7177734375,\"date\":\"2020-06-20\",\"color\":13,\"props\":{\"date:create\":\"2020-06-20T11:39:48+02:00\",\"date:modify\":\"2020-06-20T11:39:48+02:00\",\"exif:ApertureValue\":\"368640/65536\",\"exif:DateTime\":\"2013:08:15 11:25:20\",\"exif:DateTimeDigitized\":\"2013:08:15 11:25:20\",\"exif:DateTimeOriginal\":\"2013:08:15 11:25:20\",\"exif:ExifImageLength\":\"1092\",\"exif:ExifImageWidth\":\"1638\",\"exif:ExifOffset\":\"216\",\"exif:ExifVersion\":\"48, 50, 50, 48\",\"exif:ExposureBiasValue\":\"0/1\",\"exif:ExposureMode\":\"1\",\"exif:ExposureProgram\":\"1\",\"exif:ExposureTime\":\"1/100\",\"exif:FileSource\":\"3\",\"exif:Flash\":\"16\",\"exif:FNumber\":\"71/10\",\"exif:FocalLength\":\"28/1\",\"exif:FocalPlaneResolutionUnit\":\"2\",\"exif:GPSInfo\":\"944\",\"exif:GPSVersionID\":\"2, 2, 0, 0\",\"exif:ISOSpeedRatings\":\"100\",\"exif:Make\":\"Canon\",\"exif:MeteringMode\":\"5\",\"exif:Model\":\"Canon EOS 5D Mark II\",\"exif:ResolutionUnit\":\"2\",\"exif:SceneType\":\"1\",\"exif:ShutterSpeedValue\":\"434176/65536\",\"exif:Software\":\"Capture One 6 Macintosh\",\"exif:SubjectDistance\":\"0/1\",\"exif:thumbnail:Compression\":\"6\",\"exif:thumbnail:JPEGInterchangeFormat\":\"1004\",\"exif:thumbnail:JPEGInterchangeFormatLength\":\"2216\",\"exif:UserComment\":\"0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0\",\"exif:WhiteBalance\":\"0\",\"exif:XResolution\":\"72/1\",\"exif:YResolution\":\"72/1\",\"icc:copyright\":\"Copyright (c) 1998 Hewlett-Packard Company\",\"icc:description\":\"sRGB IEC61966-2.1\",\"icc:manufacturer\":\"IEC http://www.iec.ch\",\"icc:model\":\"IEC 61966-2.1 Default RGB colour space - sRGB\",\"jpeg:colorspace\":\"2\",\"jpeg:sampling-factor\":\"1x1,1x1,1x1\"}}'),
(178, 'IMG_1.jpg', NULL, 1, 'aaazzz__', '', '', 0, 1, '2020-06-20', '55,75,47,', 'key__', '{\"type\":\"jpeg\",\"width\":1685,\"height\":1123,\"mb\":989.67578125,\"date\":\"2020-06-20\",\"color\":13,\"props\":{\"date:create\":\"2020-06-20T11:39:35+02:00\",\"date:modify\":\"2020-06-20T11:39:35+02:00\",\"exif:ApertureValue\":\"458752/65536\",\"exif:DateTime\":\"2013:08:15 10:26:04\",\"exif:DateTimeDigitized\":\"2013:08:15 10:26:04\",\"exif:DateTimeOriginal\":\"2013:08:15 10:26:04\",\"exif:ExifImageLength\":\"1123\",\"exif:ExifImageWidth\":\"1685\",\"exif:ExifOffset\":\"216\",\"exif:ExifVersion\":\"48, 50, 50, 48\",\"exif:ExposureBiasValue\":\"0/1\",\"exif:ExposureMode\":\"1\",\"exif:ExposureProgram\":\"1\",\"exif:ExposureTime\":\"1/100\",\"exif:FileSource\":\"3\",\"exif:Flash\":\"16\",\"exif:FNumber\":\"11/1\",\"exif:FocalLength\":\"24/1\",\"exif:FocalPlaneResolutionUnit\":\"2\",\"exif:GPSInfo\":\"944\",\"exif:GPSVersionID\":\"2, 2, 0, 0\",\"exif:ISOSpeedRatings\":\"100\",\"exif:Make\":\"Canon\",\"exif:MeteringMode\":\"5\",\"exif:Model\":\"Canon EOS 5D Mark II\",\"exif:ResolutionUnit\":\"2\",\"exif:SceneType\":\"1\",\"exif:ShutterSpeedValue\":\"434176/65536\",\"exif:Software\":\"Capture One 6 Macintosh\",\"exif:SubjectDistance\":\"0/1\",\"exif:thumbnail:Compression\":\"6\",\"exif:thumbnail:JPEGInterchangeFormat\":\"1004\",\"exif:thumbnail:JPEGInterchangeFormatLength\":\"2559\",\"exif:UserComment\":\"0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0\",\"exif:WhiteBalance\":\"0\",\"exif:XResolution\":\"72/1\",\"exif:YResolution\":\"72/1\",\"icc:copyright\":\"Copyright (c) 1998 Hewlett-Packard Company\",\"icc:description\":\"sRGB IEC61966-2.1\",\"icc:manufacturer\":\"IEC http://www.iec.ch\",\"icc:model\":\"IEC 61966-2.1 Default RGB colour space - sRGB\",\"jpeg:colorspace\":\"2\",\"jpeg:sampling-factor\":\"1x1,1x1,1x1\"}}'),
(180, 'IMG_6458.jpg', NULL, 1, 'bbbbb', '', '', 0, 3, '2020-06-20', '72,74,49,79,86,', '', '{\"type\":\"jpeg\",\"width\":1660,\"height\":1106,\"mb\":433.71875,\"date\":\"2020-06-20\",\"color\":13,\"props\":{\"date:create\":\"2020-06-20T11:39:56+02:00\",\"date:modify\":\"2020-06-20T11:39:56+02:00\",\"exif:ApertureValue\":\"434176/65536\",\"exif:DateTime\":\"2013:08:15 11:37:23\",\"exif:DateTimeDigitized\":\"2013:08:15 11:37:23\",\"exif:DateTimeOriginal\":\"2013:08:15 11:37:23\",\"exif:ExifImageLength\":\"1106\",\"exif:ExifImageWidth\":\"1660\",\"exif:ExifOffset\":\"216\",\"exif:ExifVersion\":\"48, 50, 50, 48\",\"exif:ExposureBiasValue\":\"0/1\",\"exif:ExposureMode\":\"1\",\"exif:ExposureProgram\":\"1\",\"exif:ExposureTime\":\"1/80\",\"exif:FileSource\":\"3\",\"exif:Flash\":\"16\",\"exif:FNumber\":\"10/1\",\"exif:FocalLength\":\"24/1\",\"exif:FocalPlaneResolutionUnit\":\"2\",\"exif:GPSInfo\":\"944\",\"exif:GPSVersionID\":\"2, 2, 0, 0\",\"exif:ISOSpeedRatings\":\"100\",\"exif:Make\":\"Canon\",\"exif:MeteringMode\":\"5\",\"exif:Model\":\"Canon EOS 5D Mark II\",\"exif:ResolutionUnit\":\"2\",\"exif:SceneType\":\"1\",\"exif:ShutterSpeedValue\":\"417792/65536\",\"exif:Software\":\"Capture One 6 Macintosh\",\"exif:SubjectDistance\":\"0/1\",\"exif:thumbnail:Compression\":\"6\",\"exif:thumbnail:JPEGInterchangeFormat\":\"1004\",\"exif:thumbnail:JPEGInterchangeFormatLength\":\"2446\",\"exif:UserComment\":\"0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0\",\"exif:WhiteBalance\":\"0\",\"exif:XResolution\":\"72/1\",\"exif:YResolution\":\"72/1\",\"icc:copyright\":\"Copyright (c) 1998 Hewlett-Packard Company\",\"icc:description\":\"sRGB IEC61966-2.1\",\"icc:manufacturer\":\"IEC http://www.iec.ch\",\"icc:model\":\"IEC 61966-2.1 Default RGB colour space - sRGB\",\"jpeg:colorspace\":\"2\",\"jpeg:sampling-factor\":\"1x1,1x1,1x1\"}}'),
(181, 'oberrad_skulptur.png', NULL, 1, '', '', '', 0, 4, '2020-06-20', '68,56,86,', '', '{\"type\":\"png\",\"width\":1024,\"height\":682,\"mb\":1015.5771484375,\"date\":\"2020-06-20\",\"color\":13,\"props\":{\"date:create\":\"2020-06-20T11:40:05+02:00\",\"date:modify\":\"2020-06-20T11:40:05+02:00\",\"png:IHDR.bit-depth-orig\":\"8\",\"png:IHDR.bit_depth\":\"8\",\"png:IHDR.color-type-orig\":\"2\",\"png:IHDR.color_type\":\"2 (Truecolor)\",\"png:IHDR.interlace_method\":\"0 (Not interlaced)\",\"png:IHDR.width,height\":\"1024, 682\",\"png:pHYs\":\"x_res=3780, y_res=3780, units=1\",\"png:sRGB\":\"intent=0 (Perceptual Intent)\"}}'),
(182, 'P1040152.png', NULL, 1, '', '', '', 0, 5, '2020-06-20', '68,56,86,', '', '{\"type\":\"png\",\"width\":1024,\"height\":682,\"mb\":1171.1064453125,\"date\":\"2020-06-20\",\"color\":13,\"props\":{\"date:create\":\"2020-06-20T11:40:14+02:00\",\"date:modify\":\"2020-06-20T11:40:14+02:00\",\"png:IHDR.bit-depth-orig\":\"8\",\"png:IHDR.bit_depth\":\"8\",\"png:IHDR.color-type-orig\":\"2\",\"png:IHDR.color_type\":\"2 (Truecolor)\",\"png:IHDR.interlace_method\":\"0 (Not interlaced)\",\"png:IHDR.width,height\":\"1024, 682\",\"png:sRGB\":\"intent=0 (Perceptual Intent)\"}}'),
(183, 'IMG_9301.jpg', NULL, 3, 'aaazz', '', '', 0, 1, '2020-06-20', '68,56,72,71,', 'nambu keywordzzzz', '{\"type\":\"jpeg\",\"width\":1650,\"height\":1100,\"mb\":586.486328125,\"date\":\"2020-06-20\",\"color\":13,\"props\":{\"date:create\":\"2020-06-20T11:41:45+02:00\",\"date:modify\":\"2020-06-20T11:41:45+02:00\",\"exif:ApertureValue\":\"303104/65536\",\"exif:DateTime\":\"2013:08:30 11:05:06\",\"exif:DateTimeDigitized\":\"2013:08:30 11:05:06\",\"exif:DateTimeOriginal\":\"2013:08:30 11:05:06\",\"exif:ExifImageLength\":\"1100\",\"exif:ExifImageWidth\":\"1650\",\"exif:ExifOffset\":\"216\",\"exif:ExifVersion\":\"48, 50, 50, 48\",\"exif:ExposureBiasValue\":\"0/1\",\"exif:ExposureMode\":\"0\",\"exif:ExposureProgram\":\"2\",\"exif:ExposureTime\":\"1/60\",\"exif:FileSource\":\"3\",\"exif:Flash\":\"9\",\"exif:FNumber\":\"5/1\",\"exif:FocalLength\":\"40/1\",\"exif:FocalPlaneResolutionUnit\":\"2\",\"exif:GPSInfo\":\"944\",\"exif:GPSVersionID\":\"2, 2, 0, 0\",\"exif:ISOSpeedRatings\":\"400\",\"exif:Make\":\"Canon\",\"exif:MeteringMode\":\"5\",\"exif:Model\":\"Canon EOS 5D Mark II\",\"exif:ResolutionUnit\":\"2\",\"exif:SceneType\":\"1\",\"exif:ShutterSpeedValue\":\"393216/65536\",\"exif:Software\":\"Capture One 6 Macintosh\",\"exif:SubjectDistance\":\"0/1\",\"exif:thumbnail:Compression\":\"6\",\"exif:thumbnail:JPEGInterchangeFormat\":\"1004\",\"exif:thumbnail:JPEGInterchangeFormatLength\":\"2868\",\"exif:UserComment\":\"0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0\",\"exif:WhiteBalance\":\"0\",\"exif:XResolution\":\"300/1\",\"exif:YResolution\":\"300/1\",\"icc:copyright\":\"Copyright (c) 1998 Hewlett-Packard Company\",\"icc:description\":\"sRGB IEC61966-2.1\",\"icc:manufacturer\":\"IEC http://www.iec.ch\",\"icc:model\":\"IEC 61966-2.1 Default RGB colour space - sRGB\",\"jpeg:colorspace\":\"2\",\"jpeg:sampling-factor\":\"1x1,1x1,1x1\"}}'),
(184, 'IMG_9332.jpg', NULL, 3, 'deszzz', '', '', 0, 2, '2020-06-20', '68,72,70,52,49,84,48,', 'keyzzz', '{\"type\":\"jpeg\",\"width\":1629,\"height\":1086,\"mb\":413.8994140625,\"date\":\"2020-06-20\",\"color\":13,\"props\":{\"date:create\":\"2020-06-20T11:41:58+02:00\",\"date:modify\":\"2020-06-20T11:41:58+02:00\",\"exif:ApertureValue\":\"327680/65536\",\"exif:DateTime\":\"2013:08:30 11:11:56\",\"exif:DateTimeDigitized\":\"2013:08:30 11:11:56\",\"exif:DateTimeOriginal\":\"2013:08:30 11:11:56\",\"exif:ExifImageLength\":\"1086\",\"exif:ExifImageWidth\":\"1629\",\"exif:ExifOffset\":\"216\",\"exif:ExifVersion\":\"48, 50, 50, 48\",\"exif:ExposureBiasValue\":\"0/1\",\"exif:ExposureMode\":\"0\",\"exif:ExposureProgram\":\"2\",\"exif:ExposureTime\":\"1/60\",\"exif:FileSource\":\"3\",\"exif:Flash\":\"9\",\"exif:FNumber\":\"56/10\",\"exif:FocalLength\":\"24/1\",\"exif:FocalPlaneResolutionUnit\":\"2\",\"exif:GPSInfo\":\"944\",\"exif:GPSVersionID\":\"2, 2, 0, 0\",\"exif:ISOSpeedRatings\":\"400\",\"exif:Make\":\"Canon\",\"exif:MeteringMode\":\"5\",\"exif:Model\":\"Canon EOS 5D Mark II\",\"exif:ResolutionUnit\":\"2\",\"exif:SceneType\":\"1\",\"exif:ShutterSpeedValue\":\"393216/65536\",\"exif:Software\":\"Capture One 6 Macintosh\",\"exif:SubjectDistance\":\"0/1\",\"exif:thumbnail:Compression\":\"6\",\"exif:thumbnail:JPEGInterchangeFormat\":\"1004\",\"exif:thumbnail:JPEGInterchangeFormatLength\":\"1987\",\"exif:UserComment\":\"0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0\",\"exif:WhiteBalance\":\"0\",\"exif:XResolution\":\"300/1\",\"exif:YResolution\":\"300/1\",\"icc:copyright\":\"Copyright (c) 1998 Hewlett-Packard Company\",\"icc:description\":\"sRGB IEC61966-2.1\",\"icc:manufacturer\":\"IEC http://www.iec.ch\",\"icc:model\":\"IEC 61966-2.1 Default RGB colour space - sRGB\",\"jpeg:colorspace\":\"2\",\"jpeg:sampling-factor\":\"1x1,1x1,1x1\"}}'),
(185, 'IMG_9343.jpg', NULL, 3, 'ooooo', '', '', 0, 3, '2020-06-20', '68,49,84,48,', '', '{\"type\":\"jpeg\",\"width\":1650,\"height\":1100,\"mb\":700.1669921875,\"date\":\"2020-06-20\",\"color\":13,\"props\":{\"date:create\":\"2020-06-20T11:41:58+02:00\",\"date:modify\":\"2020-06-20T11:41:58+02:00\",\"exif:ApertureValue\":\"417792/65536\",\"exif:DateTime\":\"2013:08:30 11:15:17\",\"exif:DateTimeDigitized\":\"2013:08:30 11:15:17\",\"exif:DateTimeOriginal\":\"2013:08:30 11:15:17\",\"exif:ExifImageLength\":\"1100\",\"exif:ExifImageWidth\":\"1650\",\"exif:ExifOffset\":\"216\",\"exif:ExifVersion\":\"48, 50, 50, 48\",\"exif:ExposureBiasValue\":\"0/1\",\"exif:ExposureMode\":\"1\",\"exif:ExposureProgram\":\"1\",\"exif:ExposureTime\":\"1/80\",\"exif:FileSource\":\"3\",\"exif:Flash\":\"16\",\"exif:FNumber\":\"9/1\",\"exif:FocalLength\":\"24/1\",\"exif:FocalPlaneResolutionUnit\":\"2\",\"exif:GPSInfo\":\"944\",\"exif:GPSVersionID\":\"2, 2, 0, 0\",\"exif:ISOSpeedRatings\":\"100\",\"exif:Make\":\"Canon\",\"exif:MeteringMode\":\"5\",\"exif:Model\":\"Canon EOS 5D Mark II\",\"exif:ResolutionUnit\":\"2\",\"exif:SceneType\":\"1\",\"exif:ShutterSpeedValue\":\"417792/65536\",\"exif:Software\":\"Capture One 6 Macintosh\",\"exif:SubjectDistance\":\"0/1\",\"exif:thumbnail:Compression\":\"6\",\"exif:thumbnail:JPEGInterchangeFormat\":\"1004\",\"exif:thumbnail:JPEGInterchangeFormatLength\":\"2541\",\"exif:UserComment\":\"0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0\",\"exif:WhiteBalance\":\"0\",\"exif:XResolution\":\"300/1\",\"exif:YResolution\":\"300/1\",\"icc:copyright\":\"Copyright (c) 1998 Hewlett-Packard Company\",\"icc:description\":\"sRGB IEC61966-2.1\",\"icc:manufacturer\":\"IEC http://www.iec.ch\",\"icc:model\":\"IEC 61966-2.1 Default RGB colour space - sRGB\",\"jpeg:colorspace\":\"2\",\"jpeg:sampling-factor\":\"1x1,1x1,1x1\"}}'),
(186, 'IMG_9376.jpg', NULL, 3, '', '', '', 0, 4, '2020-06-20', '68,49,84,48,', '', '{\"type\":\"jpeg\",\"width\":1685,\"height\":1123,\"mb\":1031.8408203125,\"date\":\"2020-06-20\",\"color\":13,\"props\":{\"date:create\":\"2020-06-20T11:41:59+02:00\",\"date:modify\":\"2020-06-20T11:41:59+02:00\",\"exif:ApertureValue\":\"434176/65536\",\"exif:DateTime\":\"2013:08:30 11:22:53\",\"exif:DateTimeDigitized\":\"2013:08:30 11:22:53\",\"exif:DateTimeOriginal\":\"2013:08:30 11:22:53\",\"exif:ExifImageLength\":\"1123\",\"exif:ExifImageWidth\":\"1685\",\"exif:ExifOffset\":\"216\",\"exif:ExifVersion\":\"48, 50, 50, 48\",\"exif:ExposureBiasValue\":\"0/1\",\"exif:ExposureMode\":\"1\",\"exif:ExposureProgram\":\"1\",\"exif:ExposureTime\":\"1/100\",\"exif:FileSource\":\"3\",\"exif:Flash\":\"16\",\"exif:FNumber\":\"10/1\",\"exif:FocalLength\":\"24/1\",\"exif:FocalPlaneResolutionUnit\":\"2\",\"exif:GPSInfo\":\"944\",\"exif:GPSVersionID\":\"2, 2, 0, 0\",\"exif:ISOSpeedRatings\":\"100\",\"exif:Make\":\"Canon\",\"exif:MeteringMode\":\"5\",\"exif:Model\":\"Canon EOS 5D Mark II\",\"exif:ResolutionUnit\":\"2\",\"exif:SceneType\":\"1\",\"exif:ShutterSpeedValue\":\"434176/65536\",\"exif:Software\":\"Capture One 6 Macintosh\",\"exif:SubjectDistance\":\"0/1\",\"exif:thumbnail:Compression\":\"6\",\"exif:thumbnail:JPEGInterchangeFormat\":\"1004\",\"exif:thumbnail:JPEGInterchangeFormatLength\":\"3352\",\"exif:UserComment\":\"0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0\",\"exif:WhiteBalance\":\"0\",\"exif:XResolution\":\"300/1\",\"exif:YResolution\":\"300/1\",\"icc:copyright\":\"Copyright (c) 1998 Hewlett-Packard Company\",\"icc:description\":\"sRGB IEC61966-2.1\",\"icc:manufacturer\":\"IEC http://www.iec.ch\",\"icc:model\":\"IEC 61966-2.1 Default RGB colour space - sRGB\",\"jpeg:colorspace\":\"2\",\"jpeg:sampling-factor\":\"1x1,1x1,1x1\"}}'),
(187, 'IMG_9483.jpg', NULL, 3, '', '', '', 0, 5, '2020-06-20', '68,49,84,48,', '', '{\"type\":\"jpeg\",\"width\":1659,\"height\":1106,\"mb\":544.1572265625,\"date\":\"2020-06-20\",\"color\":13,\"props\":{\"date:create\":\"2020-06-20T11:42:26+02:00\",\"date:modify\":\"2020-06-20T11:42:26+02:00\",\"exif:ApertureValue\":\"393216/65536\",\"exif:DateTime\":\"2013:08:30 12:06:42\",\"exif:DateTimeDigitized\":\"2013:08:30 12:06:42\",\"exif:DateTimeOriginal\":\"2013:08:30 12:06:42\",\"exif:ExifImageLength\":\"1106\",\"exif:ExifImageWidth\":\"1659\",\"exif:ExifOffset\":\"216\",\"exif:ExifVersion\":\"48, 50, 50, 48\",\"exif:ExposureBiasValue\":\"0/1\",\"exif:ExposureMode\":\"1\",\"exif:ExposureProgram\":\"1\",\"exif:ExposureTime\":\"1/50\",\"exif:FileSource\":\"3\",\"exif:Flash\":\"9\",\"exif:FNumber\":\"8/1\",\"exif:FocalLength\":\"24/1\",\"exif:FocalPlaneResolutionUnit\":\"2\",\"exif:GPSInfo\":\"944\",\"exif:GPSVersionID\":\"2, 2, 0, 0\",\"exif:ISOSpeedRatings\":\"200\",\"exif:Make\":\"Canon\",\"exif:MeteringMode\":\"5\",\"exif:Model\":\"Canon EOS 5D Mark II\",\"exif:ResolutionUnit\":\"2\",\"exif:SceneType\":\"1\",\"exif:ShutterSpeedValue\":\"368640/65536\",\"exif:Software\":\"Capture One 6 Macintosh\",\"exif:SubjectDistance\":\"0/1\",\"exif:thumbnail:Compression\":\"6\",\"exif:thumbnail:JPEGInterchangeFormat\":\"1004\",\"exif:thumbnail:JPEGInterchangeFormatLength\":\"2765\",\"exif:UserComment\":\"0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0\",\"exif:WhiteBalance\":\"0\",\"exif:XResolution\":\"300/1\",\"exif:YResolution\":\"300/1\",\"icc:copyright\":\"Copyright (c) 1998 Hewlett-Packard Company\",\"icc:description\":\"sRGB IEC61966-2.1\",\"icc:manufacturer\":\"IEC http://www.iec.ch\",\"icc:model\":\"IEC 61966-2.1 Default RGB colour space - sRGB\",\"jpeg:colorspace\":\"2\",\"jpeg:sampling-factor\":\"1x1,1x1,1x1\"}}'),
(188, 'IMG_9400.jpg', NULL, 3, '', '', '', 0, 6, '2020-06-20', '68,49,84,48,', '', '{\"type\":\"jpeg\",\"width\":1685,\"height\":1123,\"mb\":668.3291015625,\"date\":\"2020-06-20\",\"color\":13,\"props\":{\"date:create\":\"2020-06-20T11:42:27+02:00\",\"date:modify\":\"2020-06-20T11:42:27+02:00\",\"exif:ApertureValue\":\"327680/65536\",\"exif:DateTime\":\"2013:08:30 11:39:05\",\"exif:DateTimeDigitized\":\"2013:08:30 11:39:05\",\"exif:DateTimeOriginal\":\"2013:08:30 11:39:05\",\"exif:ExifImageLength\":\"1123\",\"exif:ExifImageWidth\":\"1685\",\"exif:ExifOffset\":\"216\",\"exif:ExifVersion\":\"48, 50, 50, 48\",\"exif:ExposureBiasValue\":\"0/1\",\"exif:ExposureMode\":\"0\",\"exif:ExposureProgram\":\"2\",\"exif:ExposureTime\":\"1/125\",\"exif:FileSource\":\"3\",\"exif:Flash\":\"9\",\"exif:FNumber\":\"56/10\",\"exif:FocalLength\":\"32/1\",\"exif:FocalPlaneResolutionUnit\":\"2\",\"exif:GPSInfo\":\"944\",\"exif:GPSVersionID\":\"2, 2, 0, 0\",\"exif:ISOSpeedRatings\":\"200\",\"exif:Make\":\"Canon\",\"exif:MeteringMode\":\"5\",\"exif:Model\":\"Canon EOS 5D Mark II\",\"exif:ResolutionUnit\":\"2\",\"exif:SceneType\":\"1\",\"exif:ShutterSpeedValue\":\"458752/65536\",\"exif:Software\":\"Capture One 6 Macintosh\",\"exif:SubjectDistance\":\"0/1\",\"exif:thumbnail:Compression\":\"6\",\"exif:thumbnail:JPEGInterchangeFormat\":\"1004\",\"exif:thumbnail:JPEGInterchangeFormatLength\":\"2768\",\"exif:UserComment\":\"0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0\",\"exif:WhiteBalance\":\"0\",\"exif:XResolution\":\"300/1\",\"exif:YResolution\":\"300/1\",\"icc:copyright\":\"Copyright (c) 1998 Hewlett-Packard Company\",\"icc:description\":\"sRGB IEC61966-2.1\",\"icc:manufacturer\":\"IEC http://www.iec.ch\",\"icc:model\":\"IEC 61966-2.1 Default RGB colour space - sRGB\",\"jpeg:colorspace\":\"2\",\"jpeg:sampling-factor\":\"1x1,1x1,1x1\"}}'),
(189, 'IMG_9560.jpg', NULL, 3, '', '', '', 0, 7, '2020-06-20', '68,49,84,48,', '', '{\"type\":\"jpeg\",\"width\":1641,\"height\":1094,\"mb\":709.3330078125,\"date\":\"2020-06-20\",\"color\":13,\"props\":{\"date:create\":\"2020-06-20T11:42:27+02:00\",\"date:modify\":\"2020-06-20T11:42:27+02:00\",\"exif:ApertureValue\":\"417792/65536\",\"exif:DateTime\":\"2013:08:30 13:10:11\",\"exif:DateTimeDigitized\":\"2013:08:30 13:10:11\",\"exif:DateTimeOriginal\":\"2013:08:30 13:10:11\",\"exif:ExifImageLength\":\"1094\",\"exif:ExifImageWidth\":\"1641\",\"exif:ExifOffset\":\"216\",\"exif:ExifVersion\":\"48, 50, 50, 48\",\"exif:ExposureBiasValue\":\"0/1\",\"exif:ExposureMode\":\"0\",\"exif:ExposureProgram\":\"2\",\"exif:ExposureTime\":\"1/200\",\"exif:FileSource\":\"3\",\"exif:Flash\":\"9\",\"exif:FNumber\":\"9/1\",\"exif:FocalLength\":\"24/1\",\"exif:FocalPlaneResolutionUnit\":\"2\",\"exif:GPSInfo\":\"944\",\"exif:GPSVersionID\":\"2, 2, 0, 0\",\"exif:ISOSpeedRatings\":\"400\",\"exif:Make\":\"Canon\",\"exif:MeteringMode\":\"5\",\"exif:Model\":\"Canon EOS 5D Mark II\",\"exif:ResolutionUnit\":\"2\",\"exif:SceneType\":\"1\",\"exif:ShutterSpeedValue\":\"499712/65536\",\"exif:Software\":\"Capture One 6 Macintosh\",\"exif:SubjectDistance\":\"0/1\",\"exif:thumbnail:Compression\":\"6\",\"exif:thumbnail:JPEGInterchangeFormat\":\"1004\",\"exif:thumbnail:JPEGInterchangeFormatLength\":\"2739\",\"exif:UserComment\":\"0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0\",\"exif:WhiteBalance\":\"0\",\"exif:XResolution\":\"300/1\",\"exif:YResolution\":\"300/1\",\"icc:copyright\":\"Copyright (c) 1998 Hewlett-Packard Company\",\"icc:description\":\"sRGB IEC61966-2.1\",\"icc:manufacturer\":\"IEC http://www.iec.ch\",\"icc:model\":\"IEC 61966-2.1 Default RGB colour space - sRGB\",\"jpeg:colorspace\":\"2\",\"jpeg:sampling-factor\":\"1x1,1x1,1x1\"}}'),
(190, 'IMG_9529.jpg', NULL, 3, '', '', '', 0, 8, '2020-06-20', '68,49,84,48,', '', '{\"type\":\"jpeg\",\"width\":1658,\"height\":1105,\"mb\":713.1240234375,\"date\":\"2020-06-20\",\"color\":13,\"props\":{\"date:create\":\"2020-06-20T11:42:27+02:00\",\"date:modify\":\"2020-06-20T11:42:27+02:00\",\"exif:ApertureValue\":\"352256/65536\",\"exif:DateTime\":\"2013:08:30 12:51:19\",\"exif:DateTimeDigitized\":\"2013:08:30 12:51:19\",\"exif:DateTimeOriginal\":\"2013:08:30 12:51:19\",\"exif:ExifImageLength\":\"1105\",\"exif:ExifImageWidth\":\"1658\",\"exif:ExifOffset\":\"216\",\"exif:ExifVersion\":\"48, 50, 50, 48\",\"exif:ExposureBiasValue\":\"0/1\",\"exif:ExposureMode\":\"1\",\"exif:ExposureProgram\":\"1\",\"exif:ExposureTime\":\"1/50\",\"exif:FileSource\":\"3\",\"exif:Flash\":\"9\",\"exif:FNumber\":\"63/10\",\"exif:FocalLength\":\"24/1\",\"exif:FocalPlaneResolutionUnit\":\"2\",\"exif:GPSInfo\":\"944\",\"exif:GPSVersionID\":\"2, 2, 0, 0\",\"exif:ISOSpeedRatings\":\"320\",\"exif:Make\":\"Canon\",\"exif:MeteringMode\":\"5\",\"exif:Model\":\"Canon EOS 5D Mark II\",\"exif:ResolutionUnit\":\"2\",\"exif:SceneType\":\"1\",\"exif:ShutterSpeedValue\":\"368640/65536\",\"exif:Software\":\"Capture One 6 Macintosh\",\"exif:SubjectDistance\":\"0/1\",\"exif:thumbnail:Compression\":\"6\",\"exif:thumbnail:JPEGInterchangeFormat\":\"1004\",\"exif:thumbnail:JPEGInterchangeFormatLength\":\"2849\",\"exif:UserComment\":\"0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0\",\"exif:WhiteBalance\":\"0\",\"exif:XResolution\":\"300/1\",\"exif:YResolution\":\"300/1\",\"icc:copyright\":\"Copyright (c) 1998 Hewlett-Packard Company\",\"icc:description\":\"sRGB IEC61966-2.1\",\"icc:manufacturer\":\"IEC http://www.iec.ch\",\"icc:model\":\"IEC 61966-2.1 Default RGB colour space - sRGB\",\"jpeg:colorspace\":\"2\",\"jpeg:sampling-factor\":\"1x1,1x1,1x1\"}}'),
(191, 'IMG_9390.jpg', NULL, 3, '', '', '', 0, 9, '2020-06-20', '68,49,84,48,', '', '{\"type\":\"jpeg\",\"width\":1665,\"height\":1110,\"mb\":1009.7060546875,\"date\":\"2020-06-20\",\"color\":13,\"props\":{\"date:create\":\"2020-06-20T11:42:27+02:00\",\"date:modify\":\"2020-06-20T11:42:27+02:00\",\"exif:ApertureValue\":\"434176/65536\",\"exif:DateTime\":\"2013:08:30 11:28:08\",\"exif:DateTimeDigitized\":\"2013:08:30 11:28:08\",\"exif:DateTimeOriginal\":\"2013:08:30 11:28:08\",\"exif:ExifImageLength\":\"1110\",\"exif:ExifImageWidth\":\"1665\",\"exif:ExifOffset\":\"216\",\"exif:ExifVersion\":\"48, 50, 50, 48\",\"exif:ExposureBiasValue\":\"0/1\",\"exif:ExposureMode\":\"1\",\"exif:ExposureProgram\":\"1\",\"exif:ExposureTime\":\"1/100\",\"exif:FileSource\":\"3\",\"exif:Flash\":\"16\",\"exif:FNumber\":\"10/1\",\"exif:FocalLength\":\"24/1\",\"exif:FocalPlaneResolutionUnit\":\"2\",\"exif:GPSInfo\":\"944\",\"exif:GPSVersionID\":\"2, 2, 0, 0\",\"exif:ISOSpeedRatings\":\"100\",\"exif:Make\":\"Canon\",\"exif:MeteringMode\":\"5\",\"exif:Model\":\"Canon EOS 5D Mark II\",\"exif:ResolutionUnit\":\"2\",\"exif:SceneType\":\"1\",\"exif:ShutterSpeedValue\":\"434176/65536\",\"exif:Software\":\"Capture One 6 Macintosh\",\"exif:SubjectDistance\":\"0/1\",\"exif:thumbnail:Compression\":\"6\",\"exif:thumbnail:JPEGInterchangeFormat\":\"1004\",\"exif:thumbnail:JPEGInterchangeFormatLength\":\"3468\",\"exif:UserComment\":\"0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0\",\"exif:WhiteBalance\":\"0\",\"exif:XResolution\":\"300/1\",\"exif:YResolution\":\"300/1\",\"icc:copyright\":\"Copyright (c) 1998 Hewlett-Packard Company\",\"icc:description\":\"sRGB IEC61966-2.1\",\"icc:manufacturer\":\"IEC http://www.iec.ch\",\"icc:model\":\"IEC 61966-2.1 Default RGB colour space - sRGB\",\"jpeg:colorspace\":\"2\",\"jpeg:sampling-factor\":\"1x1,1x1,1x1\"}}'),
(202, 'P1040195.png', NULL, 6, '', '', '', 0, 2, '2020-06-20', '49,77,50,', '', '{\"type\":\"png\",\"width\":1024,\"height\":682,\"mb\":739.72265625,\"date\":\"2020-06-20\",\"color\":13,\"props\":{\"date:create\":\"2020-06-20T11:45:58+02:00\",\"date:modify\":\"2020-06-20T11:45:58+02:00\",\"png:IHDR.bit-depth-orig\":\"8\",\"png:IHDR.bit_depth\":\"8\",\"png:IHDR.color-type-orig\":\"2\",\"png:IHDR.color_type\":\"2 (Truecolor)\",\"png:IHDR.interlace_method\":\"0 (Not interlaced)\",\"png:IHDR.width,height\":\"1024, 682\",\"png:sRGB\":\"intent=0 (Perceptual Intent)\"}}'),
(203, 'IMG_9.jpg', NULL, 6, '', '', '', 0, 3, '2020-06-20', '49,77,50,', '', '{\"type\":\"jpeg\",\"width\":1638,\"height\":1092,\"mb\":398.7177734375,\"date\":\"2020-06-20\",\"color\":13,\"props\":{\"date:create\":\"2020-06-20T11:46:02+02:00\",\"date:modify\":\"2020-06-20T11:46:02+02:00\",\"exif:ApertureValue\":\"368640/65536\",\"exif:DateTime\":\"2013:08:15 11:25:20\",\"exif:DateTimeDigitized\":\"2013:08:15 11:25:20\",\"exif:DateTimeOriginal\":\"2013:08:15 11:25:20\",\"exif:ExifImageLength\":\"1092\",\"exif:ExifImageWidth\":\"1638\",\"exif:ExifOffset\":\"216\",\"exif:ExifVersion\":\"48, 50, 50, 48\",\"exif:ExposureBiasValue\":\"0/1\",\"exif:ExposureMode\":\"1\",\"exif:ExposureProgram\":\"1\",\"exif:ExposureTime\":\"1/100\",\"exif:FileSource\":\"3\",\"exif:Flash\":\"16\",\"exif:FNumber\":\"71/10\",\"exif:FocalLength\":\"28/1\",\"exif:FocalPlaneResolutionUnit\":\"2\",\"exif:GPSInfo\":\"944\",\"exif:GPSVersionID\":\"2, 2, 0, 0\",\"exif:ISOSpeedRatings\":\"100\",\"exif:Make\":\"Canon\",\"exif:MeteringMode\":\"5\",\"exif:Model\":\"Canon EOS 5D Mark II\",\"exif:ResolutionUnit\":\"2\",\"exif:SceneType\":\"1\",\"exif:ShutterSpeedValue\":\"434176/65536\",\"exif:Software\":\"Capture One 6 Macintosh\",\"exif:SubjectDistance\":\"0/1\",\"exif:thumbnail:Compression\":\"6\",\"exif:thumbnail:JPEGInterchangeFormat\":\"1004\",\"exif:thumbnail:JPEGInterchangeFormatLength\":\"2216\",\"exif:UserComment\":\"0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0\",\"exif:WhiteBalance\":\"0\",\"exif:XResolution\":\"72/1\",\"exif:YResolution\":\"72/1\",\"icc:copyright\":\"Copyright (c) 1998 Hewlett-Packard Company\",\"icc:description\":\"sRGB IEC61966-2.1\",\"icc:manufacturer\":\"IEC http://www.iec.ch\",\"icc:model\":\"IEC 61966-2.1 Default RGB colour space - sRGB\",\"jpeg:colorspace\":\"2\",\"jpeg:sampling-factor\":\"1x1,1x1,1x1\"}}'),
(204, 'IMG_6458.jpg', NULL, 6, '', '', '', 0, 4, '2020-06-20', '49,77,50,', '', '{\"type\":\"jpeg\",\"width\":1660,\"height\":1106,\"mb\":433.71875,\"date\":\"2020-06-20\",\"color\":13,\"props\":{\"date:create\":\"2020-06-20T11:46:03+02:00\",\"date:modify\":\"2020-06-20T11:46:03+02:00\",\"exif:ApertureValue\":\"434176/65536\",\"exif:DateTime\":\"2013:08:15 11:37:23\",\"exif:DateTimeDigitized\":\"2013:08:15 11:37:23\",\"exif:DateTimeOriginal\":\"2013:08:15 11:37:23\",\"exif:ExifImageLength\":\"1106\",\"exif:ExifImageWidth\":\"1660\",\"exif:ExifOffset\":\"216\",\"exif:ExifVersion\":\"48, 50, 50, 48\",\"exif:ExposureBiasValue\":\"0/1\",\"exif:ExposureMode\":\"1\",\"exif:ExposureProgram\":\"1\",\"exif:ExposureTime\":\"1/80\",\"exif:FileSource\":\"3\",\"exif:Flash\":\"16\",\"exif:FNumber\":\"10/1\",\"exif:FocalLength\":\"24/1\",\"exif:FocalPlaneResolutionUnit\":\"2\",\"exif:GPSInfo\":\"944\",\"exif:GPSVersionID\":\"2, 2, 0, 0\",\"exif:ISOSpeedRatings\":\"100\",\"exif:Make\":\"Canon\",\"exif:MeteringMode\":\"5\",\"exif:Model\":\"Canon EOS 5D Mark II\",\"exif:ResolutionUnit\":\"2\",\"exif:SceneType\":\"1\",\"exif:ShutterSpeedValue\":\"417792/65536\",\"exif:Software\":\"Capture One 6 Macintosh\",\"exif:SubjectDistance\":\"0/1\",\"exif:thumbnail:Compression\":\"6\",\"exif:thumbnail:JPEGInterchangeFormat\":\"1004\",\"exif:thumbnail:JPEGInterchangeFormatLength\":\"2446\",\"exif:UserComment\":\"0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0\",\"exif:WhiteBalance\":\"0\",\"exif:XResolution\":\"72/1\",\"exif:YResolution\":\"72/1\",\"icc:copyright\":\"Copyright (c) 1998 Hewlett-Packard Company\",\"icc:description\":\"sRGB IEC61966-2.1\",\"icc:manufacturer\":\"IEC http://www.iec.ch\",\"icc:model\":\"IEC 61966-2.1 Default RGB colour space - sRGB\",\"jpeg:colorspace\":\"2\",\"jpeg:sampling-factor\":\"1x1,1x1,1x1\"}}'),
(206, 'oberrad_skulptur.png', NULL, 6, '', '', '', 0, 6, '2020-06-20', '49,77,50,', '', '{\"type\":\"png\",\"width\":1024,\"height\":682,\"mb\":1015.5771484375,\"date\":\"2020-06-20\",\"color\":13,\"props\":{\"date:create\":\"2020-06-20T11:46:04+02:00\",\"date:modify\":\"2020-06-20T11:46:04+02:00\",\"png:IHDR.bit-depth-orig\":\"8\",\"png:IHDR.bit_depth\":\"8\",\"png:IHDR.color-type-orig\":\"2\",\"png:IHDR.color_type\":\"2 (Truecolor)\",\"png:IHDR.interlace_method\":\"0 (Not interlaced)\",\"png:IHDR.width,height\":\"1024, 682\",\"png:pHYs\":\"x_res=3780, y_res=3780, units=1\",\"png:sRGB\":\"intent=0 (Perceptual Intent)\"}}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_galerie_comments`
--

DROP TABLE IF EXISTS `morp_cms_galerie_comments`;
CREATE TABLE `morp_cms_galerie_comments` (
  `commentsID` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mid` int(11) NOT NULL,
  `dat` timestamp NOT NULL DEFAULT current_timestamp(),
  `parentID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_galerie_comments`
--

INSERT INTO `morp_cms_galerie_comments` (`commentsID`, `gid`, `comment`, `mid`, `dat`, `parentID`) VALUES
(1, 56, 'Hier schreibe ich gerade meinen ersten Kommentar.\n\näöüßÄÖÜß@', 1, '2019-04-07 22:00:00', 0),
(4, 2, 'Schönes Foto', 1, '2019-04-07 22:00:00', 0),
(2, 56, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebu', 0, '2019-04-07 22:00:00', 0),
(3, 56, ' invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergr', 1, '2019-04-07 22:00:00', 0),
(5, 56, 'wie geht das?', 1, '2019-04-16 22:00:00', 0),
(10, 23, 'usg dauilgs aösiuh \nökj DSÖIUGH', 2, '2020-05-28 22:00:00', 0),
(9, 18, 'Mein Kommentar zum Bild ...', 1, '2019-05-20 22:00:00', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_galerie_folders`
--

DROP TABLE IF EXISTS `morp_cms_galerie_folders`;
CREATE TABLE `morp_cms_galerie_folders` (
  `folderID` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `folder_name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_galerie_folders`
--

INSERT INTO `morp_cms_galerie_folders` (`folderID`, `mid`, `folder_name`) VALUES
(8, 2, 'vu'),
(13, 2, 'folder2'),
(12, 2, 'folder1'),
(16, 2, 'Stimmungzzz'),
(15, 2, 'poo');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_galerie_folders_images`
--

DROP TABLE IF EXISTS `morp_cms_galerie_folders_images`;
CREATE TABLE `morp_cms_galerie_folders_images` (
  `imagesID` int(11) NOT NULL,
  `foldersID` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `comments` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_galerie_folders_images`
--

INSERT INTO `morp_cms_galerie_folders_images` (`imagesID`, `foldersID`, `gid`, `ordering`, `comments`) VALUES
(1, 3, 119, 0, ''),
(2, 3, 120, 0, ''),
(3, 6, 119, 0, ''),
(4, 6, 120, 0, ''),
(5, 6, 121, 0, ''),
(6, 6, 128, 0, ''),
(7, 6, 129, 0, ''),
(8, 6, 130, 0, ''),
(14, 11, 119, 0, ''),
(10, 8, 120, 0, ''),
(11, 8, 121, 0, ''),
(24, 8, 153, 0, ''),
(15, 11, 120, 0, ''),
(16, 12, 129, 0, ''),
(17, 12, 130, 0, ''),
(21, 8, 129, 0, ''),
(19, 8, 119, 0, ''),
(23, 8, 152, 0, ''),
(25, 13, 152, 0, ''),
(26, 13, 162, 0, ''),
(27, 13, 165, 0, ''),
(28, 12, 152, 0, ''),
(29, 12, 153, 0, ''),
(30, 12, 162, 0, ''),
(31, 12, 164, 0, ''),
(32, 12, 165, 0, ''),
(47, 8, 180, 0, ''),
(35, 15, 179, 0, ''),
(36, 15, 178, 0, ''),
(45, 8, 178, 0, ''),
(46, 8, 179, 0, ''),
(48, 8, 181, 0, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_galerie_group`
--

DROP TABLE IF EXISTS `morp_cms_galerie_group`;
CREATE TABLE `morp_cms_galerie_group` (
  `ggid` int(11) NOT NULL,
  `ggname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sort` int(11) DEFAULT NULL,
  `gglink` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sichtbar` int(1) NOT NULL DEFAULT 1,
  `date` varchar(12) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_galerie_group`
--

INSERT INTO `morp_cms_galerie_group` (`ggid`, `ggname`, `sort`, `gglink`, `sichtbar`, `date`) VALUES
(1, 'stift', NULL, '', 1, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_galerie_guests`
--

DROP TABLE IF EXISTS `morp_cms_galerie_guests`;
CREATE TABLE `morp_cms_galerie_guests` (
  `guestID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `start_dat` varchar(10) NOT NULL,
  `end_dat` varchar(10) NOT NULL,
  `email` text NOT NULL,
  `folder_ids` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_galerie_guests`
--

INSERT INTO `morp_cms_galerie_guests` (`guestID`, `username`, `password`, `start_dat`, `end_dat`, `email`, `folder_ids`) VALUES
(14, 'test@yahoo.com', 'e10adc3949ba59abbe56e057f20f883e', '2020-07-27', '2020-07-31', 'test@yahoo.com', '8,');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_galerie_likes`
--

DROP TABLE IF EXISTS `morp_cms_galerie_likes`;
CREATE TABLE `morp_cms_galerie_likes` (
  `likesID` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `gid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_galerie_likes`
--

INSERT INTO `morp_cms_galerie_likes` (`likesID`, `mid`, `gid`) VALUES
(84, 2, 183);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_galerie_name`
--

DROP TABLE IF EXISTS `morp_cms_galerie_name`;
CREATE TABLE `morp_cms_galerie_name` (
  `gnid` int(11) NOT NULL,
  `gnname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ggid` int(11) NOT NULL DEFAULT 0,
  `img` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date` date NOT NULL,
  `textde` text COLLATE utf8_unicode_ci NOT NULL,
  `texten` text COLLATE utf8_unicode_ci NOT NULL,
  `gntextde` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gntexten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `besucher` int(11) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `sichtbar` int(1) NOT NULL DEFAULT 1,
  `mid` int(11) NOT NULL,
  `tags` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_galerie_name`
--

INSERT INTO `morp_cms_galerie_name` (`gnid`, `gnname`, `ggid`, `img`, `date`, `textde`, `texten`, `gntextde`, `gntexten`, `besucher`, `sort`, `sichtbar`, `mid`, `tags`) VALUES
(1, 'SdK2019', 1, '336520_563556310323411_1749275100_o.jpg', '2019-03-06', 'Das ist eine kurze Beschreibung zur Galerie', '', 'SdK2019', '', 559, 1, 1, 2, ''),
(6, 'Beachsoccer', 1, '', '2019-03-20', '', '', 'Beachsoccer', '', 538, 4, 1, 2, ''),
(3, 'Spatz', 1, '', '2019-03-25', '', '', 'Spatz', '', 635, 3, 1, 2, ''),
(8, 'nam', 0, '', '0000-00-00', 'aaaz', '', '', '', 3, 0, 1, 0, ''),
(9, 'bbzyyopp_11vbbb', 0, '', '0000-00-00', 'bbz', '', '', '', 0, 0, 1, 0, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_image`
--

DROP TABLE IF EXISTS `morp_cms_image`;
CREATE TABLE `morp_cms_image` (
  `imgid` int(11) NOT NULL,
  `navid` int(11) NOT NULL DEFAULT 0,
  `pos` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `size` int(11) NOT NULL DEFAULT 0,
  `imgname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gid` int(11) NOT NULL DEFAULT 0,
  `edit` int(1) NOT NULL DEFAULT 1,
  `itext` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `longtext` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci PACK_KEYS=0;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_image`
--

INSERT INTO `morp_cms_image` (`imgid`, `navid`, `pos`, `type`, `size`, `imgname`, `gid`, `edit`, `itext`, `longtext`, `image`) VALUES
(1, 0, 0, 0, 49710, 'st02.png', 1, 1, '', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_img_group`
--

DROP TABLE IF EXISTS `morp_cms_img_group`;
CREATE TABLE `morp_cms_img_group` (
  `gid` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `art` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci PACK_KEYS=0;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_img_group`
--

INSERT INTO `morp_cms_img_group` (`gid`, `name`, `art`) VALUES
(1, 'Allgemein', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_meinungen`
--

DROP TABLE IF EXISTS `morp_cms_meinungen`;
CREATE TABLE `morp_cms_meinungen` (
  `tid` int(11) NOT NULL,
  `topicID` int(11) NOT NULL,
  `tTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tText` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `img1` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sichtbar` int(11) NOT NULL,
  `datumende` varchar(10) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `fon` varchar(255) NOT NULL,
  `mid` int(11) NOT NULL,
  `datum` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_meinungen`
--

INSERT INTO `morp_cms_meinungen` (`tid`, `topicID`, `tTitle`, `tText`, `img1`, `sichtbar`, `datumende`, `mail`, `fon`, `mid`, `datum`) VALUES
(1, 1, 'Dringend Meinung gesucht ', 'ew#üojf\r\nü', '', 0, '', 'post@pixel-dusche.de', '12345', 1, '2019-02-08'),
(3, 1, 'Mittagessen', 'et. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', '', 1, '', 'test@dusche.de', '126666345', 2, '2019-04-18'),
(4, 3, 'Unterstützung', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et', '', 1, '', 'id@pixel.de', '+49 88888 12345', 3, '2019-05-08'),
(5, 3, 'Mitarbeitertreffen', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', '', 1, '', 'post@pixel-dusche.de', '12345', 1, '2019-04-28'),
(6, 5, 'Das ist meine Meinung zur Gemeinschaft', 'Bin gespannt, ob die Zuordnung stimmt.', '', 1, '', '', '', 1, '2019-05-09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_meinungen_comments`
--

DROP TABLE IF EXISTS `morp_cms_meinungen_comments`;
CREATE TABLE `morp_cms_meinungen_comments` (
  `commentsID` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mid` int(11) NOT NULL,
  `dat` timestamp NOT NULL DEFAULT current_timestamp(),
  `parentID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_meinungen_comments`
--

INSERT INTO `morp_cms_meinungen_comments` (`commentsID`, `tid`, `comment`, `mid`, `dat`, `parentID`) VALUES
(1, 5, 'das ist meine Meinung', 2, '2019-04-18 06:42:24', 0),
(3, 5, 'Ich habe auch eine Meinung und etwas zu sagen und korrigiere noch ... ', 1, '2019-04-22 22:00:00', 0),
(4, 4, 'Ich mache mit !!!!', 1, '2019-05-08 22:00:00', 0),
(6, 4, 'Ich auch', 1, '2019-05-14 22:00:00', 0),
(7, 5, '4. sortierung?', 1, '2019-05-15 14:16:43', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_meinungen_likes`
--

DROP TABLE IF EXISTS `morp_cms_meinungen_likes`;
CREATE TABLE `morp_cms_meinungen_likes` (
  `likesID` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `tid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_meinungen_likes`
--

INSERT INTO `morp_cms_meinungen_likes` (`likesID`, `mid`, `tid`) VALUES
(1, 1, 3),
(4, 2, 5),
(5, 2, 4),
(6, 3, 5),
(7, 3, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_meinungen_topics`
--

DROP TABLE IF EXISTS `morp_cms_meinungen_topics`;
CREATE TABLE `morp_cms_meinungen_topics` (
  `topicID` int(11) NOT NULL,
  `topicTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `topicDesc` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `img1` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sichtbar` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_meinungen_topics`
--

INSERT INTO `morp_cms_meinungen_topics` (`topicID`, `topicTitle`, `topicDesc`, `img1`, `sichtbar`) VALUES
(1, 'Allgemein', 'ew#üojf\r\nü', '', 1),
(3, 'Oberrad', 'et. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', '', 1),
(4, 'Mitarbeiter', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et', '', 1),
(5, 'Gemeinschaft', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', '', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_nav`
--

DROP TABLE IF EXISTS `morp_cms_nav`;
CREATE TABLE `morp_cms_nav` (
  `navid` int(11) NOT NULL,
  `ebene` int(11) NOT NULL DEFAULT 0,
  `parent` int(11) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fbimage` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `anker` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `oldlnk` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `setlink` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `shortlink` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lnk` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sichtbar` int(1) NOT NULL DEFAULT 1,
  `edit` int(1) NOT NULL DEFAULT 1,
  `keyw` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lang` int(1) NOT NULL DEFAULT 1,
  `lock` int(1) NOT NULL DEFAULT 0,
  `bereich` int(1) NOT NULL DEFAULT 1,
  `button` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `bheight` int(1) NOT NULL,
  `emotional` int(11) NOT NULL,
  `design` int(11) NOT NULL,
  `nocontent` int(1) NOT NULL,
  `accesskey` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `langpar` int(11) NOT NULL,
  `blog` int(1) NOT NULL,
  `datum` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci PACK_KEYS=0;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_nav`
--

INSERT INTO `morp_cms_nav` (`navid`, `ebene`, `parent`, `sort`, `name`, `fbimage`, `anker`, `oldlnk`, `setlink`, `shortlink`, `title`, `lnk`, `sichtbar`, `edit`, `keyw`, `desc`, `lang`, `lock`, `bereich`, `button`, `bheight`, `emotional`, `design`, `nocontent`, `accesskey`, `langpar`, `blog`, `datum`, `author`) VALUES
(1, 1, 0, 1, 'Home', '', '', '', 'home', '', '', '', 0, 1, '', '', 1, 0, 1, '', 0, 0, 1, 0, '', 0, 0, '', ''),
(2, 1, 0, 2, 'news', '', '', '', 'neuigkeiten', '', '', '', 0, 1, '', '', 1, 1, 1, '', 0, 0, 1, 0, '', 0, 0, '', ''),
(4, 1, 0, 3, 'Start', '', '', '', 'kategorien', '', '', '', 0, 1, '', '', 1, 1, 1, '', 0, 0, 1, 0, '', 0, 0, '', ''),
(5, 1, 0, 4, 'Infos', '', '', '', 'infos', '', '', '', 1, 1, '', '', 1, 0, 2, '', 0, 0, 1, 0, '', 0, 0, '', ''),
(6, 1, 0, 5, 'Profile', '', '', '', 'profil', '', '', '', 1, 1, '', '', 1, 1, 2, '', 0, 0, 1, 0, '', 0, 0, '', ''),
(7, 2, 4, 1, 'new category', '', '', '', 'galerie-erstellen', '', '', '', 0, 1, '', '', 1, 1, 1, '', 0, 0, 1, 0, '', 0, 0, '', ''),
(8, 2, 4, 2, 'category edit', '', '', '', 'kategorien-edit', '', '', '', 0, 1, '', '', 1, 1, 1, '', 0, 0, 1, 0, '', 0, 0, '', ''),
(9, 2, 4, 3, 'my categories', '', '', '', 'meine-kategorien', '', '', '', 0, 1, '', '', 1, 1, 1, '', 0, 0, 1, 0, '', 0, 0, '', ''),
(10, 2, 4, 4, 'gallery Upload', '', '', '', 'galerie-upload', '', '', '', 0, 1, '', '', 1, 1, 1, '', 0, 0, 1, 0, '', 0, 0, '', ''),
(24, 2, 4, 5, 'gallery comments', '', '', '', 'gallery-comment', '', '', '', 0, 1, '', '', 1, 1, 1, '', 0, 0, 1, 0, '', 0, 0, '', ''),
(26, 1, 0, 9, 'Suche', '', '', '', 'suche', '', '', '', 0, 1, '', '', 1, 0, 2, '', 0, 0, 1, 0, '', 0, 0, '', ''),
(29, 1, 0, 10, 'HashTags', '', '', '', 'hashtags', '', '', '', 0, 1, '', '', 1, 1, 2, '', 0, 0, 1, 0, '', 0, 0, '', ''),
(36, 1, 0, 6, 'kategory', '', '', '', 'kategory', '', '', '', 1, 1, '', '', 1, 1, 2, '', 0, 0, 1, 0, '', 0, 0, '', ''),
(37, 1, 0, 7, 'Keywords', '', '', '', 'tag', '', '', '', 1, 1, '', '', 1, 1, 2, '', 0, 0, 1, 0, '', 0, 0, '', ''),
(38, 1, 0, 8, 'tagGroup', '', '', '', 'tag-group', '', '', '', 1, 1, '', '', 1, 1, 2, '', 0, 0, 1, 0, '', 0, 0, '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_news`
--

DROP TABLE IF EXISTS `morp_cms_news`;
CREATE TABLE `morp_cms_news` (
  `nid` int(11) NOT NULL,
  `ntitle` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `nmovie` varchar(255) CHARACTER SET utf8 NOT NULL,
  `ntext` text CHARACTER SET utf8 NOT NULL,
  `nvon` date NOT NULL DEFAULT '0000-00-00',
  `nbis` date NOT NULL DEFAULT '0000-00-00',
  `nerstellt` date NOT NULL DEFAULT '0000-00-00',
  `nuhr` varchar(100) CHARACTER SET utf8 NOT NULL,
  `ntag` varchar(50) CHARACTER SET utf8 NOT NULL,
  `nort` varchar(255) CHARACTER SET utf8 NOT NULL,
  `nlat` varchar(50) CHARACTER SET utf8 NOT NULL,
  `edit` int(1) NOT NULL DEFAULT 1,
  `aktuell` int(1) NOT NULL DEFAULT 1,
  `nabstr` text CHARACTER SET utf8 NOT NULL,
  `nautor` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `imgid` int(11) NOT NULL DEFAULT 0,
  `nlink` varchar(250) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `ngid` int(11) NOT NULL DEFAULT 1,
  `nsubtitle` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT 0,
  `style` int(1) NOT NULL DEFAULT 1,
  `img1` varchar(150) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `img2` varchar(150) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `img3` varchar(150) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `img4` varchar(150) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `hid` int(11) NOT NULL,
  `sichtbar` int(1) NOT NULL DEFAULT 1,
  `icon` varchar(50) CHARACTER SET utf8 NOT NULL,
  `nMetaTitle` varchar(100) CHARACTER SET utf8 NOT NULL,
  `nMetaDesc` varchar(255) CHARACTER SET utf8 NOT NULL,
  `tags` text COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_news`
--

INSERT INTO `morp_cms_news` (`nid`, `ntitle`, `nmovie`, `ntext`, `nvon`, `nbis`, `nerstellt`, `nuhr`, `ntag`, `nort`, `nlat`, `edit`, `aktuell`, `nabstr`, `nautor`, `imgid`, `nlink`, `ngid`, `nsubtitle`, `pid`, `style`, `img1`, `img2`, `img3`, `img4`, `hid`, `sichtbar`, `icon`, `nMetaTitle`, `nMetaDesc`, `tags`) VALUES
(1, 'Katharina wurde eingeweiht', '', 'Der katholische Stadtdekan Dr. Johannes zu Eltz und der evangelische Stadtdekan Dr. Achim Knecht haben am Mittwoch, 12. September, die Verwaltung des St. Katharinen- und Weißfrauenstiftes im Hof zum Rebstock in der neuen Frankfurter Altstadt eingeweiht. Vor rund 80 geladenen Gästen, darunter Stadtverordnetenvorsteher Stephan Siegler, sowie Mitarbeiterinnen und Mitarbeitern der Stiftung erinnerten die beiden Geistlichen an die Wurzeln der Stiftung, die aus dem mittelalterlichen Weißfrauenkloster und dem St. Katharinenkloster entstammt. Beide betonten, in einer weltlichen Stadt wie Frankfurt sei es etwas Besonderes, den Festtag und die künftige Arbeit einer säkularen Einrichtung unter Gottes Segen zu stellen. Achim Knecht zitierte den Bibelvers im Brief an die Galater, „Einer trage des Anderen Last…“, der die Motivation der Stiftung von den Anfängen im Mittelalter bis heute beschreibe: „Die Last der Altersarmut wird von der Stiftung mitgetragen.“ Knecht sagte, die Bezeichnung „Stiftsfrau“ für bedürftige Frauen, die die Stiftung in Frankfurt unterstützt, zeige „ein hohes Maß an Respekt und Achtung“. Der katholische Stadtdekan Dr. Johannes zu Eltz verließ das Rednerpult und spritzte Weihwasser in den Saal: „Ich segne die Menschen, die hier arbeiten und nicht das Gebäude. Wenn Sie Weihwasser trifft, ist das kein Versehen, sondern Absicht.“\r\n\r\n \r\n\r\n\r\n\r\n\r\nDie Vorsitzende des Stiftungsvorstandes Stadträtin Prof. Dr. Daniela Birkenfeld sagte in ihrer Festansprache, die Stiftung blicke auf eine „spannende bewegte Geschichte“ zurück. Trotz Bauernkriegen und Säkularisierung gelang es, die Stiftungen des Weißfrauenklosters (1228) und des St. Katharinenklosters (1353) zu erhalten und 1876 zu einer Stiftung zu verschmelzen. Die heutigen Jahresrenten an 1400 Stiftsfrauen gewährleisteten „ein lebenswertes Älterwerden auch in einer hochpreisigen Stadt“. Birkenfeld nannte auch den zweiten Stiftungszweck, der 1959 hinzukam: bezahlbaren, barrierefreien Wohnraum für Seniorinnen zu errichten. So sei gerade die 7. Wohnanlage in der Schwarzburgstraße im Nordend im Bau, einem beliebten Stadtteil, in dem es nicht leicht sei, eine bezahlbare Wohnung zu bekommen. Das Katharinen- und Weißfrauenstift schaffe zudem Möglichkeiten für Frauen, am Stadtleben teilzunehmen. Gutachten zeigten, dass häufig Frauen Stiftsfrauen würden, die den Krieg miterlebten, den Verlust des Ehepartners und häufig auch den Verlust der Heimat und der Familie zu verkraften hatten. Birkenfeld dankte den Mitarbeiterinnen und Mitarbeitern der Stiftung für ihr Engagement während der Bauzeit und während des Umzuges. Sie sicherte allen Stiftsangehörigen für die kommende Zeit Unterstützung zu: „Wir machen uns viele Gedanken, damit sie in dieser schnelllebigen hochpreisigen Stadt gut leben können.“\r\n\r\nStiftungsdirektorin Ursula Poletti betonte, für die Stiftung sei es ein Anliegen, „dass die neue Frankfurter Altstadt auch ein Ort für finanziell nicht so gut situierte Frankfurter Seniorinnen und Senioren wird“. So vermietete die Stiftung dem Frankfurter Verband Räume im Erdgeschoss des Hofes zum Rebstock, damit er dort ein Café betreiben kann, in dem Gäste mit Frankfurt-Pass Vergünstigungen bekommen.\r\n\r\nDer Hof zum Rebstock ist eng mit der Entstehungsgeschichte der Stiftung verbunden, sagte Historiker Björn Wissenbach in seinem Vortrag. Denn auf dem Grundstück lebte einst Katharina zum Rebstock, die ihrem Schwager Wicker Frosch einen Teil ihres Erbes vermachte, so dass dieser 1353 das St. Katharinenkloster stiften konnte, eine der beiden Wurzeln des St. Katharinen- und Weißfrauenstifts.\r\n\r\nFoto: Christoph Boeckheler ', '0000-00-00', '0000-00-00', '2018-09-12', '', '', '', '', 1, 1, 'Der katholische Stadtdekan Dr. Johannes zu Eltz und der evangelische Stadtdekan Dr. Achim Knecht haben am Mittwoch, 12. September, die Verwaltung des St. Katharinen- und ', '', 0, '', 1, '', 0, 1, 'skw_verwaltung_braubachstr.jpg', '', '', '', 0, 1, '', '', '', '#oberrad #garten #essen #blumen '),
(2, 'Open Water Champion Nathalie Pohl joins RESTUBE', '', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\r\n\r\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', '0000-00-00', '0000-00-00', '2019-02-04', '', '', '', '', 1, 1, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At ', '', 0, '', 1, 'Erfolgreicher Freiwasser-Auftakt in Israel', 0, 1, 'oslo_Østre_frikirke.jpg', '', '', '', 0, 1, '', '', '', '#essen #oberursel '),
(3, 'Spritzgießteile in Perfektion – we think plastics! ', '', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\r\n\r\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', '0000-00-00', '0000-00-00', '2019-03-04', '', '', '', '', 1, 1, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At ', '', 0, '', 1, 'Morpheus CMS, API (Schnittstelle) zu Immobilienscout 24', 7, 1, '7sins-catwalk.jpg', '8fbe13bd7590b317e46d5dc6f7ea9e18.jpg', 'breitling-avenger-hurricane-military.jpeg', '', 0, 1, '', '', '', '#wohnheim-aussen #tisch #essen #garten #raum #oberrad '),
(4, 'FEBRUAR', '', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', '0000-00-00', '0000-00-00', '2019-04-04', '', '', '', '', 1, 1, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At ', '', 0, '', 2, 'Veranstaltungen im Februar 2019', 0, 1, 'adobestock_117973711_preview.jpeg', '', '', '', 0, 1, '', '', '', '#garten #rolator #raum '),
(5, 'März', '', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\r\n\r\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', '0000-00-00', '0000-00-00', '2019-04-01', '', '', '', '', 1, 1, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At ', '', 0, '', 2, 'Veranstaltungen im März 2019', 0, 1, 'adobestock_144474943_preview.jpeg', '', '', '', 0, 1, '', '', '', '#raum #garten #essen '),
(6, 'Wir suchen', '', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', '0000-00-00', '0000-00-00', '2019-02-04', '', '', '', '', 1, 1, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At ', '', 0, '', 3, '', 0, 1, '5b8bbd3c64ba8_263_295.jpg', '', '', '', 0, 1, '', '', '', '#oberrad '),
(7, 'Dienstanweisung 21.05.2019', '', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\r\n\r\nAmet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', '0000-00-00', '0000-00-00', '2019-05-21', '', '', '', '', 1, 1, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At ', '', 0, '', 4, 'Verhalten in der Öffentlichkeit', 1, 1, '', '', '', '', 0, 1, '', '', '', '#dienstanweisung ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_news_confirmed`
--

DROP TABLE IF EXISTS `morp_cms_news_confirmed`;
CREATE TABLE `morp_cms_news_confirmed` (
  `cid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `nid` int(11) NOT NULL,
  `datum` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_news_confirmed`
--

INSERT INTO `morp_cms_news_confirmed` (`cid`, `mid`, `nid`, `datum`) VALUES
(2, 1, 7, '2019-05-22 09:36:44'),
(4, 2, 7, '2019-05-22 11:28:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_news_group`
--

DROP TABLE IF EXISTS `morp_cms_news_group`;
CREATE TABLE `morp_cms_news_group` (
  `ngid` int(11) NOT NULL,
  `ngname` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `edit` int(1) NOT NULL DEFAULT 1,
  `format` int(1) NOT NULL DEFAULT 1,
  `nlang` int(1) NOT NULL DEFAULT 1,
  `targetID` int(11) NOT NULL,
  `confirm` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_news_group`
--

INSERT INTO `morp_cms_news_group` (`ngid`, `ngname`, `edit`, `format`, `nlang`, `targetID`, `confirm`) VALUES
(1, 'Allgemein Stift', 1, 1, 1, 16, 0),
(2, 'Veranstaltungen', 1, 1, 1, 17, 0),
(3, 'Wohnanlage Oberrad', 1, 1, 1, 18, 0),
(4, 'Dienstanweisungen', 1, 1, 1, 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_pdf`
--

DROP TABLE IF EXISTS `morp_cms_pdf`;
CREATE TABLE `morp_cms_pdf` (
  `pid` int(11) NOT NULL,
  `pdesc` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plong` text COLLATE utf8_unicode_ci NOT NULL,
  `pname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `psize` int(11) NOT NULL DEFAULT 0,
  `pdate` date NOT NULL DEFAULT '0000-00-00',
  `pgid` int(11) NOT NULL DEFAULT 1,
  `edit` int(1) NOT NULL DEFAULT 0,
  `pimage` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `pstart` date NOT NULL,
  `pend` date NOT NULL,
  `locked` int(11) NOT NULL,
  `counter` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_pdf`
--

INSERT INTO `morp_cms_pdf` (`pid`, `pdesc`, `plong`, `pname`, `psize`, `pdate`, `pgid`, `edit`, `pimage`, `pstart`, `pend`, `locked`, `counter`) VALUES
(1, 'Vertrag zur Auftragsverarbeitung', 'Das ist ein Update vom xx.xx.xxxxx', 'Vertrag_Auftragsverarbeitung_FG.pdf', 2169860, '2019-04-03', 1, 0, '', '0000-00-00', '0000-00-00', 0, 1),
(2, '', '', 'Vertrag_zur_Auftragsverarbeitung_DS-GVO - FG.docx', 69621, '2019-04-03', 1, 0, '', '0000-00-00', '0000-00-00', 0, 1),
(3, '', '', 'streif-hahnenkamm-abfahrt-kitzbuehel.png', 106661, '2019-04-03', 2, 0, '', '0000-00-00', '0000-00-00', 0, 0),
(4, '', '', 'wappenvorlage_eps.eps', 501390, '2019-04-03', 2, 0, '', '0000-00-00', '0000-00-00', 0, 0),
(5, '', '', 'Screenshot Produkt 1.png', 2241385, '2019-04-03', 2, 0, '', '0000-00-00', '0000-00-00', 0, 0),
(6, '', '', 'Pressemitteilung 1.docx', 22854, '2019-04-03', 3, 0, '', '0000-00-00', '0000-00-00', 0, 0),
(7, '', '', 'Pressemitteilung 1.pdf', 14258, '2019-04-03', 3, 0, '', '0000-00-00', '0000-00-00', 0, 0),
(8, '', '', 'header_digitale-transformation-7.jpg', 161357, '2019-04-03', 2, 0, '', '0000-00-00', '0000-00-00', 0, 0),
(9, '', '', 'schlossgut DB3655732.sql.zip', 48027, '2019-04-03', 2, 0, '', '0000-00-00', '0000-00-00', 0, 0),
(10, '', '', 'IMG_4972.jpg', 75683, '2019-04-03', 2, 0, '', '0000-00-00', '0000-00-00', 0, 0),
(11, '', '', 'QR-Readiness-01.png', 16614, '2019-04-03', 2, 0, '', '0000-00-00', '0000-00-00', 0, 0),
(12, '', '', 'test xls 02.xls', 25088, '2019-04-03', 2, 0, '', '0000-00-00', '0000-00-00', 0, 0),
(13, '', '', 'test xls.xlsx', 30222, '2019-04-03', 2, 0, '', '0000-00-00', '0000-00-00', 0, 0),
(14, '', '', '7S-front-fashion-figure-template.ai', 236442, '2019-04-03', 2, 0, '', '0000-00-00', '0000-00-00', 0, 0),
(15, '', '', 'klein 7 sins.ai', 1836934, '2019-04-03', 2, 0, '', '0000-00-00', '0000-00-00', 0, 0),
(16, '', '', '7sins_logo_finish_04_02_2015_negativ.eps', 1778742, '2019-04-03', 2, 0, '', '0000-00-00', '0000-00-00', 0, 0),
(17, 'Das ist die kurze Beschreibung', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo', 'fashions-flash.jpeg', 11604, '2019-04-03', 1, 1, '', '0000-00-00', '0000-00-00', 0, 2),
(18, '', '', 'Hintergrund_Orange.jpg', 275740, '2019-04-03', 1, 1, '', '0000-00-00', '0000-00-00', 0, 2),
(19, '', '', 'fotolia_129584185 Kopie.jpg', 13614, '2019-04-03', 1, 0, '', '0000-00-00', '0000-00-00', 0, 0),
(20, '', '', 'church-in-kalavrita-1231609.jpg', 184958, '2019-04-03', 1, 0, '', '0000-00-00', '0000-00-00', 0, 1),
(21, '', '', 'Oslo_Østre_frikirke.JPG', 208331, '2019-04-03', 1, 0, '', '0000-00-00', '0000-00-00', 0, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_pdf_count`
--

DROP TABLE IF EXISTS `morp_cms_pdf_count`;
CREATE TABLE `morp_cms_pdf_count` (
  `countID` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `datum` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_pdf_count`
--

INSERT INTO `morp_cms_pdf_count` (`countID`, `pid`, `mid`, `datum`) VALUES
(5, 17, 1, '2019-04-17 10:54:34'),
(4, 0, 1, '2019-04-17 10:54:01'),
(3, 2, 1, '2019-04-17 08:21:34'),
(6, 1, 1, '2019-05-22 08:20:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_pdf_group`
--

DROP TABLE IF EXISTS `morp_cms_pdf_group`;
CREATE TABLE `morp_cms_pdf_group` (
  `pgid` int(11) NOT NULL,
  `pgname` varchar(255) NOT NULL,
  `parent` int(11) NOT NULL,
  `pgart` int(1) NOT NULL,
  `pghl` varchar(255) NOT NULL,
  `img1` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_pdf_group`
--

INSERT INTO `morp_cms_pdf_group` (`pgid`, `pgname`, `parent`, `pgart`, `pghl`, `img1`) VALUES
(1, 'allgemein', 0, 1, 'Dokumente Allgemein', ''),
(2, 'dokumente-zeiterfassung', 0, 1, 'Zeiterfassung', ''),
(3, 'pressemitteilungen', 0, 1, 'Pressemitteilungen', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_pdf_group__`
--

DROP TABLE IF EXISTS `morp_cms_pdf_group__`;
CREATE TABLE `morp_cms_pdf_group__` (
  `pgid` int(11) NOT NULL,
  `pgname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` int(11) NOT NULL,
  `pgart` int(1) NOT NULL DEFAULT 1,
  `pghl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img1` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_pdf_group__`
--

INSERT INTO `morp_cms_pdf_group__` (`pgid`, `pgname`, `parent`, `pgart`, `pghl`, `img1`) VALUES
(1, 'allgemein', 0, 1, 'Dokumente Allgemein', ''),
(0, 'zeiterfassung', 0, 1, 'Zeiterfassung', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_pfad`
--

DROP TABLE IF EXISTS `morp_cms_pfad`;
CREATE TABLE `morp_cms_pfad` (
  `id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `navid` int(11) NOT NULL DEFAULT 0,
  `parent` int(11) NOT NULL DEFAULT 0,
  `page` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `wg` int(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_pfad`
--

INSERT INTO `morp_cms_pfad` (`id`, `url`, `navid`, `parent`, `page`, `wg`) VALUES
(1, 'neuigkeiten-uu/', 2, 0, '', 0),
(2, 'neuigkeiten/', 2, 0, '', 0),
(3, 'profil/', 6, 0, '', 0),
(4, 'galerien/galerie-erstellen/', 7, 4, '', 0),
(5, 'galerien/galerie-edit/', 8, 4, '', 0),
(6, 'galerien/meine-galerien/', 9, 4, '', 0),
(7, 'galerien/galerie-upload/', 10, 4, '', 0),
(8, 'galerien/', 4, 0, '', 0),
(9, 'termine/monatsansicht/', 15, 3, '', 0),
(10, 'termine/', 3, 0, '', 0),
(11, 'termine/wochenansicht/', 13, 3, '', 0),
(12, 'termine/listenansicht/', 14, 3, '', 0),
(13, 'schwarzes-brett/angebot-aufgeben/', 19, 11, '', 0),
(14, 'schwarzes-brett/mein-angebote/', 20, 11, '', 0),
(15, 'schwarzes-brett/angebot-bearbeiten/', 21, 11, '', 0),
(16, 'schwarzes-brett/', 11, 0, '', 0),
(17, 'downloads/', 12, 0, '', 0),
(18, 'galerien/gallery-comment/', 24, 4, '', 0),
(19, 'termine/teilnehmen/', 27, 3, '', 0),
(20, 'termine/gaesteliste/', 27, 3, '', 0),
(21, 'termine/meine-veranstaltungen/', 28, 3, '', 0),
(22, 'plauderstube/', 23, 0, '', 0),
(23, 'ttt-meinungen/', 31, 0, '', 0),
(24, 'meinungen/', 31, 0, '', 0),
(25, 'meinungen/meinungen-comment/', 33, 31, '', 0),
(26, 'meinungen/meine-meinungen/', 32, 31, '', 0),
(27, 'home/', 1, 0, '', 0),
(28, 'kategorien/', 4, 0, '', 0),
(29, 'kategorien/kategorien-edit/', 8, 4, '', 0),
(30, 'kategorien/meine-kategorien/', 9, 4, '', 0),
(31, 'kategorien/galerie-upload/', 10, 4, '', 0),
(32, 'kategorien/gallery-comment/', 24, 4, '', 0),
(33, 'kategorien/galerie-erstellen/', 7, 4, '', 0),
(34, 'tag-groupz/', 38, 0, '', 0),
(35, 'tag-group/', 38, 0, '', 0),
(36, 'tagz-group/', 36, 0, '', 0),
(37, 'kategory-group/', 36, 0, '', 0),
(38, 'tag-group-zzz/', 38, 0, '', 0),
(39, 'tag/', 38, 0, '', 0),
(40, 'kategory/', 36, 0, '', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_protokoll`
--

DROP TABLE IF EXISTS `morp_cms_protokoll`;
CREATE TABLE `morp_cms_protokoll` (
  `prid` int(11) NOT NULL,
  `id` int(11) NOT NULL DEFAULT 0,
  `db` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uid` int(11) NOT NULL DEFAULT 0,
  `datum` date NOT NULL DEFAULT '0000-00-00',
  `art` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_telegram`
--

DROP TABLE IF EXISTS `morp_cms_telegram`;
CREATE TABLE `morp_cms_telegram` (
  `tid` int(11) NOT NULL,
  `tTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tText` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `img1` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sichtbar` int(11) NOT NULL,
  `datumende` varchar(10) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `fon` varchar(255) NOT NULL,
  `mid` int(11) NOT NULL,
  `datum` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_telegram`
--

INSERT INTO `morp_cms_telegram` (`tid`, `tTitle`, `tText`, `img1`, `sichtbar`, `datumende`, `mail`, `fon`, `mid`, `datum`) VALUES
(1, 'Dringend gesucht ', 'ew#üojf\r\nü', '', 0, '', 'post@pixel-dusche.de', '12345', 1, '2019-04-08'),
(3, 'Gesucht ', 'et. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', '', 1, '', 'test@dusche.de', '126666345', 2, '2019-04-08'),
(4, 'Dringend ', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et', '', 1, '', 'id@pixel.de', '+49 88888 12345', 3, '2019-04-08'),
(5, 'Dringend gesucht und bald gefunden', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', '', 1, '', 'post@pixel-dusche.de', '12345', 1, '2019-04-08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_telegram_comments`
--

DROP TABLE IF EXISTS `morp_cms_telegram_comments`;
CREATE TABLE `morp_cms_telegram_comments` (
  `commentsID` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mid` int(11) NOT NULL,
  `dat` timestamp NOT NULL DEFAULT current_timestamp(),
  `parentID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_telegram_comments`
--

INSERT INTO `morp_cms_telegram_comments` (`commentsID`, `tid`, `comment`, `mid`, `dat`, `parentID`) VALUES
(1, 5, 'das ist ein Kommentar', 2, '2019-04-18 06:42:24', 0),
(3, 5, 'Ich habe auch etwas zu sagen und korrigiere noch ... hier', 1, '2019-04-22 22:00:00', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_cms_user`
--

DROP TABLE IF EXISTS `morp_cms_user`;
CREATE TABLE `morp_cms_user` (
  `uid` int(11) NOT NULL,
  `uname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pw` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `berechtigung` int(11) DEFAULT NULL,
  `admin` int(1) NOT NULL DEFAULT 0,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `auths` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `morp_cms_user`
--

INSERT INTO `morp_cms_user` (`uid`, `uname`, `pw`, `berechtigung`, `admin`, `email`, `title`, `lastname`, `firstname`, `auths`) VALUES
(1, 'morpheus', 'db04cce4e9bafc1aaabbb7ceb7b5a2c5', 2, 1, 'post@pixel-dusche.de', 'Herr', 'Knetter', 'Björn', '20|30|40|50|60'),
(2, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, '', '', '', '', ''),
(3, 'Text', 'e10adc3949ba59abbe56e057f20f883e', 2, 0, '', '', '', '', '10'),
(4, 'News', 'e10adc3949ba59abbe56e057f20f883e', 2, 0, '', '', '', '', '14'),
(5, 'Doks', 'e10adc3949ba59abbe56e057f20f883e', 2, 0, '', '', '', '', '30'),
(6, 'k5', 'f04c695938211b49cdacf3e9a39b2ba1', 2, 1, '', '', '', '', ''),
(7, 'kstift', '687f1664f7d2f3ff7c2d96f75d7991d6', 2, 1, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_color`
--

DROP TABLE IF EXISTS `morp_color`;
CREATE TABLE `morp_color` (
  `colid` int(11) NOT NULL,
  `color` varchar(7) NOT NULL,
  `colname` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `morp_color`
--

INSERT INTO `morp_color` (`colid`, `color`, `colname`) VALUES
(1, 'ababab', 'bg-mittelgrau'),
(2, '444', 'bg-dark'),
(3, 'eee', 'bg-grau'),
(4, '444', 'b1'),
(5, '666', 'b2'),
(6, 'ccc', 'g1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_download`
--

DROP TABLE IF EXISTS `morp_download`;
CREATE TABLE `morp_download` (
  `id` int(11) NOT NULL,
  `benutzer` int(11) DEFAULT NULL,
  `pid` int(11) NOT NULL,
  `datei` char(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `onceagain` tinyint(4) NOT NULL DEFAULT 0,
  `angelegt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `aktiv` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci PACK_KEYS=1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_einladung_liste`
--

DROP TABLE IF EXISTS `morp_einladung_liste`;
CREATE TABLE `morp_einladung_liste` (
  `eid` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `confirmed` int(11) NOT NULL,
  `anzahlPersonen` int(11) NOT NULL,
  `kommentar` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_events`
--

DROP TABLE IF EXISTS `morp_events`;
CREATE TABLE `morp_events` (
  `eventid` int(11) NOT NULL,
  `eventName` varchar(255) NOT NULL,
  `eventOrt` varchar(255) NOT NULL,
  `eventDatum` varchar(10) NOT NULL,
  `eventStartZeit` varchar(5) NOT NULL,
  `eventText` text NOT NULL,
  `eventAnzahlTeilnehmer` int(11) NOT NULL,
  `eventBegleitung` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `morp_events`
--

INSERT INTO `morp_events` (`eventid`, `eventName`, `eventOrt`, `eventDatum`, `eventStartZeit`, `eventText`, `eventAnzahlTeilnehmer`, `eventBegleitung`) VALUES
(1, 'Oster Essen für Freunde', 'Frankfurt am Main', '2019-04-20', '17:45', '', 50, 0),
(2, 'Sommerfest', 'Am Main an der Mühle', '2019-08-31', '11:30', '', 200, 2),
(3, 'Oster Essen', 'Innenstadt / Raum 101', '2019-07-06', '19:00', 'Oster Essen für Alle', 100, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_event_zusage`
--

DROP TABLE IF EXISTS `morp_event_zusage`;
CREATE TABLE `morp_event_zusage` (
  `zusageid` int(11) NOT NULL,
  `eventid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `datumZusage` varchar(10) NOT NULL,
  `anzahlBegleitung` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `morp_event_zusage`
--

INSERT INTO `morp_event_zusage` (`zusageid`, `eventid`, `mid`, `datumZusage`, `anzahlBegleitung`) VALUES
(5, 1, 2, '2019-04-24', 0),
(3, 2, 1, '2019-04-11', 1),
(7, 3, 1, '2019-05-21', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_fa`
--

DROP TABLE IF EXISTS `morp_fa`;
CREATE TABLE `morp_fa` (
  `faid` int(11) NOT NULL,
  `fa` varchar(30) NOT NULL,
  `beschreibung` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `morp_fa`
--

INSERT INTO `morp_fa` (`faid`, `fa`, `beschreibung`) VALUES
(1, 'fa-clock-o', '_ Uhr'),
(2, 'fa-star', '_ stern'),
(3, 'fa-cutlery', 'messer gabel'),
(4, 'fa-camera', '_ camera'),
(5, 'fa-camera-retro', '_ camera-retro'),
(6, 'fa-desktop', 'bildschirm'),
(7, 'fa-adjust', 'adjust'),
(8, 'fa-anchor', 'anchor'),
(9, 'fa-archive', 'archive'),
(10, 'fa-area-chart', 'area-chart'),
(11, 'fa-arrows', 'arrows'),
(12, 'fa-arrows-h', 'arrows-h'),
(13, 'fa-arrows-v', 'arrows-v'),
(14, 'fa-asterisk', 'asterisk'),
(15, 'fa-at', 'at'),
(16, 'fa-automobile', 'automobile'),
(17, 'fa-ban', 'ban'),
(18, 'fa-bank', 'bank'),
(19, 'fa-bar-chart', 'bar-chart'),
(20, 'fa-bar-chart-o', 'bar-chart-o'),
(21, 'fa-barcode', 'barcode'),
(22, 'fa-bars', 'bars'),
(23, 'fa-bed', 'bed'),
(24, 'fa-beer', 'beer'),
(25, 'fa-bell', 'bell'),
(26, 'fa-bell-o', 'bell-o'),
(27, 'fa-bell-slash', 'bell-slash'),
(28, 'fa-bell-slash-o', 'bell-slash-o'),
(29, 'fa-bicycle', 'bicycle'),
(30, 'fa-binoculars', 'binoculars'),
(31, 'fa-birthday-cake', 'birthday-cake'),
(32, 'fa-bolt', 'bolt'),
(33, 'fa-bomb', 'bomb'),
(34, 'fa-book', 'book'),
(35, 'fa-bookmark', 'bookmark'),
(36, 'fa-bookmark-o', 'bookmark-o'),
(37, 'fa-briefcase', 'briefcase'),
(38, 'fa-bug', 'bug'),
(39, 'fa-building', 'building'),
(40, 'fa-building-o', 'building-o'),
(41, 'fa-bullhorn', 'bullhorn'),
(42, 'fa-bullseye', 'bullseye'),
(43, 'fa-bus', 'bus'),
(44, 'fa-cab', 'cab'),
(45, 'fa-calculator', 'calculator'),
(46, 'fa-calendar', 'calendar'),
(47, 'fa-calendar-o', 'calendar-o'),
(48, 'fa-camera', 'camera'),
(49, 'fa-camera-retro', 'camera-retro'),
(50, 'fa-car', 'car'),
(54, 'fa-caret-square-o-up', 'caret-square-o-up'),
(55, 'fa-cart-arrow-down', 'cart-arrow-down'),
(56, 'fa-cart-plus', 'cart-plus'),
(57, 'fa-cc', 'cc'),
(58, 'fa-certificate', 'certificate'),
(59, 'fa-check', 'check'),
(60, 'fa-check-circle', 'check-circle'),
(61, 'fa-check-circle-o', 'check-circle-o'),
(62, 'fa-check-square', 'check-square'),
(63, 'fa-check-square-o', 'check'),
(64, 'fa-child', 'child'),
(65, 'fa-circle', 'circle'),
(66, 'fa-circle-o', 'circle-o'),
(67, 'fa-circle-o-notch', 'circle-o-notch'),
(68, 'fa-circle-thin', 'circle-thin'),
(69, 'fa-clock-o', 'clock-o'),
(70, 'fa-close', 'close'),
(71, 'fa-cloud', 'cloud'),
(72, 'fa-cloud-download', 'cloud-download'),
(73, 'fa-cloud-upload', 'cloud-upload'),
(74, 'fa-code', 'code'),
(75, 'fa-code-fork', 'code-fork'),
(76, 'fa-coffee', 'coffee'),
(77, 'fa-cog', 'cog'),
(78, 'fa-cogs', 'cogs'),
(79, 'fa-comment', 'sprechblase'),
(80, 'fa-comment-o', 'comment-o'),
(81, 'fa-comments', 'comments'),
(82, 'fa-comments-o', 'comments-o'),
(83, 'fa-compass', 'compass'),
(84, 'fa-copyright', 'copyright'),
(85, 'fa-credit-card', 'credit-card'),
(86, 'fa-crop', 'crop'),
(87, 'fa-crosshairs', 'crosshairs'),
(88, 'fa-cube', 'cube'),
(89, 'fa-cubes', 'cubes'),
(90, 'fa-cutlery', 'cutlery'),
(91, 'fa-dashboard', 'dashboard'),
(92, 'fa-database', 'database'),
(93, 'fa-desktop', 'desktop'),
(94, 'fa-diamond', 'diamond'),
(95, 'fa-dot-circle-o', 'dot-circle-o'),
(96, 'fa-download', 'download'),
(97, 'fa-edit', 'edit'),
(98, 'fa-ellipsis-h', 'ellipsis-h'),
(99, 'fa-ellipsis-v', 'ellipsis-v'),
(100, 'fa-envelope', 'envelope'),
(101, 'fa-envelope-o', 'envelope-o'),
(102, 'fa-envelope-square', 'envelope-square'),
(103, 'fa-eraser', 'eraser'),
(104, 'fa-exchange', 'exchange'),
(105, 'fa-exclamation', 'exclamation'),
(339, 'fa-twitter', 'twitter'),
(108, 'fa-external-link', 'external-link'),
(110, 'fa-eye', 'Eye'),
(111, 'fa-eye-slash', 'eye-slash'),
(112, 'fa-eyedropper', 'eyedropper'),
(113, 'fa-fax', 'fax'),
(114, 'fa-female', 'female'),
(115, 'fa-fighter-jet', 'fighter-jet'),
(116, 'fa-file-archive-o', 'file-archive-o'),
(117, 'fa-file-audio-o', 'file-audio-o'),
(118, 'fa-file-code-o', 'file-code-o'),
(119, 'fa-file-excel-o', 'file-excel-o'),
(120, 'fa-file-image-o', 'file-image-o'),
(121, 'fa-file-movie-o', 'file-movie-o'),
(122, 'fa-file-pdf-o', 'file-pdf-o'),
(123, 'fa-file-photo-o', 'file-photo-o'),
(124, 'fa-file-picture-o', 'file-picture-o'),
(125, 'fa-file-powerpoint-o', 'file-powerpoint-o'),
(126, 'fa-file-sound-o', 'file-sound-o'),
(127, 'fa-file-video-o', 'file-video-o'),
(128, 'fa-file-word-o', 'file-word-o'),
(129, 'fa-file-zip-o', 'file-zip-o'),
(130, 'fa-film', 'film'),
(131, 'fa-filter', 'filter'),
(132, 'fa-fire', 'fire'),
(133, 'fa-fire-extinguisher', 'fire-extinguisher'),
(134, 'fa-flag', 'flag'),
(135, 'fa-flag-checkered', 'flag-checkered'),
(136, 'fa-flag-o', 'flag-o'),
(137, 'fa-flash', 'flash'),
(138, 'fa-flask', 'flask'),
(139, 'fa-folder', 'folder'),
(140, 'fa-folder-o', 'folder-o'),
(141, 'fa-folder-open', 'folder-open'),
(142, 'fa-folder-open-o', 'folder-open-o'),
(143, 'fa-frown-o', 'frown-o'),
(144, 'fa-futbol-o', 'futbol-o'),
(145, 'fa-gamepad', 'gamepad'),
(146, 'fa-gavel', 'gavel'),
(147, 'fa-gear', 'gear'),
(148, 'fa-gears', 'gears'),
(149, 'fa-genderless', 'genderless'),
(150, 'fa-gift', 'gift'),
(151, 'fa-glass', 'glass'),
(152, 'fa-globe', 'globe'),
(153, 'fa-graduation-cap', 'graduation-cap'),
(154, 'fa-group', 'group'),
(155, 'fa-hdd-o', 'hdd-o'),
(156, 'fa-headphones', 'headphones'),
(157, 'fa-heart', 'heart'),
(158, 'fa-heart-o', 'heart-o'),
(159, 'fa-heartbeat', 'heartbeat'),
(160, 'fa-history', 'history'),
(161, 'fa-home', 'home'),
(162, 'fa-hotel', 'hotel'),
(163, 'fa-image', 'image'),
(164, 'fa-inbox', 'inbox'),
(165, 'fa-info', 'info'),
(166, 'fa-info-circle', 'info-circle'),
(167, 'fa-institution', 'institution'),
(168, 'fa-key', 'key'),
(169, 'fa-keyboard-o', 'keyboard-o'),
(170, 'fa-language', 'language'),
(171, 'fa-laptop', 'laptop'),
(172, 'fa-leaf', 'Blatt'),
(173, 'fa-legal', 'legal'),
(174, 'fa-lemon-o', 'lemon-o'),
(175, 'fa-level-down', 'level-down'),
(176, 'fa-level-up', 'level-up'),
(177, 'fa-life-bouy', 'life-bouy'),
(178, 'fa-life-buoy', 'life-buoy'),
(179, 'fa-life-ring', 'life-ring'),
(180, 'fa-life-saver', 'life-saver'),
(181, 'fa-lightbulb-o', 'lightbulb-o'),
(182, 'fa-line-chart', 'line-chart'),
(183, 'fa-location-arrow', 'location-arrow'),
(184, 'fa-lock', 'lock'),
(185, 'fa-magic', 'magic'),
(186, 'fa-magnet', 'magnet'),
(187, 'fa-mail-forward', 'mail-forward'),
(188, 'fa-mail-reply', 'mail-reply'),
(189, 'fa-mail-reply-all', 'mail-reply-all'),
(190, 'fa-male', 'male'),
(191, 'fa-map-marker', 'map-marker'),
(192, 'fa-meh-o', 'meh-o'),
(193, 'fa-microphone', 'microphone'),
(194, 'fa-microphone-slash', 'microphone-slash'),
(195, 'fa-minus', 'minus'),
(196, 'fa-minus-circle', 'minus-circle'),
(197, 'fa-minus-square', 'minus-square'),
(198, 'fa-minus-square-o', 'minus-square-o'),
(199, 'fa-mobile', 'mobile'),
(200, 'fa-mobile-phone', 'mobile-phone'),
(201, 'fa-money', 'money'),
(202, 'fa-moon-o', 'moon-o'),
(203, 'fa-mortar-board', 'mortar-board'),
(204, 'fa-motorcycle', 'motorcycle'),
(205, 'fa-music', 'music'),
(206, 'fa-navicon', 'navicon'),
(207, 'fa-newspaper-o', 'newspaper-o'),
(208, 'fa-paint-brush', 'paint-brush'),
(209, 'fa-paper-plane', 'paper-plane'),
(210, 'fa-paper-plane-o', 'felix paper-plane-o'),
(211, 'fa-paw', 'paw'),
(212, 'fa-pencil', 'pencil'),
(213, 'fa-pencil-square', 'pencil-square'),
(214, 'fa-pencil-square-o', 'pencil-square-o'),
(215, 'fa-phone', 'phone'),
(216, 'fa-phone-square', 'phone-square'),
(217, 'fa-photo', 'photo'),
(218, 'fa-picture-o', 'picture-o'),
(219, 'fa-pie-chart', 'pie-chart'),
(220, 'fa-plane', 'plane'),
(221, 'fa-plug', 'plug'),
(222, 'fa-plus', 'plus'),
(223, 'fa-plus-circle', 'plus-circle'),
(224, 'fa-plus-square', 'plus-square'),
(225, 'fa-plus-square-o', 'plus-square-o'),
(226, 'fa-power-off', 'power-off'),
(227, 'fa-print', 'print'),
(228, 'fa-puzzle-piece', 'puzzle-piece'),
(229, 'fa-qrcode', 'qrcode'),
(230, 'fa-question', 'question'),
(231, 'fa-question-circle', 'question-circle'),
(232, 'fa-quote-left', 'quote-left'),
(233, 'fa-quote-right', 'quote-right'),
(234, 'fa-random', 'random'),
(235, 'fa-recycle', 'recycle'),
(236, 'fa-refresh', 'refresh'),
(237, 'fa-remove', 'remove'),
(238, 'fa-reorder', 'reorder'),
(239, 'fa-reply', 'reply'),
(240, 'fa-reply-all', 'reply-all'),
(241, 'fa-retweet', 'retweet'),
(242, 'fa-road', 'road'),
(243, 'fa-rocket', 'rocket'),
(244, 'fa-rss', 'rss'),
(245, 'fa-rss-square', 'rss-square'),
(246, 'fa-search', 'search'),
(247, 'fa-search-minus', 'search-minus'),
(248, 'fa-search-plus', 'search-plus'),
(249, 'fa-send', 'send'),
(250, 'fa-send-o', 'send-o'),
(251, 'fa-server', 'server'),
(252, 'fa-share', 'share'),
(253, 'fa-share-alt', 'share-alt'),
(254, 'fa-share-alt-square', 'share-alt-square'),
(255, 'fa-share-square', 'share-square'),
(256, 'fa-share-square-o', 'share-square-o'),
(257, 'fa-shield', 'shield'),
(258, 'fa-ship', 'ship'),
(259, 'fa-shopping-cart', 'shopping-cart'),
(260, 'fa-sign-in', 'sign-in'),
(261, 'fa-sign-out', 'sign-out'),
(262, 'fa-signal', 'signal'),
(263, 'fa-sitemap', 'sitemap'),
(264, 'fa-sliders', 'sliders'),
(265, 'fa-smile-o', 'smile-o'),
(266, 'fa-soccer-ball-o', 'soccer-ball-o'),
(267, 'fa-sort', 'sort'),
(268, 'fa-sort-alpha-asc', 'sort-alpha-asc'),
(269, 'fa-sort-alpha-desc', 'sort-alpha-desc'),
(270, 'fa-sort-amount-asc', 'sort-amount-asc'),
(271, 'fa-sort-amount-desc', 'sort-amount-desc'),
(272, 'fa-sort-asc', 'sort-asc'),
(273, 'fa-sort-desc', 'sort-desc'),
(274, 'fa-sort-down', 'sort-down'),
(275, 'fa-sort-numeric-asc', 'sort-numeric-asc'),
(276, 'fa-sort-numeric-desc', 'sort-numeric-desc'),
(277, 'fa-sort-up', 'sort-up'),
(278, 'fa-space-shuttle', 'space-shuttle'),
(279, 'fa-spinner', 'spinner'),
(280, 'fa-spoon', 'spoon'),
(281, 'fa-square', 'square'),
(282, 'fa-square-o', 'square-o'),
(283, 'fa-star', 'stern'),
(284, 'fa-star-half', 'star-half'),
(285, 'fa-star-half-empty', 'star-half-empty'),
(286, 'fa-star-half-full', 'star-half-full'),
(287, 'fa-star-half-o', 'star-half-o'),
(288, 'fa-star-o', 'star-o'),
(289, 'fa-street-view', 'street-view'),
(290, 'fa-suitcase', 'suitcase'),
(291, 'fa-support', 'support'),
(292, 'fa-tachometer', 'tachometer'),
(293, 'fa-tag', 'tag'),
(294, 'fa-tags', 'tags'),
(295, 'fa-tasks', 'tasks'),
(296, 'fa-taxi', 'taxi'),
(297, 'fa-terminal', 'terminal'),
(298, 'fa-thumb-tack', 'thumb-tack'),
(299, 'fa-thumbs-down', 'thumbs-down'),
(300, 'fa-thumbs-o-down', 'thumbs-o-down'),
(301, 'fa-thumbs-o-up', 'thumbs-o-up'),
(302, 'fa-thumbs-up', 'Finger up'),
(303, 'fa-ticket', 'ticket'),
(304, 'fa-times', 'times'),
(305, 'fa-times-circle', 'times-circle'),
(306, 'fa-times-circle-o', 'times-circle-o'),
(307, 'fa-tint', 'tint'),
(308, 'fa-toggle-down', 'toggle-down'),
(309, 'fa-toggle-left', 'toggle-left'),
(310, 'fa-toggle-off', 'toggle-off'),
(311, 'fa-toggle-on', 'toggle-on'),
(312, 'fa-toggle-right', 'toggle-right'),
(313, 'fa-toggle-up', 'toggle-up'),
(314, 'fa-trash', 'trash'),
(315, 'fa-trash-o', 'trash-o'),
(316, 'fa-tree', 'tree'),
(317, 'fa-trophy', 'trophy'),
(318, 'fa-truck', 'truck'),
(319, 'fa-tty', 'tty'),
(320, 'fa-umbrella', 'umbrella'),
(321, 'fa-university', 'university'),
(322, 'fa-unlock', 'unlock'),
(323, 'fa-unlock-alt', 'unlock-alt'),
(324, 'fa-unsorted', 'unsorted'),
(325, 'fa-upload', 'upload'),
(326, 'fa-user', 'user'),
(327, 'fa-user-plus', 'user-plus'),
(328, 'fa-user-secret', 'user-secret'),
(329, 'fa-user-times', 'user-times'),
(330, 'fa-users', 'User'),
(331, 'fa-video-camera', 'video-camera'),
(332, 'fa-volume-down', 'volume-down'),
(333, 'fa-volume-off', 'volume-off'),
(334, 'fa-volume-up', 'volume-up'),
(335, 'fa-warning', 'warning'),
(336, 'fa-wheelchair', 'wheelchair'),
(337, 'fa-wifi', 'wifi'),
(338, 'fa-wrench', 'wrench'),
(341, 'fa-xing', 'xing'),
(342, ' fa-xing-square', 'xing 2'),
(344, 'fa-facebook', ' agis facebook'),
(345, 'fa-handshake-o', 'handshake-o'),
(346, 'fa-volume-control-phone', 'volume-control-phone'),
(347, 'fa-th', 'Inklusion');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_intranet_user`
--

DROP TABLE IF EXISTS `morp_intranet_user`;
CREATE TABLE `morp_intranet_user` (
  `mid` int(11) NOT NULL,
  `uname` varchar(100) NOT NULL,
  `nname` varchar(100) NOT NULL,
  `vname` varchar(100) NOT NULL,
  `anrede` varchar(40) NOT NULL,
  `pw` varchar(100) NOT NULL,
  `admin` int(1) NOT NULL DEFAULT 0,
  `fon` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `img` varchar(255) NOT NULL,
  `kontrolle` int(11) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `newpass` int(11) NOT NULL,
  `countLogins` int(11) NOT NULL,
  `setMeFree` varchar(10) NOT NULL DEFAULT '#k8uNjj',
  `abteilung` int(11) NOT NULL,
  `wantEmail` int(11) NOT NULL,
  `secure` varchar(255) NOT NULL,
  `lastlog` varchar(20) NOT NULL,
  `guestID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `morp_intranet_user`
--

INSERT INTO `morp_intranet_user` (`mid`, `uname`, `nname`, `vname`, `anrede`, `pw`, `admin`, `fon`, `email`, `img`, `kontrolle`, `pass`, `newpass`, `countLogins`, `setMeFree`, `abteilung`, `wantEmail`, `secure`, `lastlog`, `guestID`) VALUES
(2, 'ws', 'Schwengler', 'Wolfgang', 'Sehr geehrter Herr', 'e80b5017098950fc58aad83c8c14978e', 0, ' 0 69.98 19 455.12', 'wolfgang.schwengler@konzept-fuenf.de', '', 0, '', 0, 21, '#k8uNjj', 0, 0, '', '2020-07-27 10:29', 0),
(3, 'bk', 'Knetter äöü?ÖÄÜ', 'Björn', 'Lieber Herr', '827ccb0eea8a706c4c34a16891f84e7b', 0, '017666855208', 'bk@pixel-dusche.de', '', 0, '', 0, 2, '#k8uNjj', 0, 0, '', '', 0),
(16, 'test@yahoo.com', '', '', '', 'e10adc3949ba59abbe56e057f20f883e', 0, '', 'test@yahoo.com', '', 0, '', 0, 0, '#k8uNjj', 0, 0, '', '', 14);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_intranet_user_track`
--
-- Error reading structure for table galery_image.morp_intranet_user_track: #1034 - Index for table 'morp_intranet_user_track' is corrupt; try to repair it
-- Error reading data for table galery_image.morp_intranet_user_track: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `galery_image`.`morp_intranet_user_track`' at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_settings`
--

DROP TABLE IF EXISTS `morp_settings`;
CREATE TABLE `morp_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `var` varchar(20) NOT NULL,
  `value` text NOT NULL,
  `reihenfolge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `morp_settings`
--

INSERT INTO `morp_settings` (`id`, `name`, `var`, `value`, `reihenfolge`) VALUES
(1, 'E-Mail Kunde / email Client', 'email', 'impressum@pixel-dusche.de', 3),
(2, 'E-Mail Name', 'emailname', 'pixel-dusche Büro für neue Medien', 2),
(3, 'Kunde / Client', 'client', 'Top Styling Frankfurt by Maike Werkmann', 1),
(5, 'Author', 'author', 'Bjoern Knetter, CMS Morpheus', 4),
(6, 'Adresse komplett', 'vcard', 'Bjoern Knetter\nc/o Frankfurter Freiheit\nHedderichstr. 41\n60594 Frankfurt am Main\n', 0),
(7, 'copyright', 'copyr', 'copyright 2019 by morpheus', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_settings_css`
--

DROP TABLE IF EXISTS `morp_settings_css`;
CREATE TABLE `morp_settings_css` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` varchar(255) NOT NULL,
  `reihenfolge` int(11) NOT NULL,
  `className` varchar(255) NOT NULL,
  `classVal` varchar(20) NOT NULL,
  `fontID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_settings_fonts`
--

DROP TABLE IF EXISTS `morp_settings_fonts`;
CREATE TABLE `morp_settings_fonts` (
  `fontID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `fontClass` varchar(30) NOT NULL,
  `fontWeight` varchar(10) NOT NULL,
  `sichtbar` int(1) NOT NULL,
  `reihenfolge` int(11) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `morp_settings_fonts`
--

INSERT INTO `morp_settings_fonts` (`fontID`, `name`, `fontClass`, `fontWeight`, `sichtbar`, `reihenfolge`, `value`) VALUES
(1, 'Lato 700', 'Lato', '700', 0, 0, '@font-face {\r\n    font-family: \'Lato\';\r\n    src: url(\'../fonts/lato-bold.woff\') format(\'woff\');\r\n    font-weight: 700;\r\n    font-style: normal;\r\n}\r\n'),
(2, 'Lato 300', 'Lato', '300', 0, 0, '@font-face {\r\n    font-family: \'Lato\';\r\n    src: url(\'../fonts/lato-light.woff\') format(\'woff\');\r\n    font-weight: 300;\r\n    font-style: normal;\r\n}'),
(3, 'Lato 400', 'Lato', '400', 0, 0, '@font-face {\r\n    font-family: \'Lato\';\r\n    src: url(\'../fonts/lato-regular.woff\') format(\'woff\');\r\n    font-weight: 400;\r\n    font-style: normal;\r\n}\r\n'),
(4, 'Montserrat 700', 'Montserrat', '700', 0, 0, '@font-face {\r\n    font-family: \'Montserrat\';\r\n    src: url(\'../fonts/montserrat-bold.woff\') format(\'woff\');\r\n    font-weight: 700;\r\n    font-style: normal;\r\n}'),
(5, 'Montserrat 400', 'Montserrat', '400', 0, 0, '@font-face {\r\n    font-family: \'Montserrat\';\r\n    src: url(\'../fonts/montserrat-regular.woff\') format(\'woff\');\r\n    font-weight: 400;\r\n    font-style: normal;\r\n}'),
(6, 'Montserrat 300', 'Montserrat', '300', 0, 0, '@font-face {\r\n    font-family: \'Montserrat\';\r\n    src: url(\'../fonts/montserrat-light.woff\') format(\'woff\');\r\n    font-weight: 300;\r\n    font-style: normal;\r\n}'),
(7, 'Montserrat 500', 'Montserrat', '500', 0, 0, '@font-face {\r\n    font-family: \'Montserrat\';\r\n    src: url(\'../fonts/montserrat-medium.woff\') format(\'woff\');\r\n    font-weight: 500;\r\n    font-style: normal;\r\n}'),
(8, 'Open Sans 300', 'Open Sans', '300', 0, 0, '@font-face {\r\n    font-family: \'Open Sans\';\r\n    src: url(\'../fonts/opensans-light.woff\') format(\'woff\');\r\n    font-weight: 300;\r\n    font-style: normal;\r\n}'),
(9, 'Open Sans 400', 'Open Sans', '400', 0, 0, '@font-face {\r\n    font-family: \'Open Sans\';\r\n    src: url(\'../fonts/opensans-regular.woff\') format(\'woff\');\r\n    font-weight: 400;\r\n    font-style: normal;\r\n}\r\n'),
(10, 'Open Sans 600', 'Open Sans', '600', 0, 0, '@font-face {\r\n    font-family: \'Open Sans\';\r\n    src: url(\'../fonts/opensans-semibold.woff\') format(\'woff\');\r\n    font-weight: 600;\r\n    font-style: normal;\r\n}'),
(11, 'Open Sans 700', 'Open Sans', '700', 0, 0, '@font-face {\r\n    font-family: \'Open Sans\';\r\n    src: url(\'../fonts/opensans-bold.woff\') format(\'woff\');\r\n    font-weight: 700;\r\n    font-style: normal;\r\n}'),
(12, 'Open Sans Condensed 300', 'Open Sans Condensed', '300', 0, 0, '@font-face {\r\n    font-family: \'Open Sans Condensed\';\r\n    src: url(\'../fonts/opensanscondensed-light.woff\') format(\'woff\');\r\n    font-weight: 300;\r\n    font-style: normal;\r\n}'),
(13, 'Play 300', 'Play', '300', 1, 0, '@font-face {\r\n    font-family: \'Play\';\r\n    src: url(\'../fonts/play-regular.woff\') format(\'woff\');\r\n    font-weight: 300;\r\n    font-style: normal;\r\n\r\n}'),
(14, 'Play 600', 'Play', '600', 1, 0, '@font-face {\r\n    font-family: \'Play\';\r\n    src: url(\'../fonts/play-bold.woff\') format(\'woff\');\r\n    font-weight: 600;\r\n    font-style: normal;\r\n}'),
(15, 'Encode Sans Condensed', 'Encode Sans Condensed', '800', 0, 0, '@font-face {\r\n    font-family: \'Encode Sans Condensed\';\r\n    src: url(\'../fonts/EncodeSansCondensed-ExtraBold.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/EncodeSansCondensed-ExtraBold.woff\') format(\'woff\');\r\n    font-weight: 800;\r\n    font-style: normal;\r\n}'),
(16, 'IBM Plex Sans Condensed', 'IBM Plex Sans Condensed', 'bold', 0, 0, '@font-face {\r\n    font-family: \'IBM Plex Sans Condensed\';\r\n    src: url(\'../fonts/IBMPlexSansCond-BoldItalic.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/IBMPlexSansCond-BoldItalic.woff\') format(\'woff\');\r\n    font-weight: bold;\r\n    font-style: italic;\r\n}'),
(17, 'IBM Plex Sans Condensed', 'IBM Plex Sans Condensed', 'normal', 0, 0, '@font-face {\r\n    font-family: \'IBM Plex Sans Condensed\';\r\n    src: url(\'../fonts/IBMPlexSansCond-Italic.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/IBMPlexSansCond-Italic.woff\') format(\'woff\');\r\n    font-weight: normal;\r\n    font-style: italic;\r\n}'),
(18, 'Oswald', 'Oswald', 'normal', 0, 0, '@font-face {\r\n    font-family: \'Oswald\';\r\n    src: url(\'../fonts/Oswald-Regular.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/Oswald-Regular.woff\') format(\'woff\');\r\n    font-weight: normal;\r\n    font-style: normal;\r\n}'),
(19, 'Oswald bold', 'Oswald', 'bold', 0, 0, '@font-face {\r\n    font-family: \'Oswald\';\r\n    src: url(\'../fonts/Oswald-Bold.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/Oswald-Bold.woff\') format(\'woff\');\r\n    font-weight: bold;\r\n    font-style: normal;\r\n}'),
(20, 'Racing Sans One', 'Racing Sans One', 'normal', 0, 0, '@font-face {\r\n    font-family: \'Racing Sans One\';\r\n    src: url(\'../fonts/RacingSansOne-Regular.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/RacingSansOne-Regular.woff\') format(\'woff\');\r\n    font-weight: normal;\r\n    font-style: normal;\r\n}'),
(21, 'IBM Plex Sans Condensed', 'IBM Plex Sans Condensed', 'normal', 0, 0, '@font-face {\r\n    font-family: \'IBM Plex Sans Condensed\';\r\n    src: url(\'../fonts/IBMPlexSansCond.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/IBMPlexSansCond.woff\') format(\'woff\');\r\n    font-weight: normal;\r\n    font-style: normal;\r\n}'),
(22, 'IBM Plex Sans Condensed', 'IBM Plex Sans Condensed', '500', 0, 0, '@font-face {\r\n    font-family: \'IBM Plex Sans Condensed\';\r\n    src: url(\'../fonts/IBMPlexSansCond-Medium.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/IBMPlexSansCond-Medium.woff\') format(\'woff\');\r\n    font-weight: 500;\r\n    font-style: normal;\r\n}'),
(23, 'PT Sans', 'PT Sans', 'normal', 0, 0, '@font-face {\r\n    font-family: \'PT Sans\';\r\n    src: url(\'../fonts/PTSans-Regular.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/PTSans-Regular.woff\') format(\'woff\');\r\n    font-weight: normal;\r\n    font-style: normal;\r\n}'),
(24, 'PT Sans bold', 'PT Sans', 'bold', 0, 0, '@font-face {\r\n    font-family: \'PT Sans\';\r\n    src: url(\'../fonts/PTSans-Bold.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/PTSans-Bold.woff\') format(\'woff\');\r\n    font-weight: bold;\r\n    font-style: normal;\r\n}'),
(25, 'Oswald', 'Oswald', '300', 0, 0, '@font-face {\r\n    font-family: \'Oswald\';\r\n    src: url(\'../fonts/Oswald-Light.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/Oswald-Light.woff\') format(\'woff\');\r\n    font-weight: 300;\r\n    font-style: normal;\r\n}'),
(26, 'Encode Sans Condensed', 'Encode Sans Condensed', '500', 0, 0, '@font-face {\r\n    font-family: \'Encode Sans Condensed\';\r\n    src: url(\'../fonts/EncodeSansCondensed-Medium.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/EncodeSansCondensed-Medium.woff\') format(\'woff\');\r\n    font-weight: 500;\r\n    font-style: normal;\r\n}'),
(27, 'Encode Sans Condensed', 'Encode Sans Condensed', '300', 0, 0, '@font-face {\r\n    font-family: \'Encode Sans Condensed\';\r\n    src: url(\'../fonts/EncodeSansCondensed-Light.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/EncodeSansCondensed-Light.woff\') format(\'woff\');\r\n    font-weight: 300;\r\n    font-style: normal;\r\n}'),
(28, 'Encode Sans Condensed', 'Encode Sans Condensed', '200', 0, 0, '@font-face {\r\n    font-family: \'Encode Sans Condensed ExLight\';\r\n    src: url(\'../fonts/EncodeSansCondensed-ExtraLight.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/EncodeSansCondensed-ExtraLight.woff\') format(\'woff\');\r\n    font-weight: 200;\r\n    font-style: normal;\r\n}'),
(29, 'Ropa Sans', 'Ropa Sans', 'normal', 0, 0, '@font-face {\r\n    font-family: \'Ropa Sans\';\r\n    src: url(\'../fonts/RopaSans-Regular.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/RopaSans-Regular.woff\') format(\'woff\');\r\n    font-weight: normal;\r\n    font-style: normal;\r\n}'),
(30, 'Oswald', 'Oswald', '500', 0, 0, '@font-face {\r\n    font-family: \'Oswald\';\r\n    src: url(\'../fonts/Oswald-Medium.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/Oswald-Medium.woff\') format(\'woff\');\r\n    font-weight: 500;\r\n    font-style: normal;\r\n}\r\n'),
(31, 'Encode Sans Condensed', 'Encode Sans Condensed', 'bold', 0, 0, '@font-face {\r\n    font-family: \'Encode Sans Condensed\';\r\n    src: url(\'../fonts/EncodeSansCondensed-Bold.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/EncodeSansCondensed-Bold.woff\') format(\'woff\');\r\n    font-weight: bold;\r\n    font-style: normal;\r\n}'),
(32, 'Nanum Brush Script', 'Nanum Brush Script', 'normal', 0, 0, '@font-face {\r\n    font-family: \'Nanum Brush Script\';\r\n    src: url(\'../fonts/NanumBrush.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/NanumBrush.woff\') format(\'woff\');\r\n    font-weight: normal;\r\n    font-style: normal;\r\n}'),
(33, 'Encode Sans Condensed', 'Encode Sans Condensed', '900', 0, 0, '@font-face {\r\n    font-family: \'Encode Sans Condensed\';\r\n    src: url(\'../fonts/EncodeSansCondensed-Black.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/EncodeSansCondensed-Black.woff\') format(\'woff\');\r\n    font-weight: 900;\r\n    font-style: normal;\r\n}'),
(34, 'Encode Sans Condensed', 'Encode Sans Condensed', 'normal', 0, 0, '@font-face {\r\n    font-family: \'Encode Sans Condensed\';\r\n    src: url(\'../fonts/EncodeSansCondensed-Regular.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/EncodeSansCondensed-Regular.woff\') format(\'woff\');\r\n    font-weight: normal;\r\n    font-style: normal;\r\n}'),
(35, 'Encode Sans Condensed', 'Encode Sans Condensed', '100', 0, 0, '@font-face {\r\n    font-family: \'Encode Sans Condensed\';\r\n    src: url(\'../fonts/EncodeSansCondensed-Thin.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/EncodeSansCondensed-Thin.woff\') format(\'woff\');\r\n    font-weight: 100;\r\n    font-style: normal;\r\n}'),
(36, 'IBM Plex Sans Condensed', 'IBM Plex Sans Condensed', 'bold', 0, 0, '@font-face {\r\n    font-family: \'IBM Plex Sans Condensed\';\r\n    src: url(\'../fonts/IBMPlexSansCond-Bold.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/IBMPlexSansCond-Bold.woff\') format(\'woff\');\r\n    font-weight: bold;\r\n    font-style: normal;\r\n}'),
(37, 'Antic Didone', 'Antic Didone', 'normal', 1, 0, '@font-face {\r\n    font-family: \'Antic Didone\';\r\n    src: url(\'../fonts/AnticDidone-Regular.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/AnticDidone-Regular.woff\') format(\'woff\');\r\n    font-weight: normal;\r\n    font-style: normal;\r\n}'),
(38, 'PT Sans Narrow', 'PT Sans Narrow', 'normal', 0, 0, '@font-face {\r\n    font-family: \'PT Sans Narrow\';\r\n    src: url(\'../fonts/PTSans-Narrow.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/PTSans-Narrow.woff\') format(\'woff\');\r\n    font-weight: normal;\r\n    font-style: normal;\r\n}'),
(39, 'IBM Plex Sans Condensed', 'IBM Plex Sans Condensed', '600', 0, 0, '@font-face {\r\n    font-family: \'IBM Plex Sans Condensed\';\r\n    src: url(\'../fonts/IBMPlexSansCond-SemiBold.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/IBMPlexSansCond-SemiBold.woff\') format(\'woff\');\r\n    font-weight: 600;\r\n    font-style: normal;\r\n}'),
(40, 'IBM Plex Sans Condensed', 'IBM Plex Sans Condensed', '200', 1, 0, '@font-face {\r\n    font-family: \'IBM Plex Sans Condensed\';\r\n    src: url(\'../fonts/IBMPlexSansCond-ExtraLight.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/IBMPlexSansCond-ExtraLight.woff\') format(\'woff\');\r\n    font-weight: 200;\r\n    font-style: normal;\r\n}'),
(41, 'Oswald', 'Oswald', '200', 0, 0, '@font-face {\r\n    font-family: \'Oswald\';\r\n    src: url(\'../fonts/Oswald-ExtraLight.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/Oswald-ExtraLight.woff\') format(\'woff\');\r\n    font-weight: 200;\r\n    font-style: normal;\r\n}'),
(42, 'IBM Plex Sans Condensed', 'IBM Plex Sans Condensed', '100', 0, 0, '@font-face {\r\n    font-family: \'IBM Plex Sans Condensed\';\r\n    src: url(\'../fonts/IBMPlexSansCond-Thin.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/IBMPlexSansCond-Thin.woff\') format(\'woff\');\r\n    font-weight: 100;\r\n    font-style: normal;\r\n}'),
(43, 'Encode Sans Condensed', 'Encode Sans Condensed', '600', 0, 0, '@font-face {\r\n    font-family: \'Encode Sans Condensed\';\r\n    src: url(\'../fonts/EncodeSansCondensed-SemiBold.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/EncodeSansCondensed-SemiBold.woff\') format(\'woff\');\r\n    font-weight: 600;\r\n    font-style: normal;\r\n}'),
(44, 'PT Sans Narrow', 'PT Sans Narrow', 'bold', 0, 0, '@font-face {\r\n    font-family: \'PT Sans Narrow\';\r\n    src: url(\'../fonts/PTSans-NarrowBold.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/PTSans-NarrowBold.woff\') format(\'woff\');\r\n    font-weight: bold;\r\n    font-style: normal;\r\n}'),
(45, 'IBM Plex Sans Condensed', 'IBM Plex Sans Condensed', '300', 0, 0, '@font-face {\r\n    font-family: \'IBM Plex Sans Condensed\';\r\n    src: url(\'../fonts/IBMPlexSansCond-Light.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/IBMPlexSansCond-Light.woff\') format(\'woff\');\r\n    font-weight: 300;\r\n    font-style: normal;\r\n}'),
(46, 'Oswald', 'Oswald', '600', 0, 0, '@font-face {\r\n    font-family: \'Oswald\';\r\n    src: url(\'../fonts/Oswald-SemiBold.woff2\') format(\'woff2\'),\r\n        url(\'../fonts/Oswald-SemiBold.woff\') format(\'woff\');\r\n    font-weight: 600;\r\n    font-style: normal;\r\n}'),
(47, 'Roboto 300', 'Roboto', '300', 0, 0, '@font-face {\r\n    font-family: \'Roboto\';\r\n    src: url(\'../fonts/roboto-light.woff\') format(\'woff\');\r\n    font-weight: 300;\r\n    font-style: normal;\r\n}'),
(48, 'Roboto 400', 'Roboto', '400', 0, 0, '@font-face {\r\n    font-family: \'Roboto\';\r\n    src: url(\'../fonts/roboto-regular.woff\') format(\'woff\');\r\n    font-weight: 400;\r\n    font-style: normal;\r\n}'),
(49, 'Roboto 600', 'Roboto', '600', 0, 0, '@font-face {\r\n    font-family: \'Roboto\';\r\n    src: url(\'../fonts/roboto-medium.woff\') format(\'woff\');\r\n    font-weight: 600;\r\n    font-style: normal;\r\n}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_sprachdatei`
--

DROP TABLE IF EXISTS `morp_sprachdatei`;
CREATE TABLE `morp_sprachdatei` (
  `id` int(11) NOT NULL,
  `de` text COLLATE utf8_unicode_ci NOT NULL,
  `us` text COLLATE utf8_unicode_ci NOT NULL,
  `en` text COLLATE utf8_unicode_ci NOT NULL,
  `ru` text COLLATE utf8_unicode_ci NOT NULL,
  `es` text COLLATE utf8_unicode_ci NOT NULL,
  `dk` text COLLATE utf8_unicode_ci NOT NULL,
  `bez` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fr` text COLLATE utf8_unicode_ci NOT NULL,
  `it` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `morp_sprachdatei`
--

INSERT INTO `morp_sprachdatei` (`id`, `de`, `us`, `en`, `ru`, `es`, `dk`, `bez`, `fr`, `it`) VALUES
(1, 'Sehr geehrte(r) Interessent(in),\r\n\r\nbitte bestätigen Sie durch einen Klick auf den folgenden Link Ihren Wunsch, unsere Newsletter künftig zu erhalten.\r\n\r\nVielen Dank.\r\n\r\n<!-- link -->\r\n\r\n(Falls Ihr Email-Programm die vorstehende Adresse nicht als Link interpretiert, tragen Sie bitte die komplette Adresse ohne Leerzeichen in die Adresszeile Ihres Browser und bestätigen Sie mit Enter. Vielen Dank) \r\n\r\nMit freundlichen Grüßen\r\n\r\nLANDESAPOTHEKERKAMMER HESSEN\r\nKörperschaft des öffentlichen Rechts\r\nKuhwaldstraße 46\r\n60486 Frankfurt am Main\r\nE-Mail: info@apothekerkammer.de\r\n\r\nBesuchen Sie uns auch im Internet unter: www.apothekerkammer.de', '', '', '', '', '', 'Bestätigungs E-Mail', '', ''),
(2, '<p>Vielen Dank für Ihre Anmeldung. Sie erhalten in Kürze eine E-Mail von uns.\r\n<b>Bitte bestätigen Sie Ihre Newsletter-Anmeldung durch Klick auf den im E-Mail enthaltenen link!</b>\r\n\r\nWir freuen uns darauf, zukünftig interessante Neuigkeiten mit Ihnen zu teilen!\r\n\r\nMit freundlichen Grüßen\r\n\r\nIhre\r\nLANDESAPOTHEKERKAMMER HESSEN</p>\r\n', '', '', '', '', '', 'Text nach Anmeldung', '', ''),
(3, 'Herr\r\nFrau\r\nHerr Dr.\r\nFrau Dr.', '', '', '', '', '', 'Anrede', '', ''),
(4, '<p>Bitte wählen Sie Ihre gewünschten Newsletter aus folgenden Themen aus:</p>', '', '', '', '', '', 'Newsletter', '', ''),
(5, 'Pflichtfelder', '', '', '', '', '', 'Pflichtfelder', '', ''),
(6, 'Bitte bestätigen Sie Ihre Newsletter-Anmeldung', '', '', '', '', '', 'Betreff Bestätigung Newsletter', '', ''),
(7, 'LAK Hessen: Newsletter Bestätigung', '', '', '', '', '', 'Absender Name / Bestätigung', '', ''),
(8, 'info@apothekerkammer.de', '', '', '', '', '', 'Absender-Adresse web-Newsletter', '', ''),
(9, '<h2>Newsletter-Aktivierung</h2>\r\n<p>Vielen Dank für Ihre Anmeldung.\r\nSie erhalten zukünftig die gewählten Newsletter an die von Ihnen angegebene E-Mail-Adresse.</p>', '', '', '', '', '', 'Vielen Dank für Ihre Anmeldung', '', ''),
(10, '<h2>Newsletter Abbestellen</h2><p>Ihre Abmeldung war erfolgreich</p>', '', '', '', '', '', 'Newsletter Abbestellen', '', ''),
(11, '<h2>Newsletter Abbestellen</h2><p>Wir konnten Ihre Adresse in unserem System nicht finden</p>', '', '', '', '', '', 'Abbestellen erfolglos', '', ''),
(13, '<p><a href=\"unregister.php\">Bitte klicken Sie hier, wenn Sie unseren Newsletter <b>abbestellen</b> möchten.</a></p>', '', '', '', '', '', 'Abmelde Link von Bestellseite', '', ''),
(12, '<p>Die gewählten Themen/Newsletter sollen gesendet werden an:</p>', '', '', '', '', '', 'Newsletter Anmeldung Text Zwischenzeile', '', ''),
(14, 'Ich stimme zu, dass meine Angaben aus dem Formular von der LAK Hessen gespeichert und auf der Homepage der Landesapothekerkammer Hessen für alle sichtbar veröffentlicht werden. Die Daten werden nach 2 Monaten von der Homepage der Landesapothekerkammer Hessen entfernt und können dann nicht mehr öffentlich eingesehen werden. Detaillierte Informationen zum Umgang mit Nutzerdaten finden Sie auch in unserer <a href=\"/datenschutz/\" target=\"_blank\" style=\"text-decoration:underline;\">Datenschutzerklärung</a>.', '', '', '', '', '', 'Formular Stellengesuche', '', ''),
(15, 'Ich stimme zu, dass meine Angaben aus dem Formular von der LAK Hessen gespeichert und auf der Homepage der Landesapothekerkammer Hessen für alle sichtbar veröffentlicht werden. Die Daten werden nach 2 Monaten von der Homepage der Landesapothekerkammer Hessen entfernt und können dann nicht mehr öffentlich eingesehen werden. Detaillierte Informationen zum Umgang mit Nutzerdaten finden Sie auch in unserer <a href=\"/datenschutz/\" target=\"_blank\" style=\"text-decoration:underline;\">Datenschutzerklärung</a>.', '', '', '', '', '', 'Stellengesuche Stellenangebote', '', ''),
(16, 'Wenn Sie die im Kontaktformular eingegebenen Daten durch Anklicken des nachfolgenden Buttons übersenden, erklären Sie sich einverstanden, dass wir Ihre Angaben für die Beantwortung Ihrer Anfrage bzw. Kontaktaufnahme zur Verarbeitung speichern. Eine Weitergabe an Dritte findet grundsätzlich nicht statt, es sei denn geltende Datenschutzvorschriften rechtfertigen eine Übertragung oder wir sind dazu gesetzlich verpflichtet. Sie können Ihre erteilte Einwilligung jederzeit mit Wirkung für die Zukunft widerrufen. Weitere Informationen zum Datenschutz finden Sie auch in der <a href=\"/datenschutz/\" target=\"_blank\" style=\"text-decoration:underline;\">Datenschutzerklärung</a> dieser Webseite.', '', '', '', '', '', 'Formular Kontakt', '', ''),
(17, 'Wenn Sie die im Antragsformular eingegebenen Daten durch Anklicken des nachfolgenden Buttons übersenden, erklären Sie sich damit einverstanden, dass wir Ihre Angaben unter anderem für die Beantwortung Ihrer Anfrage bzw. zur Übermittlung der Login-Daten zur Verarbeitung speichern. Eine Weitergabe an Dritte findet grundsätzlich nicht statt, es sei denn geltende Datenschutzvorschriften rechtfertigen eine Übertragung oder wir sind dazu gesetzlich verpflichtet. Sie können Ihre erteilte Einwilligung jederzeit mit Wirkung für die Zukunft widerrufen. Weitere Informationen zum Datenschutz finden Sie auch in der <a href=\"/datenschutz/\" target=\"_blank\" style=\"text-decoration:underline;\">Datenschutzerklärung</a> dieser Webseite.', '', '', '', '', '', 'Login beantragen', '', ''),
(18, 'Wenn Sie die im Formular zum Zurücksetzen Ihres Passwortes eingegebenen Daten durch Anklicken des nachfolgenden Buttons übersenden, erklären Sie sich damit einverstanden, dass wir Ihre Angaben unter anderem für die Beantwortung Ihrer Anfrage bzw. zur Übermittlung der Login-Daten zur Verarbeitung speichern. Eine Weitergabe an Dritte findet grundsätzlich nicht statt, es sei denn geltende Datenschutzvorschriften rechtfertigen eine Übertragung oder wir sind dazu gesetzlich verpflichtet. Sie können Ihre erteilte Einwilligung jederzeit mit Wirkung für die Zukunft widerrufen. Weitere Informationen zum Datenschutz finden Sie auch in der <a href=\"/datenschutz/\" target=\"_blank\" style=\"text-decoration:underline;\">Datenschutzerklärung</a> dieser Webseite.', '', '', '', '', '', 'Passwort vergessen', '', ''),
(19, 'Um alle Services der Landesapothekerkammer nutzen zu können, akzeptieren Sie bitte die Datenschutzerklärung.', '', '', '', '', '', 'Datenschutzerklärung', '', ''),
(20, 'Wenn Sie die im Kontaktformular eingegebenen Daten durch Anklicken des nachfolgenden Buttons übersenden, erklären Sie sich damit einverstanden, dass wir Ihre Angaben für die Beantwortung Ihrer Anfrage bzw. Kontaktaufnahme verarbeiten, speichern und nutzen. Dies erfolgt ausschließlich zum Zwecke der Durchführung der begleitenden Unterrichtsveranstaltungen. Eine Weitergabe an Dritte findet grundsätzlich nicht statt, es sei denn geltende Datenschutzvorschriften rechtfertigen eine Übertragung oder wir sind dazu gesetzlich verpflichtet. Sie können Ihre Einwilligung jederzeit mit Wirkung für die Zukunft widerrufen. Der Widerruf berührt nicht die Rechtmäßigkeit der auf Grund der Einwilligung bis zum Widerruf erfolgten Datenverarbeitung. Weitere Informationen zum Datenschutz finden Sie auch in der Datenschutzerklärung dieser Webseite.', '', '', '', '', '', 'Formular BUV', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_suche_count`
--

DROP TABLE IF EXISTS `morp_suche_count`;
CREATE TABLE `morp_suche_count` (
  `sid` int(11) NOT NULL,
  `kid` int(11) NOT NULL DEFAULT 0,
  `navid` int(11) NOT NULL DEFAULT 0,
  `anzde` int(11) NOT NULL DEFAULT 0,
  `anzen` int(11) NOT NULL DEFAULT 0,
  `art` int(1) NOT NULL DEFAULT 1,
  `stid` int(11) NOT NULL DEFAULT 0,
  `nid` int(11) NOT NULL,
  `ngid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `morp_suche_count`
--

INSERT INTO `morp_suche_count` (`sid`, `kid`, `navid`, `anzde`, `anzen`, `art`, `stid`, `nid`, `ngid`) VALUES
(49, 0, 2, 1, 0, 1, 0, 0, 0),
(50, 0, 3, 3, 0, 1, 0, 0, 0),
(51, 0, 4, 1, 0, 1, 0, 0, 0),
(52, 0, 5, 383, 0, 1, 0, 0, 0),
(53, 0, 6, 2, 0, 1, 0, 0, 0),
(54, 0, 11, 3, 0, 1, 0, 0, 0),
(55, 0, 12, 1, 0, 1, 0, 0, 0),
(56, 0, 13, 3, 0, 1, 0, 0, 0),
(57, 0, 14, 3, 0, 1, 0, 0, 0),
(58, 0, 15, 3, 0, 1, 0, 0, 0),
(59, 0, 16, 2, 0, 1, 0, 0, 0),
(60, 0, 17, 2, 0, 1, 0, 0, 0),
(61, 0, 18, 2, 0, 1, 0, 0, 0),
(62, 0, 19, 3, 0, 1, 0, 0, 0),
(63, 0, 20, 3, 0, 1, 0, 0, 0),
(64, 0, 22, 2, 0, 1, 0, 0, 0),
(65, 0, 25, 2, 0, 1, 0, 0, 0),
(66, 0, 28, 3, 0, 1, 0, 0, 0),
(67, 0, 1, 255, 0, 2, 0, 1, 1),
(68, 0, 2, 143, 0, 2, 0, 2, 1),
(69, 0, 3, 208, 0, 2, 0, 3, 1),
(70, 0, 4, 69, 0, 2, 0, 4, 2),
(71, 0, 5, 137, 0, 2, 0, 5, 2),
(72, 0, 6, 69, 0, 2, 0, 6, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_suche_keyw`
--

DROP TABLE IF EXISTS `morp_suche_keyw`;
CREATE TABLE `morp_suche_keyw` (
  `kid` int(11) NOT NULL,
  `keyw` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `de` int(1) NOT NULL DEFAULT 0,
  `en` int(1) NOT NULL DEFAULT 0,
  `fr` int(1) NOT NULL,
  `ru` int(1) NOT NULL,
  `it` int(1) NOT NULL,
  `es` int(1) NOT NULL,
  `desc` int(1) NOT NULL DEFAULT 0,
  `title` int(1) NOT NULL DEFAULT 0,
  `news` int(1) NOT NULL DEFAULT 0,
  `table` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `morp_suche_keyw`
--

INSERT INTO `morp_suche_keyw` (`kid`, `keyw`, `de`, `en`, `fr`, `ru`, `it`, `es`, `desc`, `title`, `news`, `table`) VALUES
(0, 'neuigkeiten', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'calendar', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'woche', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'termine', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'galerien', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'infos', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'intranet', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'subline', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'info', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'aeoeuess', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'lorem', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'ipsum', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'dolor', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'amet', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'consetetur', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'sadipscing', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'elitr', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'diam', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'nonumy', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'eirmod', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'tempor', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'invidunt', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'labore', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'dolore', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'magna', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'aliquyam', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'erat', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'voluptua', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'vero', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'accusam', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'justo', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'dolores', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'rebum', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'stet', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'clita', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'kasd', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'gubergren', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'takimata', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'sanctus', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'funktioniert', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'galerie', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'fotos', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'profile', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'profil', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'angebote', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'schwarzes', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'brett', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'downloads', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'wochenansicht', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'liste', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'listenansicht', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'monat', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'monatsansicht', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'stift', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'veranstaltungen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'oberrad', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'angebot', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'aufgeben', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'telegram', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'telegramme', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'teilnahme', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'katholische', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'stadtdekan', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'johannes', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'eltz', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'evangelische', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'achim', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'knecht', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'mittwoch', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'september', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'verwaltung', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'katharinen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'weissfrauenstiftes', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'rebstock', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'neuen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'frankfurter', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'altstadt', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'eingeweiht', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'geladenen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'gaesten', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'stadtverordnetenvorsteher', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'stephan', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'siegler', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'mitarbeiterinnen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'mitarbeitern', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'stiftung', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'erinnerten', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'geistlichen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'wurzeln', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'mittelalterlichen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'weissfrauenkloster', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'katharinenkloster', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'entstammt', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'betonten', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'weltlichen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'stadt', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'frankfurt', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'besonderes', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'festtag', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'kuenftige', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'arbeit', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'saekularen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'einrichtung', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'unter', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'gottes', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'segen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'stellen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'zitierte', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'bibelvers', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'brief', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'galater', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'trage', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'anderen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'last', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'motivation', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'anfaengen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'mittelalter', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'heute', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'beschreibe', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'altersarmut', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'mitgetragen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'sagte', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'bezeichnung', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'stiftsfrau', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'beduerftige', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'frauen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'unterstuetzt', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'zeige', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'hohes', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'mass', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'respekt', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'achtung', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'verliess', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'rednerpult', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'spritzte', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'weihwasser', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'saal', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'segne', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'menschen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'arbeiten', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'gebaeude', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'trifft', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'versehen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'absicht', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'vorsitzende', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'stiftungsvorstandes', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'stadtraetin', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'prof', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'daniela', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'birkenfeld', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'ihrer', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'festansprache', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'blicke', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'spannende', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'bewegte', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'geschichte', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'zurueck', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'trotz', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'bauernkriegen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'saekularisierung', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'gelang', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'stiftungen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'weissfrauenklosters', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, '1228', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'katharinenklosters', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, '1353', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'erhalten', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, '1876', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'verschmelzen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'heutigen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'jahresrenten', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, '1400', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'stiftsfrauen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'gewaehrleisteten', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'lebenswertes', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'aelterwerden', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'hochpreisigen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'nannte', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'zweiten', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'stiftungszweck', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, '1959', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'hinzukam', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'bezahlbaren', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'barrierefreien', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'wohnraum', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'seniorinnen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'errichten', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'gerade', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'wohnanlage', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'schwarzburgstrasse', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'nordend', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'beliebten', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'stadtteil', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'leicht', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'bezahlbare', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'wohnung', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'bekommen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'weissfrauenstift', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'schaffe', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'zudem', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'moeglichkeiten', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'stadtleben', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'teilzunehmen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'gutachten', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'zeigten', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'haeufig', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'krieg', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'miterlebten', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'verlust', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'ehepartners', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'heimat', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'familie', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'verkraften', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'dankte', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'engagement', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'bauzeit', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'umzuges', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'sicherte', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'stiftsangehoerigen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'kommende', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'zeit', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'unterstuetzung', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'gedanken', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'schnelllebigen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'leben', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'stiftungsdirektorin', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'ursula', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'poletti', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'betonte', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'anliegen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'neue', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'finanziell', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'situierte', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'senioren', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'vermietete', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'verband', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'raeume', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'erdgeschoss', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'hofes', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'betreiben', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'gaeste', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'pass', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'verguenstigungen', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'entstehungsgeschichte', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'verbunden', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'historiker', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'bjoern', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'wissenbach', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'vortrag', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'grundstueck', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'lebte', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'einst', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'katharina', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'schwager', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'wicker', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'frosch', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'teil', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'erbes', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'vermachte', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'stiften', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'weissfrauenstifts', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'foto', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'christoph', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'boeckheler', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'open', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'water', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'champion', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'nathalie', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'pohl', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'joins', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'restube', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'spritzgiessteile', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'perfektion', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'think', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'plastics', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'februar', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'maerz', 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(0, 'suchen', 1, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_suche_track`
--

DROP TABLE IF EXISTS `morp_suche_track`;
CREATE TABLE `morp_suche_track` (
  `ms` int(11) NOT NULL,
  `suche` varchar(255) NOT NULL,
  `time` varchar(20) NOT NULL,
  `hashtag` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `morp_suche_track`
--

INSERT INTO `morp_suche_track` (`ms`, `suche`, `time`, `hashtag`) VALUES
(1, 'Motorrad', '2019-04-10 18:04:48', 0),
(2, 'essen', '2019-04-10 18:04:00', 0),
(3, 'rolator', '2019-04-10 18:04:03', 0),
(4, 'oberursel', '2019-04-11 08:04:27', 0),
(5, 'garten', '2019-04-12 17:04:17', 0),
(6, 'garten', '2019-04-12 17:04:34', 0),
(7, '', '2019-04-12 17:04:40', 0),
(8, 'rolator', '2019-04-12 17:04:57', 0),
(9, '', '2019-04-12 17:04:18', 0),
(10, '', '2019-04-12 17:04:27', 0),
(11, '???', '2019-04-12 17:04:14', 0),
(12, 'äöü', '2019-04-12 17:04:22', 0),
(13, 'äöü', '2019-04-12 17:04:32', 0),
(14, 'garten', '2019-04-12 17:04:35', 0),
(15, 'garten', '2019-04-12 17:04:09', 0),
(16, 'garten', '2019-04-12 17:04:42', 0),
(17, 'garten', '2019-04-12 17:04:47', 0),
(18, 'garten', '2019-04-12 17:04:49', 0),
(19, 'raum', '2019-04-17 10:04:28', 1),
(20, 'frühstück', '2019-04-17 11:04:52', 0),
(21, '', '2019-04-17 11:04:11', 0),
(22, 'frühstück', '2019-04-17 11:04:09', 0),
(23, 'frühstück', '2019-04-17 11:04:23', 0),
(24, 'frühstück', '2019-04-17 11:04:25', 0),
(25, 'frühstück', '2019-04-17 11:04:22', 0),
(26, 'frühstück mal', '2019-04-17 11:04:21', 0),
(27, 'frühstück mal', '2019-04-17 11:04:31', 0),
(28, 'frühstück mal', '2019-04-17 11:04:47', 0),
(29, 'das + zwei', '2019-04-17 11:04:07', 0),
(30, 'das + zwei', '2019-04-17 11:04:48', 0),
(31, 'das + zwei', '2019-04-17 11:04:07', 0),
(32, 'das + zwei', '2019-04-17 11:04:27', 0),
(33, 'das + zwei', '2019-04-17 11:04:22', 0),
(34, 'zwei oder drei', '2019-04-17 11:04:56', 0),
(35, 'zwei | drei', '2019-04-17 11:04:07', 0),
(36, 'zwei | drei', '2019-04-17 11:04:28', 0),
(37, 'zwei | drei', '2019-04-17 11:04:33', 0),
(38, 'zwei | drei', '2019-04-17 11:04:32', 0),
(39, 'zwei | drei', '2019-04-17 11:04:30', 0),
(40, 'zwei | drei', '2019-04-17 11:04:04', 0),
(41, 'zwei | drei', '2019-04-17 11:04:37', 0),
(42, 'zwei | drei', '2019-04-17 12:04:25', 0),
(43, 'zwei | drei', '2019-04-17 12:04:07', 0),
(44, 'zwei | drei', '2019-04-17 12:04:21', 0),
(45, 'zwei | drei', '2019-04-17 12:04:24', 0),
(46, 'zwei | drei', '2019-04-17 12:04:51', 0),
(47, 'zwei | drei', '2019-04-17 12:04:29', 0),
(48, 'zwei | drei', '2019-04-17 12:04:45', 0),
(49, 'zwei | drei', '2019-04-17 12:04:12', 0),
(50, 'zwei | drei', '2019-04-17 12:04:27', 0),
(51, '', '2019-04-17 15:04:24', 1),
(52, '', '2019-04-17 15:04:37', 1),
(53, '', '2019-04-17 15:04:52', 1),
(54, '', '2019-04-17 15:04:38', 1),
(55, '', '2019-04-17 15:04:21', 1),
(56, '', '2019-04-17 15:04:00', 1),
(57, '', '2019-04-17 15:04:24', 1),
(58, '', '2019-04-17 15:04:37', 1),
(59, '', '2019-04-17 15:04:56', 1),
(60, '', '2019-04-17 15:04:10', 1),
(61, '', '2019-04-17 15:04:17', 1),
(62, '', '2019-04-17 15:04:25', 1),
(63, '', '2019-04-17 15:04:55', 1),
(64, '', '2019-04-17 15:04:27', 1),
(65, '', '2019-04-17 15:04:20', 1),
(66, '', '2019-04-17 15:04:27', 1),
(67, '', '2019-04-17 15:04:32', 1),
(68, '', '2019-04-17 15:04:34', 1),
(69, '', '2019-04-17 15:04:31', 1),
(70, '', '2019-04-17 15:04:42', 1),
(71, '', '2019-04-17 15:04:51', 1),
(72, '', '2019-04-17 15:04:02', 1),
(73, '', '2019-04-17 15:04:15', 1),
(74, '', '2019-04-17 15:04:00', 1),
(75, '', '2019-04-17 15:04:02', 1),
(76, '', '2019-04-17 15:04:32', 1),
(77, '', '2019-04-17 15:04:39', 1),
(78, '', '2019-04-17 15:04:04', 1),
(79, '', '2019-04-17 15:04:08', 1),
(80, '', '2019-04-17 15:04:32', 1),
(81, '', '2019-04-17 15:04:47', 1),
(82, '', '2019-04-17 15:04:15', 1),
(83, '', '2019-04-17 15:04:46', 1),
(84, '', '2019-04-17 15:04:47', 1),
(85, '', '2019-04-17 15:04:49', 1),
(86, '', '2019-04-17 15:04:06', 1),
(87, '', '2019-04-17 15:04:17', 1),
(88, '', '2019-04-17 15:04:39', 1),
(89, '', '2019-04-17 15:04:46', 1),
(90, '', '2019-04-17 15:04:56', 1),
(91, '', '2019-04-17 15:04:30', 1),
(92, '', '2019-04-17 15:04:36', 1),
(93, '', '2019-04-17 15:04:40', 1),
(94, '', '2019-04-17 15:04:49', 1),
(95, '', '2019-04-17 15:04:54', 1),
(96, '', '2019-04-17 15:04:13', 1),
(97, '', '2019-04-17 15:04:14', 1),
(98, '', '2019-04-17 15:04:20', 1),
(99, '', '2019-04-17 15:04:27', 1),
(100, '', '2019-04-17 15:04:31', 1),
(101, '', '2019-04-17 15:04:02', 1),
(102, '', '2019-04-17 15:04:07', 1),
(103, '', '2019-04-17 16:04:01', 1),
(104, '', '2019-04-17 16:04:16', 1),
(105, '', '2019-04-17 16:04:09', 1),
(106, '', '2019-04-17 16:04:15', 1),
(107, '', '2019-04-17 16:04:34', 1),
(108, '', '2019-04-17 16:04:01', 1),
(109, '', '2019-04-17 16:04:22', 1),
(110, '', '2019-04-17 16:04:03', 1),
(111, 'foto', '2019-04-17 17:04:54', 0),
(112, '', '2019-05-21 08:05:32', 1),
(113, 'Mitarbeiter', '2019-05-21 08:05:59', 0),
(114, 'Mitarbeiter', '2019-05-21 08:05:34', 0),
(115, 'Mitarbeiter', '2019-05-21 08:05:46', 0),
(116, 'Mitarbeiter', '2019-05-21 08:05:03', 0),
(117, 'Mitarbeiter', '2019-05-21 08:05:46', 0),
(118, 'Mitarbeiter', '2019-05-21 08:05:11', 0),
(119, 'oberrad', '2019-05-21 08:05:37', 0),
(120, '', '2019-05-21 08:05:50', 1),
(121, '', '2019-05-21 08:05:04', 1),
(122, 'Auftragsverarbeitung', '2019-05-21 14:05:13', 0),
(123, 'Auftragsverarbeitung', '2019-05-21 14:05:26', 0),
(124, 'Auftrags', '2019-05-21 14:05:32', 0),
(125, 'Auftrags', '2019-05-21 17:05:02', 0),
(126, 'Auftrags', '2019-05-21 17:05:38', 0),
(127, 'Auftrags', '2019-05-21 17:05:09', 0),
(128, 'Auftrags', '2019-05-21 17:05:14', 0),
(129, 'Auftrags', '2019-05-21 17:05:46', 0),
(130, 'Auftrags', '2019-05-21 17:05:39', 0),
(131, 'Auftrags', '2019-05-21 17:05:17', 0),
(132, 'Auftrags', '2019-05-21 17:05:28', 0),
(133, 'Auftrags', '2019-05-21 17:05:43', 0),
(134, 'Auftrags', '2019-05-21 17:05:02', 0),
(135, 'Auftrags', '2019-05-21 17:05:29', 0),
(136, 'Auftrags', '2019-05-21 17:05:55', 0),
(137, 'vertrag', '2019-05-21 17:05:44', 0),
(138, 'Lorem', '2019-05-21 17:05:11', 0),
(139, 'Lorem', '2019-05-21 17:05:48', 0),
(140, 'Lorem', '2019-05-21 17:05:10', 0),
(141, 'Lorem', '2019-05-21 18:05:16', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_tags`
--

DROP TABLE IF EXISTS `morp_tags`;
CREATE TABLE `morp_tags` (
  `tagID` int(11) NOT NULL,
  `tag_long` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tag` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `morp_tags`
--

INSERT INTO `morp_tags` (`tagID`, `tag_long`, `tag`, `category_id`) VALUES
(47, 'Malen', 'Malen', 8),
(48, 'Schreiben', 'Schreiben', 8),
(49, 'Neugierig', 'Neugierig', 9),
(50, 'Traurig', 'Traurig', 9),
(52, 'Mädchen', 'Mädchen', 20),
(53, 'Junge', 'Junge', 20),
(55, '2 Jungen', '2 Jungen', 20),
(56, 'vorhanden', 'vorhanden', 12),
(57, 'nicht notwendig', 'nicht notwendigz', 12),
(58, 'Jochen Günther', 'Jochen Günther', 13),
(59, 'Anja Jahn', 'Anja Jahn', 13),
(60, 'Stefanie Kösling', 'Stefanie Kösling', 13),
(61, 'Daniela Krenzer', 'Daniela Krenzer', 13),
(62, 'BAG', 'BAG', 11),
(63, 'FAN', 'FAN', 11),
(68, 'nicht notwendig', 'nicht notwendigzzzz', 12),
(69, 'Mädchen', 'Mädchen', 20),
(70, 'Junge', 'Junge', 20),
(71, '2 Mädchen', '2 Mädchen', 20),
(72, '2 Jungen', '2 Jungen', 20),
(73, 'Team Kinderbüro', 'Team Kinderbüro', 22),
(74, 'Politiker*innen', 'Politiker*innen', 22),
(75, 'Künstler*innen', 'Künstler*innen', 22),
(77, 'Traurig', 'Traurig', 9),
(78, 'Nachdenklich', 'Nachdenklich', 9),
(79, 'Bündnisschlüssel', 'Bündnisschlüssel', 11),
(80, 'Stadt der Kinder', 'Stadt der Kinder', 11),
(81, 'Stark durch Erziehung', 'Stark durch Erziehung', 11),
(82, 'Nahaufnahme', 'Nahaufnahme', 10),
(83, 'Totale', 'Totale', 10),
(84, 'Portrait', 'Portrait', 10),
(85, 'Jochen Günther', 'Jochen Günther', 13),
(86, 'Anja Jahn', 'Anja Jahn', 13),
(87, 'Stefanie Kösling', 'Stefanie Kösling', 13),
(88, 'Spiel', 'Spiel', 8),
(89, 'Sport', 'Sport', 8),
(98, 'teer', 'teer', 21),
(99, 'uii', 'uii', 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_tags_category`
--

DROP TABLE IF EXISTS `morp_tags_category`;
CREATE TABLE `morp_tags_category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `morp_tags_category`
--

INSERT INTO `morp_tags_category` (`id`, `name`, `id_user`) VALUES
(7, 'Wo?', 2),
(8, 'Was?', 2),
(9, 'Stimmung', 2),
(10, 'Typ des Fotos', 2),
(11, 'Symbol / Logo/ Namenszug', 2),
(12, 'Einverständniserklärung', 2),
(13, 'Urheber*innen', 2),
(20, 'Menschen', 2),
(21, 'Alter', 2),
(22, 'Persönlichkeiten', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `morp_tags_list`
--

DROP TABLE IF EXISTS `morp_tags_list`;
CREATE TABLE `morp_tags_list` (
  `tagListID` int(11) NOT NULL,
  `tagID` int(11) NOT NULL,
  `targetID` int(11) NOT NULL,
  `art` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `morp_tags_list`
--

INSERT INTO `morp_tags_list` (`tagListID`, `tagID`, `targetID`, `art`) VALUES
(3177, 2, 6, 'news'),
(3176, 3, 5, 'news'),
(3175, 4, 5, 'news'),
(3174, 10, 5, 'news'),
(3167, 10, 4, 'news'),
(3166, 27, 4, 'news'),
(3165, 4, 4, 'news'),
(3232, 2, 3, 'news'),
(3249, 4, 1, 'image'),
(3151, 1, 2, 'news'),
(3231, 10, 3, 'news'),
(3230, 4, 3, 'news'),
(3229, 3, 3, 'news'),
(3228, 8, 3, 'news'),
(3197, 4, 10, 'image'),
(3150, 3, 2, 'news'),
(3270, 44, 7, 'news'),
(3557, 6, 56, 'image'),
(3556, 4, 56, 'image'),
(3555, 5, 56, 'image'),
(3560, 3, 59, 'image'),
(3559, 10, 59, 'image'),
(3558, 27, 59, 'image'),
(3562, 4, 53, 'image'),
(3561, 5, 53, 'image'),
(3227, 5, 3, 'news'),
(3252, 3, 72, 'image'),
(3251, 2, 72, 'image'),
(3250, 10, 72, 'image'),
(3629, 27, 18, 'image'),
(3628, 3, 18, 'image'),
(3627, 43, 18, 'image'),
(3626, 1, 18, 'image'),
(3635, 7, 25, 'image'),
(3634, 44, 25, 'image'),
(3633, 43, 25, 'image'),
(3632, 2, 25, 'image'),
(3631, 1, 25, 'image'),
(3630, 27, 25, 'image'),
(3639, 42, 23, 'image'),
(3638, 3, 23, 'image'),
(3637, 44, 23, 'image'),
(3636, 2, 23, 'image'),
(3643, 44, 24, 'image'),
(3642, 3, 24, 'image'),
(3641, 2, 24, 'image'),
(3640, 4, 24, 'image'),
(3646, 9, 26, 'image'),
(3645, 3, 26, 'image'),
(3644, 43, 26, 'image');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `timetables`
--

DROP TABLE IF EXISTS `timetables`;
CREATE TABLE `timetables` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `date` varchar(10) NOT NULL,
  `day` varchar(10) NOT NULL,
  `start_time` varchar(10) CHARACTER SET latin1 NOT NULL,
  `end_time` varchar(10) CHARACTER SET latin1 NOT NULL,
  `color` int(11) NOT NULL,
  `description` text NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 1,
  `invite` int(11) NOT NULL,
  `inviteText` varchar(255) NOT NULL,
  `enddate` varchar(10) NOT NULL,
  `event` int(11) NOT NULL,
  `confirmed` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `timetables`
--

INSERT INTO `timetables` (`id`, `name`, `image`, `date`, `day`, `start_time`, `end_time`, `color`, `description`, `state`, `invite`, `inviteText`, `enddate`, `event`, `confirmed`) VALUES
(1, 'Treffen am Main', '20161223_epd_rainer_oettel_ostern_3420_rdax_1140x541_60.jpg', '20-05-2019', '', '16:00', '21:00', 1, 'Lass Dich Ã¼berraschen', 1, 1, 'Wollen Sie dabei sein?', '', 1, 1),
(2, 'OsterfrÃ¼hstÃ¼ck', 'Osterhase_im_Narzissenfeld_2fe06cd36ddaed69d69203d08d147ffe.jpg', '22-05-2019', '', '09:00', '18:00', 2, 'Test ganzer Tag', 1, 1, 'Wir freuen uns auf Sie und Ihre Partner', '', 2, 1),
(3, 'FrÃ¼hstÃ¼ck', 'chalet-schiwago-kontakt-IMG_3166.jpg', '23-05-2019', '', '08:05', '11:10', 3, 'FrÃ¼hstÃ¼ck mit der GF', 1, 1, 'Sie kÃ¶nnen mit 2 Personen teilnehmen', '', 3, 1),
(4, 'Jour Fix Marketing', '', '01-04-2019', 'tuesday', '09:15', '10:00', 1, '', 1, 0, '', '06-06-2019', 0, 1),
(5, 'frÃ¼h', '', '22-05-2019', '', '15:00', '20:00', 2, 'Beschreibung', 1, 0, '', '', 0, 0),
(6, 'spÃ¤t', '', '15-01-2020', '', '', '', 1, '', 1, 0, '', '', 0, 0),
(7, 'sehr spÃ¤t', '', '03-06-2020', '', '', '', 1, '', 1, 0, '', '', 0, 0),
(8, 'PrÃ¤sentation Intranet', '', '21-05-2019', '', '14:00', '15:25', 4, 'K5 prÃ¤sentiert die neue Intranet LÃ¶sung', 1, 0, '', '', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` char(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `salt` char(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `role` int(11) NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `salt`, `email`, `role`, `state`) VALUES
(1, 'Admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '32adb74318e6e57f', 'admin@gmail.com', 1, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `morp_blog`
--
ALTER TABLE `morp_blog`
  ADD PRIMARY KEY (`fBlogID`);

--
-- Chỉ mục cho bảng `morp_blog_kat`
--
ALTER TABLE `morp_blog_kat`
  ADD PRIMARY KEY (`fBlogKatID`);

--
-- Chỉ mục cho bảng `morp_cms_angebote`
--
ALTER TABLE `morp_cms_angebote`
  ADD PRIMARY KEY (`aid`);

--
-- Chỉ mục cho bảng `morp_cms_content`
--
ALTER TABLE `morp_cms_content`
  ADD PRIMARY KEY (`cid`);

--
-- Chỉ mục cho bảng `morp_cms_content_history`
--
ALTER TABLE `morp_cms_content_history`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `morp_cms_form`
--
ALTER TABLE `morp_cms_form`
  ADD PRIMARY KEY (`fid`);

--
-- Chỉ mục cho bảng `morp_cms_form_auswertung`
--
ALTER TABLE `morp_cms_form_auswertung`
  ADD PRIMARY KEY (`aid`);

--
-- Chỉ mục cho bảng `morp_cms_form_field`
--
ALTER TABLE `morp_cms_form_field`
  ADD PRIMARY KEY (`ffid`);

--
-- Chỉ mục cho bảng `morp_cms_galerie`
--
ALTER TABLE `morp_cms_galerie`
  ADD PRIMARY KEY (`gid`);

--
-- Chỉ mục cho bảng `morp_cms_galerie_comments`
--
ALTER TABLE `morp_cms_galerie_comments`
  ADD PRIMARY KEY (`commentsID`),
  ADD UNIQUE KEY `commentsID` (`commentsID`);

--
-- Chỉ mục cho bảng `morp_cms_galerie_folders`
--
ALTER TABLE `morp_cms_galerie_folders`
  ADD PRIMARY KEY (`folderID`);

--
-- Chỉ mục cho bảng `morp_cms_galerie_folders_images`
--
ALTER TABLE `morp_cms_galerie_folders_images`
  ADD PRIMARY KEY (`imagesID`);

--
-- Chỉ mục cho bảng `morp_cms_galerie_group`
--
ALTER TABLE `morp_cms_galerie_group`
  ADD PRIMARY KEY (`ggid`);

--
-- Chỉ mục cho bảng `morp_cms_galerie_guests`
--
ALTER TABLE `morp_cms_galerie_guests`
  ADD PRIMARY KEY (`guestID`);

--
-- Chỉ mục cho bảng `morp_cms_galerie_likes`
--
ALTER TABLE `morp_cms_galerie_likes`
  ADD PRIMARY KEY (`likesID`),
  ADD UNIQUE KEY `mid` (`mid`,`gid`);

--
-- Chỉ mục cho bảng `morp_cms_galerie_name`
--
ALTER TABLE `morp_cms_galerie_name`
  ADD PRIMARY KEY (`gnid`);

--
-- Chỉ mục cho bảng `morp_cms_image`
--
ALTER TABLE `morp_cms_image`
  ADD PRIMARY KEY (`imgid`);

--
-- Chỉ mục cho bảng `morp_cms_img_group`
--
ALTER TABLE `morp_cms_img_group`
  ADD PRIMARY KEY (`gid`);

--
-- Chỉ mục cho bảng `morp_cms_meinungen`
--
ALTER TABLE `morp_cms_meinungen`
  ADD PRIMARY KEY (`tid`);

--
-- Chỉ mục cho bảng `morp_cms_meinungen_comments`
--
ALTER TABLE `morp_cms_meinungen_comments`
  ADD PRIMARY KEY (`commentsID`),
  ADD UNIQUE KEY `commentsID` (`commentsID`);

--
-- Chỉ mục cho bảng `morp_cms_meinungen_likes`
--
ALTER TABLE `morp_cms_meinungen_likes`
  ADD PRIMARY KEY (`likesID`),
  ADD UNIQUE KEY `mid` (`mid`,`tid`);

--
-- Chỉ mục cho bảng `morp_cms_meinungen_topics`
--
ALTER TABLE `morp_cms_meinungen_topics`
  ADD PRIMARY KEY (`topicID`);

--
-- Chỉ mục cho bảng `morp_cms_nav`
--
ALTER TABLE `morp_cms_nav`
  ADD PRIMARY KEY (`navid`),
  ADD UNIQUE KEY `navid` (`ebene`,`navid`,`parent`);

--
-- Chỉ mục cho bảng `morp_cms_news`
--
ALTER TABLE `morp_cms_news`
  ADD PRIMARY KEY (`nid`);

--
-- Chỉ mục cho bảng `morp_cms_news_confirmed`
--
ALTER TABLE `morp_cms_news_confirmed`
  ADD PRIMARY KEY (`cid`);

--
-- Chỉ mục cho bảng `morp_cms_news_group`
--
ALTER TABLE `morp_cms_news_group`
  ADD PRIMARY KEY (`ngid`);

--
-- Chỉ mục cho bảng `morp_cms_pdf`
--
ALTER TABLE `morp_cms_pdf`
  ADD PRIMARY KEY (`pid`);

--
-- Chỉ mục cho bảng `morp_cms_pdf_count`
--
ALTER TABLE `morp_cms_pdf_count`
  ADD PRIMARY KEY (`countID`);

--
-- Chỉ mục cho bảng `morp_cms_pdf_group`
--
ALTER TABLE `morp_cms_pdf_group`
  ADD PRIMARY KEY (`pgid`);

--
-- Chỉ mục cho bảng `morp_cms_pdf_group__`
--
ALTER TABLE `morp_cms_pdf_group__`
  ADD PRIMARY KEY (`pgid`);

--
-- Chỉ mục cho bảng `morp_cms_pfad`
--
ALTER TABLE `morp_cms_pfad`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `morp_cms_protokoll`
--
ALTER TABLE `morp_cms_protokoll`
  ADD PRIMARY KEY (`prid`);

--
-- Chỉ mục cho bảng `morp_cms_telegram`
--
ALTER TABLE `morp_cms_telegram`
  ADD PRIMARY KEY (`tid`);

--
-- Chỉ mục cho bảng `morp_cms_telegram_comments`
--
ALTER TABLE `morp_cms_telegram_comments`
  ADD PRIMARY KEY (`commentsID`),
  ADD UNIQUE KEY `commentsID` (`commentsID`);

--
-- Chỉ mục cho bảng `morp_cms_user`
--
ALTER TABLE `morp_cms_user`
  ADD PRIMARY KEY (`uid`);

--
-- Chỉ mục cho bảng `morp_color`
--
ALTER TABLE `morp_color`
  ADD PRIMARY KEY (`colid`);

--
-- Chỉ mục cho bảng `morp_download`
--
ALTER TABLE `morp_download`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `morp_einladung_liste`
--
ALTER TABLE `morp_einladung_liste`
  ADD PRIMARY KEY (`eid`);

--
-- Chỉ mục cho bảng `morp_events`
--
ALTER TABLE `morp_events`
  ADD PRIMARY KEY (`eventid`);

--
-- Chỉ mục cho bảng `morp_event_zusage`
--
ALTER TABLE `morp_event_zusage`
  ADD PRIMARY KEY (`zusageid`);

--
-- Chỉ mục cho bảng `morp_fa`
--
ALTER TABLE `morp_fa`
  ADD PRIMARY KEY (`faid`);

--
-- Chỉ mục cho bảng `morp_intranet_user`
--
ALTER TABLE `morp_intranet_user`
  ADD PRIMARY KEY (`mid`),
  ADD UNIQUE KEY `uname` (`uname`);

--
-- Chỉ mục cho bảng `morp_settings`
--
ALTER TABLE `morp_settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `morp_settings_css`
--
ALTER TABLE `morp_settings_css`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `morp_settings_fonts`
--
ALTER TABLE `morp_settings_fonts`
  ADD PRIMARY KEY (`fontID`);

--
-- Chỉ mục cho bảng `morp_sprachdatei`
--
ALTER TABLE `morp_sprachdatei`
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `morp_suche_count`
--
ALTER TABLE `morp_suche_count`
  ADD PRIMARY KEY (`sid`),
  ADD UNIQUE KEY `kid` (`kid`,`navid`,`art`);

--
-- Chỉ mục cho bảng `morp_suche_track`
--
ALTER TABLE `morp_suche_track`
  ADD PRIMARY KEY (`ms`);

--
-- Chỉ mục cho bảng `morp_tags`
--
ALTER TABLE `morp_tags`
  ADD PRIMARY KEY (`tagID`);

--
-- Chỉ mục cho bảng `morp_tags_category`
--
ALTER TABLE `morp_tags_category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `morp_tags_list`
--
ALTER TABLE `morp_tags_list`
  ADD PRIMARY KEY (`tagListID`);

--
-- Chỉ mục cho bảng `timetables`
--
ALTER TABLE `timetables`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `morp_blog`
--
ALTER TABLE `morp_blog`
  MODIFY `fBlogID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `morp_blog_kat`
--
ALTER TABLE `morp_blog_kat`
  MODIFY `fBlogKatID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `morp_cms_angebote`
--
ALTER TABLE `morp_cms_angebote`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `morp_cms_content`
--
ALTER TABLE `morp_cms_content`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT cho bảng `morp_cms_content_history`
--
ALTER TABLE `morp_cms_content_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT cho bảng `morp_cms_form`
--
ALTER TABLE `morp_cms_form`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `morp_cms_form_auswertung`
--
ALTER TABLE `morp_cms_form_auswertung`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `morp_cms_form_field`
--
ALTER TABLE `morp_cms_form_field`
  MODIFY `ffid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `morp_cms_galerie`
--
ALTER TABLE `morp_cms_galerie`
  MODIFY `gid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT cho bảng `morp_cms_galerie_comments`
--
ALTER TABLE `morp_cms_galerie_comments`
  MODIFY `commentsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `morp_cms_galerie_folders`
--
ALTER TABLE `morp_cms_galerie_folders`
  MODIFY `folderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `morp_cms_galerie_folders_images`
--
ALTER TABLE `morp_cms_galerie_folders_images`
  MODIFY `imagesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `morp_cms_galerie_group`
--
ALTER TABLE `morp_cms_galerie_group`
  MODIFY `ggid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `morp_cms_galerie_guests`
--
ALTER TABLE `morp_cms_galerie_guests`
  MODIFY `guestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `morp_cms_galerie_likes`
--
ALTER TABLE `morp_cms_galerie_likes`
  MODIFY `likesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT cho bảng `morp_cms_galerie_name`
--
ALTER TABLE `morp_cms_galerie_name`
  MODIFY `gnid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `morp_cms_image`
--
ALTER TABLE `morp_cms_image`
  MODIFY `imgid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `morp_cms_img_group`
--
ALTER TABLE `morp_cms_img_group`
  MODIFY `gid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `morp_cms_meinungen`
--
ALTER TABLE `morp_cms_meinungen`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `morp_cms_meinungen_comments`
--
ALTER TABLE `morp_cms_meinungen_comments`
  MODIFY `commentsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `morp_cms_meinungen_likes`
--
ALTER TABLE `morp_cms_meinungen_likes`
  MODIFY `likesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `morp_cms_meinungen_topics`
--
ALTER TABLE `morp_cms_meinungen_topics`
  MODIFY `topicID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `morp_cms_nav`
--
ALTER TABLE `morp_cms_nav`
  MODIFY `navid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `morp_cms_news`
--
ALTER TABLE `morp_cms_news`
  MODIFY `nid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `morp_cms_news_confirmed`
--
ALTER TABLE `morp_cms_news_confirmed`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `morp_cms_news_group`
--
ALTER TABLE `morp_cms_news_group`
  MODIFY `ngid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `morp_cms_pdf`
--
ALTER TABLE `morp_cms_pdf`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `morp_cms_pdf_count`
--
ALTER TABLE `morp_cms_pdf_count`
  MODIFY `countID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `morp_cms_pdf_group`
--
ALTER TABLE `morp_cms_pdf_group`
  MODIFY `pgid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `morp_cms_pfad`
--
ALTER TABLE `morp_cms_pfad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `morp_cms_protokoll`
--
ALTER TABLE `morp_cms_protokoll`
  MODIFY `prid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `morp_cms_telegram`
--
ALTER TABLE `morp_cms_telegram`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `morp_cms_telegram_comments`
--
ALTER TABLE `morp_cms_telegram_comments`
  MODIFY `commentsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `morp_cms_user`
--
ALTER TABLE `morp_cms_user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `morp_color`
--
ALTER TABLE `morp_color`
  MODIFY `colid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `morp_download`
--
ALTER TABLE `morp_download`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `morp_einladung_liste`
--
ALTER TABLE `morp_einladung_liste`
  MODIFY `eid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `morp_events`
--
ALTER TABLE `morp_events`
  MODIFY `eventid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `morp_event_zusage`
--
ALTER TABLE `morp_event_zusage`
  MODIFY `zusageid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `morp_fa`
--
ALTER TABLE `morp_fa`
  MODIFY `faid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=348;

--
-- AUTO_INCREMENT cho bảng `morp_intranet_user`
--
ALTER TABLE `morp_intranet_user`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `morp_settings`
--
ALTER TABLE `morp_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `morp_settings_css`
--
ALTER TABLE `morp_settings_css`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `morp_settings_fonts`
--
ALTER TABLE `morp_settings_fonts`
  MODIFY `fontID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT cho bảng `morp_sprachdatei`
--
ALTER TABLE `morp_sprachdatei`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `morp_suche_count`
--
ALTER TABLE `morp_suche_count`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT cho bảng `morp_suche_track`
--
ALTER TABLE `morp_suche_track`
  MODIFY `ms` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT cho bảng `morp_tags`
--
ALTER TABLE `morp_tags`
  MODIFY `tagID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT cho bảng `morp_tags_category`
--
ALTER TABLE `morp_tags_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `morp_tags_list`
--
ALTER TABLE `morp_tags_list`
  MODIFY `tagListID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3647;

--
-- AUTO_INCREMENT cho bảng `timetables`
--
ALTER TABLE `timetables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
