##### Cheatsheets - Œci¹gawki #####

# Cel: opracowanie podstawowych funcji przedstawionych na plikach cheatsheets

# do ogarniêcia
## readr
## stringr
## ggplot2
## dplyr


rm(list = ls())
.libPaths("D:/Dysk R/R_library")
setwd("D:\\Dysk R\\+cheatsheets")
system('open "D:/Dysk R/+cheatsheets"')

##### 1. base-r  #####

system('open "D:/Dysk R/+cheatsheets/1. base-r.pdf"')

library("dplyr")

# 1. Pomoc #
# A. Uzyskiwanie dostêpu do plików pomocy #

?mean                                     # wyrzuca pomoc dotycz¹c¹ konkretnej funkcji
help.search('help.search')                # Przeszukuje pliki help ze wskazanym s³owem lub fraz¹
??utils::help                             # Wszystie tematy ³¹cz¹ce siê z "help" w pakiecie utils
help(package = 'base')                    # szukanie pomocy dla wskazanego pakietu

# B. Wiêcej informacja dotycz¹cych obiektu #

df <- mtcars

str(df)                                   # tworzy podsumowanie obiektu
class(df)                                 # znajduje klasê obiektu


# 2. U¿ywanie pakietów #

install.packages('dplyr')                 # pobiera i instaluje pakiet z repozytorium CRAN
library(dplyr)                            # ³aduje pakiet do sesji udostêpniaj¹c wszystkie funkcje danego pakietu
dplyr::select                             # u¿ywamy funkcjê z konkretnego pakietu (przydatne, gdy nazwy funkcji w ró¿nych pakietach s¹ identyczne)
data(iris)                                # ³adujemy wbudowany zbiór danych do œrodowiska 


# 3. Katalog roboczy (Working Directory) #

getwd()                                  # znajduje obecny katalog roboczy
setwd('D:\\Dysk R\\+cheatsheets')        # zmiana obecnego katalogu roboczego na inny


# 4. Wektory (vectors)

# A. Tworzenie wektorow #

c(2,4,6)                                 # ³¹czenie elementów w wektor
2:6                                      # sekwencja liczb ca³kowitych
seq(from = 2, to = 3, by = 0.1)          # z³o¿ona sekwencja
rep(x = 1:2, times = 3)                  # powtarzanie wektora
rep(x = 1:2, each = 3)                   # powtarzane elementów wektora    


# B. Funkcje wektorowe (Vector Functions)

x <- round(runif(23, 0, 50),0)
y <- c(apple = "apple", orange = "orange", juice = "juice")

sort(x)                                  # sortuje wektor
table(x)                                 # przedstawia liczebnoœci danego wektora
rev(x)                                   # zwraca odwrócony wektor
unique(x)                                # zwraca unikalne wartoœci


# C. Selekcja elementów wektora

x[4]                                     # czwarty element
x[-4]                                    # wszystkie bez czwartego
x[2:4]                                   # elementy od drugiego do czwartego
x[-(2:4)]                                # wszystkie bez elementów od drugiego do czwartego
x[c(1,5)]                                # elementy pierwszy i pi¹ty

x[x == 37]                               # elementy równe 37
x[x <= 25]                               # elementy mniejsze równe 25
x[x %in% c(33,1,42,50,6)]                # elementy w zbiorze (33,1,42,50,6)
y['apple']                               # element z dan¹ nazw¹


# 5. Programowanie #

# A. Pêtla "For Loop"

a <- rep(NA, 10)

for (i in 1:length(a)){
  a[i] = i^2
}

a

# B. "If statements"

for (i in 1:length(a)){
  if (a[i] < 50){  
    a[i] = 25
  } else {
    a[i] = 75
  }}

a


# C. Pêtla "While Loop"

for (i in 1:length(a)){
  while (a[i] == 25){
    a[i] = sqrt(a[i])
  }
}

a

# D. Funkcje

funkcja_1 <- function(zmienna){
  zmienna = zmienna - 3.5
  return(zmienna)
}

a <- funkcja_1(a)
a

# 6. Wczytywanie i nadpisywanie danych

write.table(x = a, file = '+przyk³ad.txt')        # zapisanie pliku tekstowego txt
tabela1 <- read.table(file = '+przyk³ad.txt')     # wczytanie pliku tekstowego txt

