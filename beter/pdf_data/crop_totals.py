import os
import json
from PIL import Image

def crop_totals():
    # Load pages_text.json to get classifications
    json_path = "/home/herbrand/vragen/pdf_data/pages_text.json"
    if not os.path.exists(json_path):
        print(f"Error: {json_path} not found")
        return
        
    with open(json_path, "r") as f:
        pages = json.load(f)
        
    # Create crops directory
    crops_dir = "/home/herbrand/vragen/pdf_data/crops"
    os.makedirs(crops_dir, exist_ok=True)
    
    # Process each page
    for p in pages:
        if p["classification"] == "Measurement Sheet":
            page_num = p["page"]
            filename = f"page-{page_num:03d}.png"
            img_path = os.path.join("/home/herbrand/vragen/pdf_data/pages", filename)
            
            if os.path.exists(img_path):
                img = Image.open(img_path)
                width, height = img.size
                
                # Crop bottom-right corner (e.g. from x=950 to 1240, y=1600 to 1753)
                crop_box = (950, 1600, width, height)
                cropped_img = img.crop(crop_box)
                
                output_filename = f"crop_page_{page_num:03d}.png"
                output_path = os.path.join(crops_dir, output_filename)
                cropped_img.save(output_path)
                print(f"Saved crop for page {page_num:03d} to {output_path}")
            else:
                print(f"Warning: image {img_path} not found")

if __name__ == "__main__":
    crop_totals()
