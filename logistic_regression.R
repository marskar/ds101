# http://uc-r.github.io/logistic_regression
library(dplyr)  # data manipulation 
library(ggplot2) # data visualization
library(modelr)     # provides easy pipeline modeling functions
library(broom)      # helps to tidy up model outputs

# Load data 
(default <- as_tibble(ISLR::Default))

set.seed(123)
sample <- sample(c(TRUE, FALSE), nrow(default), replace = T, prob = c(0.6,0.4))
train <- default[sample, ]
test <- default[!sample, ]

model1 <- glm(default ~ balance, family = "binomial", data = train)

default %>%
    mutate(prob = ifelse(default == "Yes", 1, 0)) %>%
    ggplot(aes(balance, prob)) +
    geom_point(alpha = .15) +
    geom_smooth(method = "glm", method.args = list(family = "binomial")) +
    # ggtitle("Logistic regression model fit") +
    xlab(NULL) +
    ylab(NULL)
ggsave(filename = 'images/logistic_regression.png', dpi = 600, height = 1.5, width = 3)