write.csv(x = a, file = '+przyk³ad.csv')          # zapisanie pliku csv oddzielonego przecinkiem
tabela1 <- read.csv(file = '+przyk³ad.csv')       # wczytanie pliku csv oddzielonego przecinkiem

save(a, file = '+przyk³ad.Rdata')                 # zapisanie pliku w formacie Rdata - specjalnego typu dla R 
load(file = '+przyk³ad.Rdata')                    # wczytanie pliku w formacie Rdata - specjalnego typu dla R


# 7. Warunkowanie

x
x[15] == x[17]                                   # sprawdzamy czy s¹ równe
x[15] != x[17]                                   # sprawdzamy czy nie s¹ równe
x[15] >  x[17]                                   # sprawdzamy czy jest wiêkszy
x[15] <  x[17]                                   # sprawdzamy czy jest mniejszy
x[15] >= x[17]                                   # sprawdzamy czy jest wiêkszy równy
x[15] <= x[17]                                   # sprawdzamy czy jest mniejszy równy
is.na(x[15])                                     # sprawdzamy czy brakuje wartoœci
is.null(x[15])                                   # sprawdzamy czy jest null



# 8. Typy

x <- rep(0:1, 10)

as.logical(x)                                    # zamienia na wartoœci logiczne "Boolean values" - PRAWDA lub FA£SZ
as.numeric(x)                                    # zamienia na wartoœci numeryczne (integers albo floating points)
as.character(x)                                  # zamienia na ci¹g znaków (preferowany przy faktorowaniu)
as.factor(x)                                     # zamienia na ci¹g znaków z ustalonymi poziomami (przydatne przy modelach statystycznych)


# 9. Funkcje matematyczne

x <- round(runif(n = 35, min = 0, max = 550),6)
y <- round(runif(n = 35, min = 0, max = 550),6)


log(x = x, base = exp(1))                           # funkcja logarytmiczna, domyœlnie zwraca logarytm naturalny
exp(x = x)                                          # funkcja eksponencjalna (wyk³adnicza)
max(x, na.rm = TRUE)                                # funkcja zwracaj¹ca maksimum, na.rm = TRUE wyci¹ga z wektora wszytkie NA, domyœlnie FALSE
min(x, na.rm = TRUE)                                # funkcja zwracaj¹ca minimum, na.rm = TRUE wyci¹ga z wektora wszytkie NA, domyœlnie FALSE
round(x = x, digits = 0)                            # funkcja zaokr¹glaj¹ca do n-tej liczby po przecinku, domyœlnie digits = 0
signif(x = x, digits = 6)                           # funkcja zaokr¹glaj¹ca do n znacz¹cych cyfr, domyœlnie digits = 6
cor(x = x, y = y, method = "pearson")               # funkcja zwracaj¹ca korelacjê, domyœlnie metod¹ Pearsona
sum(x, y, na.rm = FALSE)                            # funkcja sumuj¹ca, na.rm = TRUE wyci¹ga z wektora wszytkie NA, domyœlnie FALSE
mean(x = c(x,y), trim = 0, na.rm = FALSE)           # funkcja zwracaj¹ca œredni¹, trim przycina wektor o dany procent z góry i do³u, domyœlnie 0
median(x = x, na.rm = FALSE)                        # funkcja zwracaj¹ca medianê (liczbê œrodkow¹)
quantile(x, probs = c(0,0.25,0.5,0.75,1),           # funkcja zwracaj¹ca kwantyle, probs jest ustawiony domyœlnie na 0, 25%, 50%, 75% i 100%
         names = TRUE, na.rm = FALSE, type = 7)      # names informuje, czy pokazaæ procenty, na.RM obs³uguje NA, type to sposób liczenia, domyœlnie 7
rank(x = x, na.last = TRUE)                         # funcja nadaj¹ca kolejnoœæ (rangi) elementom
var(x = x, y = y, na.rm = FALSE)                    # funkcja zwracaj¹ca wariancjê
sd(x = x, na.rm = FALSE)                            # funkcja zwracaj¹ca odchylenie standardowe


# 10. Przypisywanie wartoœci do zmiennych

a <- "apple"
a


# 11. Œrodowisko pracy

ls()                                                # zwraca listê obiektów we wskazanym œrodowisku, domyœlnie z bie¿¹cego œrodowiska 
rm(x = a)                                           # usuwa x ze œrodowiska (w tym przypadku jest to zmienna a)
rm(list = ls())                                     # usuwa wszystkie zmienne ze œrodowiska



