set RECIPE_DIR_BACKUP=%RECIPE_DIR%
set LIBRARY_INC_BACKUP=%LIBRARY_INC%
set PREFIX_BACKUP=%PREFIX%
call %BUILD_PREFIX%\Library\bin\run_autotools_clang_conda_build.bat
if errorlevel 1 exit 1
:: Restore RECIPE_DIR, LIBRARY_INC and PREFIX workaround
:: for https://github.com/conda-forge/autotools_clang_conda-feedstock/issues/13
set PREFIX=%PREFIX_BACKUP%
set LIBRARY_INC=%LIBRARY_INC_BACKUP%
set RECIPE_DIR=%RECIPE_DIR_BACKUP%
