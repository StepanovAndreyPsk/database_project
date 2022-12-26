-- task 6

-- 6.1 Выведем список доступных курсов для каждого уровня подписки
SELECT st.subscription_name, string_agg(c.course_name, ', ')
FROM school.subscription_type_X_course stc
    INNER JOIN school.course c
        ON stc.course_id = c.course_id
    INNER JOIN school.subscription_type st
        ON st.subscription_type_id = stc.subscription_type_id
GROUP BY st.subscription_type_id;


-- 6.2 Выведем топ 3 курсов по популярности
SELECT c.course_name, count(user_id) as student_num
FROM school.user_x_course uc
    JOIN school.course c
        on uc.course_id = c.course_id
GROUP BY c.course_name
ORDER BY student_num
LIMIT 3;

-- 6.3 Для каждого пользователя выведем изменение стоимости преобретаемой им подписки
--     Формат вывода: имя пользователя - дата активации текущей подписки - разница в стоимости относительно предыдущей
--     Вывод должен содержать данные только для тех пользователей

SELECT *
FROM (
SELECT user_name, activation_date,
       cost_per_month - lag(cost_per_month) OVER (PARTITION BY ust.user_id ORDER BY activation_date) as cost_difference
FROM school.user_x_subscription_type ust
    LEFT JOIN school.subscription_type st
        ON ust.subscription_type_id = st.subscription_type_id
    LEFT JOIN school.user u
        ON ust.user_id = u.user_id) as stat
WHERE stat.cost_difference IS NOT NULL;

-- 6.4 Для каждого пользователя выведем список обязательных экзаменов, которые он должен сдать
SELECT u.user_id as user_id, user_name, string_agg(exam_name, ', ')
FROM school.user_x_course uc
    INNER JOIN school.course_X_exam ce
        ON uc.course_id = ce.course_id
    INNER JOIN school.exam e
        ON ce.exam_id = e.exam_id
    INNER JOIN school.user u
        ON u.user_id = uc.user_id
WHERE ce.mandatory IS TRUE
GROUP BY u.user_id;

-- 6.5 Для каждого пользователя вывести для каждого завершённого им курса общий срежний балл,
-- полученный им за завершённые курсы до этого момента
SELECT user_name, start_date as course_start_date, avg(score) OVER (PARTITION BY uc.user_id ORDER BY start_date) as accum_average
FROM school.user_X_course uc
    LEFT JOIN school.user u
        ON u.user_id = uc.user_id
WHERE uc.completed = TRUE;
