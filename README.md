# 🎶 Optimal-Track-Analytics

[![Issues](https://img.shields.io/github/issues/Skorpion02/Optimal-Track-Analytics?style=flat-square)](https://github.com/Skorpion02/Optimal-Track-Analytics/issues)
[![Forks](https://img.shields.io/github/forks/Skorpion02/Optimal-Track-Analytics?style=flat-square)](https://github.com/Skorpion02/Optimal-Track-Analytics/network/members)
[![Stars](https://img.shields.io/github/stars/Skorpion02/Optimal-Track-Analytics?style=flat-square)](https://github.com/Skorpion02/Optimal-Track-Analytics/stargazers)
[![Last Commit](https://img.shields.io/github/last-commit/Skorpion02/Optimal-Track-Analytics?style=flat-square)](https://github.com/Skorpion02/Optimal-Track-Analytics/commits/main)
[![License](https://img.shields.io/github/license/Skorpion02/Optimal-Track-Analytics?style=flat-square)](LICENSE)
[![SQL](https://img.shields.io/badge/SQL-MySQL-green?style=flat-square&logo=mysql)](#)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen?style=flat-square&logo=github)](https://github.com/Skorpion02/Optimal-Track-Analytics/pulls)

---

## 📝 Project Overview

This project focuses on analyzing artist data on Spotify to identify key trends and provide strategic recommendations to drive artist growth and promotion.  
The main goal is to offer data-driven guidance for artists' success on the platform.

---

## 📊 Methodology

The analyzed data includes two main tables: `sp_artista` and `sp_artista_estadisticas`.  
SQL queries were performed to extract relevant insights related to the popularity and follower growth of artists over a three-month period.  
The results were processed and analyzed to identify key patterns, also detecting possible gaps in data collection and duplications.

---

## 📈 Analysis Results

### Artists with the Highest Follower Growth

The following artists showed the highest follower growth during the analyzed period:

| Artist        | Follower Growth | Average Popularity |
|---------------|-----------------|--------------------|
| Billie Eilish | 1,830,059       | 94.9               |
| Ed Sheeran    | 1,771,423       | 93.6               |
| Ariana Grande | 1,172,805       | 92.4               |
| Travis Scott  | 1,073,118       | 97.2               |
| Bad Bunny     | 926,105         | 99.7               |

### Artists with the Lowest Follower Growth

The following artists showed the lowest follower growth during the analyzed period:

| Artist Name                             | Follower Growth | Average Popularity |
|-----------------------------------------|-----------------|--------------------|
| UNA                                     | 17.3            | 2                  |
| Vernizzi Jazz  & Corrado Giuffredi      | 19.6            | 3                  |
| RooRee                                  | 15.6            | 3                  |
| Fynite                                  | 15.6            | 3                  |
| Shannon Delani                          | 27              | 4                  |

These artists are just starting and could learn from the high-growth artists to plan their marketing strategies, be more active, and increase their relevance on the platform.

### General Trends

* The average popularity of the analyzed artists is 63.2, reflecting a moderate-to-high level of acceptance among Spotify listeners.
* Artists with the highest follower growth have average popularities above 90, highlighting their consistency in generated interest.
* The standard deviation in the popularity of these artists is low, suggesting a stable and engaged audience.

---

## 🚀 Strategic Conclusions & Recommendations

### Key Strategic Conclusions

1. **Statistic Count per Artist:** Allows identification of potential gaps in crucial data collection for decision-making based on complete metrics.
2. **Duplicated Artists:** The need to maintain clean and consistent data is fundamental to ensure accurate tracking.
3. **Artist with Most Followers on the Most Recent Date:** Focus promotional strategies on artists with the highest potential for engagement and return on investment.
4. **Artists with Low Popularity:** Shows areas for improvement for specific marketing strategies, such as social media campaigns or collaborations.
5. **Artists with More than 30,000 Followers:** Provides a key segment for targeted campaigns that consolidate their market position.
6. **Most Popular Artist on a Specific Date:** Helps plan strategic music releases or events at times of high visibility.

### General Strategic Recommendations

* Prioritize artists with the highest number of followers for high-impact campaigns.
* Implement targeted marketing strategies for artists with low popularity.
* Maintain data quality to ensure informed decisions.
* Utilize dates and events of highest popularity as key points for releases.

### Measures for Artists with Follower Loss

To reverse follower losses and foster growth, the following strategies are proposed:

* **Reactivation of Interest:** Promote new marketing campaigns to revitalize interest in affected artists. This includes the launch of exclusive content, such as remixes, collaborations, or unreleased material.
* **Content Analysis:** Review recent trends in published content to identify areas for improvement. Changes in genres, production quality, or even publication frequency can be key factors.
* **Strategic Collaborations:** Encourage collaborations with artists of complementary genres or with overlapping follower bases to attract new audiences.
* **Audience Analysis:** Use analytical tools to delve into demographic changes and follower preferences, adjusting the strategy to better align with their expectations.
* **Expanded Digital Presence:** Improve presence on platforms beyond Spotify, such as YouTube, TikTok, and other social media, to capture the attention of a wider audience.

### Specific Recommendations for Lower Popularity Artists

The analysis identified a group of artists with lower popularity and fewer followers.  
This group presents particular characteristics, such as a stable but limited follower base and relatively low follower growth.  
The following specific strategies are proposed to boost their development:

1. **Targeted Campaigns:** Focus efforts on advertising campaigns on social media and collaborations with more popular artists to expand their visibility and attract new followers.
2. **Content Optimization:** Enhance discoverability through improvements in keywords and descriptions on their profiles, in addition to creating engaging content that resonates with specific audiences.
3. **Audience Analysis:** Better understand the characteristics of their current listeners to identify opportunities for expansion into similar markets.
4. **Consistency in Releases:** Maintain a release frequency that allows the audience to remain engaged and attract new listeners regularly.

---

## 🛠️ Technologies Used

* **SQL:** For data extraction and querying from the database.
    * `SQL`: For database.

---

## 🚀 How to Use / Reproduce the Analysis

1. **Set up a MySQL-compatible environment.**
2. **Create the required tables** (`sp_artista`, `sp_artista_estadisticas`) and load your data.
3. **Run or adapt queries from [`Optimal-Track-Analytics.sql`](./Optimal-Track-Analytics.sql) for your analysis needs.

---

## 🤝 Contributions

Contributions, questions, and suggestions are welcome!

- [Open issues](https://github.com/Skorpion02/Optimal-Track-Analytics/issues)
- [Send a pull request](https://github.com/Skorpion02/Optimal-Track-Analytics/pulls)
- ⭐️ Star this repo if you find it useful!

---

## 📄 License

Distributed under the [MIT License](LICENSE).

---

⭐️ **If you found this project helpful, please give it a star!**

---

<div align="center">
  <b>Made with ❤️ by Skorpion02</b>
</div>
