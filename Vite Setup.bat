@ECHO off
TITLE Create Web Application with Vite

:: Variables
SET app-name=app
SET template-name=react-ts

:: App name
ECHO Enter "app-name"; default: "app"
SET /p app-name=

:: Vite Setup
CD ..
CALL npm create vite@latest %app-name% -- --template %template-name%
CD %app-name%
CALL npm install
CALL npm install react-router-dom localforage match-sorter sort-by
CALL npm install react-helmet-async
CALL npm install -D tailwindcss postcss autoprefixer
CALL npx tailwindcss init -p
CALL npm install --save react-toastify
CALL npm install axios
CALL npm install @heroicons/react

:: Cleanup
XCOPY /s /y "..\Vite-Setup\app\*" "."
IF EXIST public DEL /q public
IF EXIST src (
	CD src
	IF EXIST assets DEL /q assets
	IF EXIST App.css DEL /q App.css
	CD ..
)

:: Git
CALL git init
CALL git add .
CALL git commit -m "Initial commit"

PAUSE