# 12. Macierze #

m <- matrix(data = 1:16, nrow = 4, ncol = 4,        # tworzenie macierzy 4x5, byrow oznacza narzucanie wartoœci rzêdami, domyœlnie fALSE
            byrow = FALSE)
n <- matrix(data = 36:21, nrow = 4, ncol = 4,
            byrow = TRUE)

m[2, ]                   # drugi rz¹d
m[ ,3]                   # trzecia kolumna
m[2,4]                   # element z drugiego rzêdu i czwartej kolumny

t(m)                     # transpozycja macierzy
m %*% t(m)               # mno¿enie macierzy
solve(a = m, b = n)      # znajdowanie x w równaniu a * x = b


# 13. Listy

l <- list(x = 1:5, y = c("a", "b"))    # lista jest zbiorem elementów, które mog¹ byæ ró¿nych typów
l[[2]]                                 # drugi element listy l
l[1]                                   # nowa lista tylko z pierwszym elementem z listy
l$x                                    # element list nazwany "x"
l['y']                                 # nowa lista tylko z elementem nazwanym "y"


# 14. Data frames

df <- data.frame(x = 1:3, y = letters[1:3])
df <- data.frame(x = 1:3, y = c("a", "b", "c"))

df[, 2]          # druga kolumna
df[2, ]          # drugi rz¹d
df[2,2]          # element z drugiego rzêdu i drugiej kolumny

df$x             # kolumna nazwana "x"
df[2]            # zwraca drug¹ kolumnê jako data.frame
df[[2]]          # zwraca elementy z drugiej kolumny jako wektor ze zdefiniowanymiu poziomami (factor)

View(df)         # przegl¹danie ca³ego data.frame w osobnym oknie
head(df, n = 6)  # zwraca górn¹ czêœæ data.frame, domyœlnie pierwsze 6 wierszy

nrow(df)         # zwraca liczbê wierszy
ncol(df)         # zwraca liczbê kolumn
dim(df)          # zwraca liczbê wierszy i kolumn

cbind(df, z = df[,2])   # ³¹czy kolumny
rbind(df, "4" = df[3,]) # ³¹czy wiersze


# 15. Strings (Ci¹g znaków, ³añcuch)

x <- letters
y <- round(runif(n = 26, min = 1, max = 10),0)

paste(x, y, sep = " ; ")                         # ³¹czenie razem wielu wektorów
paste(x, collapse = " * ")                       # ³¹czenie elementów jednego wektora razem
grep(pattern = "d", x = letters)                 # szukanie wyra¿enia w zbiorze, zwraca miejsce w danym zbiorze
gsub(pattern = "e", replacement = "i", x = x)    # zamiana wzoru na inny znak w danym zbiorze
toupper("AdAdfmfU")                              # zamiana na wielkie znaki
tolower("AdAdfHDU")                              # zamiana na ma³e znaki
nchar("AdAdfHDU")                                # zwraca liczbê znaków


# 16. Factors

x <- round(runif(n = 30, min = 1, max = 10),0)

factor(x = x)               # zamienia wektor w faktor, mo¿na ustawiæ poziomy oraz kolejnoœæ
cut(x = x, breaks = 4)      # zamienia wektor numeryczny w faktor pociêty na sekcje 
plot(cut(x = x, breaks = 4))

# 17. Statystyki

x <- round(runif(n = 30, min = 1, max = 10),0) 
y <- round(runif(n = 30, min = 1, max = 10),0) 

lm(x ~ y)                  # model liniowy
glm(x ~ y)                 # uogólniony model liniowy
summary(x)

t.test(x, y)                     # t-test
pairwise.t.test(x, y)            # t-test dla sparowanych danych
prop.test(x = x, n = 30)         # ?
aov(formula = lm(x ~ y))         # analiza wariancji


# 18. Rozk³ady

# A. Zmienne losowe

normal1 <- rnorm(n = 10, mean = 0, sd = 1)
poisson1 <- rpois(n = 10, lambda = 2)
binomial1 <- rbinom(n = 10, size = 100, prob = 0.1)
uniform1 <- runif(n = 10, min = 0, max = 10)

# B. Funkcja gêstoœci

dnorm(normal1)
dpois(poisson1, lambda = 2)
dbinom(binomial1, size = 100, prob = 0.1)
dunif(uniform1)

# C. Dystrybuanta

