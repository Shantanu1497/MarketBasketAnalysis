# DM_06_03.R
pacman::p_load(arules, arulesViz) 
require(readxl)
# DATA #####################################################
help(package='arules')

## Read transactional data from arules package
data("Groceries")   # Load data
?Groceries   
# Help on data
str(Groceries)      # Structure of data
summary(Groceries)  # Includes most frequent items

# RULES ####################################################

# Set minimum support (minSup) to .001
# Set minimum confidence (minConf) to .80
?apriori
rules <- apriori(Groceries, 
                 parameter = list(supp = 0.001, conf = 0.80))

rules2 <- apriori(Retail, 
                 parameter = list(supp = 0.001, conf = 0.80))

inspect(rules[1:10])
# PLOTS ####################################################

# Scatterplot of support x confidence (colored by lift)
plot(rules)
arulesViz::plotly_arules(rules)
r2 <- rules
# Graph of top 20 rules
plot(r2[1:20], 
     method = "graph", 
     control = list(type = "items"))

# Parallel coordinates plot of top 20 rules
plot(r2[1:20], 
     method = "paracoord", 
     control = list(reorder = TRUE))
# Matrix plot of antecedents and consequents
plot(r2[1:20], 
     method = "matrix", 
     control = list(reorder = TRUE))

# Grouped matrix plot of antecedents and consequents
plot(rules[1:30], method = "grouped")


itemFrequencyPlot(Groceries,topN=20,col=brewer.pal(8,'Pastel2'),main='Relative Item Frequency Plot',type="relative",ylab="Item Frequency (Relative) ")

# CLEAN UP #################################################

# Clear workspace
rm(list = ls()) 

# Clear packages
pacman::p_unload(arules, arulesViz)

# Clear plots
dev.off()

# Clear console
cat("\014")  # ctrl+L
require(RColorBrewer)

