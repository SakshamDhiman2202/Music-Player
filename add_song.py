#!/usr/bin/env python
import os
import django
import sys

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'musicplayer.settings')
django.setup()

from music.models import Song

try:
    # Check if song already exists
    if Song.objects.filter(title='New Song').exists():
        print("❌ Song already exists")
        sys.exit(1)
    
    # Create new song
    song = Song.objects.create(
        title='New Song',
        artist='Test Artist',
        album='Test Album',
        genre='Pop',
        duration=180
    )
    
    print("✅ SUCCESS!")
    print(f"Song '{song.title}' has been added to the database")
    print(f"\nNow:")
    print("1. Go to http://localhost:8000")
    print("2. You'll see 'New Song' in the homepage")
    print("3. Click it to add to player")
    print("4. Click ▶️ to play (needs audio file)")
    print("\nTo add audio file:")
    print("1. Go to http://localhost:8000/admin")
    print("2. Click 'Songs'")
    print("3. Click 'New Song'")
    print("4. Upload audio file (MP3, WAV, OGG, M4A)")
    print("5. Save")
    print("6. Go back to http://localhost:8000 and play!")
    
except Exception as e:
    print(f"❌ Error: {e}")
    import traceback
    traceback.print_exc()
