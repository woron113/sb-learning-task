# SB learning task

## Előkészület

### Környezet kialakítása

0. [Forkold ezt a repositoryt](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo?tool=webui)

1. A projekt docker környezetre lett felkészítve, ha nem komfortos neked saját felelőségre más környezetben is fejleszthetsz.

- [Docker telepítése](https://docs.docker.com/engine/install/)

2. Környezet felépítése
```makefile
make build
```

3. Npm packagek telepítése
```makefile
make npm-install
```

4. Vite futtatása
```makefile
make npm-dev
```

5. Parancsok kilistázása (itt találhatod a konténerek leállítását és indítását)
```makefile
make help
```

### Weboldal Design

A tervet az alábbi oldalon érheted el figmában:

[Figma design terv](https://www.figma.com/file/0NCbTpBEMFoa4urpgnUyKI/Acenda---Homepage-of-a-booking-website?type=design&node-id=0%3A1&mode=design&t=lIeSpce6VAnHyFAV-1)

## Feladat leírása

A terv alapján építsük meg az oldalt laravel keretrendszerben. Kontrollerek, modellek nem szükségesek. Az adatokat statikusan tárolhatjuk. Javascriptet nem kell írni (esetleg a mobil menü nyitogatására, de azt is meg lehet oldan css-ből). A lényeg hogy ha kell js, fel legyen készítve a build, de ha akarod a lapozókat megoldhatod css-ben.


### Stíluslapok kialakítása SCSS és BEM segítségével

#### Alap SCSS fájl létrehozása

Hozzunk létre egy alap SCSS fájlokat a projekt számára, amelyben változókat használunk a színek, betűtípusok, és méretek egyszerűbb kezelésére. Az alábbi fájl struktúra található a projektben. Példákkal a fájlok létrehozásával.
```
scss/
├── config/    
│   ├── _colors.scss  // Global variables
│   ├── _spacing.scss
│   ├── _fonts.scss  
│   │
│
├── base/
│   ├── _reset.scss
│   ├── _normalize.scss
│
├── functions/
│   ├── _index.scss               // Import functions
│   ├── _get-color.scss           // Color manipulation
│   ├── _utility.scss             // Other utility functions
│
├── mixins/
│   ├── _typography.scss          // Mixins for fonts
│   ├── _spacing.scss             // Mixins for margins and padding
│   ├── _responsive.scss          // Mixins for responsive styles
│
├── layouts/
│   ├── grid.scss               // Layout specific style
│   ├── header.scss
│   ├── footer.scss    
│
├── components/
│   ├── button.scss             // Component specific style
│   ├── card.scss 
│
├── pages/
│   ├── Home.scss               // Pages and views
│
├── third-party/
│
├── app.scss

```

- Alkalmazzuk a BEM (Block Element Modifier) CSS módszert a stílusok strukturáltabb kialakításához.
- A feladatot css keretrendszer nélkül kell megoldani
- Figyelj hogy a támogatottság a következő böngészö verziókig fedje le: Chrome 87, Safari 13.2, Firefox 91, Edge 97
- Css grid és flex box layoutot legalább az egyik section-nél használj

### HTML és Laravel Blade

1. Alakítsuk ki a Blade struktúrát az elkészített design alapján.

```
views/
├── components/    
│   ├── button.blade.php
│   ├── form/
│       ├── textfield.blade.php
│       ├── checkbox.blade.php    
│
├── layouts/                            
│   ├── head.blade.php
│   ├── header.blade.php
│   ├── footer.blade.php
│
├── pages/
│   ├── Home      
│        ├── index.blade.php 
│
├── app.blade.php

```

- Alkalmazzuk az elkészített HTML elemekre az SCSS és BEM stílusokat.
- Használjunk blade direktívákat a Laravel Blade templating segítségével.
- jobb keresőoptimalizálás és felhasználói élmény érdekében használjunk szemantikus HTML elemeket.
- Használhatsz Class-based komponenseket, de View-based komponenseket mindenképpen használj.
- Top book blockban használj html5 micro adatokat.

### Webhasználhatóság

1. Használja aria attributumokat és role-okat
Néhány példa:
- role: Meghatározza az elem szerepét az oldalon. Például, ha egy div elemnek van egy menü funkciója, akkor megadhatod neki a role="menu" attribútumot.
- aria-label: Leíró szöveg megadása az elem számára, amely segíthet a képernyőolvasóknak megérteni az elem funkcióját, ha nincs szöveges tartalom az elemen belül.
- aria-labelledby / aria-describedby: Az elemhez tartozó más elemek azonosítóinak megadása, amelyek segíthetik a felhasználókat az elem értelmének megértésében.
- aria-expanded / aria-selected / aria-checked: Az elem aktuális állapotát jelző attribútumok, például egy kinyitható menü esetén.
- aria-hidden: Az elem láthatóságának beállítása, amely segíthet az elemek megjelenítésének vagy elrejtésének vezérlésében a felhasználók számára.

2. A reszponzív elrendezés biztosítsd, hogy a weboldal jól működjön különböző eszközökön és képernyőméreteken.
