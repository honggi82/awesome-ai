@echo off
setlocal
cd /d "%~dp0"

set "GH_EXE=%~dp0.tools\gh\bin\gh.exe"
if not exist "%GH_EXE%" if exist "%~dp0..\awesome-BCI\.tools\gh\bin\gh.exe" set "GH_EXE=%~dp0..\awesome-BCI\.tools\gh\bin\gh.exe"
if not exist "%GH_EXE%" set "GH_EXE=gh"

"%GH_EXE%" auth status
if errorlevel 1 (
  echo.
  echo GitHub login is required. Run:
  echo   "%GH_EXE%" auth login --hostname github.com --web --scopes repo
  exit /b 1
)

"%GH_EXE%" repo view honggi82/awesome-ai >nul 2>nul
if errorlevel 1 (
  "%GH_EXE%" repo create honggi82/awesome-ai --public --description "Awesome AI: metadata-driven AI paper curation, 2020-2026" --source . --remote origin --push
) else (
  git remote set-url origin https://github.com/honggi82/awesome-ai.git
  git push -u origin main
)
if errorlevel 1 exit /b %errorlevel%

"%GH_EXE%" api repos/honggi82/awesome-ai/pages -X POST -f "source[branch]=main" -f "source[path]=/docs" >nul 2>nul
if errorlevel 1 (
  "%GH_EXE%" api repos/honggi82/awesome-ai/pages -X PUT -f "source[branch]=main" -f "source[path]=/docs" >nul 2>nul
)

echo.
echo Done: https://github.com/honggi82/awesome-ai
echo Pages: https://honggi82.github.io/awesome-ai/
