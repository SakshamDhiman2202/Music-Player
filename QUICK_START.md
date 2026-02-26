# QUICK START - MusicPlayer

**Get the app running in 5 minutes!**

## Prerequisites
- Python 3.10+
- macOS (as per your environment)

## One-Command Setup
```bash
cd /Users/sakshamdhiman/MusicPlayer && source venv/bin/activate 2>/dev/null || (python3 -m venv venv && source venv/bin/activate) && pip install -r requirements.txt && python manage.py migrate && python manage.py createsuperuser && python manage.py runserver
```

## Step-by-Step Setup

### 1. Activate Virtual Environment
```bash
cd /Users/sakshamdhiman/MusicPlayer
source venv/bin/activate
```

### 2. Install Dependencies (if not already installed)
```bash
pip install -r requirements.txt
```

### 3. Create Admin Account
```bash
python manage.py createsuperuser
```
Then enter:
- Username: `admin`
- Email: Your email
- Password: Your password

### 4. Start Server
```bash
python manage.py runserver
```

### 5. Open Browser
Visit: **http://localhost:8000**

---

## Usage

### As Regular User
1. Click "Register" → Create account → Login
2. Browse songs on home page
3. Click any song to play it
4. Click ❤️ to add to favorites
5. Create playlists in "Playlists" menu
6. View profile stats

### As Admin
1. Go to http://localhost:8000/admin
2. Login with superuser account
3. Click "+ Add Song" to upload music
4. Fill in details and upload audio file
5. New songs appear on home page

---

## Player Controls

**Bottom Music Player Bar (Spotify-style):**
- Click song card → Load in player
- ▶️ Button → Play/Pause
- ⏭️ → Next song
- ⏮️ → Previous song
- Timeline → Skip to time
- 🔊 Slider → Change volume

**Keyboard Shortcuts:**
- **Space** → Play/Pause
- **←** → Previous song
- **→** → Next song

---

## Supported Audio Formats
- MP3 (.mp3)
- WAV (.wav)
- OGG (.ogg)
- M4A (.m4a)

---

## Demo Account
No account needed initially - 10 sample songs are pre-loaded!

**Admin Sample:**
- Username: `admin`
- Password: Create your own

---

## Troubleshooting

### Server won't start?
```bash
python manage.py runserver 8001  # Use port 8001
```

### Database error?
```bash
rm db.sqlite3
python manage.py migrate
python manage.py seed_songs
```

### Can't access admin?
```bash
python manage.py createsuperuser  # Create new admin
```

---

## Project Files

Key files to customize:
- **Styling**: `static/css/style.css`
- **Player Logic**: `static/js/player.js`
- **Settings**: `musicplayer/settings.py`
- **Database Models**: `music/models.py`

---

## Next Steps

1. **Upload Music**: Visit admin panel → Music → Add Song
2. **Customize Look**: Edit `static/css/style.css`
3. **Add Features**: Check `music/views.py` and `music/models.py`
4. **Deploy**: See README.md for production instructions

---

## Default Sample Songs
✓ Summer Vibes
✓ Midnight Dreams
✓ Rock Anthem
✓ Jazz Nights
✓ Hip Hop Flow
✓ Classical Beauty
✓ Country Roads
✓ Dance Floor
✓ Reggae Sunset
✓ Blues Soul

---

**That's it! Enjoy your music player!** 🎵

For detailed documentation, see:
- `README.md` - Full documentation
- `SETUP_GUIDE.md` - Detailed setup
- `VERIFICATION.md` - Project checklist
