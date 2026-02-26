# MusicPlayer - Django 5 Web-Based Music Player

A fully functional web-based music player application similar to Spotify, built with Django 5, Bootstrap 5, and vanilla JavaScript.

## Features

### Core Features
✅ **Global Music Player Bar** - Fixed bottom player visible on all pages (Spotify-style)
✅ **Play/Pause Controls** - Full playback control with visual feedback
✅ **Skip Navigation** - Next and Previous song buttons with auto-play
✅ **Volume Control** - Adjustable volume slider
✅ **Progress Bar** - Scrubble through songs with time display
✅ **Song Search** - Search by title and artist
✅ **Genre Filtering** - Filter songs by genre
✅ **Sorting Options** - Sort by newest, alphabetical, artist, most played

### User Features
✅ **User Authentication** - Register, Login, Logout functionality
✅ **User Profiles** - Custom user profiles with avatar and bio
✅ **Playlists** - Create, edit, delete personal playlists
✅ **Add to Playlist** - AJAX functionality to add songs to playlists
✅ **Favorites** - Mark songs as favorites with AJAX toggle
✅ **Play History** - Automatic tracking of played songs
✅ **Recently Played** - View recently played songs

### Admin Features
✅ **Admin Panel** - Full Django admin interface
✅ **Song Management** - Upload and manage songs
✅ **Genre Management** - Browse and filter by genre
✅ **Play History Stats** - View play statistics

### Database Models
- **Song** - Title, artist, album, genre, duration, audio file, cover image, play count
- **Playlist** - User playlists with many-to-many song relationship
- **Favorite** - User favorite songs with timestamps
- **PlayHistory** - Track of user's played songs
- **UserProfile** - Extended user profile with avatar and bio

## Project Structure

```
MusicPlayer/
├── manage.py
├── requirements.txt
├── musicplayer/
│   ├── __init__.py
│   ├── settings.py
│   ├── urls.py
│   ├── asgi.py
│   └── wsgi.py
├── music/
│   ├── migrations/
│   ├── management/
│   │   └── commands/
│   │       └── seed_songs.py
│   ├── __init__.py
│   ├── admin.py
│   ├── apps.py
│   ├── models.py
│   ├── urls.py
│   ├── utils.py
│   └── views.py
├── templates/
│   ├── base.html
│   └── music/
│       ├── auth/
│       │   ├── login.html
│       │   └── register.html
│       ├── home.html
│       ├── profile.html
│       ├── update_profile.html
│       ├── favorites.html
│       ├── recently_played.html
│       ├── genre.html
│       └── playlists/
│           ├── playlist_list.html
│           ├── playlist_detail.html
│           ├── create_playlist.html
│           ├── update_playlist.html
│           └── confirm_delete.html
├── static/
│   ├── css/
│   │   └── style.css
│   ├── js/
│   │   └── player.js
│   └── images/
│       └── default-cover.svg
└── media/
    ├── songs/
    └── covers/
```

## Installation & Setup

### 1. Prerequisites
- Python 3.10 or higher
- pip (Python package manager)

### 2. Clone/Create Project
The project is already set up in `/Users/sakshamdhiman/MusicPlayer`

### 3. Create Virtual Environment
```bash
cd /Users/sakshamdhiman/MusicPlayer
python -m venv venv

# Activate virtual environment
# On macOS/Linux:
source venv/bin/activate
# On Windows:
venv\Scripts\activate
```

### 4. Install Dependencies
```bash
pip install -r requirements.txt
```

### 5. Database Setup
```bash
# Create initial migrations
python manage.py makemigrations

# Apply migrations
python manage.py migrate

# Create superuser (admin account)
python manage.py createsuperuser
# Follow the prompts to create admin account

# (Optional) Load sample songs
python manage.py seed_songs
```

### 6. Create Media Directories
```bash
mkdir -p media/songs
mkdir -p media/covers
mkdir -p media/avatars
```

### 7. Collect Static Files (for production)
```bash
python manage.py collectstatic --noinput
```

### 8. Run Development Server
```bash
python manage.py runserver
```

The application will be available at: **http://localhost:8000**

## Usage Guide

### For Regular Users
1. **Register** - Visit `/register/` to create a new account
2. **Login** - Access `/login/` with your credentials
3. **Browse Songs** - View all songs on the home page
4. **Play Songs** - Click on any song to load it in the player
5. **Create Playlists** - Go to Playlists section to create custom playlists
6. **Add to Playlist** - Use the add button on songs to add them to playlists
7. **Favorites** - Click the heart icon to favorite songs
8. **View Profile** - Access your profile to see stats and play history

