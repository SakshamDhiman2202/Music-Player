@echo off
echo ==================================
echo MusicPlayer - Quick Setup Script
echo ==================================
echo.

REM Check Python version
echo Checking Python version...
python --version

REM Create virtual environment
echo Creating virtual environment...
python -m venv venv

REM Activate virtual environment
echo Activating virtual environment...
call venv\Scripts\activate.bat

REM Install requirements
echo Installing dependencies...
pip install --upgrade pip
pip install -r requirements.txt

REM Create directories
echo Creating media directories...
if not exist media\songs mkdir media\songs
if not exist media\covers mkdir media\covers
if not exist media\avatars mkdir media\avatars

REM Run migrations
echo Running database migrations...
python manage.py makemigrations
python manage.py migrate

REM Load sample songs
echo Loading sample songs...
python manage.py seed_songs

echo.
echo ==================================
echo Setup Complete!
echo ==================================
echo.
echo Next steps:
echo 1. Create superuser account:
echo    python manage.py createsuperuser
echo.
echo 2. Run development server:
echo    python manage.py runserver
echo.
echo 3. Access the application:
echo    http://localhost:8000
echo.
echo 4. Access admin panel:
echo    http://localhost:8000/admin
echo.
pause
