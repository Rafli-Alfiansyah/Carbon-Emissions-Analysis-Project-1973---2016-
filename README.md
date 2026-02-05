# 📊 Carbon Emissions Analysis Project (1973 - 2016)

![imrs](https://github.com/user-attachments/assets/db202eaa-3550-4dc6-be1a-9ca881ec25cd)

## 📌 Project Overview

This project involves cleaning and analyzing historical carbon emission data. The goal was to transform raw industrial data into actionable insights, identifying top polluters and observing long-term environmental trends using **MySQL**.

## 🛠️ Data Cleaning & Transformation

Before analysis, the following steps were taken to ensure data integrity:

* **Data Filtering:** Removed "Month 13" records (annual aggregates) to prevent double-counting.
* **Type Conversion:** Converted `YYYYMM` (Integer) to a standard `DATE` format.
* **Schema Refinement:** * Renamed columns for clarity (`MSN` → `industry`, `Description` → `sector`).
* Cast `Value` from String to `DOUBLE` to allow mathematical aggregations.
* Dropped redundant columns like `Unit`.

---

## 🔍 Key Insights & SQL Results

### 1. Most Recent High-Emitting Industries

This query identifies which industries contributed the most to CO2 emissions in the latest recorded period.

```sql
SELECT industry, SUM(emission_value) AS CO2_emissions
FROM carbon
GROUP BY industry
ORDER BY CO2_emissions DESC;

```
| Industry | CO2 Emissions      |
|----------|--------------------|
| TXEIEUS  | 82352.67600000005  |
| CLEIEUS  | 65782.39300000005  |
| NNEIEUS  | 11295.358999999997 |
| PAEIEUS  | 4982.993000000005  |
| RFEIEUS  | 4239.311999999999  |
| DKEIEUS  | 404.8870000000003  |
| PCEIEUS  | 338.78499999999997 |
| NWEIEUS  | 281.36700000000025 |
| GEEIEUS  | 10.563000000000013 |

### 2. Decadal Emission Trends (2006 - 2016)

We analyzed how different sectors performed over the last decade of the dataset.

```sql
SELECT sector, SUM(emission_value) AS CO2_emissions, YEAR(date) AS year
FROM carbon
WHERE YEAR(date) BETWEEN 2006 AND 2016
GROUP BY sector, year
ORDER BY year;

```
| Sector                                                                                     | CO2 Emissions       | Year |
|--------------------------------------------------------------------------------------------|---------------------|------|
| Coal Electric Power Sector CO2 Emissions                                                   | 1953.697            | 2006 |
| Residual Fuel Oil Electric Power Sector CO2 Emissions                                      | 28.409              | 2006 |
| Distillate Fuel, Including Kerosene-Type Jet Fuel, Oil Electric Power Sector CO2 Emissions | 5.37                | 2006 |
| Natural Gas Electric Power Sector CO2 Emissions                                            | 338.209             | 2006 |
| Petroleum Coke Electric Power Sector CO2 Emissions                                         | 20.734999999999996  | 2006 |
| Total Energy Electric Power Sector CO2 Emissions                                           | 2358.322            | 2006 |
| Geothermal Energy Electric Power Sector CO2 Emissions                                      | 0.3770000000000001  | 2006 |
| Non-Biomass Waste Electric Power Sector CO2 Emissions                                      | 11.529              | 2006 |
| Petroleum Electric Power Sector CO2 Emissions                                              | 54.512              | 2006 |
| Coal Electric Power Sector CO2 Emissions                                                   | 1987.2869999999998  | 2007 |
| Natural Gas Electric Power Sector CO2 Emissions                                            | 371.618             | 2007 |
| Geothermal Energy Electric Power Sector CO2 Emissions                                      | 0.3770000000000001  | 2007 |
| Petroleum Electric Power Sector CO2 Emissions                                              | 54.339              | 2007 |
| Non-Biomass Waste Electric Power Sector CO2 Emissions                                      | 11.290999999999999  | 2007 |
| Petroleum Coke Electric Power Sector CO2 Emissions                                         | 16.599999999999998  | 2007 |
| Distillate Fuel, Including Kerosene-Type Jet Fuel, Oil Electric Power Sector CO2 Emissions | 6.487               | 2007 |
| Total Energy Electric Power Sector CO2 Emissions                                           | 2424.9139999999998  | 2007 |
| Residual Fuel Oil Electric Power Sector CO2 Emissions                                      | 31.253              | 2007 |
| Coal Electric Power Sector CO2 Emissions                                                   | 1959.386            | 2008 |
| Total Energy Electric Power Sector CO2 Emissions                                           | 2372.831            | 2008 |
| Natural Gas Electric Power Sector CO2 Emissions                                            | 362.252             | 2008 |
| Geothermal Energy Electric Power Sector CO2 Emissions                                      | 0.3780000000000001  | 2008 |
| Distillate Fuel, Including Kerosene-Type Jet Fuel, Oil Electric Power Sector CO2 Emissions | 5.303999999999999   | 2008 |
| Non-Biomass Waste Electric Power Sector CO2 Emissions                                      | 11.616              | 2008 |
| Residual Fuel Oil Electric Power Sector CO2 Emissions                                      | 18.945              | 2008 |
| Petroleum Coke Electric Power Sector CO2 Emissions                                         | 14.949              | 2008 |
| Petroleum Electric Power Sector CO2 Emissions                                              | 39.198              | 2008 |
| Coal Electric Power Sector CO2 Emissions                                                   | 1740.8750000000002  | 2009 |
| Total Energy Electric Power Sector CO2 Emissions                                           | 2157.826            | 2009 |
| Natural Gas Electric Power Sector CO2 Emissions                                            | 372.512             | 2009 |
| Geothermal Energy Electric Power Sector CO2 Emissions                                      | 0.3890000000000001  | 2009 |
| Non-Biomass Waste Electric Power Sector CO2 Emissions                                      | 11.244              | 2009 |
| Petroleum Coke Electric Power Sector CO2 Emissions                                         | 13.463999999999999  | 2009 |
| Residual Fuel Oil Electric Power Sector CO2 Emissions                                      | 14.258999999999999  | 2009 |
| Petroleum Electric Power Sector CO2 Emissions                                              | 32.812              | 2009 |
| Distillate Fuel, Including Kerosene-Type Jet Fuel, Oil Electric Power Sector CO2 Emissions | 5.089999999999999   | 2009 |
| Coal Electric Power Sector CO2 Emissions                                                   | 1827.619            | 2010 |
| Total Energy Electric Power Sector CO2 Emissions                                           | 2270.2549999999997  | 2010 |
| Distillate Fuel, Including Kerosene-Type Jet Fuel, Oil Electric Power Sector CO2 Emissions | 5.827999999999999   | 2010 |
| Non-Biomass Waste Electric Power Sector CO2 Emissions                                      | 11.01               | 2010 |
| Geothermal Energy Electric Power Sector CO2 Emissions                                      | 0.3890000000000001  | 2010 |
| Petroleum Coke Electric Power Sector CO2 Emissions                                         | 13.948000000000002  | 2010 |
| Residual Fuel Oil Electric Power Sector CO2 Emissions                                      | 12.136999999999997  | 2010 |
| Natural Gas Electric Power Sector CO2 Emissions                                            | 399.319             | 2010 |
| Petroleum Electric Power Sector CO2 Emissions                                              | 31.917              | 2010 |
| Coal Electric Power Sector CO2 Emissions                                                   | 1722.7089999999998  | 2011 |
| Natural Gas Electric Power Sector CO2 Emissions                                            | 409.12300000000005  | 2011 |
| Distillate Fuel, Including Kerosene-Type Jet Fuel, Oil Electric Power Sector CO2 Emissions | 4.658000000000001   | 2011 |
| Petroleum Coke Electric Power Sector CO2 Emissions                                         | 14.126000000000001  | 2011 |
| Residual Fuel Oil Electric Power Sector CO2 Emissions                                      | 7.332999999999999   | 2011 |
| Petroleum Electric Power Sector CO2 Emissions                                              | 26.115000000000002  | 2011 |
| Geothermal Energy Electric Power Sector CO2 Emissions                                      | 0.39600000000000013 | 2011 |
| Non-Biomass Waste Electric Power Sector CO2 Emissions                                      | 11.326999999999998  | 2011 |
| Total Energy Electric Power Sector CO2 Emissions                                           | 2169.669            | 2011 |
| Petroleum Coke Electric Power Sector CO2 Emissions                                         | 8.685               | 2012 |
| Non-Biomass Waste Electric Power Sector CO2 Emissions                                      | 11.437              | 2012 |
| Residual Fuel Oil Electric Power Sector CO2 Emissions                                      | 6.045999999999999   | 2012 |
| Petroleum Electric Power Sector CO2 Emissions                                              | 18.568              | 2012 |
| Distillate Fuel, Including Kerosene-Type Jet Fuel, Oil Electric Power Sector CO2 Emissions | 3.8350000000000004  | 2012 |
| Natural Gas Electric Power Sector CO2 Emissions                                            | 492.68399999999997  | 2012 |
| Geothermal Energy Electric Power Sector CO2 Emissions                                      | 0.40200000000000014 | 2012 |
| Coal Electric Power Sector CO2 Emissions                                                   | 1511.238            | 2012 |
| Total Energy Electric Power Sector CO2 Emissions                                           | 2034.3249999999998  | 2012 |
| Geothermal Energy Electric Power Sector CO2 Emissions                                      | 0.40100000000000013 | 2013 |
| Petroleum Coke Electric Power Sector CO2 Emissions                                         | 12.511000000000001  | 2013 |
| Residual Fuel Oil Electric Power Sector CO2 Emissions                                      | 6.0840000000000005  | 2013 |
| Petroleum Electric Power Sector CO2 Emissions                                              | 22.648999999999997  | 2013 |
| Natural Gas Electric Power Sector CO2 Emissions                                            | 444.3579999999999   | 2013 |
| Distillate Fuel, Including Kerosene-Type Jet Fuel, Oil Electric Power Sector CO2 Emissions | 4.053000000000001   | 2013 |
| Non-Biomass Waste Electric Power Sector CO2 Emissions                                      | 11.077000000000002  | 2013 |
| Coal Electric Power Sector CO2 Emissions                                                   | 1571.3500000000001  | 2013 |
| Total Energy Electric Power Sector CO2 Emissions                                           | 2049.838            | 2013 |
| Petroleum Coke Electric Power Sector CO2 Emissions                                         | 12.065999999999999  | 2014 |
| Petroleum Electric Power Sector CO2 Emissions                                              | 25.572999999999997  | 2014 |
| Residual Fuel Oil Electric Power Sector CO2 Emissions                                      | 7.497999999999998   | 2014 |
| Natural Gas Electric Power Sector CO2 Emissions                                            | 443.569             | 2014 |
| Geothermal Energy Electric Power Sector CO2 Emissions                                      | 0.41300000000000014 | 2014 |
| Distillate Fuel, Including Kerosene-Type Jet Fuel, Oil Electric Power Sector CO2 Emissions | 6.010000000000001   | 2014 |
| Non-Biomass Waste Electric Power Sector CO2 Emissions                                      | 11.129000000000001  | 2014 |
| Coal Electric Power Sector CO2 Emissions                                                   | 1569.136            | 2014 |
| Total Energy Electric Power Sector CO2 Emissions                                           | 2049.826            | 2014 |
| Residual Fuel Oil Electric Power Sector CO2 Emissions                                      | 7.486               | 2015 |
| Coal Electric Power Sector CO2 Emissions                                                   | 1352.9669999999999  | 2015 |
| Geothermal Energy Electric Power Sector CO2 Emissions                                      | 0.41300000000000014 | 2015 |
| Petroleum Electric Power Sector CO2 Emissions                                              | 24.196999999999996  | 2015 |
| Natural Gas Electric Power Sector CO2 Emissions                                            | 529.767             | 2015 |
| Petroleum Coke Electric Power Sector CO2 Emissions                                         | 11.415999999999999  | 2015 |
| Distillate Fuel, Including Kerosene-Type Jet Fuel, Oil Electric Power Sector CO2 Emissions | 5.296999999999999   | 2015 |
| Non-Biomass Waste Electric Power Sector CO2 Emissions                                      | 11.129000000000001  | 2015 |
| Total Energy Electric Power Sector CO2 Emissions                                           | 1918.4820000000002  | 2015 |
| Petroleum Coke Electric Power Sector CO2 Emissions                                         | 7.281000000000001   | 2016 |
| Natural Gas Electric Power Sector CO2 Emissions                                            | 321.43000000000006  | 2016 |
| Distillate Fuel, Including Kerosene-Type Jet Fuel, Oil Electric Power Sector CO2 Emissions | 2.368               | 2016 |
| Coal Electric Power Sector CO2 Emissions                                                   | 684.401             | 2016 |
| Petroleum Electric Power Sector CO2 Emissions                                              | 12.87               | 2016 |
| Non-Biomass Waste Electric Power Sector CO2 Emissions                                      | 6.477999999999999   | 2016 |
| Geothermal Energy Electric Power Sector CO2 Emissions                                      | 0.24100000000000002 | 2016 |
| Residual Fuel Oil Electric Power Sector CO2 Emissions                                      | 3.219               | 2016 |
| Total Energy Electric Power Sector CO2 Emissions                                           | 1025.42             | 2016 |

### 3. Industries with Successful Declines

Using **CTEs (Common Table Expressions)**, we compared the early era (1973-1983) average against the modern era (2005-2016) average to find industries that successfully reduced their carbon footprint.

```sql
WITH sector_comparison AS (...)
SELECT industry, early_avg, late_avg, (late_avg - early_avg) AS change_amount
FROM sector_comparison
WHERE late_avg < early_avg;

```
| Industry | Early Decade       | Late Decade        | Change Amount       |
|----------|--------------------|--------------------|---------------------|
| RFEIEUS  | 18.08118939393939  | 1.5232446043165473 | -16.55794478962284  |
| PAEIEUS  | 19.399204545454545 | 3.192726618705034  | -16.20647792674951  |
| DKEIEUS  | 1.2536136363636374 | 0.4508992805755395 | -0.8027143557880979 |

### 4. Top 3 Industrial Giants: Yearly Patterns

An advanced analysis using a **CTE and JOIN** to isolate the three biggest emitters and track their specific behavior year-over-year.

```sql
WITH top_industry AS (...)
SELECT c.industry, YEAR(c.date) AS year, SUM(c.emission_value) AS annual_emissions
FROM carbon c
JOIN top_industry t ON c.industry = t.industry
GROUP BY c.industry, year;

```
| Industry | Year | Annual Emissions   |
|----------|------|--------------------|
| CLEIEUS  | 1973 | 811.7909999999999  |
| CLEIEUS  | 1974 | 800.131            |
| CLEIEUS  | 1975 | 823.7399999999999  |
| CLEIEUS  | 1976 | 911.347            |
| CLEIEUS  | 1977 | 962.1430000000001  |
| CLEIEUS  | 1978 | 959.9169999999999  |
| CLEIEUS  | 1979 | 1055.704           |
| CLEIEUS  | 1980 | 1136.5939999999998 |
| CLEIEUS  | 1981 | 1180.3680000000002 |
| CLEIEUS  | 1982 | 1181.956           |
| CLEIEUS  | 1983 | 1241.7789999999998 |
| CLEIEUS  | 1984 | 1317.613           |
| CLEIEUS  | 1985 | 1367.4             |
| CLEIEUS  | 1986 | 1357.485           |
| CLEIEUS  | 1987 | 1426.7520000000004 |
| CLEIEUS  | 1988 | 1491.808           |
| CLEIEUS  | 1989 | 1518.8429999999998 |
| CLEIEUS  | 1990 | 1547.5639999999999 |
| CLEIEUS  | 1991 | 1548.18            |
| CLEIEUS  | 1992 | 1569.5649999999998 |
| CLEIEUS  | 1993 | 1632.519           |
| CLEIEUS  | 1994 | 1638.781           |
| CLEIEUS  | 1995 | 1660.743           |
| CLEIEUS  | 1996 | 1752.4099999999999 |
| CLEIEUS  | 1997 | 1797.0439999999999 |
| CLEIEUS  | 1998 | 1828.1830000000002 |
| CLEIEUS  | 1999 | 1836.415           |
| CLEIEUS  | 2000 | 1927.377           |
| CLEIEUS  | 2001 | 1869.828           |
| CLEIEUS  | 2002 | 1889.8790000000001 |
| CLEIEUS  | 2003 | 1930.972           |
| CLEIEUS  | 2004 | 1943.069           |
| CLEIEUS  | 2005 | 1983.8279999999997 |
| CLEIEUS  | 2006 | 1953.697           |
| CLEIEUS  | 2007 | 1987.2869999999998 |
| CLEIEUS  | 2008 | 1959.386           |
| CLEIEUS  | 2009 | 1740.8750000000002 |
| CLEIEUS  | 2010 | 1827.619           |
| CLEIEUS  | 2011 | 1722.7089999999998 |
| CLEIEUS  | 2012 | 1511.238           |
| CLEIEUS  | 2013 | 1571.3500000000001 |
| CLEIEUS  | 2014 | 1569.136           |
| CLEIEUS  | 2015 | 1352.9669999999999 |
| CLEIEUS  | 2016 | 684.401            |
| NNEIEUS  | 1973 | 198.856            |
| NNEIEUS  | 1974 | 186.71800000000002 |
| NNEIEUS  | 1975 | 171.892            |
| NNEIEUS  | 1976 | 167.22200000000004 |
| NNEIEUS  | 1977 | 174.226            |
| NNEIEUS  | 1978 | 174.916            |
| NNEIEUS  | 1979 | 191.679            |
| NNEIEUS  | 1980 | 200.44600000000003 |
| NNEIEUS  | 1981 | 197.894            |
| NNEIEUS  | 1982 | 175.714            |
| NNEIEUS  | 1983 | 157.647            |
| NNEIEUS  | 1984 | 169.662            |
| NNEIEUS  | 1985 | 166.13799999999998 |
| NNEIEUS  | 1986 | 141.616            |
| NNEIEUS  | 1987 | 154.65999999999997 |
| NNEIEUS  | 1988 | 142.849            |
| NNEIEUS  | 1989 | 168.28799999999998 |
| NNEIEUS  | 1990 | 175.493            |
| NNEIEUS  | 1991 | 179.142            |
| NNEIEUS  | 1992 | 186.28             |
| NNEIEUS  | 1993 | 187.663            |
| NNEIEUS  | 1994 | 210.988            |
| NNEIEUS  | 1995 | 228.236            |
| NNEIEUS  | 1996 | 204.904            |
| NNEIEUS  | 1997 | 218.87000000000003 |
| NNEIEUS  | 1998 | 248.016            |
| NNEIEUS  | 1999 | 260.057            |
| NNEIEUS  | 2000 | 280.81800000000004 |
| NNEIEUS  | 2001 | 289.538            |
| NNEIEUS  | 2002 | 305.93100000000004 |
| NNEIEUS  | 2003 | 278.285            |
| NNEIEUS  | 2004 | 296.839            |
| NNEIEUS  | 2005 | 319.035            |
| NNEIEUS  | 2006 | 338.209            |
| NNEIEUS  | 2007 | 371.618            |
| NNEIEUS  | 2008 | 362.252            |
| NNEIEUS  | 2009 | 372.512            |
| NNEIEUS  | 2010 | 399.319            |
| NNEIEUS  | 2011 | 409.12300000000005 |
| NNEIEUS  | 2012 | 492.68399999999997 |
| NNEIEUS  | 2013 | 444.3579999999999  |
| NNEIEUS  | 2014 | 443.569            |
| NNEIEUS  | 2015 | 529.767            |
| NNEIEUS  | 2016 | 321.43000000000006 |
| TXEIEUS  | 1973 | 1286.353           |
| TXEIEUS  | 1974 | 1250.643           |
| TXEIEUS  | 1975 | 1243.814           |
| TXEIEUS  | 1976 | 1351.1860000000001 |
| TXEIEUS  | 1977 | 1442.127           |
| TXEIEUS  | 1978 | 1447.658           |
| TXEIEUS  | 1979 | 1505.2470000000003 |
| TXEIEUS  | 1980 | 1543.709           |
| TXEIEUS  | 1981 | 1551.136           |
| TXEIEUS  | 1982 | 1480.7900000000002 |
| TXEIEUS  | 1983 | 1520.703           |
| TXEIEUS  | 1984 | 1588.2939999999999 |
| TXEIEUS  | 1985 | 1619.1449999999998 |
| TXEIEUS  | 1986 | 1613.2489999999996 |
| TXEIEUS  | 1987 | 1680.19            |
| TXEIEUS  | 1988 | 1757.5199999999998 |
| TXEIEUS  | 1989 | 1825.562           |
| TXEIEUS  | 1990 | 1831.0010000000002 |
| TXEIEUS  | 1991 | 1829.556           |
| TXEIEUS  | 1992 | 1843.4219999999998 |
| TXEIEUS  | 1993 | 1919.0849999999998 |
| TXEIEUS  | 1994 | 1943.8449999999998 |
| TXEIEUS  | 1995 | 1960.0349999999999 |
| TXEIEUS  | 1996 | 2033.2369999999999 |
| TXEIEUS  | 1997 | 2101.384           |
| TXEIEUS  | 1998 | 2191.771           |
| TXEIEUS  | 1999 | 2204.392           |
| TXEIEUS  | 2000 | 2310.169           |
| TXEIEUS  | 2001 | 2272.636           |
| TXEIEUS  | 2002 | 2288.035           |
| TXEIEUS  | 2003 | 2319.17            |
| TXEIEUS  | 2004 | 2350.377           |
| TXEIEUS  | 2005 | 2415.5270000000005 |
| TXEIEUS  | 2006 | 2358.322           |
| TXEIEUS  | 2007 | 2424.9139999999998 |
| TXEIEUS  | 2008 | 2372.831           |
| TXEIEUS  | 2009 | 2157.826           |
| TXEIEUS  | 2010 | 2270.2549999999997 |
| TXEIEUS  | 2011 | 2169.669           |
| TXEIEUS  | 2012 | 2034.3249999999998 |
| TXEIEUS  | 2013 | 2049.838           |
| TXEIEUS  | 2014 | 2049.826           |
| TXEIEUS  | 2015 | 1918.4820000000002 |
| TXEIEUS  | 2016 | 1025.42            |

---

## 🚀 Conclusion

The analysis reveals that while some industries have managed to decrease their emissions over 40 years, the total volume remains dominated by a few key industrial sectors. This structured SQL approach allows for automated reporting as new data becomes available.
