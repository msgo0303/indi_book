import os

files_to_update = [
    'index.html',
    'About.html',
    'form.html',
    'library.html',
    'events.html',
    'community.html',
    'temp.html',
    'login.html',
    'Admin_1.html'
]

replacements = {
    'href="index.html"': 'href="/"',
    'href="About.html"': 'href="/about"',
    'href="About.html?tab=tab3"': 'href="/about?tab=tab3"',
    'href="library.html"': 'href="/library"',
    'href="events.html"': 'href="/events"',
    'href="community.html"': 'href="/community"',
    'href="form.html"': 'href="/form"',
    'href="temp.html"': 'href="/temp"',
    'href="login.html"': 'href="/login"',
    'href="Admin_1.html"': 'href="/admin"',
    'href=\'index.html\'': 'href=\'/\'',
    'href=\'About.html\'': 'href=\'/about\'',
    'href=\'About.html?tab=tab3\'': 'href=\'/about?tab=tab3\'',
    'href=\'library.html\'': 'href=\'/library\'',
    'href=\'events.html\'': 'href=\'/events\'',
    'href=\'community.html\'': 'href=\'/community\'',
    'href=\'form.html\'': 'href=\'/form\'',
    'href=\'temp.html\'': 'href=\'/temp\'',
    'href=\'login.html\'': 'href=\'/login\'',
    'href=\'Admin_1.html\'': 'href=\'/admin\''
}

base_dir = r"c:\Users\gmdoh\Desktop\grandP"

for file_name in files_to_update:
    file_path = os.path.join(base_dir, file_name)
    if not os.path.exists(file_path):
        print(f"File not found: {file_name}")
        continue
    
    # Try reading with utf-8 first
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
    except UnicodeDecodeError:
        # Fallback to cp949/euc-kr if utf-8 fails
        with open(file_path, 'r', encoding='cp949') as f:
            content = f.read()
    
    original_content = content
    for old, new in replacements.items():
        content = content.replace(old, new)
        
    if original_content != content:
        # Write back in utf-8
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"Updated: {file_name}")
    else:
        print(f"No changes: {file_name}")