pnorm(normal1, mean = 0, sd = 1)
ppois(poisson1, lambda = 2)
pbinom(binomial1, size = 100, prob = 0.1)
punif(uniform1)

# D. Kwantyle

qnorm(normal1, mean = 0, sd = 1)
qpois(poisson1, lambda = 2)
qbinom(binomial1, size = 100, prob = 0.1)
qunif(uniform1)


# 19. Tworzenie wykresów

plot(x)
plot(x,y)
hist(x)




##### 2. lubridate #####

system('open "D:/Dysk R/+cheatsheets/2. lubridate.pdf"')

library("lubridate")

# 1. Date-times

dt <- as_datetime(1514979403) # date-time jest punktem na osi czasu przechowywanym jako liczba sekund od 1970-01-01 00:00:00 UTC
d <- as_date(17534)           # date jest dniem przechowywanym jako liczba dni od since 1970-01-01
t <- hms::as.hms(85)          # hms jest czasem przechowywanym jako liczba sekund od 00:00:00


# 2. Analiza date-times (zamiana strings albo liczb do date-times)

a <- "2017-11-28 14:02:12"
b <- "2017-11-28 14:02"
c <- "2017-11-28 14"
d <- "2017-11-28"

a;b;c;d
ymd_hms(a); ymd_hm(b); ymd_h(c); ymd(d)


a <- "2017-22-12 10:11:12"
b <- "2017-22-12 10:20"
c <- "2017-22-12 10"
d <- "2017-22-12"

a;b;c;d
ydm_hms(a); ydm_hm(b); ydm_h(c); ydm(d)


a <- "11/02/2017 01:02:03"
b <- "11/02/2017 01:02"
c <- "11/02/2017 01"
d <- "11/02/2017"

a;b;c;d
mdy_hms(a); mdy_hm(b); mdy_h(c); mdy(d)


a <- "1 Jan 2017 23:59:59"
b <- "1 Jan 2017 23:59"
c <- "1 Jan 2017 23"
d <- "1 Jan 2017"

a;b;c;d
dmy_hms(a); dmy_hm(b); dmy_h(c); dmy(d)


a <- "20170131"
b <- "20173101"
c <- "01312017"
d <- "31012017"

a;b;c;d
ymd(a); ydm(b); mdy(c); dmy(d)


a <- "July 4th, 2000"
b <- "July 4th '00"
c <- "2000, July 4th"
d <- "2000, 4th of July"
e <- "4th of July '00"
f <- "'00, 4th of July"
g <- "'00 July 4th"

a;b;c;d;e;f;g
mdy(a); mdy(b); ymd(c); ydm(d); dmy(e); ydm(f); ymd(g)

a <- "2001: Q3"

yq(a)


a <- "4:11:23"
b <- "4:11"
c <- "11:23"

a;b;c
lubridate::hms(a); lubridate::hm(b); lubridate::ms(c)

a <- 2017.75
b <- 2018.33

a;b
date_decimal(a); date_decimal(b)



now(tzone = "CET")   # Central European Time
now(tzone = "UTC")   # Coordinated Universal Time

today(tzone = "CET")
today(tzone = "UTC")


a <- "9/1/01"
b <- "22-1-17"

a;b
fast_strptime(x = a, format = '%y/%m/%d')
fast_strptime(x = b, format = '%d-%m-%y')



# 3. Pobieranie i uk³adanie komponentów

d <- "2017-11-28"
day(d); month(d); year(d)

a <- "2017-9-30 12:54:34"

date(a)
year(a); isoyear(a); epiyear(a)
month(a); month(a, label = TRUE, abbr = TRUE)
day(a); wday(a, label = TRUE, abbr = FALSE, week_start = 1); qday(a)

hour(a); minute(a); second(a)

week(a); isoweek(a); epiweek(a)

quarter(a)
semester(a)

am(a)
pm(a)

dst(a)   # Is it daylight savings?

leap_year(date = year(a))


# 4. Zaokr¹glanie Date-times

(a <- ymd_hms(a))

floor_date(a, unit = "second")
floor_date(a, unit = "minute")
floor_date(a, unit = "hour")
floor_date(a, unit = "day")
floor_date(a, unit = "month")
floor_date(a, unit = "year")

round_date(a, unit = "second")
round_date(a, unit = "minute")
round_date(a, unit = "hour")
round_date(a, unit = "day")
round_date(a, unit = "month")
round_date(a, unit = "year")

