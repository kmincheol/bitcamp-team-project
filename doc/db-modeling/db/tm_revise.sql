매치보드에서 해당 게시물을 삭제 시도시 참조에러가 난다면 해야할것.

==================================== 에러 발생 

Cannot delete or update a parent row: a foreign key constraint fails
 (`teamdb`.
`mtchaply`, CONSTRAINT `FK_mtch_TO_mtchaply` FOREIGN KEY (`mtch_id`) REFERENCES `mtch` (`mtch_id`))

(`teamdb`.
`revw`, CONSTRAINT `FK_mtch_TO_revw` FOREIGN KEY (`mtch_id`) REFERENCES `mtch` (`mtch_id`))
=====================================



===================================== 해결방안
ALTER TABLE  `mtch` DROP FOREIGN KEY  `FK_tm_TO_mtch` ;
ALTER TABLE  `mtch` ADD FOREIGN KEY (  `tm_id` ) REFERENCES  `teamdb`.`tm` (
`tm_id`
) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE  `rcrm` DROP FOREIGN KEY  `FK_tm_TO_rcrm` ;
ALTER TABLE  `rcrm` ADD FOREIGN KEY (  `tm_id` ) REFERENCES  `teamdb`.`tm` (
`tm_id`
) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE  `revw` DROP FOREIGN KEY  `FK_tm_TO_revw` ;
ALTER TABLE  `revw` ADD FOREIGN KEY (  `tm_id` ) REFERENCES  `teamdb`.`tm` (
`tm_id`
) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE  `tm_mbr` DROP FOREIGN KEY  `FK_tm_TO_tm_mbr` ;
ALTER TABLE  `tm_mbr` ADD FOREIGN KEY (  `tm_mbr_id` ) REFERENCES  `teamdb`.`tm` (
`tm_id`
) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE  `warn` DROP FOREIGN KEY  `FK_tm_TO_warn` ;
ALTER TABLE  `warn` ADD FOREIGN KEY (  `tm_id` ) REFERENCES  `teamdb`.`tm` (
`tm_id`
) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE  `mtch_tag` DROP FOREIGN KEY  `FK_mtch_TO_mtch_tag` ;
ALTER TABLE  `mtch_tag` ADD FOREIGN KEY (  `mtch_id` ) REFERENCES  `teamdb`.`mtch` (
`mtch_id`
) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE  `mtchaply` DROP FOREIGN KEY  `FK_mtch_TO_mtchaply` ;
ALTER TABLE  `mtchaply` ADD FOREIGN KEY (  `mtch_id` ) REFERENCES  `teamdb`.`mtch` (
`mtch_id`
) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE  `revw` DROP FOREIGN KEY  `FK_mtch_TO_revw` ;
ALTER TABLE  `revw` ADD FOREIGN KEY (  `mtch_id` ) REFERENCES  `teamdb`.`mtch` (
`mtch_id`
) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE  `mtch` DROP FOREIGN KEY  `FK_tm_TO_mtch2` ;
ALTER TABLE  `mtch` ADD FOREIGN KEY (  `tm_id2` ) REFERENCES  `teamdb`.`tm` (
`tm_id`
) ON DELETE CASCADE ON UPDATE CASCADE;

=====================================