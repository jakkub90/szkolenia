##### Cheatsheets - �ci�gawki #####

# Cel: opracowanie podstawowych funcji przedstawionych na plikach cheatsheets

# do ogarni�cia
## readr
## stringr
## ggplot2
## dplyr

# https://github.com/mi2-warsaw/SER/tree/master/OtwartaStatystyka

library(rmarkdown)
render("Rmarkdown.Rmd")

rm(list = ls())
.libPaths("D:/Dysk R/R_library")
setwd("D:\\Dysk R\\+cheatsheets")
system('open "D:/Dysk R/+cheatsheets"')


analiza <- function(x){
  return(list(podsumowanie = summary(x), 
              struktura = str(x),
              klasa = class(x), 
              typ_danych = typeof(x), 
              tryb = mode(x), 
              d�ugo�� = length(x), 
              atrybuty = attributes(x)))
}

analiza(mtcars)

message("aaa")
warning("aaa")

sessionInfo()
R.Version()

##### 1. base-r  #####

system('open "D:/Dysk R/+cheatsheets/1. base-r.pdf"')

library("dplyr")

# 1. Pomoc #
# A. Uzyskiwanie dost�pu do plik�w pomocy #

?mean                                     # wyrzuca pomoc dotycz�c� konkretnej funkcji
help.search('help.search')                # Przeszukuje pliki help ze wskazanym s�owem lub fraz�
??utils::help                             # Wszystie tematy ��cz�ce si� z "help" w pakiecie utils
help(package = 'base')                    # szukanie pomocy dla wskazanego pakietu

# B. Wi�cej informacja dotycz�cych obiektu #

df <- mtcars

str(df)                                   # tworzy podsumowanie obiektu
class(df)                                 # znajduje klas� obiektu


# 2. U�ywanie pakiet�w #

install.packages('dplyr')                 # pobiera i instaluje pakiet z repozytorium CRAN
library(dplyr)                            # �aduje pakiet do sesji udost�pniaj�c wszystkie funkcje danego pakietu
dplyr::select                             # u�ywamy funkcj� z konkretnego pakietu (przydatne, gdy nazwy funkcji w r�nych pakietach s� identyczne)
data(iris)                                # �adujemy wbudowany zbi�r danych do �rodowiska 


# 3. Katalog roboczy (Working Directory) #

getwd()                                  # znajduje obecny katalog roboczy
setwd('D:\\Dysk R\\+cheatsheets')        # zmiana obecnego katalogu roboczego na inny


# 4. Wektory (vectors)

# A. Tworzenie wektorow #

c(2,4,6)                                 # ��czenie element�w w wektor
2:6                                      # sekwencja liczb ca�kowitych
seq(from = 2, to = 3, by = 0.1)          # z�o�ona sekwencja
rep(x = 1:2, times = 3)                  # powtarzanie wektora
rep(x = 1:2, each = 3)                   # powtarzane element�w wektora    


# B. Funkcje wektorowe (Vector Functions)

x <- round(runif(23, 0, 50),0)
y <- c(apple = "apple", orange = "orange", juice = "juice")

sort(x)                                  # sortuje wektor
table(x)                                 # przedstawia liczebno�ci danego wektora
rev(x)                                   # zwraca odwr�cony wektor
unique(x)                                # zwraca unikalne warto�ci


# C. Selekcja element�w wektora

x[4]                                     # czwarty element
x[-4]                                    # wszystkie bez czwartego
x[2:4]                                   # elementy od drugiego do czwartego
x[-(2:4)]                                # wszystkie bez element�w od drugiego do czwartego
x[c(1,5)]                                # elementy pierwszy i pi�ty

x[x == 37]                               # elementy r�wne 37
x[x <= 25]                               # elementy mniejsze r�wne 25
x[x %in% c(33,1,42,50,6)]                # elementy w zbiorze (33,1,42,50,6)
y['apple']                               # element z dan� nazw�


# 5. Programowanie #

# A. P�tla "For Loop"

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


# C. P�tla "While Loop"

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

write.table(x = a, file = '+przyk�ad.txt')        # zapisanie pliku tekstowego txt
tabela1 <- read.table(file = '+przyk�ad.txt')     # wczytanie pliku tekstowego txt

write.csv(x = a, file = '+przyk�ad.csv')          # zapisanie pliku csv oddzielonego przecinkiem
tabela1 <- read.csv(file = '+przyk�ad.csv')       # wczytanie pliku csv oddzielonego przecinkiem

