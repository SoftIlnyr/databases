Задание 2: файл V1.1.1__add_tables__metrics.sql
Задание 3: файл Task3.sql
Задание 4: V1.1.2__update_tables__metrics.sql

Основная идея задания 4: В таблицу метрики добавляем поля 
Формула (formula), Название переменной (var_name) и Зависимая переменная (dependent);

API берет информацию по метрике, видит, что она зависима, берет у нее формулу, 
в которую прописаны другие метрики при помощи var_name. Например, метрики
1 и 2 имеют var_name x1 и x2. Какая-нибудь метрика 3 имеет var_name x3 и 
формулу "x1 * x2" , "func(x1, x2)".

API парсит эту формулу, вставляет в нее нужные метрики (берет их через таблицу metric_relation, либо ищет по метрикам по var_name),
и, после вычисления формулы, вводит значений для метрики с формулой. 