ceiling_date(a, unit = "second")
ceiling_date(a, unit = "minute")
ceiling_date(a, unit = "hour")
ceiling_date(a, unit = "day")
ceiling_date(a, unit = "month")
ceiling_date(a, unit = "year")

a; rollback(a, roll_to_first = TRUE); rollback(a, roll_to_first = FALSE)
a; rollback(a, preserve_hms = TRUE); rollback(a, preserve_hms = FALSE)


# 5. Tworzenie "stempli"

sf <- stamp("Created Sunday, Jan 17, 1999 3:34")
sf(ymd("2010-04-05"))



# 6. Strefy czasowe

OlsonNames()

with_tz(a, tzone = "CET"); with_tz(a, tzone = "UTC")
force_tz(a, tzone = "Canada/Yukon"); force_tz(a, "Asia/Baku"); force_tz(a, tzone = "CET")


# 7. Dzia³ania matematyczne na datach i czasie

normal <- ymd_hms("2018-01-01 01:30:00",tz="US/Eastern")
gap <- ymd_hms("2018-03-11 01:30:00",tz="US/Eastern")
lap <- ymd_hms("2018-11-04 00:30:00",tz="US/Eastern")
leap <- ymd("2019-03-01")

# Normalne dodawanie bez uwzglêdniania nieregularnoœci
normal + minutes(90)
gap + minutes(90)
lap + minutes(90)
leap + years(1)

# Dodawanie z uwzglêdnieniem nieregularnoœci
normal + dminutes(90)
gap + dminutes(90)
lap + dminutes(90)
leap + dyears(1)


interval(normal, normal + minutes(90))
interval(gap, gap + minutes(90))
interval(lap, lap + minutes(90))
interval(leap, leap + years(1))


jan31 <- ymd("20180131")
jan31 + months(1)              # pojawia siê b³¹d, poniewa¿ nie istnieje data 31.02.2018
jan31 %m+% months(1)           # funkcja %m+% rozwi¹zuje powy¿szy problem

add_with_rollback(jan31, months(1), roll_to_first = TRUE)
add_with_rollback(jan31, months(1), roll_to_first = FALSE)


# 8. Okresy

p <- months(3) + days(13)

years(12)
months(11)
weeks(10)
days(9)
hours(888)
minutes(777)
seconds(666)

milliseconds(555)
microseconds(444444)
nanoseconds(333333333)
picoseconds(222222222222)

period(5, units = "months")
as.period(5, unit = "years")
is.period(years(5))

period_to_seconds(years(1))
seconds_to_period(123456789)


# poni¿sze funkcje zwracaj¹ liczbê sekund

(dd <- ddays(365))
(dd <- ddays(13))

dyears(1)
dweeks(1)
ddays(1)
dhours(1)
dminutes(1)
dseconds(1)
dmilliseconds(1)
dmicroseconds(1)
dnanoseconds(1)
dpicoseconds(1)


duration(5, units = "days")
duration(5, units = "years")

as.duration(5)
is.duration(ddays(5))

(df <- difftime(time1 = "2018-01-01", time2 = "2017-02-03"))
is.difftime(df)
(df <- make_difftime(5, units = "day"))
is.difftime(df)


# Interwa³y

a <- ymd("2017-06-13 UTC")
d <- ymd("2017-11-28 UTC")

i <- interval(ymd("2017-01-01 UTC"), d)
j <- d %--% ymd("2018-12-31 UTC")

now() %within% i
now() %within% j
a %within% i

int_start(i)
int_end(i)

int_end(i) <- now()
i


int_start(i); int_end(i)
int_start(j); int_end(j)
int_aligns(i, j)             # sprawdza, czy maj¹ wspólne granice
int_overlaps(i, j)           # sprawdza, czy okresy siê pokrywaj¹ w jakimœ punkcie

v <- c(a, a + 100, a + 1000)
int_diff(v)                  # tworzy interwa³y z elementów wektora

int_flip(i)                  # odwraca interwa³

int_standardize(i)           
int_standardize(int_flip(i)) # jeœli kierunek interwa³u jest negatywny to odwraca jego kierunek

int_length(i)                # zwraca liczbê sekund w interwale
seconds_to_period(int_length(i))


i; int_shift(i, by = days(5))
i; int_shift(i, by = years(3))


df <- make_difftime(5, units = "day")
as.interval(x = df, start = ymd("2016-01-01 UTC"))

