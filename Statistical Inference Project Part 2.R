## Load and Read the data
library(datasets)
data("ToothGrowth")
head(ToothGrowth)

## Summary of the data
summary(ToothGrowth)
str(ToothGrowth)

# Exploratory data analysis
library(ggplot2)
ToothGrowth$dose <- as.factor(ToothGrowth$dose)
ggplot(ToothGrowth, aes(x = supp, y = len)) +
    geom_boxplot(aes(fill = supp)) 

ggplot(ToothGrowth, aes(x = dose, y = len, fill = supp)) +
    geom_bar(stat = "identity") +
    facet_grid(. ~ supp)

ggplot(ToothGrowth, aes(x = supp, y = len)) +
    geom_boxplot(aes(fill = supp)) +
    facet_wrap(~dose)

## Use confidence intervals and/or hypothesis tests to compare tooth growth by supp and dose
t.test(len ~ supp, data = ToothGrowth)
t.test(len ~ supp, ToothGrowth[ToothGrowth$dose == 0.5, ])
t.test(len ~ supp, ToothGrowth[ToothGrowth$dose == 1.0, ])
t.test(len ~ supp, ToothGrowth[ToothGrowth$dose == 2.0, ])

