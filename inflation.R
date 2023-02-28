## Inspired by https://twitter.com/StatsRegulation/status/1630223124787503105?s=20


library(ggplot2)
library(lubridate)



data <- data.frame(date = c("01/10/22",
                            "01/11/22",
                            "01/12/22",
                            "01/01/23"),
                   inflation = c(0.111,
                                 0.107,
                                 0.105,
                                 0.101)
                  )

data$date = dmy(data$date)


## Reproduce original plot

ggplot(data, aes(x=date, y = inflation)) + geom_col(width = 15, fill = "white") + ## Width is in "days" as x-axis is a date.
  geom_text(aes(label = scales::percent(accuracy = 0.1, inflation)),
            position = position_stack(0.5),
            colour = "#C31A1F",
            size = 6) +
  labs(title = toupper("An update on January\n Inflation Statistics")) +
  theme_minimal(base_size = 18) +
  theme(text = element_text(colour = "white"),
        plot.background = element_rect(fill = "#C31A1F"),
        axis.text.x = element_text(colour = "white"),
        axis.text.y = element_text(colour = "white"),
        plot.title = element_text(hjust = 0.5, size = rel(2)),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "white"),
        plot.margin = unit(c(4,4,2,4), "cm")
        ) +
  scale_y_continuous(labels = scales::label_percent(), name = "",
                     limits = c(0,0.12),
                     expand = c(0,0),
                     minor_breaks = ) +
  scale_x_date(date_labels = "%B\n%Y", name = "")

ggsave("Inflation.png", device = "png", width = 1000, height= 1000, units = "px")
  
