# MusicPlayer - Complete Setup & Run Guide

This is a step-by-step guide to get the MusicPlayer application running on your machine.

## System Requirements

- **macOS** (as per environment)
- **Python 3.10+**
- **pip** (Python package manager)
- **Git** (optional, for version control)
- **Minimum 500MB** free disk space

## Quick Start (3 Steps)

### Step 1: Install Dependencies
```bash
cd /Users/sakshamdhiman/MusicPlayer
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
```

### Step 2: Initialize Database
```bash
source venv/bin/activate
python manage.py makemigrations music
python manage.py migrate
python manage.py seed_songs
```

### Step 3: Create Admin Account & Run Server
```bash
source venv/bin/activate

# Create admin user (you'll be prompted for username and password)
python manage.py createsuperuser

# Start development server
python manage.py runserver
```

The application will be available at: **http://localhost:8000**

---

## Detailed Setup Instructions

### 1. Navigate to Project Directory
```bash
cd /Users/sakshamdhiman/MusicPlayer
```

### 2. Create Python Virtual Environment
Virtual environments isolate project dependencies from your system Python.

```bash
# Create virtual environment
python3 -m venv venv

# Activate it (you'll see (venv) prefix in terminal)
source venv/bin/activate

# On subsequent sessions, just run:
source venv/bin/activate
```

### 3. Upgrade pip
```bash
pip install --upgrade pip
```

### 4. Install Project Dependencies
```bash
# Install all required packages from requirements.txt
pip install -r requirements.txt

# Verify installation
pip list
```

Expected packages:
- Django 5.0.1
- Pillow (image handling)
- mutagen (audio metadata)
- django-cors-headers

### 5. Create Database Migrations
```bash
# Generate migration files for music app
python manage.py makemigrations music

# You should see output like:
# Migrations for 'music':
#   music/migrations/0001_initial.py
```

### 6. Apply Migrations to Database
```bash
# Apply all migrations to create database tables
python manage.py migrate

# You should see output like:
# Operations to perform:
#   Apply all migrations: admin, auth, contenttypes, sessions, music
# Running migrations:
#   Applying music.0001_initial... OK
```

### 7. Load Sample Data (Optional)
```bash
# Populate database with 10 sample songs for testing
python manage.py seed_songs

# You should see:
# Created: Summer Vibes - The Beatmakers
# Created: Midnight Dreams - Luna Echo
# ... etc
# Total songs created: 10
```

### 8. Create Superuser Account
```bash
# Create admin account for Django admin panel
python manage.py createsuperuser

# You'll be prompted for:
# Username: (enter admin username)
# Email address: (enter your email)
# Password: (enter secure password)
# Password (again): (confirm password)
```

### 9. Run Development Server
```bash
# Start the development server
python manage.py runserver

# You should see output like:
# Starting development server at http://127.0.0.1:8000/
# Quit the server with CONTROL-C
```

---

## Accessing the Application

Once the server is running, open your web browser and visit:

### General Users
- **Home Page**: http://localhost:8000
- **Register**: http://localhost:8000/register/
- **Login**: http://localhost:8000/login/
- **Playlists**: http://localhost:8000/playlists/
- **Favorites**: http://localhost:8000/favorites/
- **Profile**: http://localhost:8000/profile/

### Admin Users
- **Admin Panel**: http://localhost:8000/admin
- **Upload Songs**: http://localhost:8000/admin/music/song/add/
- **Manage Users**: http://localhost:8000/admin/auth/user/

---

## First Time Usage

### 1. Create Your Account
1. Go to http://localhost:8000/register/
2. Enter username, password, and confirm password
3. Click "Register"
4. You'll be logged in automatically

### 2. Upload Songs (Admin Only)
1. Login with your superuser account
2. Go to http://localhost:8000/admin
3. Click on "+ Add Song" in the Music section
4. Fill in details:
   - **Title**: Song name
   - **Artist**: Artist name
   - **Album**: Album name (optional)
   - **Genre**: Music genre (Rock, Pop, Jazz, etc.)
   - **Duration**: Song duration in seconds
   - **Audio file**: MP3, WAV, OGG, or M4A file
   - **Cover image**: Album art (optional)
5. Click "Save"

### 3. Play Music
1. Go to http://localhost:8000
2. Click on any song card to load it in the player
3. Click the green Play button in the bottom player bar
4. Use playback controls to control music

### 4. Create Playlists
1. Click "Playlists" in navigation
2. Click "Create Playlist"
3. Enter playlist name and save
4. Go back to home and click the "+" button on songs to add them

---

## Troubleshooting

### Issue: "python3 not found"
**Solution**: 
- macOS: Install Python from https://www.python.org/downloads/
- Or use Homebrew: `brew install python3`