save(a, file = '+przyk�ad.Rdata')                 # zapisanie pliku w formacie Rdata - specjalnego typu dla R 
load(file = '+przyk�ad.Rdata')                    # wczytanie pliku w formacie Rdata - specjalnego typu dla R


# 7. Warunkowanie

x
x[15] == x[17]                                   # sprawdzamy czy s� r�wne
x[15] != x[17]                                   # sprawdzamy czy nie s� r�wne
x[15] >  x[17]                                   # sprawdzamy czy jest wi�kszy
x[15] <  x[17]                                   # sprawdzamy czy jest mniejszy
x[15] >= x[17]                                   # sprawdzamy czy jest wi�kszy r�wny
x[15] <= x[17]                                   # sprawdzamy czy jest mniejszy r�wny
is.na(x[15])                                     # sprawdzamy czy brakuje warto�ci
is.null(x[15])                                   # sprawdzamy czy jest null



# 8. Typy

x <- rep(0:1, 10)

as.logical(x)                                    # zamienia na warto�ci logiczne "Boolean values" - PRAWDA lub FA�SZ
as.numeric(x)                                    # zamienia na warto�ci numeryczne (integers albo floating points)
as.character(x)                                  # zamienia na ci�g znak�w (preferowany przy faktorowaniu)
as.factor(x)                                     # zamienia na ci�g znak�w z ustalonymi poziomami (przydatne przy modelach statystycznych)


# 9. Funkcje matematyczne

x <- round(runif(n = 35, min = 0, max = 550),6)
y <- round(runif(n = 35, min = 0, max = 550),6)


log(x = x, base = exp(1))                           # funkcja logarytmiczna, domy�lnie zwraca logarytm naturalny
exp(x = x)                                          # funkcja eksponencjalna (wyk�adnicza)
max(x, na.rm = TRUE)                                # funkcja zwracaj�ca maksimum, na.rm = TRUE wyci�ga z wektora wszytkie NA, domy�lnie FALSE
min(x, na.rm = TRUE)                                # funkcja zwracaj�ca minimum, na.rm = TRUE wyci�ga z wektora wszytkie NA, domy�lnie FALSE
round(x = x, digits = 0)                            # funkcja zaokr�glaj�ca do n-tej liczby po przecinku, domy�lnie digits = 0
signif(x = x, digits = 6)                           # funkcja zaokr�glaj�ca do n znacz�cych cyfr, domy�lnie digits = 6
cor(x = x, y = y, method = "pearson")               # funkcja zwracaj�ca korelacj�, domy�lnie metod� Pearsona
sum(x, y, na.rm = FALSE)                            # funkcja sumuj�ca, na.rm = TRUE wyci�ga z wektora wszytkie NA, domy�lnie FALSE
mean(x = c(x,y), trim = 0, na.rm = FALSE)           # funkcja zwracaj�ca �redni�, trim przycina wektor o dany procent z g�ry i do�u, domy�lnie 0
median(x = x, na.rm = FALSE)                        # funkcja zwracaj�ca median� (liczb� �rodkow�)
quantile(x, probs = c(0,0.25,0.5,0.75,1),           # funkcja zwracaj�ca kwantyle, probs jest ustawiony domy�lnie na 0, 25%, 50%, 75% i 100%
         names = TRUE, na.rm = FALSE, type = 7)      # names informuje, czy pokaza� procenty, na.RM obs�uguje NA, type to spos�b liczenia, domy�lnie 7
rank(x = x, na.last = TRUE)                         # funcja nadaj�ca kolejno�� (rangi) elementom
var(x = x, y = y, na.rm = FALSE)                    # funkcja zwracaj�ca wariancj�
sd(x = x, na.rm = FALSE)                            # funkcja zwracaj�ca odchylenie standardowe


# 10. Przypisywanie warto�ci do zmiennych

a <- "apple"
a


# 11. �rodowisko pracy

ls()                                                # zwraca list� obiekt�w we wskazanym �rodowisku, domy�lnie z bie��cego �rodowiska 
rm(x = a)                                           # usuwa x ze �rodowiska (w tym przypadku jest to zmienna a)
rm(list = ls())                                     # usuwa wszystkie zmienne ze �rodowiska



# 12. Macierze #

m <- matrix(data = 1:16, nrow = 4, ncol = 4,        # tworzenie macierzy 4x5, byrow oznacza narzucanie warto�ci rz�dami, domy�lnie fALSE
            byrow = FALSE)
