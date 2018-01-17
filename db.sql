CREATE TABLE IF NOT EXISTS `stories` (
  `id` bigint NOT NULL,
  `label` text NOT NULL,
  `date` date NOT NULL,
  `country` varchar(2) NOT NULL,
  `json_source` TEXT,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;

CREATE INDEX date_idx ON stories (date);
CREATE INDEX country_idx ON stories (country);