df <- duration(days = 13)
as.interval(x = df, start = now())

df <- period(months = 13)
as.interval(df, start = now())

as.interval(3654, now())



##### 3. stringr #####

system('open "D:/Dysk R/+cheatsheets/3. strings.pdf"')

library(stringr)

# Pakiet stringr dostarczas zbiór wewnêtrznie zgodnych narzêdzi do pracy z ci¹gami znaków np. sekwencji znaków otoczonych cudzys³owami

# 1. Wykrywanie dopasowañ (detect matches)

a <- c("jab³ko", "pomarañcze", "ogórek", "kapustaka", "truskawki", "du¿y*owoc", "czarna porzeczka")

str_detect(a, "ka")                      # sprawdza, czy w danym ci¹gu znajduje siê wzór
str_which(a, "ka")                       # sprawdza, w którym ci¹gu znajduje siê dany wzór
str_count(a, "ka")                       # sprawdza, ile razy wzór pojawi³ siê w danym ci¹gu
str_locate(a, "ka")                      # lokalizuje pozycje pasuj¹cych wzorców w ³añcuchu, zwraca macierz z informacj¹ o pierwszym wzorze
str_locate_all(a, "ka")                  # Zlokalizuj pozycje pasuj¹cych wzorców w ³añcuchu, zwraca listê ze wszystkimi wzorcami


# 2. Podzbiory ci¹gów (Subset strings)

str_sub(string = a, start = 2L, end = 4L)   # wyodrêbnia podci¹gi z ci¹gu znaków (od 2 znaku do 4, razem 3 znaki)
str_sub(string = a, start = 3, end = -2)    # jak wy¿ej, ale minus oznacza do danego znaku od koñca, tj. od 3 znaku do 2 od koñca
str_subset(string = a, pattern = "ka")      # zwraca tylko te ci¹gi, które zawieraj¹ dany wzór
str_extract(string = a, pattern = "ka")     # zwraca pierwsze znalezione dopasowanie wzoru jako wektor
str_extract_all(string = a, pattern = "ka") # jw. ale zwraca jako listê wszystkie dopasowane wzory
str_match(string = a, pattern = "ka")       # zwraca jako macierz pierwszy dopasowany wzór w ka¿dym ci¹gu
str_match_all(string = a, pattern = "ka")   # jak wy¿ej, ale jako listê z wszystkimi wzoramui


# 3. Zarz¹dzanie d³ugoœci¹ (Manage lengths)

a <- fruit
b <- c("   jaB£Ko", "pomaRAÑcze   ", "  OgóreK  ", "  kapuS TAka sss", "   TRuSkawki ", " du¯y*oWoc", "CZARna porzeczka")

str_length(string = a)                                       # zwraca liczbê znaków
str_pad(string = a, width = 10, side = "left", pad = "*")    # ustala liczbê znaków w ci¹gu np. dodaje spacje z lewej lub prawej
str_trunc(string = a, width = 7, side = "right", ellipsis = "...")  # skraca ci¹g znaków, zastêpuj¹c je wielokropkiem, tj. max 7 znaków
str_trim(string = b, side = "both")                          # przycina odstêpy na pocz¹tku i koñcu ci¹gu


# 4. Zmienianie ci¹gów (mutate strings)

str_sub(string = a, start = 1, end = 3) <- "aaa"; a             # zamieniamy podci¹g znaków od 1 do 3 now¹ wartoœci¹
str_replace(string = a, pattern = "aaa", replacement = "bbb")   # zamieniamy pierwszy znaleziony wzór w ci¹gu now¹ wartoœci¹
str_replace_all(string = a, pattern = "a", replacement = "b")   # jak wy¿ej, ale wszystkie wzory

str_to_lower(string = b, locale = "pl"); b                      # zamienia znaki wielkie na ma³e
str_to_upper(string = b, locale = "pl"); b                      # zamienia znaki ma³e na wielkie
str_to_title(string = b, locale = "pl"); b                      # zmienia pierwszy znak wyrazu w ci¹gu na wielki, a pozosta³e na ma³e


# 5. £¹czenie i rozdzielanie (join and split)

a <- fruit
b <- as.character(1:20)
c <- data.frame(imiona = LETTERS, liczba = 101:126)

