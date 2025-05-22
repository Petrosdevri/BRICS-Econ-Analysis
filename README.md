# 🌍 BRICS Economic Convergence Analysis
<h3>📊 Economic Development and Convergence Analysis of BRICS using the Principal Component Analysis (PCA) Method</h3>

- 📊 In this project, we compare the economic performance of the five main BRICS member states (🇧🇷 Brazil, 🇨🇳 China, 🇮🇳 India, 🇷🇺 Russia, 🇿🇦 South Africa) and identify patterns of convergence.
- 🧮 The comparison runs from 1990 to 2023, uses Principal Component Analysis (PCA), and covers key economic indicators.
- 🤝 The project was done together with my friend Jason Kehagias (<a href='https://github.com/JasonKeha'>@JasonKeha</a>).

<h4>📚 Data Sources</h4>

- 🌐 <a href='https://vincentarelbundock.github.io/WDI/'>WDI (World Development Indicators)</a>

<h4>📈 Economic Indicators</h4>

- 📉 GDP Growth (%)
- 💵 GDP per Capita (US$)
- 💰 GDP per Capita, PPP (US$)
- 🌍 FDI Inflows (% of GDP)
- 🔥 Inflation (%)
- 🪖 Military Expenditure (% of GDP)

<h4>🔍 Main Findings</h4>

<img src='Graphs/PCA/PCA graph of variables.png' alt='pca-graph' width='400' />
<img src='Graphs/PCA/Scree Plot.png' alt='scree-plot' width='400' />

<h5>🧠 Interpretation of the Correlation of Variables:</h5>

- ➡️ The variables `GDP_capita` and `GDP_capita_PPP` tend to be in Principal Component 1 (PC1).
- ↗️ The `GDP_growth` and `FDI` variables tend to be in Principal Component 2 (PC2).
- ⚠️ Inflation does not trend positively in either PC.
- 🪖 Military Expenditure (`Military_Expenditure`) has an intermediate relationship with the PCs.

<h5>📉 Interpretation of Variance by Principal Components (PCs):</h5>

- PC1 covers **35.1%** of the total volume of information, while PC2 covers **24.7%**.
- In sum, the two PCs cover **59.8%** of the indicators, a satisfactory percentage.
- PC3 covers around **18.9%** and mainly concerns inflation, while the other PCs do not concern important data.

<img src='Graphs/PCA/Contributions of Indicators to PC1.png' alt='contributions-pc1' width='400' />
<img src='Graphs/PCA/Contributions of Indicators to PC2.png' alt='contributions-pc2' width='400' />

<h5>📊 Interpretation of the indicators in PC1:</h5>

- 🥇 `GDP_capita_PPP` (40%): Largest contribution to PC1, suggesting that fluctuations in GDP per capita explain a significant part of the overall variation in PC1.
- 🥈 `GDP_capita` (35%): Second strongest indicator, closely related to PC1, but less so than the PPP estimate.
- 🥉 `GDP_growth` (15%): Significant but minor influence; annual growth rates do not dominate the PC1 axis.

<h5>📊 Interpretation of the indicators in PC2:</h5>

- 🥇 `FDI` (33%): Largest contribution to PC2, suggesting that FDI fluctuations explain a significant part of the overall variation in PC2.
- 🥈 `Inflation` (21%): Second strongest indicator, closely related to PC2, but less so than FDI.
- 🥉 `Military_Expenditure` (15%): Significant but secondary influence; military expenditure does not dominate the PC2 axis.

<h5>🌐 Interpretation of indicators by country:</h5>

<img src='Graphs/PCA/PCA of BRICS Economic Indicators (1990-2023).png' alt='pca-biplot' width='400' />

- 🇧🇷 Brazil performs positively in PC1, records balanced growth rates in all indicators, has a broad cloud and year-to-year volatility.
- 🇨🇳 China is in PC2 and particularly on the GDP growth axis, reflecting the country's high growth rates.
- 🇮🇳 India tends towards PC2 and negatively in PC1, showing concentration in GDP growth (small cloud) and indicating high growth but low incomes.
- 🇷🇺 Russia is positioned in PC1 and leads in a wide range of indicators (GDP per capita, Inflation, Military Expenditure), indicating strong volatility.
- 🇿🇦 South Africa is intermediate in the PCs, recording modest figures in the indicators and positioned closer to FDI.

<h4>🧾 Conclusion</h4>

- ❗ BRICS is not a homogeneous organisation in terms of economic growth: different rates per country and strong volatility.
- 📌 The comparison highlights the difference between developing countries (Russia, Brazil/South Africa, India/China).
- 🔄 The divergence between states has an impact on the policies of the organisation and affects the convergence potential of its member states.