n <- matrix(data = 36:21, nrow = 4, ncol = 4,
            byrow = TRUE)

m[2, ]                   # drugi rz�d
m[ ,3]                   # trzecia kolumna
m[2,4]                   # element z drugiego rz�du i czwartej kolumny

t(m)                     # transpozycja macierzy
m %*% t(m)               # mno�enie macierzy
solve(a = m, b = n)      # znajdowanie x w r�wnaniu a * x = b


# 13. Listy

l <- list(x = 1:5, y = c("a", "b"))    # lista jest zbiorem element�w, kt�re mog� by� r�nych typ�w
l[[2]]                                 # drugi element listy l
l[1]                                   # nowa lista tylko z pierwszym elementem z listy
l$x                                    # element list nazwany "x"
l['y']                                 # nowa lista tylko z elementem nazwanym "y"


# 14. Data frames

df <- data.frame(x = 1:3, y = letters[1:3])
df <- data.frame(x = 1:3, y = c("a", "b", "c"))

df[, 2]          # druga kolumna
df[2, ]          # drugi rz�d
df[2,2]          # element z drugiego rz�du i drugiej kolumny

df$x             # kolumna nazwana "x"
df[2]            # zwraca drug� kolumn� jako data.frame
df[[2]]          # zwraca elementy z drugiej kolumny jako wektor ze zdefiniowanymiu poziomami (factor)

View(df)         # przegl�danie ca�ego data.frame w osobnym oknie
head(df, n = 6)  # zwraca g�rn� cz�� data.frame, domy�lnie pierwsze 6 wierszy

nrow(df)         # zwraca liczb� wierszy
ncol(df)         # zwraca liczb� kolumn
dim(df)          # zwraca liczb� wierszy i kolumn

cbind(df, z = df[,2])   # ��czy kolumny
rbind(df, "4" = df[3,]) # ��czy wiersze


# 15. Strings (Ci�g znak�w, �a�cuch)

x <- letters
y <- round(runif(n = 26, min = 1, max = 10),0)

paste(x, y, sep = " ; ")                         # ��czenie razem wielu wektor�w
paste(x, collapse = " * ")                       # ��czenie element�w jednego wektora razem
grep(pattern = "d", x = letters)                 # szukanie wyra�enia w zbiorze, zwraca miejsce w danym zbiorze
gsub(pattern = "e", replacement = "i", x = x)    # zamiana wzoru na inny znak w danym zbiorze
toupper("AdAdfmfU")                              # zamiana na wielkie znaki
tolower("AdAdfHDU")                              # zamiana na ma�e znaki
nchar("AdAdfHDU")                                # zwraca liczb� znak�w


# 16. Factors

x <- round(runif(n = 30, min = 1, max = 10),0)

factor(x = x)               # zamienia wektor w faktor, mo�na ustawi� poziomy oraz kolejno��
cut(x = x, breaks = 4)      # zamienia wektor numeryczny w faktor poci�ty na sekcje 
plot(cut(x = x, breaks = 4))

# 17. Statystyki

x <- round(runif(n = 30, min = 1, max = 10),0) 
y <- round(runif(n = 30, min = 1, max = 10),0) 

lm(x ~ y)                  # model liniowy
glm(x ~ y)                 # uog�lniony model liniowy
summary(x)

t.test(x, y)                     # t-test
pairwise.t.test(x, y)            # t-test dla sparowanych danych
prop.test(x = x, n = 30)         # ?
aov(formula = lm(x ~ y))         # analiza wariancji


# 18. Rozk�ady

# A. Zmienne losowe

normal1 <- rnorm(n = 10, mean = 0, sd = 1)
poisson1 <- rpois(n = 10, lambda = 2)
binomial1 <- rbinom(n = 10, size = 100, prob = 0.1)
uniform1 <- runif(n = 10, min = 0, max = 10)

# B. Funkcja g�sto�ci

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


# 19. Tworzenie wykres�w

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



# 3. Pobieranie i uk�adanie komponent�w

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


# 4. Zaokr�glanie Date-times

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


# 7. Dzia�ania matematyczne na datach i czasie

normal <- ymd_hms("2018-01-01 01:30:00",tz="US/Eastern")
gap <- ymd_hms("2018-03-11 01:30:00",tz="US/Eastern")
lap <- ymd_hms("2018-11-04 00:30:00",tz="US/Eastern")
leap <- ymd("2019-03-01")

