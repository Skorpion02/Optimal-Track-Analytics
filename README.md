# 🎶 Optimal Track Analytics

[![Issues](https://img.shields.io/github/issues/Skorpion02/Optimal-Track-Analytics?style=flat-square)](https://github.com/Skorpion02/Optimal-Track-Analytics/issues)
[![Forks](https://img.shields.io/github/forks/Skorpion02/Optimal-Track-Analytics?style=flat-square)](https://github.com/Skorpion02/Optimal-Track-Analytics/network/members)
[![Stars](https://img.shields.io/github/stars/Skorpion02/Optimal-Track-Analytics?style=flat-square)](https://github.com/Skorpion02/Optimal-Track-Analytics/stargazers)
[![Last Commit](https://img.shields.io/github/last-commit/Skorpion02/Optimal-Track-Analytics?style=flat-square)](https://github.com/Skorpion02/Optimal-Track-Analytics/commits/main)
[![License](https://img.shields.io/github/license/Skorpion02/Optimal-Track-Analytics?style=flat-square)](LICENSE)
[![SQL](https://img.shields.io/badge/SQL-MySQL-green?style=flat-square&logo=mysql)](#)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen?style=flat-square&logo=github)](https://github.com/Skorpion02/Optimal-Track-Analytics/pulls)

---

> **Collaborative SQL analytics project for in-depth artist, follower, and popularity insights using a Spotify-style dataset.**

---

## 🚀 Project Overview

- **Purpose:** Extract meaningful trends and business intelligence from a simulated Spotify database.
- **Technology:** MySQL (SQL), advanced queries, easy to extend.

---

## ✨ Key Features

- 📊 **Artist Analytics:** Count statistics, spot duplicates, analyze followers & popularity over time.
- 📈 **Growth Tracking:** Track follower increases and identify artists with highest/lowest growth.
- 📅 **Temporal Trends:** Analyze popularity and followers by day, week, or interval.
- 🏅 **Popularity Segmentation:** Classify artists (beginner, intermediate, star) by followers.
- 🔍 **Comparative Queries:** Compare artists, find those above average, and analyze differences.
- 🌍 **Locale Formatting:** Follower counts in Spanish number format for clarity.
- 🧑‍💻 **Well-Commented SQL:** All queries are documented and easy to adapt.

---

## 📂 Repository Structure

```
Optimal-Track-Analytics/
├── Optimal-Track-Analytics     # Main SQL queries and analytics
├── sp_artista.csv / sp_artista_estadisticas.csv
└── README.md
```

---

## 📝 Example Analytics

- **Count artist stats:**
  ```sql
  SELECT COUNT(ae.artista_id) AS "stat_count", a.nombre
  FROM sp_artista_estadisticas ae
  INNER JOIN sp_artista a ON ae.artista_id = a.artista_id
  GROUP BY a.nombre;
  ```
- **Top 5 artists by follower growth:**
  ```sql
  SELECT a.nombre, MAX(ae.seguidores) - MIN(ae.seguidores) AS growth
  FROM sp_artista_estadisticas ae
  INNER JOIN sp_artista a ON ae.artista_id = a.artista_id
  GROUP BY a.nombre
  ORDER BY growth DESC
  LIMIT 5;
  ```
- **Category by followers:**
  ```sql
  SELECT a.nombre,
         SUM(ae.seguidores) AS total_seguidores,
         CASE 
           WHEN SUM(ae.seguidores) < 100000 THEN 'beginner'
           WHEN SUM(ae.seguidores) BETWEEN 100000 AND 500000 THEN 'intermediate'
           WHEN SUM(ae.seguidores) > 500000 THEN 'star'
           ELSE 'uncategorized'
         END as category
  FROM sp_artista a
  INNER JOIN sp_artista_estadisticas ae ON a.artista_id = ae.artista_id
  GROUP BY a.artista_id, a.nombre
  ORDER BY total_seguidores DESC;
  ```

*Find more queries in [`Ejercicio_grupal.sql`](./Ejercicio_grupal.sql)!*

---

## 💡 How To Use

1. **Prepare MySQL environment and create tables** (`sp_artista`, `sp_artista_estadisticas`).
2. **Import or populate your data.**
3. **Run/modify queries from [`Ejercicio_grupal.sql`](./Ejercicio_grupal.sql) for your analysis needs.**

---

## 🤝 Contributing

Contributions, questions, and suggestions are welcome!

- [Open issues](https://github.com/Skorpion02/Optimal-Track-Analytics/issues)
- [Send a pull request](https://github.com/Skorpion02/Optimal-Track-Analytics/pulls)
- ⭐️ Star this repo if you find it useful!

---

## 📬 Contact

- **Author:** [Skorpion02](https://github.com/Skorpion02)
- **Repository:** [Optimal-Track-Analytics](https://github.com/Skorpion02/Optimal-Track-Analytics)

---

## 📝 License

This project is licensed under the [MIT License](LICENSE).

---

⭐️ **If you found this project helpful, please give it a star!**

---

<div align="center">
  <b>Made with ❤️ by Skorpion02</b>
</div>
