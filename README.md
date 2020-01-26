

# CocktailFinder

English:
> Mix and find cocktials based on your ingredients. CocktailFinder is a simple example application for programming with HTML, JavaScript, PHP and a MySql database.

Deutsch (German):

> Mixe und finde Cocktials anhand deiner Zutaten. CocktailFinder ist eine einfache Beispielanwendung für die Programmierung mit HTML, JavaScript, PHP und einer MySql-Datenbank.

## Try it live
* Try it [LIVE](https://cocktailfinder.yaaw.de/).
* The Admin-Interface which is used to add new cocktails into the list is located at `https://cocktailfinder.yaaw.de/add.html`

## Used technologies
* PHP used for back-end
* MySql used for database
* jQuery, Bootstrap4 used for front-end

## Setup CocktailFinder on your local machine 

1. Create MySql Database. Import `\docs\Database\cocktail.sql`
2. Create `secrets.php` into `\core\`:
    ```
    <?php
    // MySql secrets
    define('DB_HOST', 'localhost');
    define('DB_USER', 'DB_USER');
    define('DB_PASSWORD', 'DB_PASSWORD');
    define('DB_DATABASE', 'DB_DATABASE');
    
    // Common
    define('CORS', 'https://cocktailfinder.yaaw.de');
    define('ADMIN_PASSWORD', 'ADMIN_PASSWORD');
    ?>
    ```
3. Check `url` variable within `\assets\js\app.js` and `\assets\js\add.js` to locate the running backend.

## Securing this application
1. Change CORS-Headers to your domain.
2. Disallow calling, remove completely `\core\control\saveCocktail.php` or set a very strong `ADMIN_PASSWORD`.

