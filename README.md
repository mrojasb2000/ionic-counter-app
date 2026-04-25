# Counter App (Ionic + Angular)

Aplicación Ionic/Angular con pruebas unitarias configuradas con **Jest**.

## Cambios realizados

Se migró el sistema de pruebas desde **Karma + Jasmine** a **Jest**.

### Migración de testing

- Se reemplazó el builder de pruebas en Angular por `@angular-builders/jest:run`.
- Se eliminó la configuración legacy de Karma/Jasmine.
- Se configuró Jest para Angular con `jest-preset-angular`.
- Se ajustó el soporte para paquetes ESM de Ionic (incluyendo `ionicons`).
- Se actualizaron los tipos de pruebas de `jasmine` a `jest`.

## Scripts disponibles

```bash
npm run test
npm run test:watch
npm run test:coverage
npm run test:ci
```

### Descripción de scripts

- `test`: ejecuta pruebas con `ng test` (Jest).
- `test:watch`: ejecuta pruebas en modo watch.
- `test:coverage`: genera reporte de cobertura.
- `test:ci`: ejecuta pruebas sin watch y con cobertura (ideal para CI).

## Makefile (comandos rápidos)

También se agregó un Makefile para simplificar tareas comunes durante desarrollo.

```bash
make help
make install
make start
make build
make watch
make lint
make test
make test-watch
make test-coverage
make test-ci
make coverage-open
make clean
```

### Descripción de comandos Makefile

- `help`: lista los comandos disponibles.
- `install` / `deps`: instala dependencias.
- `start`: inicia servidor de desarrollo.
- `build`: build de producción.
- `watch`: build en modo watch para desarrollo.
- `lint`: ejecuta lint.
- `test`: ejecuta pruebas.
- `test-watch`: pruebas en watch.
- `test-coverage`: pruebas con cobertura.
- `test-ci`: pruebas para CI (sin watch + coverage).
- `coverage-open`: abre el reporte HTML de cobertura en el navegador.
- `clean`: limpia artefactos comunes (`dist`, `coverage`, `.angular/cache`).

### Comandos Git

```bash
make status
make diff
make log
make stash
make pull
make push
```

- `status`: `git status`.
- `diff`: `git diff` (cambios sin stagear).
- `log`: últimos 10 commits en formato compacto con grafo.
- `stash`: guarda cambios temporalmente con `git stash`.
- `pull`: `git pull`.
- `push`: `git push`.

## Cobertura (CI)

Se agregaron umbrales globales de cobertura en Jest:

- Statements: `50%`
- Branches: `80%`
- Functions: `35%`
- Lines: `50%`

Reporte de cobertura generado en:

- `coverage/`

## Archivos de configuración clave

- `angular.json`
- `jest.config.js`
- `tsconfig.spec.json`
- `package.json`
- `Makefile`

## Dependencias de testing

Principales dependencias agregadas/actualizadas:

- `jest`
- `jest-preset-angular`
- `ts-jest`
- `@types/jest`
- `@angular-builders/jest`
- `jsdom`

Dependencias eliminadas de la configuración anterior:

- `karma`
- `karma-jasmine`
- `karma-chrome-launcher`
- `karma-coverage`
- `jasmine-core`
- `@types/jasmine`

## Troubleshooting (Jest + Ionic)

### 1. Error de tipos: "Cannot find name 'describe' / 'it' / 'expect'"

Posible causa:

- El editor no está resolviendo `tsconfig.spec.json` para los archivos `*.spec.ts`.

Soluciones:

- Verifica que `tsconfig.spec.json` tenga en `compilerOptions.types`:
	- `jest`
	- `node`
- Como fallback para el editor, agrega al inicio del spec:
	- `/// <reference types="jest" />`
- Reinicia el servidor de TypeScript en VS Code: `TypeScript: Restart TS Server`.

### 2. Error Angular NG0400: "A platform with a different configuration has been created"

Posible causa:

- Inicialización duplicada del entorno de pruebas (por ejemplo, `setupZoneTestEnv()` adicional cuando el builder ya lo hace).

Solución:

- No inicializar manualmente el entorno si el builder `@angular-builders/jest` ya lo configura.
- Evitar `setupFilesAfterEnv` custom innecesarios para Angular test env.

### 3. Error ESM de Ionic: "Jest encountered an unexpected token 'export'"

Posible causa:

- Jest no está transformando módulos ESM dentro de `node_modules` usados por Ionic.

Solución:

- Ajustar `transformIgnorePatterns` en `jest.config.js` para permitir transformar:
	- `@ionic`
	- `@stencil`
	- `ionicons`
	- archivos `.mjs`

### 4. Error de resolución: "Cannot find module 'ionicons/components/ion-icon.js'"

Posible causa:

- Resolución de rutas de `ionicons/components/*` en entorno Jest.

Solución:

- Agregar en `jest.config.js`:
	- `moduleNameMapper` con `^ionicons/components/(.*)$` apuntando a `node_modules/ionicons/components/$1`.

### 5. Tests se quedan corriendo en CI

Posible causa:

- Ejecución en modo watch.

Solución:

- Usar `npm run test:ci` para ejecutar con `--watch=false --coverage`.

## Estado actual

- Migración completada de Karma/Jasmine a Jest.
- Pruebas unitarias ejecutando correctamente con Jest.
- Cobertura validada con `npm run test:ci`.
- Flujo de desarrollo simplificado con comandos en `Makefile`.
