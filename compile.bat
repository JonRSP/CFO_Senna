@echo off

:: Navega até a pasta Texto/Capitulos
cd Texto\Capitulos || exit

:: Cria o arquivo capitulos.tex na raiz do projeto
(
    echo %% Lista de capítulos gerada automaticamente
    echo %% Atualize rodando 'gerar_capitulos.bat'
    echo.
    for %%f in (??_*.tex) do (
        echo \input{Texto\Capitulos\%%f}
    )
) > ..\..\capitulos.tex

echo Lista de capítulos gerada em capitulos.tex

cd ..\..

:: Nome do seu arquivo principal LaTeX (sem a extensão .tex)
set MAIN_FILE=monografia

:: Executando o fluxo de compilação LaTeX com biber
pdflatex %MAIN_FILE%.tex
biber %MAIN_FILE%
makeglossaries %MAIN_FILE%
pdflatex %MAIN_FILE%.tex
pdflatex %MAIN_FILE%.tex

:: Deletando os arquivos auxiliares
del /f /q %MAIN_FILE%.aux %MAIN_FILE%.bbl %MAIN_FILE%.blg %MAIN_FILE%.glo %MAIN_FILE%.glg %MAIN_FILE%.gls %MAIN_FILE%.acn %MAIN_FILE%.acr %MAIN_FILE%.out %MAIN_FILE%.toc %MAIN_FILE%.lof %MAIN_FILE%.log %MAIN_FILE%.fls %MAIN_FILE%..bbl %MAIN_FILE%.idx %MAIN_FILE%.run.xml %MAIN_FILE%.lot %MAIN_FILE%.ist %MAIN_FILE%.bcf %MAIN_FILE%..blg %MAIN_FILE%.glsdefs %MAIN_FILE%.alg

echo Compilação concluída e arquivos auxiliares removidos!