str_c(b, a, sep = "*-x-*", collapse = NULL)                      # ³¹czy ci¹gi ze wskazanym separatorem
str_c(b, a, sep = "*", collapse = " - ")                         # ³¹czy ci¹gi ze wskazanym separatorem i tworzy pojedyñczy ci¹g
str_dup(string = b, times = 1:4)                                 # powtarza ci¹g wskazan¹ liczbê razy
str_split_fixed(string = a, pattern = " ", n = 3)                # rozdziela ci¹g po wskazanym znaku i tworzy macierz
str_split(string = a, pattern = " ", n = 3, simplify = FALSE)    # jak wy¿ej, przy FALSE otrzymujemy listê, a przy TRUE macierz
glue::glue("Pi is {a[1]}")                                       # ³¹czymy ci¹gi, w nawias {} mo¿na wrzuciæ wartoœæ innej zmiennej
glue::glue_data(.x = c, "{rownames(c)} jest przy {imiona} oraz {liczba}")      # jak wy¿ej z wykorzystaniem data.frame


# 6. Porz¹dek ci¹gów (Order strings)

str_order(x = a, decreasing = FALSE)                            # funkcja sortuje ci¹g znaków i zwraca indeksy
str_sort(x = a)                                                 # sortuje ci¹g alfabetycznie


# 7. Pomocnicy (Helpers)

str_conv(string = a, encoding = "ISO-8859-1" )                 # napisuje kodowanie ci¹gu znaków
str_view(string = a, pattern = "e", match = TRUE)              # renderuje obraz html z wyrazami ci¹gu zawieraj¹cymi wzór, podœwietla wzór
str_view_all(string = a, pattern = "e", match = TRUE)          # jak wy¿ej, ale podœwietla ka¿dy znaleziony wzór
str_wrap(sentences, 20)[1:20]                                  # zwija ci¹gi w ³adnie sformatowane paragrafy


# 8. To trzeba wiedzieæ (Need to Know)

?"'"

# \n	 newline
# \r	 carriage return
# \t	 tab
# \b	 backspace
# \a	 alert (bell)
# \f	 form feed
# \v	 vertical tab
# \\	 backslash \
# \'	 ASCII apostrophe '
# \"	 ASCII quotation mark "
# \`	 ASCII grave accent (backtick) `
# \nnn	 character with given octal code (1, 2 or 3 digits)
# \xnn	 character with given hex code (1 or 2 hex digits)
# \unnnn	 Unicode character with given code (1--4 hex digits)


writeLines("pierwsza linia \n druga linia")
writeLines("powrót oznacza cofniêcie siê do pocz¹tku \r i nadpisywanie znaków")
writeLines("u¿ywamy \t tabulatora")
writeLines("u¿ywamy backspace do kasowania aaa \b\b\b\b\b bbb")
writeLines("u¿ywamy to do \f rozpoczêcia nowej strony")
writeLines("alert \a")
writeLines("pionowy \v tabulator")
writeLines("backslash \\ ")
writeLines("apostrof \' ")
writeLines("cudzys³ów \" ")
writeLines("backtick \` ")
writeLines("kod ósemkowy \102")
writeLines("kod szesnastkowy \xB6")
writeLines("kdo unicode \1213")


# 9. Interpretacje


# Wzory w stringr s¹ interpretowane jako wyra¿enia regularne. 

?regex() 
# umo¿liwia pomijanie wielkiej/ma³ej litery, dopasowuje koniec linii z koñcem ci¹gu, pozwala na komentarze wewn¹trz
# wyra¿enia regularnego oraz na dopasowanie wszystkiego, uwzglêdniaj¹c \n

str_detect("abcdEFGHIJklm", pattern = "j")
str_detect("abcdEFGHIJklm", pattern = regex(pattern = "j", ignore_case = TRUE))   # pomimo ma³ej litery wzór zosta³ znaleziony

?fixed()
# dopasowuje znaki ale pomija ci¹gi, które mog¹ byæ reprezentowane na wiele sposobów
str_detect("asbcsSFUS", fixed("f"))
str_detect("asbcsSFUS", fixed("F"))
str_detect("\u0130", fixed("i"))

?coll()
# umo¿liwia wykorzystanie regu³y sortowania specyficzne dla ustawieñ lokalnych aby rozpoznaæ znaki
str_detect("\u0130", coll("i", TRUE, locale = "tr"))

