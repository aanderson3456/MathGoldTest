import os
import sys
import google.auth
from googleapiclient.discovery import build
from googleapiclient.errors import HttpError
from googleapiclient.http import MediaFileUpload

def upload_file(file_path, mime_type=None, folder_id=None):
    """Uploads a file to Google Drive.
    
    Args:
        file_path (str): The local path to the file to upload.
        mime_type (str, optional): The MIME type of the file. If not provided,
            it will be guessed or defaulted.
        folder_id (str, optional): The ID of the parent folder in Google Drive.
        
    Returns:
        str: The ID of the uploaded file, or None if the upload failed.
    """
    if not os.path.exists(file_path):
        print(f"Error: Local file '{file_path}' does not exist.")
        return None
        
    filename = os.path.basename(file_path)
    
    try:
        # Load default credentials. Ensure GOOGLE_APPLICATION_CREDENTIALS is set
        # or credentials are automatically configured in the environment.
        creds, _ = google.auth.default()
        
        # Build the Drive API service (v3)
        service = build('drive', 'v3', credentials=creds)

        # Define file metadata
        file_metadata = {'name': filename}
        if folder_id:
            file_metadata['parents'] = [folder_id]
        
        # Specify the media to upload
        media = MediaFileUpload(file_path, mimetype=mime_type, resumable=True)

        # Execute the upload
        print(f"Uploading '{filename}' to Google Drive...")
        file = service.files().create(
            body=file_metadata,
            media_body=media,
            fields='id, name'
        ).execute()

        print(f"Successfully uploaded: '{file.get('name')}' (ID: {file.get('id')})")
        return file.get('id')

    except HttpError as error:
        print(f"An error occurred during upload: {error}")
        return None
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        return None

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: python upload_to_drive.py <file_path> [folder_id]")
        sys.exit(1)
        
    local_file = sys.argv[1]
    parent_folder = sys.argv[2] if len(sys.argv) > 2 else None
    
    upload_file(local_file, folder_id=parent_folder)
