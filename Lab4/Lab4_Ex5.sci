// Kiểm tra và nạp thư viện IPCV
if ~with_module('IPCV') then
    atomsLoad('IPCV');
end

// Truy xuất đường dẫn ảnh mẫu
try
    img_path = fullfile(IPCV_PATH, "images", "lena.png");
catch
    img_path = fullfile(getIPCVpath(), "images", "lena.png");
end

// Thực hiện các bước xử lý dữ liệu
img = imread(img_path); 
img_gray = rgb2gray(img); 
img_eq = imhistequal(img_gray); // Cân bằng lược đồ
h = fspecial('average', 5);
img_blur = imfilter(img_gray, h); // Làm mờ ảnh

// Cấu hình hiển thị trên MỘT cửa sổ duy nhất (Graphic Window 0)
scf(0); 
clf(); // Xóa nội dung cũ trong cửa sổ



// Chia cửa sổ thành lưới 2x2 để hiển thị 4 thành phần
subplot(1,3,1); imshow(img_gray); title("1. Original (Grayscale)");
subplot(1,3,2); imshow(img_eq); title("2. Histogram Equalized");
subplot(1,3,3); imshow(img_blur); title("3. Blurred (5x5 Average)");


