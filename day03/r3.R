library(ggplot2)
library(sqldf)
mympg <-sqldf('SELECT * FROM mpg')
mympg2 <-sqldf('SELECT *, (cty+hwy)/2 AS total FROM mpg')

#code error
mympg3 <- sqldf('SELECT *,
                CASE
                WHEN total >= 20 THEN "PASS"
                ELSE "FAIL"
                END AS test
                FROM mympg2')
mympg4 <- sqldf('SELECT *,
                CASE
                WHEN total >= 30 THEN "A"
                WHEN total <= 29 AND total >=20
                THEN "B"
                ELSE "C"
                END AS grade
                FROM mympg3')