import json

ocr_path = "pdf_data/drawings_ocr.json"
try:
    with open(ocr_path, "r", encoding="utf-8") as f:
        data = json.load(f)
    print("Keys in drawings_ocr.json:", list(data.keys()))
    print(f"Total drawings in OCR: {len(data)}")
    
    # Preview some page details
    for page, val in list(data.items())[:5]:
        print(f"\n--- Page {page} ---")
        text = val.get("text", "")
        print(f"Length of text: {len(text)}")
        lines = [l.strip() for l in text.split("\n") if l.strip()]
        print("First 10 non-empty lines:")
        for line in lines[:10]:
            print(f"  {line}")
except Exception as e:
    print("Error:", e)