# Normalne dodawanie bez uwzgl�dniania nieregularno�ci
normal + minutes(90)
gap + minutes(90)
lap + minutes(90)
leap + years(1)

# Dodawanie z uwzgl�dnieniem nieregularno�ci
normal + dminutes(90)
gap + dminutes(90)
lap + dminutes(90)
leap + dyears(1)


interval(normal, normal + minutes(90))
interval(gap, gap + minutes(90))
interval(lap, lap + minutes(90))
interval(leap, leap + years(1))


jan31 <- ymd("20180131")
jan31 + months(1)              # pojawia si� b��d, poniewa� nie istnieje data 31.02.2018
jan31 %m+% months(1)           # funkcja %m+% rozwi�zuje powy�szy problem

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


# poni�sze funkcje zwracaj� liczb� sekund

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


# Interwa�y

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
int_aligns(i, j)             # sprawdza, czy maj� wsp�lne granice
int_overlaps(i, j)           # sprawdza, czy okresy si� pokrywaj� w jakim� punkcie

v <- c(a, a + 100, a + 1000)
int_diff(v)                  # tworzy interwa�y z element�w wektora

int_flip(i)                  # odwraca interwa�

int_standardize(i)           
int_standardize(int_flip(i)) # je�li kierunek interwa�u jest negatywny to odwraca jego kierunek

int_length(i)                # zwraca liczb� sekund w interwale
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

# Pakiet stringr dostarczas zbi�r wewn�trznie zgodnych narz�dzi do pracy z ci�gami znak�w np. sekwencji znak�w otoczonych cudzys�owami

# 1. Wykrywanie dopasowa� (detect matches)

a <- c("jab�ko", "pomara�cze", "og�rek", "kapustaka", "truskawki", "du�y*owoc", "czarna porzeczka")

str_detect(a, "ka")                      # sprawdza, czy w danym ci�gu znajduje si� wz�r
str_which(a, "ka")                       # sprawdza, w kt�rym ci�gu znajduje si� dany wz�r
str_count(a, "ka")                       # sprawdza, ile razy wz�r pojawi� si� w danym ci�gu
str_locate(a, "ka")                      # lokalizuje pozycje pasuj�cych wzorc�w w �a�cuchu, zwraca macierz z informacj� o pierwszym wzorze
str_locate_all(a, "ka")                  # Zlokalizuj pozycje pasuj�cych wzorc�w w �a�cuchu, zwraca list� ze wszystkimi wzorcami


# 2. Podzbiory ci�g�w (Subset strings)

str_sub(string = a, start = 2L, end = 4L)   # wyodr�bnia podci�gi z ci�gu znak�w (od 2 znaku do 4, razem 3 znaki)
str_sub(string = a, start = 3, end = -2)    # jak wy�ej, ale minus oznacza do danego znaku od ko�ca, tj. od 3 znaku do 2 od ko�ca
str_subset(string = a, pattern = "ka")      # zwraca tylko te ci�gi, kt�re zawieraj� dany wz�r
str_extract(string = a, pattern = "ka")     # zwraca pierwsze znalezione dopasowanie wzoru jako wektor
str_extract_all(string = a, pattern = "ka") # jw. ale zwraca jako list� wszystkie dopasowane wzory
str_match(string = a, pattern = "ka")       # zwraca jako macierz pierwszy dopasowany wz�r w ka�dym ci�gu
str_match_all(string = a, pattern = "ka")   # jak wy�ej, ale jako list� z wszystkimi wzoramui


# 3. Zarz�dzanie d�ugo�ci� (Manage lengths)

a <- fruit
b <- c("   jaB�Ko", "pomaRA�cze   ", "  Og�reK  ", "  kapuS TAka sss", "   TRuSkawki ", " du�y*oWoc", "CZARna porzeczka")

str_length(string = a)                                       # zwraca liczb� znak�w
str_pad(string = a, width = 10, side = "left", pad = "*")    # ustala liczb� znak�w w ci�gu np. dodaje spacje z lewej lub prawej
str_trunc(string = a, width = 7, side = "right", ellipsis = "...")  # skraca ci�g znak�w, zast�puj�c je wielokropkiem, tj. max 7 znak�w
str_trim(string = b, side = "both")                          # przycina odst�py na pocz�tku i ko�cu ci�gu


# 4. Zmienianie ci�g�w (mutate strings)

