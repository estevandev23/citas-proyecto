# Orquestación cross-repo — Sistema ficticio de citas

## Alcance y repositorios

Este workspace contiene exactamente dos repositorios Git independientes:

- `citas-api/`: backend Java 21, Spring Boot 3.5.x, Maven, arquitectura hexagonal, MySQL/Flyway.
- `citas-web/`: frontend Next.js + TypeScript.

La raíz no debe inicializarse como repositorio Git ni contener código de aplicación.

## Fuente de verdad y orden de lectura

Antes de planificar o implementar, leer en este orden:

1. `README.md`
2. `PRD.md`
3. `RESTRICCIONES_TECNICAS.md`
4. `database/REQUISITOS_NORMALIZACION_3FN.md`
5. `citas-api/README.md`
6. `citas-web/README.md`
7. Los `AGENTS.md` de cada repositorio cuando existan
8. `citas-api/docs/wiki/llm-wiki/wiki/index.md` cuando exista

Las instrucciones específicas de cada repositorio complementan estas reglas.

## Límites de responsabilidad

- La lógica de negocio, persistencia, seguridad y API REST viven en `citas-api/`.
- La interfaz, estado de cliente y consumo REST viven en `citas-web/`.
- No usar Express ni BFF: el frontend consume directamente Spring Boot por REST.
- No inventar requisitos fuera del PRD, historias aprobadas o decisiones registradas.
- Nunca leer, exponer, reproducir ni versionar secretos o contenidos de `.env`.
- Usar exclusivamente datos sintéticos; no incorporar datos privados reales de FCV.

## Git y cambios

- `main` es estable; `develop` es la rama de trabajo.
- Preservar cambios existentes y no reescribir historial para ocultar progreso.
- No iniciar Git en la raíz.
- Antes de un cambio cross-repo: producir un plan, indicar contratos afectados y enumerar repositorios/archivos previstos.
- Si cambia un contrato REST, actualizar la documentación contractual y exigir evidencia verificable en ambos repositorios.
- Usar una HU aprobada como unidad primaria de alcance, pruebas y Definition of Done.

## Automatizaciones

Los workflows n8n se versionan exclusivamente como JSON en `citas-api/automations/n8n/`. Nunca incluir credenciales en workflows ni documentación.

## LLM Wiki global

La única wiki global vive en `citas-api/docs/wiki/llm-wiki/`.

- `raw/`: fuentes curadas, inmutables y sin secretos.
- `wiki/`: conocimiento sintetizado, enlazado y verificable.
- `schema/`: convenciones de operación y mantenimiento.
- Leer primero `wiki/index.md`; actualizarlo cuando cambie la estructura.
- Mantener `wiki/log.md` append-only para INGEST, QUERY, LEARN y LINT.
- Persistir mediante LEARN únicamente conocimiento durable, clasificado como HECHO, DECISIÓN, PREFERENCIA o PREGUNTA ABIERTA.
- No convertir la wiki en transcript ni incluir PII, credenciales, tokens o datos privados.

## Skills del curso

- `scrum-spec-orchestrator` solo puede escribir en `citas-api/docs/wiki/scrum/` y no implementa código.
- `stitch-design-to-frontend` gobierna Stitch → aprobación → AI Studio → reconciliación visual; no define ni inventa backend.