### For Admin Users
1. Visit `/admin/` with your superuser account
2. **Upload Songs**:
   - Go to Songs section
   - Click "Add Song"
   - Fill in details: Title, Artist, Album, Genre, Duration
   - Upload audio file (MP3, WAV, OGG, M4A)
   - Upload cover image (optional)
   - Save
3. **View Statistics**:
   - Check Play History to see user activity
   - View song play counts
4. **Manage Users**:
   - Edit user profiles
   - Manage user permissions

## Player Keyboard Shortcuts

- **Space**: Play/Pause
- **← Arrow**: Previous song
- **→ Arrow**: Next song

## API Endpoints

### Song Management
- `GET /api/song/<song_id>/` - Get song details
- `POST /api/play-history/` - Record song play

### Playlist Management
- `GET /api/user-playlists/` - Get user's playlists
- `POST /api/add-to-playlist/` - Add song to playlist
- `POST /api/remove-from-playlist/<playlist_id>/` - Remove song from playlist

### Favorites
- `POST /api/toggle-favorite/` - Toggle favorite status

## Supported Audio Formats

- MP3 (.mp3)
- WAV (.wav)
- OGG (.ogg)
- M4A (.m4a)

## Dependencies

- **Django 5.0.1** - Web framework
- **Pillow 10.1.0** - Image processing
- **mutagen 1.46.0** - Audio metadata
- **Bootstrap 5** - Frontend framework (CDN)
- **Font Awesome** - Icons (CDN)

## File Upload Limits & Configuration

Edit `musicplayer/settings.py` to configure:

```python
# Maximum file upload size (default: unlimited)
DATA_UPLOAD_MAX_MEMORY_SIZE = 52428800  # 50MB

FILE_UPLOAD_MAX_MEMORY_SIZE = 52428800  # 50MB

# Media files configuration
MEDIA_URL = '/media/'
MEDIA_ROOT = BASE_DIR / 'media'
```

## Troubleshooting

### Port Already in Use
```bash
# Run on different port
python manage.py runserver 8001
```

### Database Errors
```bash
# Reset database (delete data)
rm db.sqlite3
python manage.py migrate
python manage.py createsuperuser
```

### Static Files Not Loading
```bash
python manage.py collectstatic --clear --noinput
```

### Audio Files Not Playing
- Ensure files are in correct format
- Check file permissions
- Verify `MEDIA_ROOT` and `MEDIA_URL` configuration
- Check browser console for errors

## Browser Compatibility

- Chrome/Chromium - ✅ Full support
- Firefox - ✅ Full support
- Safari - ✅ Full support (15+)
- Edge - ✅ Full support
- IE 11 - ❌ Not supported

## Production Deployment

For production deployment:

1. **Update Secret Key**:
   ```python
   # In settings.py, change:
   SECRET_KEY = 'your-secret-key-here'
   DEBUG = False
   ALLOWED_HOSTS = ['yourdomain.com']
   ```

2. **Use Production Database**:
   ```python
   # Switch from SQLite to PostgreSQL/MySQL
   DATABASES = {
       'default': {
           'ENGINE': 'django.db.backends.postgresql',
           'NAME': 'musicplayer_db',
           'USER': 'postgres',
           'PASSWORD': 'password',
           'HOST': 'localhost',
           'PORT': '5432',
       }
   }
   ```

3. **Configure Static Files**:
   ```bash
   python manage.py collectstatic
   ```

4. **Use Gunicorn**:
   ```bash
   pip install gunicorn
   gunicorn musicplayer.wsgi
   ```

5. **Setup Nginx** as reverse proxy

## Customization

### Change Theme Colors
Edit `static/css/style.css` - Update `:root` CSS variables:
```css
:root {
    --primary-color: #1DB954;  /* Spotify green */
    --secondary-color: #191414;
    --text-color: #FFFFFF;
    --muted-color: #B3B3B3;
    --border-color: #282828;
}
```

### Modify Player Appearance
- Player bar height: `.music-player` height property
- Controls layout: `.player-container` grid-template-columns
- Colors: Update CSS variables in `style.css`

## Support & Issues

If you encounter any issues:
1. Check the Django logs in console
2. Check browser console (F12) for JavaScript errors
3. Verify database is properly set up
4. Ensure all dependencies are installed
5. Check file permissions for media directories

## License

This project is open source and available for educational use.

## Features Roadmap

Future enhancements:
- [ ] Queue management
- [ ] Shuffle and repeat modes
- [ ] Social sharing
- [ ] Collaborative playlists
- [ ] Audio visualization
- [ ] Multiple user accounts with family plan
- [ ] Offline mode with caching
- [ ] Mobile app
- [ ] Podcast support
- [ ] Real-time notifications

---

**Happy Music Playing! 🎵**
