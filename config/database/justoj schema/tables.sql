CREATE TABLE `problems` (
  `id` int(11) NOT NULL,
  `title` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `statement` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `input` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `output` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `score` int(11) NOT NULL,
  `submissions` int(11) DEFAULT '0',
  `solved` int(11) DEFAULT '0',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB;


CREATE TABLE `problems_limit` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `language` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timelimit` decimal(3,2) DEFAULT NULL,
  `memorylimit` int(11) DEFAULT NULL
) ENGINE=InnoDB;


CREATE TABLE `submissions` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `language` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `access` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `submittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `runtime` decimal(3,2) NOT NULL,
  `runmemory` int(11) NOT NULL
) ENGINE=InnoDB;


CREATE TABLE `submission_code` (
  `id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `code` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB;


CREATE TABLE `temp_user` (
  `id` int(11) NOT NULL,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created` datetime NOT NULL,
  `expire` datetime NOT NULL,
  `token` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB;


CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `joined` datetime NOT NULL,
  `firstname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `institute` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB;

























