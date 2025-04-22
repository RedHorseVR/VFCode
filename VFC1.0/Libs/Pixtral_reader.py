from transformers import AutoProcessor, LlavaForConditionalGeneration
import torch

# Set the device
device = "cuda" if torch.cuda.is_available() else "cpu"

# Load model and processor
model_id = "M:/pixtral-12b"
processor = AutoProcessor.from_pretrained(model_id)
model = LlavaForConditionalGeneration.from_pretrained(model_id, torch_dtype=torch.float16)

# Move model to GPU
model = model.to(device)

# Prepare inputs
IMG_URLS = [
    "https://www.hdwallpapers.in/download/small_flowers_with_green_leaf_plant_hd_flower-1920x1080.jpg",
    "https://www.thoughtco.com/thmb/Q9PPkT7OZk9xU9uTn2qKzvB8vKE=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/lotus-flower-828457262-5c6334b646e0fb0001dcd75a.jpg",
    "https://cdn.pixabay.com/photo/2015/04/19/08/32/rose-729509_640.jpg",
    "https://wallpapers.com/images/hd/sunflower-on-light-blue-sky-vnbybfagr7mlnz8n.jpg"
]

PROMPT = "<s>[INST]Describe the images.\n[IMG][IMG][IMG][IMG][/INST]"

inputs = processor(text=PROMPT, images=IMG_URLS, return_tensors="pt").to(device)

# Generate
with torch.no_grad():
    generate_ids = model.generate(**inputs, max_new_tokens=500)

output = processor.batch_decode(generate_ids, skip_special_tokens=True, clean_up_tokenization_spaces=False)[0]
print(output)