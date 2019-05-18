매치보드에서 해당 게시물을 삭제 시도시 참조에러가 난다면 해야할것.

==================================== 에러 발생 

Cannot delete or update a parent row: a foreign key constraint fails
 (`teamdb`.
`mtchaply`, CONSTRAINT `FK_mtch_TO_mtchaply` FOREIGN KEY (`mtch_id`) REFERENCES `mtch` (`mtch_id`))

(`teamdb`.
`revw`, CONSTRAINT `FK_mtch_TO_revw` FOREIGN KEY (`mtch_id`) REFERENCES `mtch` (`mtch_id`))
=====================================



===================================== 해결방안
ALTER TABLE  `mtchaply` DROP FOREIGN KEY  `FK_mtch_TO_mtchaply` ;
ALTER TABLE  `mtchaply` ADD FOREIGN KEY (  `mtch_id` ) REFERENCES  `teamdb`.`mtch` (
`mtch_id`
) ON DELETE CASCADE ON UPDATE CASCADE;



ALTER TABLE  `revw` DROP FOREIGN KEY  `FK_mtch_TO_revw` ;
ALTER TABLE  `revw` ADD FOREIGN KEY (  `mtch_id` ) REFERENCES  `teamdb`.`mtch` (
`mtch_id`
) ON DELETE CASCADE ON UPDATE CASCADE;
=====================================