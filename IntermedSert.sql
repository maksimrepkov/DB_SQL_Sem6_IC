USE seminar6ic;

-- Задача № 1.
-- Создайте функцию, которая принимает количество секунд и форматирует их в количество дней, часов, минут и секунд. 

DROP FUNCTION IF EXISTS formatTime
DELIMITER $$
CREATE FUNCTION formatTime(n INT)
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
SET @days = n DIV 86400;
SET @hours = n DIV 3600 MOD 24;
SET @minutes = n DIV 60 MOD 60;
SET @seconds = n MOD 60;
SET @results := CONCAT(@days, ' days ', @hours, ' hours ', @minutes, ' minutes ', @seconds, ' seconds ');
RETURN @results;
END $$
DELIMITER ;

SELECT formatTime(123456);

-- Задача № 2.
-- Выведите только четные числа от 1 до 10.

DROP PROCEDURE IF EXISTS printEven
DELIMITER $$
CREATE PROCEDURE printEven(`start` INT, `end` INT)
BEGIN
	DECLARE i INT DEFAULT `start`;
    DECLARE result TEXT DEFAULT NULL;
    WHILE  i <= `end` DO
        IF i % 2 = 0 THEN
			IF result IS NULL THEN
				SET result = concat(i);
			ELSE
				SET result = concat(result, ', ', i);
			END IF;
		END IF;
        SET i = i + 1;
    END WHILE;
	SELECT result;
END $$
DELIMITER ;

CALL printEven(1, 10);