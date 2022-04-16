# Автобусные остановки
## Описание
Приложение позволяет посмотреть информацию о том когда прибудет ближайший автобус на выбранную остановку.
На первоначальном экране располагается таблица в которой содержаться все возможные для просмотра остановки.
После выбора осиновке открывается карта с расположенной в нижней части экранна информацией об остановки.
Данную информационную панель можно скрыть нажав на крестик и открыть снова нажав на отмеченную точку на карте.
Вернуться к списку остановок возможно нажав на кнопку в правом в верхнем углу экрана или свайпнув экран.
Приложения запоминает остановку на которой вы его закрыли и при следующем открытие сразу покажет ее.
Так же приложения адаптированна под темную и светлую тему.

## Технологии
- Приложение выполнена на Swift 5.
- Верстка производилась из кода.
- Использовалась архитектура MVP, но с добавлением билдера и роутера для более удобном переходе между экранами.
- Все возможные поля закрыты протоколами, ради соблюдение принципов SOLID и что бы было возможно инъекция зависимостей
для хорошего Unit тестирования.
- Так же логика работы с сетью была вынесена в отдельный класс.
- Для получения цвета из HEX был расширен класс UIColor.
- Так же написаны Unit тесты.
- Для сохранения данных после закрытия приложений использовал UserDefaults.
