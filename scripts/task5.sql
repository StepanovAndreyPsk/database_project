
-- task 5
-- открылся новый онлайн-курс
INSERT INTO school.course(course_id, course_name, course_length)
    VALUES  (6, 'Веб-разработка', 90);

-- здесь у нас появился новый тип подписки
INSERT INTO school.subscription_type(subscription_type_id, subscription_name, cost_per_month)
        VALUES  (6, 'Всё и сразу', 5000);

-- и мы добавили все курсы в этот тип подписки
INSERT INTO school.subscription_type_X_course(subscription_type_id, course_id)
        VALUES  (6, 1),
                (6, 2),
                (6, 3),
                (6, 4),
                (6, 5),
                (6, 6);

-- решили продлить курс по С++ до 60 дней
UPDATE school.course
SET course_length = 60
WHERE course_name = 'Язык программирования C++';

-- закыли один из курсов
DELETE FROM school.course WHERE course_id = 4;

-- преподавателя закрытого курса переназначили на другой курс
INSERT INTO school.teacher_X_course(teacher_id, course_id)
VALUES (5, 6);

-- один из пользователей приостановил подписку
UPDATE school.user_x_subscription_type
SET expiration_date = '18-12-2022'
WHERE user_id = 3;

SELECT course_name, course_length
FROM school.course
WHERE course_length < 90;

SELECT count(*) as number_of_students
FROM school.user_x_course
WHERE course_id = (SELECT course_id FROM school.course WHERE course_name = 'Алгоритмы и структуры данных');