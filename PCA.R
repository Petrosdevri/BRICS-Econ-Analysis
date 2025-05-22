# Packages for PCA
library('FactoMineR')
library('Factoshiny')
library('factoextra')
library('tidyr')
library('dplyr')

# Data cleaning
GDPGrowth_clean <- GDPGrowth %>%
  select(country, year, GDP_growth = NY.GDP.MKTP.KD.ZG)

GDPCapita_clean <- GDPCapita %>%
  select(country, year, GDP_capita = NY.GDP.PCAP.CD)

GDPCapitaPPP_clean <- GDPCapitaPPP %>%
  select(country, year, GDP_capita_PPP = NY.GDP.PCAP.PP.CD)

FDI_clean <- FDI %>%
  select(country, year, FDI = BX.KLT.DINV.WD.GD.ZS)

# For Inflation we select post-2000 data
Inflation_clean <- Inflation %>%
  filter(year >= 2000) %>%
  select(country, year, Inflation = NY.GDP.DEFL.KD.ZG)

MilitaryExp_clean <- MilitaryExp %>%
  select(country, year, Military_Expenditure = MS.MIL.XPND.GD.ZS)

# Data conversion to a united variable
merged_data <- GDPGrowth_clean %>%
  left_join(GDPCapita_clean, by = c("country", "year")) %>%
  left_join(GDPCapitaPPP_clean, by = c("country", "year")) %>%
  left_join(FDI_clean, by = c("country", "year")) %>%
  left_join(Inflation_clean, by = c("country", "year")) %>%
  left_join(MilitaryExp_clean, by = c("country", "year"))

# Data selection for PCA
pca_data <- merged_data %>% 
  select(GDP_growth, GDP_capita, GDP_capita_PPP, FDI, Inflation, Military_Expenditure)

# Implementation of PCA and graph creation
pca_result <- PCA(pca_data, scale.unit = TRUE, graph = TRUE)

fviz_pca_var(pca_result,  axes = c(1, 2), repel = TRUE)

# Preparation for the contribution graphs
var <- get_pca_var(pca_result)
ind <- get_pca_ind(pca_result)   
head(var$cos2)
head(var$contrib)  

# Indicator analysis in PC1 and PC2
fviz_contrib(pca_result, 
             choice = "var", 
             axes = 1:2
)

# Indicator analysis in PC1
fviz_contrib(pca_result, 
             choice = "var", 
             axes = 1, top = 6, 
             title = "Contributions of Indicators to PC1",  
             ggtheme = theme_minimal(base_size = 14)) +  
             labs(x = "Variables", y = "Contribution (%)")

# Indicator analysis in PC2
fviz_contrib(pca_result,  
             choice = "var", 
             axes = 2, top = 6,  
             title = "Contributions of Indicators to PC2",  
             ggtheme = theme_minimal(base_size = 14)) +  
             labs(x = "Variables", y = "Contribution (%)")

# Creation of a graph with eigenvalues
fviz_eig(pca_result, addlabels = TRUE, main = "Scree Plot")

# Biplot creation
fviz_pca_biplot(pca_result,
                col.ind = merged_data$country,
                palette = custom_colors,
                addEllipses = TRUE,
                title = "PCA of BRICS Economic Indicators (1990-2023)"
)