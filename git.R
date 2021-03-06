##### GIT - RStudio #####

rm(list = ls())
.libPaths("D:/Dysk R/R_library")
setwd("D:\\Dysk R\\+ GIT\\repozytorium")

# http://r-pkgs.had.co.nz/git.html
# https://p1k3.com/userland-book/
# https://git-scm.com/book/pl/v2

# 1. Instrukcja : jak zacz�� 

# Na pocz�tku trzeba za�o�y� konto na https://github.com/ (konto jest darmowe), a potem za�o�y� tam repozytorium
# (wystarczy post�powa� zgodnie z tym, co jest na stronie, za�o�enie repozytorium jest proste)
# tutorial jest na youtube https://www.youtube.com/watch?v=SWYqp7iY_Tc

# Po drugie trzeba pobra� GIT ze strony https://git-scm.com/download/win (je�li pracujemy na Windowsie)


# Nast�pnie konfigurujemy konto GIT wpisuj�c w to okno nast�puj�ce polecenia:

# git                                                            # nie jest to konieczne ale pozwala zaznajomi� si� z podstawowymi poleceniami GIT
# git config --global user.name "jakkub90"                       # w miejsce xxxxx wpisujemy nasz� nazw� u�ytkownika z githuba
# git config --global user.email "jakubkubiak90@gmail.com"       # w miejsce xxxxx wpisujemy nasz email
# git config --list                                              # ta komenda pozwala sprawdzi�, czy dobrze wprowadzili�my dane (nie jest konieczna)

# Wchodzimy w Tools -> Global options -> Git/SVN
# i zaznaczamy element u g�ry (Enable version control interface for RStudio project)

# nast�pne tworzymy nowy projekt
# File -> New project -> Version Control -> Git
# W tym miejscu kopiujemy nasz adres URL pobrany z Githuba (przyk�adowy wygl�da nast�puj�co https://github.com/jakkub90/repozytorium.git)

# potem ustalamy folder na naszym dysku, gdzie b�d� zapisywane dane (RStudio powinien si� ponownie uruchomi�)
# tworzymy nowy RScript i zapisujemy go (powinien si� zapisa� w lokalizacji, kt�r� wskazali�my jako repozytorium naszego projektu na dysku)

# W celu zaktualizowania pliki w GitHubie:

# 1/ klikamy Pull
# 2/ kliekamy Commit (zaznaczamy plik i nadajemy nazw�)
# 3/ W wierszu polece� (Shell, kt�ry mo�na znale�� w zak�adce Git w Rstudiu) wystarczy wpisa� nast�puj�ce komendy

# git remote add origin git@github.com:login/repozytorium.git
# git push -u origin master


# przydatne polecenia:

# http://www.ee.surrey.ac.uk/Teaching/Unix/unix1.html

# ls                                      wskazuje wszystkie pliki w folderze roboczym
# ls -l                                   wskazuje wszystkie pliki w folderze rob. ze szczeg�ami
# ls -a                                   wskazuje wszystkie pliki i foldery
# mkdir nowyfolder                        tworzy folder o nazwie nowyfolder
# cd directory                            ustawia (zmienia) folder roboczy o nazwie directory
# cd ~                                    ustawia pierwotny folder roboczy
# cd ..                                   ustawia folder roboczy na katalog nadrz�dny
# pwd                                     wskazuje obecny katalog roboczy
# cat nowyfolder \ cat plik.txt           wy�wietla zawarto�� plik.txt lub informuje, czy istniej wskazany folderze
# rmdir nowyfolder                        usuwa folder o nazwie nowyfolder
# mv plik.txt nowyfolder                  przenosi plik o nazwie plik.txt do folderu nowyfolder
# cp plik.txt nowyfolder                  tworzy kopie plik plik.txt w folderze nowyfolder
# rm plik.txt                             usuwa plik o nazwie plik.txt
# *                                       symbol gwiazdki (asterisk) oznacza zaznaczenie wszystkigo
# sort                                    sortuje wynik wy�wiatlany z cat



# wyja�nienie czynno�ci GIT w RStudio

# Diff             - wskazuje nam, co zmienili�my w danym pliku
# Commit           - aktualizuje nasze dane lokalnie (trzeba wskaza� plik oraz nazw� pliku)
# Pull             - weryfikuje poprawno�� pliku zapisanego lokalnie z plikiem z GitHuba
# Push             - aktualizuje dane na GitHubie
# symbol znaku     - przedstawia nam histori�
# Shell            - tworzy wiersz polece� (potrzebne, by wykona� wiele polece�)




