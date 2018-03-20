##### GIT - RStudio #####

rm(list = ls())
.libPaths("D:/Dysk R/R_library")
setwd("D:\\Dysk R\\+ GIT\\repozytorium")

# http://r-pkgs.had.co.nz/git.html
# https://p1k3.com/userland-book/
# https://git-scm.com/book/pl/v2

# 1. Instrukcja : jak zacz¹æ 

# Na pocz¹tku trzeba za³o¿yæ konto na https://github.com/ (konto jest darmowe), a potem za³o¿yæ tam repozytorium
# (wystarczy postêpowaæ zgodnie z tym, co jest na stronie, za³o¿enie repozytorium jest proste)
# tutorial jest na youtube https://www.youtube.com/watch?v=SWYqp7iY_Tc

# Po drugie trzeba pobraæ GIT ze strony https://git-scm.com/download/win (jeœli pracujemy na Windowsie)


# Nastêpnie konfigurujemy konto GIT wpisuj¹c w to okno nastêpuj¹ce polecenia:

# git                                                            # nie jest to konieczne ale pozwala zaznajomiæ siê z podstawowymi poleceniami GIT
# git config --global user.name "jakkub90"                       # w miejsce xxxxx wpisujemy nasz¹ nazwê u¿ytkownika z githuba
# git config --global user.email "jakubkubiak90@gmail.com"       # w miejsce xxxxx wpisujemy nasz email
# git config --list                                              # ta komenda pozwala sprawdziæ, czy dobrze wprowadziliœmy dane (nie jest konieczna)

# Wchodzimy w Tools -> Global options -> Git/SVN
# i zaznaczamy element u góry (Enable version control interface for RStudio project)

# nastêpne tworzymy nowy projekt
# File -> New project -> Version Control -> Git
# W tym miejscu kopiujemy nasz adres URL pobrany z Githuba (przyk³adowy wygl¹da nastêpuj¹co https://github.com/jakkub90/repozytorium.git)

# potem ustalamy folder na naszym dysku, gdzie bêd¹ zapisywane dane (RStudio powinien siê ponownie uruchomiæ)
# tworzymy nowy RScript i zapisujemy go (powinien siê zapisaæ w lokalizacji, któr¹ wskazaliœmy jako repozytorium naszego projektu na dysku)

# W celu zaktualizowania pliki w GitHubie:

# 1/ klikamy Pull
# 2/ kliekamy Commit (zaznaczamy plik i nadajemy nazwê)
# 3/ W wierszu poleceñ (Shell, który mo¿na znaleŸæ w zak³adce Git w Rstudiu) wystarczy wpisaæ nastêpuj¹ce komendy

# git remote add origin git@github.com:login/repozytorium.git
# git push -u origin master


# przydatne polecenia:

# http://www.ee.surrey.ac.uk/Teaching/Unix/unix1.html

# ls                                      wskazuje wszystkie pliki w folderze roboczym
# ls -l                                   wskazuje wszystkie pliki w folderze rob. ze szczegó³ami
# ls -a                                   wskazuje wszystkie pliki i foldery
# mkdir nowyfolder                        tworzy folder o nazwie nowyfolder
# cd directory                            ustawia (zmienia) folder roboczy o nazwie directory
# cd ~                                    ustawia pierwotny folder roboczy
# cd ..                                   ustawia folder roboczy na katalog nadrzêdny
# pwd                                     wskazuje obecny katalog roboczy
# cat nowyfolder \ cat plik.txt           wyœwietla zawartoœæ plik.txt lub informuje, czy istniej wskazany folderze
# rmdir nowyfolder                        usuwa folder o nazwie nowyfolder
# mv plik.txt nowyfolder                  przenosi plik o nazwie plik.txt do folderu nowyfolder
# cp plik.txt nowyfolder                  tworzy kopie plik plik.txt w folderze nowyfolder
# rm plik.txt                             usuwa plik o nazwie plik.txt
# *                                       symbol gwiazdki (asterisk) oznacza zaznaczenie wszystkigo
# sort                                    sortuje wynik wyœwiatlany z cat



# wyjaœnienie czynnoœci GIT w RStudio

# Diff             - wskazuje nam, co zmieniliœmy w danym pliku
# Commit           - aktualizuje nasze dane lokalnie (trzeba wskazaæ plik oraz nazwê pliku)
# Pull             - weryfikuje poprawnoœæ pliku zapisanego lokalnie z plikiem z GitHuba
# Push             - aktualizuje dane na GitHubie
# symbol znaku     - przedstawia nam historiê
# Shell            - tworzy wiersz poleceñ (potrzebne, by wykonaæ wiele poleceñ)




