-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2023 at 04:38 AM
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
CREATE DATABASE IF NOT EXISTS `flower_shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `flower_shop`;

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
(1, 'superadmin', '186cf774c97b60a1c106ef718d10970a6a06e06bef89553d9ae65d938a886eae', 'SuperAdmin'),
(2, 'admin1', '25f43b1486ad95a1398e3eeb3d83bc4010015fcc9bedb35b432e00298d5021f7', 'Admin'),
(3, 'khoavanphuc', '8d7df0d3f37d2234a2e49a95960c277105bf732787158d34aaa3aa8577ed0c7d', 'Admin'),
(4, 'hexsaigon54', 'd4d35e9e4cb557072bad1ffebdc6ae2f8f23a77ed373b699e9b912760cc1a0e1', 'Admin');

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
(2, 3, 'Hoa Hồng ', 'https://th.bing.com/th/id/OIP.qACyVTZgNvyeYEjcJPVh_gHaHa?w=217&h=217&c=7&r=0&o=5&pid=1.7', '', 240000, 'Hoa Hồng là loại hoa tượng trưng cho tình yêu vĩnh hằng, mối tình cảm cao quý và sâu đậm.'),
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
(2, 'Đinh Quốc Chương', 1999, 'male', 'Chuongdq@gmail.com', 'chuongdq', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', ', 23 Phan Bội Châu,Quy Nhơn, Bình Định', 'activate', '2023-11-01 11:04:28', NULL),
(3, 'Trịnh Minh Dương', 2000, 'male', 'Duongtm@gmail.com', 'duongtm', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '231 Lê Hồng Phong, Quy Nhơn, Bình Định', 'deactivate', '2023-11-01 08:04:40', '2023-11-15 11:08:24'),
(4, 'Lê Đồng Tâm', 2002, 'male', 'Tamld@gmail.com', 'tamld', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '456 Hùng Vương, Quy Nhơn, Bình Định', 'activate', '2023-09-06 11:04:53', NULL),
(5, 'Phan Thu Thảo', 2001, 'female', 'Thaopt@gmail.com', 'thaopt', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '213 Âu Cơ, Quy Nhơn, Bình Định', 'activate', '2023-11-03 11:05:13', NULL),
(6, 'Đường Mỹ Hà', 2003, 'female', 'Hadm@gmail.com', 'hadm', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '1112 Hùng Vương, Quy Nhơn, Bình Định', 'activate', '2023-11-04 11:05:25', NULL),
(7, 'Nguyễn Tuấn Nghĩa', 2004, 'male', 'Nghiant@gmail.com', 'nghiant', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '21 Đào Duy Tử, Quy Nhơn, Bình Định', 'activate', '2023-09-07 11:06:50', NULL),
(8, 'Bùi Quang Tuấn', 1992, 'male', 'Tuanbq@gmail.com', 'tuanbq', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Hẻm 220 Nguyễn Thái Học, Quy Nhơn, Bình Định', 'deactivate', '2023-11-02 11:07:17', '2023-11-17 11:08:59'),
(9, 'Trần Thu Ngân', 1998, 'female', 'Ngantt@gmail.com', 'ngantt', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '38 Võ Lai, Quy Nhơn, Bình Định', 'activate', '2023-09-06 11:07:38', NULL),
(10, 'Nguyễn Thục Ngân', 2001, 'female', 'Ngannt@gmail.com', 'ngannt', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '456 Trần Hưng Đạo, Quy Nhơn, Bình Định', 'activate', '2023-10-24 11:09:10', NULL),
(11, 'Bùi Ngọc Bảo Trân', 2000, 'female', 'Tranbnb@gmail.com', 'tranbnb', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '561 Lạc Long Quân, Quy Nhơn', 'activate', '2023-10-12 11:09:22', NULL),
(12, 'Phạm Ngọc Quyền', 1994, 'male', 'Quyenpn@gmail.com', 'quyenpn', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '17 Trần Thị Kỷ, thị xã An Nhơn, Bình Định', 'deactivate', '2023-10-10 11:09:47', '2023-11-16 11:19:22'),
(13, 'Nguyễn Trung Dũng', 1999, 'male', 'Dungnt@gmail.com', 'dungnt', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '44 Tăng Bạt Hổ, huyện Tuy Phước, Bình Định', 'activate', '2023-10-23 11:10:51', NULL),
(14, 'Nguyễn Tấn Kiệt', 2002, 'male', 'Kietnt@gmail.com', 'kietnt', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '521 Tây Sơn, tp.Quy Nhơn, Bình Định', 'activate', '2023-11-06 11:11:33', NULL),
(15, 'Nguyễn Dương', 2000, 'male', 'Duongn@gmail.com', 'duongn', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '34 Nguyễn Trân, thị xã Hoài Nhơn, Bình Định', 'activate', '2023-10-26 11:11:46', NULL),
(16, 'Đoàn Nguyễn Huyền Trang', 2005, 'female', '', '', '12345', '22 Đào Duy Từ, tp.Quy Nhơn, Bình Định', 'activate', '2023-10-03 11:11:57', NULL),
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
