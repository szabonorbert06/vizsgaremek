## A DRIVESELECT weboldal fejlesztői: Hoffmann Ádám, Szabó Norbert
## Admin user --> e-mail: admin@admin.com    jelszó: admin1234
## Példa user-ek az oldal teszteléséhez:
- 1. e-mail: teszt1@blathy.info    jelszó: teszt1234
- 2. e-mail: pelda1@blathy.info    jelszó: pelda1234



# Függőségek:

### Telepíteni szükséges:

- XAMPP - https://www.apachefriends.org

- Node.js - https://nodejs.org

- Composer - https://getcomposer.org

---

### Backend:

- PHP 8.2+
- Laravel Framework 12.0+
- Laravel Sanctum 4.0+
- Laravel Tinker 2.10.1+


(Ezek mind automatikusan települnek a `composer install` paranccsal, külön nem kell letölteni őket.)

---

### Frontend:

- Node.js 20.19.0+ vagy 22.12.0+
- Vue beta (v3)
- Vue Router 5.0.3+
- Pinia 3.0.4+
- Axios 1.13.6+
- Bootstrap 5.3.8+
- Bootstrap Icons 1.13.1+
- Vite 7.3.1+

(Ezek mind automatikusan települnek az `npm install` paranccsal.)


# Indítás:

#### 1. Előkészítés:
                                                                                              
- Indítsa el a XAMPP-ot és kapcsolja be az Apache és MySQL szolgáltatásokat.
- Nyissa meg a phpMyAdmin-t, és importálja be a dump fájlt. (A adatbázis nevének egyeznie kell a `.env` fájlban szereplő `DB_DATABASE` értékkel)
- Nyissa meg a frontend és backend almappákat tartalmazó projektmappát.
                  
#### 2. Backend indítása:

Nyisson egy terminált:
- `cd backend`
- `composer install`
- `php artisan key:generate`
- `php artisan storage:link`
- `php artisan serve`

#### 3. Frontend indítása:

Nyisson egy másik terminált:
- `cd frontend`
- `npm install`
- `npm run dev`

#### 4. Megnyitás:

- A backend itt fut: http://localhost:8000
- A frontend terminál megmutatja a pontos URL-t, azt nyissa meg a böngészőben (általában http://localhost:5173)