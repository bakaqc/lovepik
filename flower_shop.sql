-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2023 at 01:55 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flower_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(64) NOT NULL,
  `role` enum('SuperAdmin','Admin') NOT NULL COMMENT 'Cấp bậc của admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `role`) VALUES
(1, 'superadmin', 'superadmin', 'SuperAdmin'),
(2, 'admin1', 'admin1', 'Admin'),
(3, 'khoavanphuc', 'khoavanphuc', 'Admin'),
(4, 'hexsaigon54', 'hexsaigon54', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `user_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`user_id`, `product_id`, `amount`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 5, 2),
(4, 12, 3),
(5, 10, 2),
(6, 16, 1),
(7, 27, 4),
(8, 18, 4),
(9, 9, 1),
(10, 11, 2),
(11, 15, 1),
(12, 17, 1),
(13, 19, 2),
(14, 22, 2),
(15, 21, 3),
(16, 24, 3),
(17, 30, 2),
(18, 17, 3),
(19, 16, 3),
(20, 15, 4),
(21, 14, 2),
(22, 5, 5),
(23, 23, 5),
(24, 6, 5),
(25, 2, 4),
(26, 29, 1),
(27, 27, 4),
(28, 28, 5),
(29, 29, 2),
(30, 30, 3);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Hoa sinh nhật'),
(2, 'Hoa chúc mừng'),
(3, 'Hoa tình yêu'),
(4, 'Hoa tang lễ'),
(5, 'Hoa ngày Tết');

-- --------------------------------------------------------

--
-- Table structure for table `data_order`
--

CREATE TABLE `data_order` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data_order`
--

INSERT INTO `data_order` (`order_id`, `product_id`, `amount`) VALUES
(1, 8, 2),
(2, 9, 2),
(3, 4, 2),
(4, 6, 3),
(5, 5, 4),
(6, 2, 5),
(7, 3, 6),
(8, 11, 2),
(9, 14, 1),
(10, 15, 3),
(11, 17, 2),
(12, 18, 6),
(13, 19, 9),
(14, 20, 11),
(15, 21, 6),
(16, 25, 2),
(17, 26, 2),
(18, 27, 7),
(19, 28, 2),
(20, 29, 3),
(21, 30, 2),
(22, 24, 2),
(23, 22, 4),
(24, 16, 2),
(25, 23, 6),
(26, 13, 2),
(27, 12, 2),
(28, 10, 2),
(29, 1, 2),
(30, 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` bigint(20) NOT NULL,
  `payment` enum('COD','MoMo') NOT NULL,
  `status` enum('processing','shipping','done','canceled') NOT NULL,
  `create_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `total_price`, `payment`, `status`, `create_at`) VALUES
(1, 30, 400000, 'MoMo', 'processing', '2023-11-01 08:00:00'),
(2, 29, 500000, 'COD', 'processing', '2023-11-02 08:00:00'),
(3, 28, 800000, 'COD', 'processing', '2023-11-03 08:00:00'),
(4, 27, 500000, 'MoMo', 'processing', '2023-11-04 08:00:00'),
(5, 26, 500000, 'MoMo', 'processing', '2023-11-05 08:00:00'),
(6, 25, 100000, 'MoMo', 'processing', '2023-11-06 08:00:00'),
(7, 24, 200000, 'MoMo', 'shipping', '2023-11-07 08:00:00'),
(8, 23, 300000, 'MoMo', 'shipping', '2023-11-08 08:00:00'),
(9, 22, 700000, 'COD', 'shipping', '2023-11-09 08:00:00'),
(10, 21, 400000, 'COD', 'shipping', '2023-11-10 08:00:00'),
(11, 20, 600000, 'COD', 'shipping', '2023-11-11 08:00:00'),
(12, 19, 700000, 'MoMo', 'shipping', '2023-11-12 08:00:00'),
(13, 18, 800000, 'COD', 'shipping', '2023-11-13 08:00:00'),
(14, 17, 500000, 'MoMo', 'shipping', '2023-11-14 08:00:00'),
(15, 16, 500000, 'MoMo', 'shipping', '2023-11-15 08:00:00'),
(16, 15, 900000, 'MoMo', 'done', '2023-11-16 08:00:00'),
(17, 14, 500000, 'MoMo', 'done', '2023-11-17 08:00:00'),
(18, 13, 500000, 'COD', 'done', '2023-11-18 08:00:00'),
(19, 12, 500000, 'MoMo', 'done', '2023-11-19 08:00:00'),
(20, 11, 500000, 'COD', 'done', '2023-11-20 08:00:00'),
(21, 10, 800000, 'COD', 'done', '2023-11-21 08:00:00'),
(22, 9, 500000, 'MoMo', 'done', '2023-11-22 08:00:00'),
(23, 8, 200000, 'MoMo', 'done', '2023-11-23 08:00:00'),
(24, 7, 300000, 'MoMo', 'done', '2023-11-24 08:00:00'),
(25, 6, 500000, 'MoMo', 'done', '2023-11-25 08:00:00'),
(26, 5, 400000, '', 'done', '2023-11-26 08:00:00'),
(27, 4, 600000, '', 'canceled', '2023-11-27 08:00:00'),
(28, 3, 700000, '', 'canceled', '2023-11-28 08:00:00'),
(29, 2, 800000, '', 'canceled', '2023-11-29 08:00:00'),
(30, 1, 900000, '', 'canceled', '2023-11-30 08:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `banners` text NOT NULL,
  `thumb` text NOT NULL,
  `price` bigint(20) NOT NULL,
  `detail` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `banners`, `thumb`, `price`, `detail`) VALUES
(1, 5, 'Hoa Cát Tường', 'https://bizweb.dktcdn.net/100/347/446/files/bo-hoa-lan-cat-tuong-gia-hoa-len-cat-tuong.jpg?v=1564825969218', '', 350000, 'Hoa Cát Tường biểu tượng đẹp đẽ của một ý chí sống kiên cường, nhiệt huyết và mang ý nghĩa tượng trưng cho một lời cầu chúc cho cuộc sống hạnh phúc và viên mãn. '),
(2, 3, 'Hoa Hồng ', 'data:image/jpeg;base64,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', '', 240000, 'Hoa Hồng là loại hoa tượng trưng cho tình yêu vĩnh hằng, mối tình cảm cao quý và sâu đậm.'),
(3, 1, 'Hoa Oải Hương', 'https://hoatuoishop.com/wp-content/uploads/2019/12/hoa-oai-huong-1.jpg', '', 310000, 'Hoa Oải Hương là biểu tượng cho sự tinh khiết, duyên dáng, nhẹ nhàng và tận tâm.'),
(4, 3, 'Hoa Hướng Dương', 'https://123flower.net/upload/hinhanh/hoa-cam-tay-co-dau-huong-duong-toa-nang.jpg', '', 365000, 'Tặng hoa hướng dương cho người mà bạn yêu thương cũng có nghĩa là bạn muốn gửi tới người ấy thông điệp rằng:”Tình cảm này của anh chỉ dành riêng cho em, dù có ở bất cứ nơi đâu thì anh cũng luôn hướng về phía em.”'),
(5, 1, 'Hoa Loa Kèn Trắng', 'https://i.pinimg.com/474x/eb/03/9e/eb039ef6b9aa48511d1c9bff6a874e06.jpg', '', 275000, 'Hoa Loa Kèn Trắng biểu tượng cho sự trong trắng, tinh khiết, nhẹ nhàng, dịu dàng của người phụ nữ.'),
(6, 3, 'Hoa Cẩm Chướng ', 'https://hoahanoi.com.vn/wp-content/uploads/2020/08/Bo-hoa-cam-chuong-e1598546539415.jpg', '', 280000, 'Hoa Cẩm Chướng được sử dụng trong dịp kết hôn thể hiện tình yêu vĩnh cửu mong muốn sẽ bên nhau trọn đời.'),
(7, 3, 'Hoa Lay Ơn', 'https://www.thegioihoatuoi.com.vn/img/photos/bo_hoa_lay_on_BO_HOA_Y_NGHIA_HEN_HO_4.jpg', '', 320000, 'Hoa Lay Ơn biểu tượng cho tình yêu nồng nàn hay niềm đam mê nhiệt huyết cao cả.'),
(8, 3, 'Hoa Lan Hồ Điệp', 'https://dienhoatuoi24h.net/wp-content/uploads/2022/12/z2857348413527_bad08fdc902e23c7a5301f2e200da042.jpg', '', 290000, 'Hoa Lan Hồ Điệp biểu tượng cho tình yêu mãnh liệt, Hoa Lan Hồ Điệp còn mang ý nghĩa cho sự giàu có, vương giả, sang trọng và cuộc sống sung túc.'),
(9, 1, 'Hoa Tulip Xanh', 'https://down-vn.img.susercontent.com/file/cn-11134207-7qukw-lfj3103h07d721', '', 285000, 'Hoa Tulip Xanh có ý nghĩa của sự yên bình, khoan thai trong cuộc sống.'),
(10, 5, 'Hoa Đồng Tiền', 'https://bizweb.dktcdn.net/100/488/580/products/1.png?v=1687832622900', '', 245000, 'Hoa Đồng Tiền có ý nghĩa về sự may mắn, tin tưởng và thịnh vượng.'),
(11, 3, 'Hoa Baby', 'https://firstsight.vn/wp-content/uploads/2020/11/BM20-400.jpg', '', 267000, 'Hoa Baby là biểu tượng ý nghĩa cho tình yêu lâu dài.'),
(12, 1, 'Hoa Cẩm Tú Cầu ', 'https://flowerboxes.vn/wp-content/uploads/2019/11/781aa32afffe1da044ef.jpg', '', 290000, 'Hoa Cẩm Tú Cầu mang ý nghĩa mưu cầu hạnh phúc, cầu cho người nhận có được cuộc sống luôn vui vẻ, bình an.'),
(13, 1, 'Hoa Sơn Trà', 'https://shophoavip.com/uploads/noidung/images/baiviet/62-TINH/da-nang/son-tra/bo-hoa-dep-4.jpg', '', 272000, 'Hoa Sơn Trà tượng trưng cho khát vọng, cho mơ ước của lứa tuổi thanh thiếu niên.'),
(14, 3, 'Hoa Hồng Xanh', 'https://bizweb.dktcdn.net/100/392/636/products/4cc5733d-a820-4919-9117-e5bf14dc49e5-1-201-a-jpeg.jpg?v=1600663668777', '', 283000, 'Hoa hồng  là loại hoa tượng trưng cho tình yêu vĩnh hằng, mối tình cảm cao quý và sâu đậm.'),
(15, 2, 'Hoa Ly Vàng', 'https://vietgifts.com/wp-content/uploads/2019/01/lilie-in-vase-1.jpg', '', 174000, 'Hoa ly màu vàng là biểu tượng mang nhiều tầng nghĩa khác nhau, vì màu sắc có một số ý nghĩa tích cực gắn liền. Chúng bao gồm hạnh phúc, lòng trung thành, khởi đầu mới, cảm giác tươi mới và ánh nắng mặt trời.'),
(16, 1, 'Hoa Loa Kèn Đỏ', 'https://down-vn.img.susercontent.com/file/f4f3bffc5233a43a4bbed4120824ad12', '', 255000, 'Hoa Loa Kèn Đỏ biểu tượng cho lòng kiêu hãnh, sự tự hào của con người'),
(17, 2, 'Hoa Tulip Trắng', 'https://8384f55340.vws.vegacdn.vn/image/cache/catalog/March%202023/bo-hoa-tulip-11-800x800.jpg.webp', '', 190000, 'Hoa Tulip Trắng là loại hoa có nhiều ý nghĩa tốt đẹp, nó đại diện cho tình yêu thuần khiết, niềm đam mê, sự bình yên, chiến thắng và sự tha thứ. '),
(18, 5, 'Nụ Tầm Xuân', 'https://storage.googleapis.com/ops-shopee-files-live/live/shopee-blog/2022/11/f2c1e501-cam-nu-tam-xuan-ngay-tet.jpg', '', 500000, 'Nụ tầm xuân với nhiều chồi non trên thân cây, được xem là tượng trưng cho sự thịnh vượng nên được rất nhiều gia đình lựa chọn mua về nhà dịp đầu năm mới.'),
(19, 4, 'Hoa Cúc', 'https://hoatuoialoha.com/wp-content/uploads/2022/11/gio-hoa-kinh-vieng.jpg', '', 120000, 'Hoa Cúc được xem là loại hoa truyền thống và được nhiều người chọn và sử dụng rất nhiều trong các tang lễ.'),
(20, 4, 'Hoa Huệ Trắng', 'https://hoadamtang.com.vn/wp-content/uploads/2021/12/52-1.jpg', '', 185000, 'Hoa Huệ Trắng thể hiện sự thành kính đối với người đã khuất.'),
(21, 4, 'Hoa Hồng Trắng', 'https://hoahanoi.com.vn/wp-content/uploads/2020/07/gio-hoa-hong-trang-dep-e1624939624773.jpg', '', 288000, 'Hoa Hồng Trắng mang ý nghĩa tôn vinh những đóng góp của người đã khuất.'),
(22, 4, 'Hoa Nhài', 'https://hoavily.com/uploads/file/gioi-thieu-hoa-nhai-hoavily.jpg', '', 194000, 'Hoa Nhài tượng trưng cho sự thuần khiết, thanh cao và lòng thành kính.'),
(23, 2, 'Hoa Hồng Vàng', 'https://hoatuoidatviet.vn/upload/images/Bo-hoa-hong-vang-Sunny.jpg', '', 263000, 'Hoa Hồng Vàng biểu tượng cho tình bạn và niềm vui. Chúng tươi sáng, vui vẻ và khiến bạn muốn mỉm cười, chúng cũng mang một vẻ đẹp thanh lịch, tinh tế.'),
(24, 2, 'Hoa Lưu Ly', 'https://hoatuoishop.com/wp-content/uploads/2019/12/hoa-tuoi-cuoi-hoi-2-911x1024.jpg', '', 230000, 'Hoa Lưu Ly hay còn gọi là hoa “Forget me not”, mang ý nghĩa “Xin đừng quên tôi.”'),
(25, 3, 'Hoa Tường Vi Hồng', 'https://diachishophoa.com/uploads/sanpham/4twefsd-1557895359-nwgb3.jpg', '', 290000, 'Hoa Tường Vi Hồng mang nghĩa “Anh yêu em mãi mãi”.'),
(26, 3, 'Hoa Mẫu Đơn', 'https://hoatuoi360.vn/uploads/file/hoatuoi360-%20bo%20mau%20don%20hong%2050002.jpg', '', 300000, 'Hoa Mẫu Đơn mang ý nghĩa một tình yêu bất diệt, trường tồn với thời gian.'),
(27, 3, 'Hoa Violet', 'https://hoaviolet.com/image/bo-hoa-baby-tim-khong-lo-72762j.jpg', '', 320000, 'Hoa Violet mang ý nghĩa của sự khiêm tốn, sự yếu đuối và tình yêu thầm kín. Nó thể hiện sự tinh tế và sự nhạy cảm.'),
(28, 5, 'Hoa Mai', 'https://product.hstatic.net/1000075734/product/z2263786970922_25fe09cfbbfd759d648ae503a46078de_a2d9c04c8ee040eba21092d04658f962_master.jpg', '', 400000, 'Hoa Mai là loài hoa mang lại sự may mắn, thịnh vượng, hạnh phúc trong suốt 1 năm.'),
(29, 5, 'Hoa Đào', 'https://ironstyle.vn/uploads/cay%20hoa%20dao%202.jpg?1481185550102', '', 400000, 'Hoa Đào trưng bày trong nhà có thể xua đuổi tà ma, mang đến nguồn sinh khí ấm áp, màu hồng hạnh phúc, tình cảm gia đình khắng khít trong năm mới.'),
(30, 5, 'Hoa Thuỷ Tiên', 'https://th.bing.com/th/id/R.cf739e8191c61038752054bc349a403b?rik=NrHnz9NtpXxxqg&pid=ImgRaw&r=0', '', 350000, 'Hoa Thuỷ Tiên là biểu tượng của sự giàu có, thịnh vượng, may mắn và hạnh phúc');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `year_of_birth` int(11) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(64) NOT NULL,
  `address` longtext DEFAULT NULL,
  `status` enum('activate','deactivate') NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `delete_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `full_name`, `year_of_birth`, `gender`, `email`, `username`, `password`, `address`, `status`, `create_at`, `delete_at`) VALUES
(1, 'Vũ Ngọc Ánh', 1997, 'female', 'Anhvn@gmail.com', 'anhvn', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '561 Lạc Long Quân, Quy Nhơn, Bình Định', 'activate', '2022-11-16 10:41:46', NULL),
(2, 'Đinh Quốc Chương', 1999, 'male', 'Chuongdq@gmail.com', 'chuongdq', '12345', ', 23 Phan Bội Châu,Quy Nhơn, Bình Định', 'activate', '2023-11-01 11:04:28', NULL),
(3, 'Trịnh Minh Dương', 2000, 'male', 'Duongtm@gmail.com', 'duongtm', '12345', '231 Lê Hồng Phong, Quy Nhơn, Bình Định', 'deactivate', '2023-11-01 08:04:40', '2023-11-15 11:08:24'),
(4, 'Lê Đồng Tâm', 2002, 'male', 'Tamld@gmail.com', 'tamld', '12345', '456 Hùng Vương, Quy Nhơn, Bình Định', 'activate', '2023-09-06 11:04:53', NULL),
(5, 'Phan Thu Thảo', 2001, 'female', 'Thaopt@gmail.com', 'thaopt', '12345', '213 Âu Cơ, Quy Nhơn, Bình Định', 'activate', '2023-11-03 11:05:13', NULL),
(6, 'Đường Mỹ Hà', 2003, 'female', 'Hadm@gmail.com', 'hadm', '12345', '1112 Hùng Vương, Quy Nhơn, Bình Định', 'activate', '2023-11-04 11:05:25', NULL),
(7, 'Nguyễn Tuấn Nghĩa', 2004, 'male', 'Nghiant@gmail.com', 'nghiant', '12345', '21 Đào Duy Tử, Quy Nhơn, Bình Định', 'activate', '2023-09-07 11:06:50', NULL),
(8, 'Bùi Quang Tuấn', 1992, 'male', 'Tuanbq@gmail.com', 'tuanbq', '12345', 'Hẻm 220 Nguyễn Thái Học, Quy Nhơn, Bình Định', 'deactivate', '2023-11-02 11:07:17', '2023-11-17 11:08:59'),
(9, 'Trần Thu Ngân', 1998, 'female', 'Ngantt@gmail.com', 'ngantt', '12345', '38 Võ Lai, Quy Nhơn, Bình Định', 'activate', '2023-09-06 11:07:38', NULL),
(10, 'Nguyễn Thục Ngân', 2001, 'female', 'Ngannt@gmail.com', 'ngannt', '12345', '456 Trần Hưng Đạo, Quy Nhơn, Bình Định', 'activate', '2023-10-24 11:09:10', NULL),
(11, 'Bùi Ngọc Bảo Trân', 2000, 'female', 'Tranbnb@gmail.com', 'tranbnb', '12345', '561 Lạc Long Quân, Quy Nhơn', 'activate', '2023-10-12 11:09:22', NULL),
(12, 'Phạm Ngọc Quyền', 1994, 'male', 'Quyenpn@gmail.com', 'quyenpn', '12345', '17 Trần Thị Kỷ, thị xã An Nhơn, Bình Định', 'deactivate', '2023-10-10 11:09:47', '2023-11-16 11:19:22'),
(13, 'Nguyễn Trung Dũng', 1999, 'male', 'Dungnt@gmail.com', 'dungnt', '12345', '44 Tăng Bạt Hổ, huyện Tuy Phước, Bình Định', 'activate', '2023-10-23 11:10:51', NULL),
(14, 'Nguyễn Tấn Kiệt', 2002, 'male', 'Kietnt@gmail.com', 'kietnt', '12345', '521 Tây Sơn, tp.Quy Nhơn, Bình Định', 'activate', '2023-11-06 11:11:33', NULL),
(15, 'Nguyễn Dương', 2000, 'male', 'Duongn@gmail.com', 'duongn', '12345', '34 Nguyễn Trân, thị xã Hoài Nhơn, Bình Định', 'activate', '2023-10-26 11:11:46', NULL),
(16, 'Đoàn Nguyễn Huyền Trang', 2005, 'female', 'Trangdnh@gmail.com', 'trangdnh', '12345', '22 Đào Duy Từ, tp.Quy Nhơn, Bình Định', 'activate', '2023-10-03 11:11:57', NULL),
(17, 'Đào Thanh Trúc', 2002, 'female', 'Trucdt@gmail.com', 'trucdt', '12345', '307 Nguyễn Thị Minh Khai, tp.Quy Nhơn, Bình Định', 'activate', '2023-10-16 11:12:45', NULL),
(18, 'Trương Thế Cảnh', 1997, 'male', 'Canhtt@gmail.com', 'canhtt', '12345', '5D Tăng Bạt Hổ, tp.Quy Nhơn, Bình Định ', 'activate', '2023-10-11 11:13:02', NULL),
(19, 'Phạm Quốc Toàn', 2004, 'male', 'Toanpq@gmail.com', 'toanpq', '12345', '65 Quang Trung, thị xã Hoài Nhơn, Bình Định', 'activate', '2023-09-22 11:13:29', NULL),
(20, 'Phạm Thanh Trúc', 1990, 'female', 'Trucpt@gmail.com', 'trucpt', '12345', '295 Trần Phú, thị xã Hoài Nhơn, Bình Định', 'activate', '2023-09-14 11:13:57', NULL),
(21, 'Phan Bảo Nhi', 1999, 'female', 'Nhipb@gmail.com', 'nhipb', '12345', '1126 Hùng Vương, tp.Quy Nhơn, Bình Định', 'activate', '2023-10-16 11:21:26', NULL),
(22, 'Phan Mai Sơn', 2003, 'male', 'Sonpm@gmail.com', 'sonpm', '12345', '25 Nguyễn Thị Định, tp.Quy Nhơn, Bình Định', 'activate', '2023-10-23 11:21:26', NULL),
(23, 'Đặng Ngọc Hưng', 2001, 'male', 'Hungdn@gmail.com', 'hungdn', '12345', '71 Bùi Thị Xuân, huyện Tây Sơn, Bình Định', 'activate', '2023-10-30 11:21:26', NULL),
(24, 'Lâm Mỹ Linh', 1996, 'female', 'Linhlm@gmail.com', 'linhlm', '12345', '94 Mai Xuân Thưởng, tp.Quy Nhơn, Bình Định', 'activate', '2023-10-15 11:21:26', NULL),
(25, 'Lê Thị Chí Thương', 1998, 'female', 'Thuongltc@gmail.com', 'thuongltc', '12345', '85/24 hoàng văn thụ, tp.Quy Nhơn, Bình Định', 'activate', '2023-10-12 11:21:26', NULL),
(26, 'Đặng Kiều Duyên', 2002, 'female', 'Duyendkgmail.com', 'duyendk', '12345', '67 Chế Lan Viên, thị xã An Nhơn, Bình Định', 'activate', '2023-10-09 11:21:26', NULL),
(27, 'Vũ Việt Thắng', 1991, 'male', 'Thangvt@gmail.com', 'thangvt', '12345', '333 Quang Trung, huyện Phù Cát, Bình Định', 'deactivate', '2023-09-13 11:20:34', '2023-11-15 11:20:51'),
(28, 'Vũ Văn Dũng', 2000, 'male', 'Dungvv@gmail.com', 'dungvv', '12345', '57A Nguyễn Huệ, tp.Quy Nhơn, Bình Định', 'activate', '2023-11-07 11:20:01', NULL),
(29, 'Phạm Đức Nghĩa', 2003, 'male', 'Nghiapd@gmail.com', 'nghiapd', '12345', '114B 31 tháng 3, tp.Quy Nhơn, Bình Định', 'activate', '2023-10-05 11:21:26', NULL),
(30, 'Lê Uyển Nhi', 2001, 'female', 'Nhilu@gmail.com', 'nhilu', '12345', 'Lô 01 Ngọc Hồi, huyện Tây Sơn, Bình Định', 'activate', '2023-10-01 11:21:26', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`user_id`,`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_order`
--
ALTER TABLE `data_order`
  ADD PRIMARY KEY (`order_id`,`product_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_order`
--
ALTER TABLE `data_order`
  ADD CONSTRAINT `data_order_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
