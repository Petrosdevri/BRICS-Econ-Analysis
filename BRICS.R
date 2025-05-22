# Packages for data and starter plots
install.packages("ggflags", repos = c(
  "https://jimjam-slam.r-universe.dev",
  "https://cloud.r-project.org"))
library('ggplot2')
library('ggflags')
library('WDI')
library('dplyr')

# Data collection from WDI listed by state, indicator, and time period
GDPGrowth <- WDI(country = c('BR', 'CN', 'IN', 'RU', 'ZA'), indicator = 'NY.GDP.MKTP.KD.ZG', start = 1990, end = 2023)
GDPCapita <- WDI(country = c('BR', 'CN', 'IN', 'RU', 'ZA'), indicator = 'NY.GDP.PCAP.CD', start = 1990, end = 2023)
GDPCapitaPPP <- WDI(country = c('BR', 'CN', 'IN', 'RU', 'ZA'), indicator = 'NY.GDP.PCAP.PP.CD', start = 1990, end = 2023)
FDI <- WDI(country = c('BR', 'CN', 'IN', 'RU', 'ZA'), indicator = 'BX.KLT.DINV.WD.GD.ZS', start = 1990, end = 2023)
Inflation <- WDI(country = c('BR', 'CN', 'IN', 'RU', 'ZA'), indicator = 'NY.GDP.DEFL.KD.ZG', start = 1990, end = 2023)
MilitaryExp <- WDI(country = c('BR', 'CN', 'IN', 'RU', 'ZA'), indicator = 'MS.MIL.XPND.GD.ZS', start = 1990, end = 2023)

# Country colours and codes
custom_colors <- c("Brazil" = "#049343",
                   "China" = "#fbc84f",
                   "India" = "#fb6c24",
                   "Russian Federation" = "#043ba3",
                   "South Africa" = "#9467bd")

country_codes <- c("Brazil" = "br",
                   "China" = "cn",
                   "India" = "in",
                   "Russian Federation" = "ru",
                   "South Africa" = "za")

GDPGrowth$iso2c <- tolower(country_codes[GDPGrowth$country])
GDPCapita$iso2c <- tolower(country_codes[GDPCapita$country])
GDPCapitaPPP$iso2c <- tolower(country_codes[GDPCapitaPPP$country])
FDI$iso2c <- tolower(country_codes[FDI$country])
Inflation$iso2c <- tolower(country_codes[Inflation$country])
MilitaryExp$iso2c <- tolower(country_codes[MilitaryExp$country])

## Graphs with ggplot
ggplot(GDPGrowth, aes(x = year, y = NY.GDP.MKTP.KD.ZG, color = country)) +  
  geom_line() +  
  geom_flag(data = GDPGrowth %>% 
            group_by(country) %>% 
            filter(year == max(year)),
            aes(country = iso2c), 
            size = 4, na.rm = TRUE) +  
  xlab('Year') +  
  ylab('GDP Growth (%)') +  
  labs(title = 'GDP Growth in the main BRICS states (%)') +  
  scale_color_manual(values = custom_colors) +  
  scale_country(guide = 'none')

ggplot(GDPCapita, aes(x = year, y = NY.GDP.PCAP.CD, color = country)) +  
  geom_line() +  
  geom_flag(data = GDPCapita %>% 
            group_by(country) %>% 
            filter(year == max(year)),
            aes(country = iso2c), 
            size = 4, na.rm = TRUE) +  
  xlab('Year') +  
  ylab('GDP per Capita (US$)') +  
  labs(title = 'GDP per Capita in the main BRICS states (US$)') +  
  scale_color_manual(values = custom_colors)

ggplot(GDPCapitaPPP, aes(x = year, y = NY.GDP.PCAP.PP.CD, color = country)) +
  geom_line() +
  geom_flag(data = GDPCapitaPPP %>%
            group_by(country) %>%
            filter(year == max(year)),
            aes(country = iso2c),
            size = 4, na.rm = TRUE) +
  xlab('Year') +
  ylab('GDP per Capita, PPP (US$)') +
  labs(title = 'GDP per Capita in the main BRICS states, PPP (US$)') +
  scale_color_manual(values = custom_colors)

ggplot(FDI, aes(x = year, y = BX.KLT.DINV.WD.GD.ZS, color = country)) +
  geom_line() +
  geom_flag(data = FDI %>%
            group_by(country) %>%
            filter(year == max(year)),
            aes(country = iso2c),
            size = 4, na.rm = TRUE) +
  xlab('Year') +
  ylab('Net FDI Inflows (% of GDP)') +
  labs(title = 'FDI Inflows in the main BRICS states (% of GDP)') +
  scale_color_manual(values = custom_colors)

# Filtering Inflation to produce graphs for two periods (1990-1999 and 2000-2023)
ggplot(filter(Inflation, year < 2000), aes(x = year, y = NY.GDP.DEFL.KD.ZG, color = country)) +  
  geom_line(na.rm = TRUE) +  
  geom_flag(data = Inflation %>%
            filter(year < 2000) %>%
            group_by(country) %>%
            filter(year == max(year)) %>%
            ungroup(),
            aes(country = iso2c), 
            size = 4, na.rm = TRUE) +
  scale_x_continuous(breaks = seq(1990, 1999, 1),
                     labels = as.character(seq(1990, 1999, 1))) +  
  labs(title = 'Inflation in the main BRICS states, 1990–1999 (%)',  
       x = 'Year', y = 'Inflation (%)') +  
  scale_color_manual(values = custom_colors) +  
  scale_country(guide = 'none')

ggplot(filter(Inflation, year >= 2000), aes(x = year, y = NY.GDP.DEFL.KD.ZG, color = country)) +  
  geom_line(na.rm = TRUE) +  
  geom_flag(data = Inflation %>%
            filter(year >= 2000) %>%
            group_by(country) %>%
            filter(year == max(year)) %>%
            ungroup(),
            aes(country = iso2c), 
            size = 4, na.rm = TRUE) +
  labs(title = 'Inflation in the main BRICS states, 2000–2023 (%)',  
       x = 'Year', y = 'Inflation (%)') +  
  scale_color_manual(values = custom_colors) +  
  scale_country(guide = 'none')

ggplot(MilitaryExp, aes(x = year, y = MS.MIL.XPND.GD.ZS, color = country)) +
  geom_line() +
  geom_flag(data = MilitaryExp %>%
            group_by(country) %>%
            filter(year == max(year)),
            aes(country = iso2c),
            size = 4, na.rm = TRUE) +
  xlab('Year') +
  ylab('Military Expenditure (% of GDP)') +
  labs(title = 'Military Expenditure in the main BRICS states (% of GDP)') +
  scale_color_manual(values = custom_colors)