### Issue: "pip: command not found"
**Solution**: 
```bash
python3 -m pip install --upgrade pip
```

### Issue: "Permission denied" when running scripts
**Solution**:
```bash
# Make script executable
chmod +x setup.sh

# Then run it
./setup.sh
```

### Issue: Port 8000 already in use
**Solution**:
```bash
# Run on a different port
python manage.py runserver 8001
# Access at http://localhost:8001
```

### Issue: Database errors or migrations failing
**Solution**:
```bash
# Reset database completely (WARNING: deletes all data!)
rm db.sqlite3
python manage.py migrate
python manage.py createsuperuser
python manage.py seed_songs
```

### Issue: Static files not loading (CSS/JS)
**Solution**:
```bash
# Collect static files
python manage.py collectstatic --noinput
```

### Issue: Audio files not playing
**Solution**:
1. Ensure files are in supported format (MP3, WAV, OGG, M4A)
2. Check browser developer console (F12) for errors
3. Verify media directory has proper permissions:
```bash
chmod -R 755 media/
```

### Issue: Images not loading
**Solution**:
```bash
# Create required directories
mkdir -p media/covers
mkdir -p media/avatars
mkdir -p media/songs
chmod -R 755 media/
```

---

## Development Tips

### Using the Django Shell
```bash
source venv/bin/activate
python manage.py shell

# Example commands:
from music.models import Song
songs = Song.objects.all()
print(songs)
exit()
```

### View Database Queries (SQL)
```python
from django.db import connection
from django.test.utils import CaptureQueriesContext

# In Django shell
from django.db import connection
connection.queries  # Shows all queries executed
```

### Reset Everything
```bash
# Complete reset of the project
source venv/bin/activate
rm db.sqlite3
python manage.py migrate
python manage.py createsuperuser
python manage.py seed_songs
```

### Run with Different Settings
```bash
# Development mode (default)
python manage.py runserver

# Specific host and port
python manage.py runserver 192.168.1.100:8000

# No auto-reload
python manage.py runserver --nothreading
```

---

## Environment Variables (Optional)

Create a `.env` file in the project root for production:

```env
DEBUG=False
SECRET_KEY=your-secret-key-here
ALLOWED_HOSTS=yourdomain.com,www.yourdomain.com
```

---

## File Structure Reference

```
MusicPlayer/
├── db.sqlite3                      # SQLite database (created after migration)
├── manage.py                       # Django management script
├── requirements.txt                # Python dependencies
├── musicplayer/                    # Project configuration
│   ├── settings.py                # Django settings
│   ├── urls.py                    # URL routing
│   ├── wsgi.py                    # Production WSGI config
│   └── asgi.py                    # Async config
├── music/                          # Django app (main functionality)
│   ├── models.py                  # Database models
│   ├── views.py                   # View logic
│   ├── urls.py                    # App URL routing
│   ├── admin.py                   # Admin panel config
│   ├── migrations/                # Database migrations
│   └── management/
│       └── commands/
│           └── seed_songs.py      # Sample data loader
├── templates/                      # HTML templates
│   └── music/                      # Music app templates
├── static/                         # Static files
│   ├── css/style.css              # Styling
│   ├── js/player.js               # Music player logic
│   └── images/                    # Images
├── media/                          # User-uploaded files
│   ├── songs/                     # Audio files
│   ├── covers/                    # Album covers
│   └── avatars/                   # User avatars
└── venv/                           # Virtual environment (ignore)
```

---

## Deactivating Virtual Environment

When you're done working:
```bash
# Deactivate virtual environment
deactivate

# You can delete venv directory if needed to free space
rm -rf venv
```

---

## Next Steps

1. **Customize Settings**: Edit `musicplayer/settings.py`
2. **Add More Songs**: Upload MP3 files through admin panel
3. **Customize Styling**: Modify `static/css/style.css`
4. **Deploy**: Follow deployment guide for production

---

## Getting Help

- **Django Documentation**: https://docs.djangoproject.com/
- **Django Admin**: http://localhost:8000/admin (with admin account)
- **Check Console Output**: Error messages appear in terminal running the server
- **Browser Developer Tools**: F12 key for debugging JavaScript

---

## Performance Tips

1. **Use Database Indexing**: Add `db_index=True` to frequently searched fields
2. **Cache Results**: Implement caching for frequently accessed data
3. **Optimize Images**: Compress album covers before uploading
4. **Use CDN**: Serve static files from CDN in production
5. **Database Optimization**: Regular backups and maintenance

---

**Congratulations! You have successfully set up the MusicPlayer application!** 🎵

Enjoy your music streaming experience!
