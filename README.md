# 🎤 Proyecto: Entrega de Premios Musicales (2003–2007)

Este proyecto hecho por la empresa Trendy SL está basada en el análisis de datos musicales utilizando **Python** y **MySQL**, con visualización de resultados a través de **Canva**. El eje central gira en torno a una entrega de premios musicales que reconoce a los artistas más destacados del período 2003–2007, considerando métricas como oyentes, canciones lanzadas y genero musical.  

Además, se incorpora una **perspectiva de género** para analizar la representación femenina en la industria durante ese período.

---

## 🛠️ Tecnologías y metodología

### 🔍 1. **Extracción de datos**
- Se utilizaron las APIs de **Spotify** (vía `Spotipy`) y **Last.fm** para obtener información de artistas, canciones, oyentes y géneros.

### 🧹 2. **Limpieza y preparación**
- Los datos extraídos se limpiaron y transformaron en **Python**.
- Se corrigieron duplicados, se homogeneizaron géneros y se agruparon por año/artista.

### 🗃️ 3. **Base de datos MySQL**
- Se creó un modelo relacional con varias tablas (artistas, canciones + estadísticas).
- Se migraron los datos procesados desde Python a **MySQL** usando conectores (`mysql.connector`).

### 🔄 4. **Conexión Python-MySQL**
- Se automatizó la inserción y consulta de datos usando scripts en Python.
- Consultas SQL complejas permitieron generar rankings y estadísticas por categoría.
- Se realizó una limpieza y un estudio de los datos antes de proceder a realizar las consultas para obtener la información necesaria para cada premio.

### 🎨 5. **Visualización**
- Los resultados fueron visualizados en **Canva** mediante gráficos, tablas y líneas de tiempo para una presentación clara e interactiva.

👤 Presentado por: *Noemi*
  
---

## 🗂️ Estructura de premios

### 🏆 1. Artista Más Popular  
**Criterios:**  
- Total de oyentes y cantidad de reproducciones.  
- Se selecciona un nominado por cada género musical, y el ganador es quien posee mejores métricas combinadas.  

👤 Presentado por: *Lucía*

---

### 🏆 2. Artista Revelación del Año 2007  
**Criterios:**  
- Artistas que aparecen por primera vez en 2007 y no en años anteriores.  
- Se analiza también su edad y trayectoria.  

👤 Presentado por: *Montse*

---

### 🏆 3. Artista con Más Productividad Musical (2003–2007)  
**Criterios:**  
- Mayor cantidad de canciones lanzadas entre 2003 y 2007.  
- Se realiza un análisis año por año para identificar al artista más productivo.  

📊 **Ganador:** Anthony Santos (88 canciones)  
📉 **Oyentes:** 73.984  
⚠️ A pesar de ser el más productivo, no fue el más escuchado.

👤 Presentado por: *Gemma*

---

### 👩‍🎤 Perspectiva de género

Se ha buscado incorporar perspectiva de género en el análisis.  
🔍 **Conclusión clave:**   
> La presencia femenina es **prácticamente nula** en los datos analizados, tanto en número de canciones, como en oyentes y popularidad.

Este hallazgo pone de manifiesto una importante brecha de género en la industria musical del período 2003–2007, en especial en los generos bachata y reggaeton.

👤 Presentado por: *Eylin*
---

## 📈 Visualización del proyecto

📊 La presentación final con gráficos, artistas ganadores y conclusiones se encuentra en Canva:  
🔗 [Ver presentación en Canva](https://www.canva.com/design/DAGnOn5D3JM/2XL8Xb3lCn1O87lfgnarOA/edit?utm_content=DAGnOn5D3JM&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton)

---

## 👥 Equipo

- **Noemi** – Coordinación y presentación general
- **Lucía** – Categoría Artista Más Popular
- **Montse** – Categoría Artista Revelación
- **Gemma** – Categoría Artista con Más Productividad Musical
- **Eylin** – Conclusiones generales y enfoque de género

---

## 📝 Pendientes del proyecto

- [ ] Redacción de este README ✔️  
- [ ] Subir gráficos a Canva basados en conclusiones  
- [ ] Incorporar fotos de integrantes del equipo y artistas ganadores  
- [ ] Subir resultados individuales al repositorio de Git  

---