?boundary()
# Dopasowuje granice miêdzy znakami, podzia³ami wierszy (line_breaks), zdaniami lub s³owami. 
str_split(sentences, boundary("character"))
str_split(sentences, boundary("line_break"))
str_split(sentences, boundary("sentence"))
str_split(sentences, boundary("character"))
str_split(sentences, boundary("word"))


# 10. Wyra¿enia regularne (regular expressions)

# dopasowanie znaków

see <- function(regexp) str_view_all("abc ABC 123\t.!?\\(){}\n", regexp)

see("a")
see("\\.")
see("\\!")
see("\\?")
see("\\\\")
see("\\(")
see("\\)")
see("\\{")
see("\\}")
see("\\n")        # nowa linia
see("\\t")        # tabulator
see("\\s")        # puste przestrzenie
see("\\S")        # wszystko oprócz pustych przestrzeni
see("\\d")        # zaznacza numery
see("\\D")        # zaznacza wszystko oprócz numerów
see("\\w")        # dowolny znak s³owny
see("\\W")        # zaznacza wszystko oprócz znaków s³ownych
see("\\b")        # zaznacza granice znaków s³ownych
see("[:digit:]")  # zaznacza znaki
see("[:alpha:]")  # zaznacza wyrazy
see("[:lower:]")  # zaznacza znaki z ma³ej litery
see("[:upper:]")  # zaznacza znaki z wielkiej litery
see("[:alnum:]")  # zaznacza znaki i s³owa
see("[:punct:]")  # zaznacza interpunkcjê
see("[:graph:]")  # zaznacza znaki, s³owa i interpunkcjê
see("[:space:]")  # zaznacza puste przestrzenie
see("[:blank:]")  # zaznacza puste przestrzenie (spacje) oraz tabulatory ale bez nowej linii
see(".")          # zaznacza wszystko oprócz nowej linii


# Zamienniki (alternates)

str_view_all(string = "abcde", pattern = "ab|d")          # lub (or)
str_view_all(string = "abcde", pattern = "[abe]")         # jeden z (one of)
str_view_all(string = "abcde", pattern = "[^abe]")        # wszystko poza (anything but)
str_view_all(string = "abcde", pattern = "[a-c]")         # zakres (range)


# kotwice (ancors)

str_view_all(string = "aabbaa", pattern = "^a")           # pocz¹tek ci¹gu
str_view_all(string = "aabbaa", pattern = "a$")           # koniec ci¹gu


# rozgl¹danie siê (look arounds)

str_view_all("abacadaedac", "a(?=c)")          # szukamy a, które jest przed c
str_view_all("abacadaedac", "a(?!c)")          # szukamy a, które nie jest przed c
str_view_all("abacadaedac", "(?<=b)a")         # szukamy a poprzedzone przez b
str_view_all("abacadaedac", "(?<!b)a")         # szukamy a, które nie jest poprzedzone przez b


# kwantyfikatory (quantifiers)

str_view_all(".a.aa.aaaa.aaa", "a?")            # zero albo jedno a
str_view_all(".a.aa.aaaa.aaa", "a*")            # zero albo wiêcej a
str_view_all(".a.aa.aaaa.aaa", "a+")            # jedno albo wiêcej a
str_view_all(".a.aa.aaaa.aaa", "a{3}")          # dok³adnie trzy a
str_view_all(".a.aa.aaaa.aaa", "a{2,}")         # dwa albo wiêcej a
str_view_all(".a.aa.aaaa.aaa", "a{2,3}")        # miêdzy dwa a trzy a


# grupy (groups)

# u¿ywamy nawiasów aby ustanowiæ precedens (kolejnoœæ oceny) i stworzyæ grupê

str_view_all("abcde", "(ab|d)e")
str_view_all("abbaab", "(a)(b)\\2\\1")


# inne

str_view_all("a  b   c d e", "[:space:]")      # zaznacza spacje i tabulatory


# symbole, które znajdzie "[:graph:]" oraz "[:punct:]"
# ,.:;?!\|/`=*+-^_~'[]{}()<>@#$", 

# symbole, które znajdzie "[:graph:]", "[:alnum:]", "[:digit:]"
# 0,1,2,3,4,5,6,7,8,9

# symbole, które znajdzie "[:graph:]", "[:alnum:]", "[:alpha:]", "[:lower:]"
# abcdefghijklmnopqrstuvwxyz

# symbole, które znajdzie "[:graph:]", "[:alnum:]", "[:alpha:]", "[:upper:]"
# ABCDEFGHIJKLMNOPQRSTUVWXYZ























