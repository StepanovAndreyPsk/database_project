-- task 4

set datestyle = 'DMY';

-- заполним таблицу user
INSERT INTO school.user(user_id, user_name, user_email, user_score)
        VALUES (1, 'Андрей Степанов', 'andreysteapanov@edu.hse.ru', 99);
INSERT INTO school.user(user_id, user_name, user_email, user_score)
        VALUES (2, 'Дмитрий Иванов', 'dmitriyivanov@edu.hse.ru', 100);
INSERT INTO school.user(user_id, user_name, user_email, user_score)
        VALUES (3, 'Егор Федоров', 'egorfedorov@edu.hse.ru', 55);
INSERT INTO school.user(user_id, user_name, user_email, user_score)
        VALUES (4, 'Евгения Соловьева', 'evgeniasoloveva@edu.hse.ru', 78);
INSERT INTO school.user(user_id, user_name, user_email, user_score)
        VALUES (5, 'Александра Герасимова', 'alexandragerasimova@edu.hse.ru', 71);

-- заполним талицу course
INSERT INTO school.course(course_id, course_name, course_length)
        VALUES(1, 'Машинное обучение', 365);
INSERT INTO school.course(course_id, course_name, course_length)
        VALUES(2, 'Математическая статистика', 90);
INSERT INTO school.course(course_id, course_name, course_length)
        VALUES(3, 'Язык программирования C++', 31);
INSERT INTO school.course(course_id, course_name, course_length)
        VALUES(4, 'Английский язык', 365);
INSERT INTO school.course(course_id, course_name, course_length)
        VALUES(5, 'Алгоритмы и структуры данных', 120);

-- заполним таблицу user_x_course
INSERT INTO school.user_X_course(user_id, course_id, start_date, score, completed)
        VALUES(1, 4, '15-12-2022', 45, FALSE),
              (2, 3, '09-09-2022', 95, TRUE),
              (2, 5, '03-10-2022', 55, TRUE),
              (3, 2, '07-12-2022', 78, FALSE),
              (4, 5, '10-11-2022', 30, FALSE),
              (5, 1, '14-10-2022', 83, TRUE);

-- заполним таблицу subscription_type
INSERT INTO school.subscription_type(subscription_type_id, subscription_name, cost_per_month)
        VALUES(1, 'Прикладная математика', 1000),
              (2, 'Программирование', 900),
              (3, 'Soft Skills', 750),
              (4, 'Machine Learning', 1500),
              (5, 'Олимпиадное программирование', 1000);

-- заполним таблицу subscription_type_x_course
INSERT INTO school.subscription_type_X_course(subscription_type_id, course_id)
        VALUES(1, 2),
              (2, 3),
              (3, 4),
              (4, 1),
              (5, 5);

-- select stc.subscription_type_id as subscrition_type_id, u.user_id as user_id, uc.start_date as start_date
--     from school.user u
--         inner join school.user_x_course uc
--         on u.user_id = uc.user_id
--     inner join school.subscription_type_X_course stc
--         on uc.course_id = stc.course_id;


-- заполним таблицу user_x_subscription_type
INSERT INTO school.user_x_subscription_type(subscription_id, subscription_type_id, user_id, activation_date, expiration_date)
        VALUES(1, 4, 5, '10-10-2022', '10-11-2022'),
              (2, 1, 3, '01-12-2022', '01-01-2023'),
              (3, 2, 2, '03-09-2022', '03-10-2022'),
              (4, 3, 1, '10-12-2022', '10-01-2023'),
              (5, 5, 4, '07-11-2022', '07-12-2022'),
              (6, 2, 5, '11-11-2022', '11-12-2022'),
              (7, 5, 5, '12-12-2022', '12-01-2023'),
              (8, 5, 5, '13-01-2023', '12-01-2023'),
              (9, 1, 2, '04-10-2022', '04-11-2022'),
              (10, 5, 2, '05-11-2022', '05-12-2022');

-- заполним таблицу mentor
INSERT INTO school.mentor(mentor_id, mentor_name, mentor_email)
        VALUES(1, 'Лопатин Александр', 'lopatinalex@gmail.com'),
              (2, 'Артемьев Кирилл', 'artemevkirill@gmail.com'),
              (3, 'Воложин Тимофей', 'volozhintimofey@gmail.com'),
              (4, 'Александрова Дарья', 'alexandrovadaria@gmail.com'),
              (5, 'Свиридова Анастасия', 'sviridovaanastasia@gmail.com');

-- заполним таблицу user_x_mentor
INSERT INTO school.user_X_mentor(user_id, mentor_id)
        VALUES(1, 2),
              (2, 3),
              (3, 4),
              (4, 5),
              (5, 1);

-- заполним таблицу teacher
INSERT INTO school.teacher(teacher_id, teacher_name, teacher_email)
        VALUES(1, 'Сергей Копелиович', 'sergeykopeliovich@yandex.ru'),
              (2, 'Руслан Пусев', 'ruslanpusev@yandex.ru'),
              (3, 'Алексей Шпильман', 'alexeyshpilman@yandex.ru'),
              (4, 'Егор Суворов', 'egorsuvorov@yandex.ru'),
              (5, 'Александра Орлова', 'alexandraorlova@yandex.ru');

-- select course_id, course_name
-- from school.course;

-- заполним табицу teacher_x_course
INSERT INTO school.teacher_X_course(teacher_id, course_id)
        VALUES  (1, 5),
                (2, 2),
                (3, 1),
                (4, 3),
                (5, 4);

-- заполним таблицу exam
INSERT INTO school.exam(exam_id, exam_name, subject)
        VALUES  (1, 'Экзамен по основам программирования', 'Программирование'),
                (2, 'IELTS', 'Английский язык'),
                (3, 'Введение в C++', 'Программирование'),
                (4, 'Экзамен по нейронным сетям', 'Машинное обучение'),
                (5, 'Экзамен по оценке гипотез', 'Статистика');

-- заполним таблицу course_x_exam
INSERT INTO school.course_X_exam(course_id, exam_id, mandatory)
        VALUES(1, 4, TRUE),
              (2, 5, FALSE),
              (3, 1, FALSE),
              (4, 2, TRUE),
              (3, 3, TRUE);