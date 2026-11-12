# Практические задания по Mermaid

В этом документе собраны решения заданий по Mermaid.

## Уровень 1: Начальный

### Задание 1.1: Простая блок-схема "Приготовление чая"

```mermaid
flowchart TD
    A([Начало]) --> B[Кипячение воды]
    B --> C{Есть ли чай?}
    C -- Да --> D[Заварить чай]
    C -- Нет --> E[Купить чай]
    E --> D
    D --> F[Пить чай]
    F --> G([Конец])
```

### Задание 1.2: Диаграмма последовательности "Заказ такси"

```mermaid
sequenceDiagram
    title Заказ такси
    participant C as Клиент
    participant App as Приложение
    participant S as Сервер
    participant D as Водитель

    C->>App: Вызвать такси
    activate App
    App->>S: Запрос на поиск водителя
    activate S
    S->>D: Поиск свободного водителя
    activate D
    D-->>S: Принять заказ
    deactivate D
    S-->>App: Водитель найден
    deactivate S
    App-->>C: Уведомление: водитель в пути
    deactivate App
    Note over D,C: Водитель едет к клиенту
    D->>C: Забирает клиента
```

## Уровень 2: Средний

### Задание 2.1: Диаграмма классов "Библиотечная система"

```mermaid
classDiagram
    class Book {
        +String title
        +String author
        +String ISBN
        +Boolean isAvailable
        +borrow()
        +returnBook()
    }
    class User {
        +String name
        +String userId
        -List~Book~ borrowedBooks
        +borrowBook(book: Book)
        +returnBook(book: Book)
    }
    class Library {
        -Book[] books
        -User[] users
        +addBook(book: Book)
        +registerUser(user: User)
        +findBook(isbn: String) Book
    }

    User "1" o-- "0..*" Book : borrowedBooks
    Library "1" *-- "0..*" Book : books
    Library "1" *-- "0..*" User : users
```

### Задание 2.2: Диаграмма Ганта "Разработка мобильного приложения"

```mermaid
gantt
    title Разработка мобильного приложения
    dateFormat  YYYY-MM-DD
    axisFormat  %d.%m

    section Подготовка
    Подготовка               :prep, 2026-01-01, 5d

    section Дизайн
    Дизайн                   :design, after prep, 7d

    section Разработка
    Фронтенд-разработка      :front, after design, 10d
    Бэкенд-разработка        :back, after prep, 12d

    section Тестирование
    Тестирование             :test, after front back, 5d
```

## Уровень 3: Продвинутый

### Задание 3.1: Архитектура веб-приложения

```mermaid
flowchart LR
    subgraph Frontend
        R[React]
        RED[Redux]
        RT[Router]
        R --> RED
        R --> RT
    end

    subgraph Backend
        N[Node.js]
        E[Express]
        M[(MongoDB)]
        N --> E
        E <--> M
    end

    subgraph External[Внешние сервисы]
        S[Stripe\nплатежи]
        SG[SendGrid\nemail]
    end

    RED <-->|REST API| E
    E -->|платежи| S
    E -->|уведомления| SG
```

### Задание 3.2: Диаграмма состояний "Заказ в интернет-магазине"

```mermaid
stateDiagram-v2
    [*] --> Новый
    Новый --> Подтвержденный : подтверждение
    Новый --> Отмененный : отмена

    Подтвержденный --> Оплаченный : оплата успешна
    Подтвержденный --> Отмененный : отмена

    state Оплата {
        [*] --> Ожидание
        Ожидание --> Авторизация
        Авторизация --> Успех
        Авторизация --> Ошибка
        Ошибка --> Ожидание : повтор
        Успех --> [*]
    }

    Оплаченный --> Отправленный : передан в доставку
    Отправленный --> Доставленный : получен клиентом
    Доставленный --> Возвращенный : возврат
    Возвращенный --> [*]
    Отмененный --> [*]
    Доставленный --> [*]
```

## Уровень 4: Экспертный

### Задание 4.1: User Journey Map "Покупка билетов в кино"

```mermaid
journey
    title Покупка билетов в кино
    section Поиск
      Поиск фильма: 4: Пользователь
      Просмотр трейлера и рейтинга: 5: Пользователь
    section Выбор
      Выбор сеанса: 4: Пользователь
      Выбор мест: 3: Пользователь
    section Оплата
      Ввод данных карты: 2: Пользователь
      Подтверждение оплаты: 4: Пользователь
    section Получение
      Получение билетов на email: 5: Пользователь
    section После посещения
      Оценка фильма/сеанса: 4: Пользователь
```

### Задание 4.2: ER-диаграмма "Социальная сеть"

```mermaid
erDiagram
    USERS ||--o{ POSTS : creates
    USERS ||--o{ COMMENTS : writes
    POSTS ||--o{ COMMENTS : has
    USERS ||--o{ LIKES : makes
    POSTS ||--o{ LIKES : receives
    USERS ||--o{ SUBSCRIPTIONS : follows
    USERS ||--o{ SUBSCRIPTIONS : followed_by

    USERS {
        int id PK
        string name
        string email
    }
    POSTS {
        int id PK
        string content
        int author_id FK
    }
    COMMENTS {
        int id PK
        string content
        int post_id FK
        int author_id FK
    }
    LIKES {
        int user_id PK, FK
        int post_id PK, FK
    }
    SUBSCRIPTIONS {
        int follower_id PK, FK
        int followee_id PK, FK
    }
```

### Задание 5: Блок-схема процесса заказа "Сервис доставки еды"

```mermaid
flowchart TD
    A([Клиент открывает приложение]) --> B[Выбор ресторана и блюд]
    B --> C[Добавление в корзину]
    C --> D{Корзина подтверждена?}
    D -- Нет --> B
    D -- Да --> E[Выбор адреса и способа оплаты]
    E --> F{Оплата успешна?}
    F -- Нет --> G[Сообщение об ошибке]
    G --> E
    F -- Да --> H[Ресторан принимает заказ]
    H --> I[Приготовление]
    I --> J[Курьер забирает заказ]
    J --> K[Доставка клиенту]
    K --> L{Заказ получен?}
    L -- Да --> M([Завершение заказа])
    L -- Проблема --> N[Поддержка/возврат]
    N --> M
```

### Задание 6: Круговая диаграмма "Автомобили на российском рынке"

```mermaid
pie showData
    title Автомобили на российском рынке
    "Иномарки" : 45
    "Отечественные" : 35
    "Совместное производство" : 20
```

---
*Диаграммы подготовлены в рамках практического задания.*