str_sub(string = a, start = 1, end = 3) <- "aaa"; a             # zamieniamy podci�g znak�w od 1 do 3 now� warto�ci�
str_replace(string = a, pattern = "aaa", replacement = "bbb")   # zamieniamy pierwszy znaleziony wz�r w ci�gu now� warto�ci�
str_replace_all(string = a, pattern = "a", replacement = "b")   # jak wy�ej, ale wszystkie wzory

str_to_lower(string = b, locale = "pl"); b                      # zamienia znaki wielkie na ma�e
str_to_upper(string = b, locale = "pl"); b                      # zamienia znaki ma�e na wielkie
str_to_title(string = b, locale = "pl"); b                      # zmienia pierwszy znak wyrazu w ci�gu na wielki, a pozosta�e na ma�e


# 5. ��czenie i rozdzielanie (join and split)

a <- fruit
b <- as.character(1:20)
c <- data.frame(imiona = LETTERS, liczba = 101:126)

str_c(b, a, sep = "*-x-*", collapse = NULL)                      # ��czy ci�gi ze wskazanym separatorem
str_c(b, a, sep = "*", collapse = " - ")                         # ��czy ci�gi ze wskazanym separatorem i tworzy pojedy�czy ci�g
str_dup(string = b, times = 1:4)                                 # powtarza ci�g wskazan� liczb� razy
str_split_fixed(string = a, pattern = " ", n = 3)                # rozdziela ci�g po wskazanym znaku i tworzy macierz
str_split(string = a, pattern = " ", n = 3, simplify = FALSE)    # jak wy�ej, przy FALSE otrzymujemy list�, a przy TRUE macierz
glue::glue("Pi is {a[1]}")                                       # ��czymy ci�gi, w nawias {} mo�na wrzuci� warto�� innej zmiennej
glue::glue_data(.x = c, "{rownames(c)} jest przy {imiona} oraz {liczba}")      # jak wy�ej z wykorzystaniem data.frame


# 6. Porz�dek ci�g�w (Order strings)

str_order(x = a, decreasing = FALSE)                            # funkcja sortuje ci�g znak�w i zwraca indeksy
str_sort(x = a)                                                 # sortuje ci�g alfabetycznie


# 7. Pomocnicy (Helpers)

str_conv(string = a, encoding = "ISO-8859-1" )                 # napisuje kodowanie ci�gu znak�w
str_view(string = a, pattern = "e", match = TRUE)              # renderuje obraz html z wyrazami ci�gu zawieraj�cymi wz�r, pod�wietla wz�r
str_view_all(string = a, pattern = "e", match = TRUE)          # jak wy�ej, ale pod�wietla ka�dy znaleziony wz�r
str_wrap(sentences, 20)[1:20]                                  # zwija ci�gi w �adnie sformatowane paragrafy


# 8. To trzeba wiedzie� (Need to Know)

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
writeLines("powr�t oznacza cofni�cie si� do pocz�tku \r i nadpisywanie znak�w")
writeLines("u�ywamy \t tabulatora")
writeLines("u�ywamy backspace do kasowania aaa \b\b\b\b\b bbb")
writeLines("u�ywamy to do \f rozpocz�cia nowej strony")
writeLines("alert \a")
writeLines("pionowy \v tabulator")
writeLines("backslash \\ ")
writeLines("apostrof \' ")
writeLines("cudzys��w \" ")
writeLines("backtick \` ")
writeLines("kod �semkowy \102")
writeLines("kod szesnastkowy \xB6")
writeLines("kdo unicode \1213")


# 9. Interpretacje


# Wzory w stringr s� interpretowane jako wyra�enia regularne. 

?regex() 
# umo�liwia pomijanie wielkiej/ma�ej litery, dopasowuje koniec linii z ko�cem ci�gu, pozwala na komentarze wewn�trz
# wyra�enia regularnego oraz na dopasowanie wszystkiego, uwzgl�dniaj�c \n

str_detect("abcdEFGHIJklm", pattern = "j")
str_detect("abcdEFGHIJklm", pattern = regex(pattern = "j", ignore_case = TRUE))   # pomimo ma�ej litery wz�r zosta� znaleziony

?fixed()
# dopasowuje znaki ale pomija ci�gi, kt�re mog� by� reprezentowane na wiele sposob�w
str_detect("asbcsSFUS", fixed("f"))
str_detect("asbcsSFUS", fixed("F"))
str_detect("\u0130", fixed("i"))

