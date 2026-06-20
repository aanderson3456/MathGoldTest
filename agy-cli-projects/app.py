import os
import re
import xml.etree.ElementTree as ET
import requests
from flask import Flask, jsonify, render_template

app = Flask(__name__)

FEED_URL = "https://docs.cloud.google.com/feeds/bigquery-release-notes.xml"

def clean_html_to_text(html):
    # Remove HTML tags
    text = re.sub(r'<[^>]+>', '', html)
    # Replace multiple whitespace/newlines with a single space
    text = re.sub(r'\s+', ' ', text).strip()
    return text

def parse_release_notes():
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
    }
    response = requests.get(FEED_URL, headers=headers, timeout=15)
    response.raise_for_status()
    
    root = ET.fromstring(response.content)
    ns = {'atom': 'http://www.w3.org/2005/Atom'}
    
    entries = []
    
    for entry in root.findall('atom:entry', ns):
        title_elem = entry.find('atom:title', ns)
        date_str = title_elem.text if title_elem is not None else "Unknown Date"
        
        updated_elem = entry.find('atom:updated', ns)
        updated_str = updated_elem.text if updated_elem is not None else ""
        
        link_elem = entry.find('atom:link[@rel="alternate"]', ns)
        if link_elem is None:
            link_elem = entry.find('atom:link', ns)
        link = link_elem.attrib.get('href', '') if link_elem is not None else ''
        
        id_elem = entry.find('atom:id', ns)
        id_str = id_elem.text if id_elem is not None else ""
        
        content_elem = entry.find('atom:content', ns)
        content_html = content_elem.text if content_elem is not None else ""
        
        # Split items inside the entry content
        items = []
        parts = re.split(r'<h3>(.*?)</h3>', content_html)
        if len(parts) > 1:
            for i in range(1, len(parts), 2):
                note_type = parts[i].strip()
                note_body = parts[i+1].strip() if i+1 < len(parts) else ""
                clean_text = clean_html_to_text(note_body)
                items.append({
                    'type': note_type,
                    'body': note_body,
                    'text': clean_text
                })
        else:
            clean_text = clean_html_to_text(content_html)
            items.append({
                'type': 'General',
                'body': content_html,
                'text': clean_text
            })
            
        entries.append({
            'date': date_str,
            'updated': updated_str,
            'link': link,
            'id': id_str,
            'items': items
        })
        
    return entries

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/api/releases')
def get_releases():
    try:
        releases = parse_release_notes()
        return jsonify({
            'status': 'success',
            'data': releases
        })
    except Exception as e:
        return jsonify({
            'status': 'error',
            'message': str(e)
        }), 500

if __name__ == '__main__':
    # Get port from environment or default to 5001
    port = int(os.environ.get('PORT', 5001))
    app.run(host='0.0.0.0', port=port, debug=True)
