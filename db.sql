CREATE TABLE IF NOT EXISTS `stories` (
  `id` bigint NOT NULL,
  `label` text NOT NULL,
  `date` date NOT NULL,
  `country` varchar(3) NOT NULL,
  `json_source` TEXT,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;