?coll()
# umo�liwia wykorzystanie regu�y sortowania specyficzne dla ustawie� lokalnych aby rozpozna� znaki
str_detect("\u0130", coll("i", TRUE, locale = "tr"))

?boundary()
# Dopasowuje granice mi�dzy znakami, podzia�ami wierszy (line_breaks), zdaniami lub s�owami. 
str_split(sentences, boundary("character"))
str_split(sentences, boundary("line_break"))
str_split(sentences, boundary("sentence"))
str_split(sentences, boundary("character"))
str_split(sentences, boundary("word"))


# 10. Wyra�enia regularne (regular expressions)

# dopasowanie znak�w

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
see("\\S")        # wszystko opr�cz pustych przestrzeni
see("\\d")        # zaznacza numery
see("\\D")        # zaznacza wszystko opr�cz numer�w
see("\\w")        # dowolny znak s�owny
see("\\W")        # zaznacza wszystko opr�cz znak�w s�ownych
see("\\b")        # zaznacza granice znak�w s�ownych
see("[:digit:]")  # zaznacza znaki
see("[:alpha:]")  # zaznacza wyrazy
see("[:lower:]")  # zaznacza znaki z ma�ej litery
see("[:upper:]")  # zaznacza znaki z wielkiej litery
see("[:alnum:]")  # zaznacza znaki i s�owa
see("[:punct:]")  # zaznacza interpunkcj�
see("[:graph:]")  # zaznacza znaki, s�owa i interpunkcj�
see("[:space:]")  # zaznacza puste przestrzenie
see("[:blank:]")  # zaznacza puste przestrzenie (spacje) oraz tabulatory ale bez nowej linii
see(".")          # zaznacza wszystko opr�cz nowej linii


# Zamienniki (alternates)

str_view_all(string = "abcde", pattern = "ab|d")          # lub (or)
str_view_all(string = "abcde", pattern = "[abe]")         # jeden z (one of)
str_view_all(string = "abcde", pattern = "[^abe]")        # wszystko poza (anything but)
str_view_all(string = "abcde", pattern = "[a-c]")         # zakres (range)


# kotwice (ancors)

str_view_all(string = "aabbaa", pattern = "^a")           # pocz�tek ci�gu
str_view_all(string = "aabbaa", pattern = "a$")           # koniec ci�gu


# rozgl�danie si� (look arounds)

str_view_all("abacadaedac", "a(?=c)")          # szukamy a, kt�re jest przed c
str_view_all("abacadaedac", "a(?!c)")          # szukamy a, kt�re nie jest przed c
str_view_all("abacadaedac", "(?<=b)a")         # szukamy a poprzedzone przez b
str_view_all("abacadaedac", "(?<!b)a")         # szukamy a, kt�re nie jest poprzedzone przez b


# kwantyfikatory (quantifiers)

str_view_all(".a.aa.aaaa.aaa", "a?")            # zero albo jedno a
str_view_all(".a.aa.aaaa.aaa", "a*")            # zero albo wi�cej a
str_view_all(".a.aa.aaaa.aaa", "a+")            # jedno albo wi�cej a
str_view_all(".a.aa.aaaa.aaa", "a{3}")          # dok�adnie trzy a
str_view_all(".a.aa.aaaa.aaa", "a{2,}")         # dwa albo wi�cej a
str_view_all(".a.aa.aaaa.aaa", "a{2,3}")        # mi�dzy dwa a trzy a


# grupy (groups)

# u�ywamy nawias�w aby ustanowi� precedens (kolejno�� oceny) i stworzy� grup�

str_view_all("abcde", "(ab|d)e")
str_view_all("abbaab", "(a)(b)\\2\\1")


# inne

str_view_all("a  b   c d e", "[:space:]")      # zaznacza spacje i tabulatory


# symbole, kt�re znajdzie "[:graph:]" oraz "[:punct:]"
# ,.:;?!\|/`=*+-^_~'[]{}()<>@#$", 

# symbole, kt�re znajdzie "[:graph:]", "[:alnum:]", "[:digit:]"
# 0,1,2,3,4,5,6,7,8,9

# symbole, kt�re znajdzie "[:graph:]", "[:alnum:]", "[:alpha:]", "[:lower:]"
# abcdefghijklmnopqrstuvwxyz

# symbole, kt�re znajdzie "[:graph:]", "[:alnum:]", "[:alpha:]", "[:upper:]"
# ABCDEFGHIJKLMNOPQRSTUVWXYZ























