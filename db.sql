CREATE TABLE `stories` (
  `id` bigint(20) NOT NULL,
  `label` text,
  `date` date NOT NULL,
  `country` varchar(2) NOT NULL,
  `json_source` text,
  PRIMARY KEY (`id`),
  KEY `date_idx` (`date`),
  KEY `country_idx` (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;