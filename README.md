# Pilvicsa — Vivero y Pilonera Ecuador

---

## 📊 CATÁLOGO DE PRODUCTOS — ENLACE CRÍTICO

> ⚠️ **NO PERDER ESTE ENLACE.** Este es el catálogo maestro de
> los 218 productos del sitio. Si se pierde el acceso a este
> documento, hay que reconstruir manualmente toda la base de
> datos de productos.

### 🔗 Google Sheet (editable) — fuente principal de datos

**URL:**
https://docs.google.com/spreadsheets/d/1S5fN0z-mpQxGTCXlFRuPgvAXFKQ77uxzCLV07Hxy0qw/edit

**Qué es:** Esta es la hoja de cálculo en vivo donde se edita el
catálogo de productos directamente — nombres, categorías,
resistencias, descripciones, ciclos, densidades, etc. Cualquier
cambio hecho aquí se refleja automáticamente en buscar.html la
próxima vez que un visitante carga la página, sin necesidad de
tocar código ni hacer un nuevo deploy.

**Estructura:**
- ID del documento: `1S5fN0z-mpQxGTCXlFRuPgvAXFKQ77uxzCLV07Hxy0qw`
- Pestaña/tab usada por el sitio: `productos_google_sheets`
- Columnas (en este orden exacto, no reordenar):
  `id, nombre, latin, categoria, pagina, pageLabel, color, forma,
  sistema, densidad, resistencias, ciclo, tamano,
  colores_disponibles, recomendaciones, familia, uso,
  descripcion, disponibilidad, imagen, youtube_id, fb_video_id,
  ig_post_id, estado, nota`
- El campo `id` debe ser único y seguir el patrón existente
  (ej. `hortalizas_001`, `florescorte_001`, `cultivoscosta_001`,
  `frutales_001`, `especies_001`, `otras_001`)
- El campo `pagina` determina en qué página de categoría aparece
  el producto (hortalizas, florescorte, cultivoscosta,
  frutalesforestales, especies, otras)
- ⚠️ **IMPORTANTE sobre el campo `imagen`:** desde junio 2026,
  buscar.html IGNORA el valor de `imagen` que viene de esta hoja
  y usa en su lugar el valor de `imagen` desde
  `data/products.json` (ver sección de código más abajo). Esto
  fue necesario porque la hoja tenía muchas rutas de imagen
  vacías o incorrectas para categorías fuera de Hortalizas. Si
  se necesita cambiar una imagen, hay que editarla en
  `data/products.json`, NO en esta hoja — editarla aquí no
  tendrá ningún efecto visible en el sitio.

### 🔗 URL de exportación CSV (uso técnico, no editar aquí)

**URL:**
https://docs.google.com/spreadsheets/d/1S5fN0z-mpQxGTCXlFRuPgvAXFKQ77uxzCLV07Hxy0qw/gviz/tq?tqx=out:csv&sheet=productos_google_sheets&headers=1

**Qué es:** Esta NO es una página para editar — es un endpoint
técnico que convierte automáticamente la pestaña
`productos_google_sheets` del Sheet de arriba en formato CSV.
Esta es la URL que `buscar.html` consume directamente vía
`fetch()` en tiempo de carga de la página (ver constante
`SHEET_URL` en buscar.html, línea ~524).

**Cómo funciona el flujo completo:**
1. Un visitante abre `buscar.html`
2. El navegador hace `fetch()` a esta URL CSV
3. Si la respuesta es exitosa, los datos se parsean y se usan
   para construir el catálogo en pantalla — EXCEPTO el campo
   `imagen`, que siempre se sobrescribe con el valor de
   `data/products.json`
4. Si el fetch falla (Sheet eliminado, sin conexión, error de
   red), el sitio usa `data/products.json` completo como
   respaldo automático

**Si esta URL deja de funcionar:** confirmar que el Sheet de
arriba sigue existiendo, que la pestaña se sigue llamando
exactamente `productos_google_sheets`, y que el documento sigue
compartido públicamente para lectura (Archivo → Compartir →
Cualquier persona con el enlace puede ver).

### 📁 Archivo de respaldo local

**Ubicación:** `data/products.json`

**Qué es:** Copia de respaldo local de todo el catálogo, en
formato JSON. Se usa automáticamente si el Google Sheet no
responde, y es además la única fuente real para el campo
`imagen` de cada producto (ver nota arriba). Si se agregan o
eliminan productos en el Google Sheet, este archivo debe
actualizarse manualmente para mantenerse sincronizado — no hay
sincronización automática entre ambos en este sentido.

---
