-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2023 at 10:11 AM
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
(1, 'superadmin', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'SuperAdmin'),
(2, 'admin1', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Admin'),
(3, 'khoavanphuc', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Admin'),
(4, 'hexsaigon54', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Admin');

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
(4, 'Bánh kem'),
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
(1, 8, 1),
(2, 9, 1),
(3, 4, 1),
(4, 6, 1),
(5, 5, 1),
(6, 2, 1),
(7, 3, 1),
(8, 11, 1),
(9, 14, 1),
(10, 15, 1),
(11, 17, 1),
(12, 18, 1),
(13, 19, 2),
(14, 20, 1),
(15, 21, 1),
(16, 25, 1),
(17, 26, 1),
(18, 27, 1),
(19, 28, 1),
(20, 29, 1),
(21, 30, 1),
(22, 24, 1),
(23, 22, 1),
(24, 16, 1),
(25, 23, 1),
(26, 13, 1),
(27, 12, 1),
(28, 10, 1),
(29, 1, 1),
(30, 15, 1),
(32, 44, 1),
(33, 14, 1),
(34, 20, 2);

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
(1, 30, 290000, 'MoMo', 'processing', '2023-11-01 08:00:00'),
(2, 29, 285000, 'COD', 'processing', '2023-11-02 08:00:00'),
(3, 28, 365000, 'COD', 'processing', '2023-11-03 08:00:00'),
(4, 27, 280000, 'MoMo', 'processing', '2023-11-04 08:00:00'),
(5, 26, 275000, 'MoMo', 'processing', '2023-11-05 08:00:00'),
(6, 25, 240000, 'MoMo', 'processing', '2023-11-06 08:00:00'),
(7, 24, 310000, 'MoMo', 'shipping', '2023-11-07 08:00:00'),
(8, 23, 340000, 'MoMo', 'shipping', '2023-11-08 08:00:00'),
(9, 22, 600000, 'COD', 'shipping', '2023-11-09 08:00:00'),
(10, 21, 280000, 'COD', 'shipping', '2023-11-10 08:00:00'),
(11, 20, 390000, 'COD', 'shipping', '2023-11-11 08:00:00'),
(12, 19, 500000, 'MoMo', 'shipping', '2023-11-12 08:00:00'),
(13, 18, 400000, 'COD', 'shipping', '2023-11-13 08:00:00'),
(14, 17, 185000, 'MoMo', 'shipping', '2023-11-14 08:00:00'),
(15, 16, 290000, 'MoMo', 'shipping', '2023-11-15 08:00:00'),
(16, 15, 290000, 'MoMo', 'done', '2023-11-16 08:00:00'),
(17, 14, 300000, 'MoMo', 'done', '2023-11-17 08:00:00'),
(18, 13, 460000, 'COD', 'done', '2023-11-18 08:00:00'),
(19, 12, 400000, 'MoMo', 'done', '2023-11-19 08:00:00'),
(20, 11, 420000, 'COD', 'done', '2023-11-20 08:00:00'),
(21, 10, 350000, 'COD', 'done', '2023-11-21 08:00:00'),
(22, 9, 230000, 'MoMo', 'done', '2023-11-22 08:00:00'),
(23, 8, 230000, 'MoMo', 'done', '2023-11-23 08:00:00'),
(24, 7, 255000, 'MoMo', 'done', '2023-11-24 08:00:00'),
(25, 6, 270000, 'MoMo', 'done', '2023-11-25 08:00:00'),
(26, 5, 275000, 'COD', 'done', '2023-11-26 08:00:00'),
(27, 4, 290000, 'MoMo', 'canceled', '2023-11-27 08:00:00'),
(28, 3, 245000, 'MoMo', 'canceled', '2023-11-28 08:00:00'),
(29, 2, 350000, 'MoMo', 'canceled', '2023-11-29 08:00:00'),
(30, 1, 280000, 'COD', 'canceled', '2023-11-16 08:00:00'),
(32, 1, 550000, 'MoMo', 'shipping', '2023-11-17 15:39:31'),
(33, 1, 600000, 'COD', 'done', '2023-11-18 15:51:43'),
(34, 1, 370000, 'MoMo', 'shipping', '2023-11-22 15:53:02');

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
(1, 5, 'Hoa Cát Tường', 'img/product_img/hoa-cat-tuong.png', '', 350000, 'Hoa Cát Tường biểu tượng đẹp đẽ của một ý chí sống kiên cường, nhiệt huyết và mang ý nghĩa tượng trưng cho một lời cầu chúc cho cuộc sống hạnh phúc và viên mãn. '),
(2, 3, 'Hoa Hồng ', 'img/product_img/hoa-hong.png', '', 240000, 'Hoa Hồng là loại hoa tượng trưng cho tình yêu vĩnh hằng, mối tình cảm cao quý và sâu đậm.'),
(3, 1, 'Hoa Oải Hương', 'img/product_img/hoa-oai-huong.png', '', 310000, 'Hoa Oải Hương là biểu tượng cho sự tinh khiết, duyên dáng, nhẹ nhàng và tận tâm.'),
(4, 3, 'Hoa Hướng Dương', 'img/product_img/hoa-huong-duong.png', '', 365000, 'Tặng hoa hướng dương cho người mà bạn yêu thương cũng có nghĩa là bạn muốn gửi tới người ấy thông điệp rằng:”Tình cảm này của anh chỉ dành riêng cho em, dù có ở bất cứ nơi đâu thì anh cũng luôn hướng về phía em.”'),
(5, 1, 'Hoa Loa Kèn Trắng', 'img/product_img/hoa-loa-ken-trang.png', '', 275000, 'Hoa Loa Kèn Trắng biểu tượng cho sự trong trắng, tinh khiết, nhẹ nhàng, dịu dàng của người phụ nữ.'),
(6, 3, 'Hoa Cẩm Chướng ', 'img/product_img/hoa-cam-chuong.png', '', 280000, 'Hoa Cẩm Chướng được sử dụng trong dịp kết hôn thể hiện tình yêu vĩnh cửu mong muốn sẽ bên nhau trọn đời.'),
(7, 3, 'Hoa Lay Ơn', 'img/product_img/hoa-lay-on.png', '', 320000, 'Hoa Lay Ơn biểu tượng cho tình yêu nồng nàn hay niềm đam mê nhiệt huyết cao cả.'),
(8, 3, 'Hoa Lan Hồ Điệp', 'img/product_img/hoa-lan-ho-diep.png', '', 290000, 'Hoa Lan Hồ Điệp biểu tượng cho tình yêu mãnh liệt, Hoa Lan Hồ Điệp còn mang ý nghĩa cho sự giàu có, vương giả, sang trọng và cuộc sống sung túc.'),
(9, 1, 'Hoa Tulip Xanh', 'img/product_img/hoa-tulip-xanh.png', '', 285000, 'Hoa Tulip Xanh có ý nghĩa của sự yên bình, khoan thai trong cuộc sống.'),
(10, 5, 'Hoa Đồng Tiền', 'img/product_img/hoa-dong-tien.png', '', 245000, 'Hoa Đồng Tiền có ý nghĩa về sự may mắn, tin tưởng và thịnh vượng.'),
(11, 3, 'Hoa Baby', 'img/product_img/hoa-baby.png', '', 340000, 'Hoa Baby là biểu tượng ý nghĩa cho tình yêu lâu dài.'),
(12, 1, 'Hoa Cẩm Tú Cầu ', 'img/product_img/hoa-cam-tu-cau.png', '', 290000, 'Hoa Cẩm Tú Cầu mang ý nghĩa mưu cầu hạnh phúc, cầu cho người nhận có được cuộc sống luôn vui vẻ, bình an.'),
(13, 1, 'Hoa Sơn Trà', 'img/product_img/hoa-son-tra.png', '', 275000, 'Hoa Sơn Trà tượng trưng cho khát vọng, cho mơ ước của lứa tuổi thanh thiếu niên.'),
(14, 3, 'Hoa Hồng Xanh', 'img/product_img/hoa-hong-xanh.png', '', 600000, 'Hoa Hồng Xanh là loại hoa tượng trưng cho tình yêu vĩnh hằng, mối tình cảm cao quý và sâu đậm.'),
(15, 2, 'Hoa Ly Vàng', 'img/product_img/hoa-ly-vang.png', '', 280000, 'Hoa Ly Vàng là biểu tượng mang nhiều tầng nghĩa khác nhau, vì màu sắc có một số ý nghĩa tích cực gắn liền. Chúng bao gồm hạnh phúc, lòng trung thành, khởi đầu mới, cảm giác tươi mới và ánh nắng mặt trời.'),
(16, 1, 'Hoa Loa Kèn Đỏ', 'img/product_img/hoa-loa-ken-do.png', '', 255000, 'Hoa Loa Kèn Đỏ biểu tượng cho lòng kiêu hãnh, sự tự hào của con người'),
(17, 2, 'Hoa Tulip Trắng', 'img/product_img/hoa-tulip-trang.png', '', 390000, 'Hoa Tulip Trắng là loại hoa có nhiều ý nghĩa tốt đẹp, nó đại diện cho tình yêu thuần khiết, niềm đam mê, sự bình yên, chiến thắng và sự tha thứ. '),
(18, 5, 'Nụ Tầm Xuân', 'img/product_img/nu-tam-xuan.png', '', 500000, 'Nụ Tầm Xuân với nhiều chồi non trên thân cây, được xem là tượng trưng cho sự thịnh vượng nên được rất nhiều gia đình lựa chọn mua về nhà dịp đầu năm mới.'),
(19, 4, 'Gato Dâu Tây', 'img/product_img/gato-dau-tay.png', '', 200000, 'Bánh Gato đã quá quen thuộc với tất cả mọi người. Những chiếc bánh với nhiều mẫu mã hấp dấp cùng hương vị thơm ngon. Ngày nay, để phù hợp với nhu cầu của người sử dụng, bánh gato được cải tiến với nhiều vị kem mới theo sở thích từng người. \n\nĐể đánh giá được một chiếc bánh gato có ngon hay không bạn hãy nhìn vào phần bánh phải thật bông xốp, mềm, thơm. Phần kem trang trí bánh không quá béo ngậy gây cảm giác ngán cho người ăn, cũng không quá nhạt hoặc quá ngọt.'),
(20, 4, 'Tiramisu Dâu Tây', 'img/product_img/tiramisu-dau-tay.png', '', 185000, 'Bánh Tiramisu được tạo nên bởi những lớp bánh quy xếp chồng lên nhau thành các lớp xen kẽ với các lớp kem, trứng, phô mai. Tạo nên hương vị vô cùng đặc biệt cho tiramisu. \r\n\r\nLớp bột cà phê, bột cacao hoặc các lớp cao cao chảy được phủ bên ngoài bánh trông vô cùng bắt mắt. Để tạo hương vị mới lạ, thợ làm bánh cũng có thể thay thế hoặc bổ sung một số nguyên liệu khác.'),
(21, 4, 'Bánh Mousse Chanh Dây', 'img/product_img/banh-mousse-chanh-day.png', '', 290000, 'Bánh Mousse là sự kết hợp khéo léo giữa vị béo ngậy, man mát của kem tươi, cùng hương vị trái cây, trà xanh, chocolate,…tạo nên sự độc đáo của bánh.\r\n\r\nThành phần cơ bản của Mousse là một lớp bánh gato mỏng phía bên dưới bánh. Phần bánh được trộn cùng với những nguyên liệu như: Chocolate, Caramel, chanh leo, cam, phô mai nướng…\r\n\r\nChiếc bánh Mousse có ưu điểm là dễ làm, nhanh gọn và không cần sử dụng đến lò nướng. Nó được xem là lựa chọn hàng đầu cho những người mới làm bánh hay chưa thạo làm bánh sinh nhật. '),
(22, 4, 'Bánh Nhung Đỏ', 'img/product_img/banh-nhung-do.png', '', 230000, 'Bánh Nhung Đỏ là loại bánh có phần bánh gato màu đỏ tươi, đỏ sậm hoặc đỏ vừa, xen kẽ là lớp kem trắng muốt và phủ bên trên khắp bánh là phần vụn bánh màu đỏ. Bánh có màu đỏ đặc trưng và nổi bật giữa các loại bánh khác.'),
(23, 2, 'Hoa Hồng Vàng', 'img/product_img/hoa-hong-vang.png', '', 270000, 'Hoa Hồng Vàng biểu tượng cho tình bạn và niềm vui. Chúng tươi sáng, vui vẻ và khiến bạn muốn mỉm cười, chúng cũng mang một vẻ đẹp thanh lịch, tinh tế.'),
(24, 2, 'Hoa Lưu Ly', 'img/product_img/hoa-luu-ly.png', '', 230000, 'Hoa Lưu Ly hay còn gọi là hoa “Forget me not”, mang ý nghĩa “Xin đừng quên tôi.”'),
(25, 3, 'Hoa Tường Vi Hồng', 'img/product_img/hoa-tuong-vi-hong.png', '', 290000, 'Hoa Tường Vi Hồng mang nghĩa “Anh yêu em mãi mãi”.'),
(26, 3, 'Hoa Mẫu Đơn', 'img/product_img/hoa-mau-don.png', '', 300000, 'Hoa Mẫu Đơn mang ý nghĩa một tình yêu bất diệt, trường tồn với thời gian.'),
(27, 3, 'Hoa Violet', 'img/product_img/hoa-violet.png', '', 460000, 'Hoa Violet mang ý nghĩa của sự khiêm tốn, sự yếu đuối và tình yêu thầm kín. Nó thể hiện sự tinh tế và sự nhạy cảm.'),
(28, 5, 'Hoa Mai', 'img/product_img/hoa-mai.png', '', 400000, 'Hoa Mai là loài hoa mang lại sự may mắn, thịnh vượng, hạnh phúc trong suốt 1 năm.'),
(29, 5, 'Hoa Đào', 'img/product_img/hoa-dao.png', '', 420000, 'Hoa Đào trưng bày trong nhà có thể xua đuổi tà ma, mang đến nguồn sinh khí ấm áp, màu hồng hạnh phúc, tình cảm gia đình khắng khít trong năm mới.'),
(30, 5, 'Hoa Thuỷ Tiên', 'img/product_img/hoa-thuy-tien.png', '', 350000, 'Hoa Thuỷ Tiên là biểu tượng của sự giàu có, thịnh vượng, may mắn và hạnh phúc'),
(33, 4, 'Cheesecake Trái cây', 'img/product_img/cheesecake-trai-cay.png', '', 300000, 'Cheesecake Trái Cây là bánh được làm từ creamcheese và whipping cream. Bánh cheesecake khác với các loại bánh khác ở chỗ là bánh này là thuộc dòng bánh lạnh. Còn các bánh khác thì đòi hỏi phải có lò nướng.'),
(34, 4, 'Bánh Flan Gato', 'img/product_img/banh-flan-gato.png', '', 150000, 'Bánh Flan Gato vô cùng khác biệt và có sự phức tạp nhất định nhờ vào sự kết hợp giữa flan và gato. Nhìn qua tưởng chừng rất khó nhưng cách làm thì đơn giản vô cùng. Bánh gồm 2 lớp, dưới cùng là lớp gato thường là vị sô-cô-la hoặc là vị va-ni. Bên trên là lớp bánh flan béo ngậy và trên cùng là một lớp đường caramel.'),
(35, 4, 'Crepe ngàn lớp', 'img/product_img/crepe-ngan-lop.png', '', 250000, 'Bánh Crepe thường được làm với chảo chống dính và nguyên liệu thì vô cùng đơn giản bao gồm sữa, trứng và bột mì và một số nguyên liệu phụ khác. Bánh crepe của Pháp được biến tấu thành bánh crepe trái cây và bánh Crepe ngàn lớp. Bánh Crepe trái cây là bánh có một lớp bánh mỏng sau đó thêm trái cây vào nhân bánh và cuộn lại hoặc gấp lại.'),
(36, 2, 'Hoa Thược Dược', 'img/product_img/hoa-thuoc-duoc.png', '', 330000, 'Hoa thược dược gây ấn tượng với con người bởi vẻ đẹp rực rỡ,quý phái, sang trọng của nó với các loài hoa khác. Hoa thược dược còn có ý nghĩa may mắn và thành công, thường được mọi người mua làm quà tặng nhau.\r\n\r\n'),
(37, 5, 'Cây Phát Tài', 'img/product_img/cay-phat-tai.png', '', 400000, 'Cây Phát Tài là loài cây mang lại may mắn, tài lộc sung túc cho cả gia đình. Theo phong thủy, số lượng cây phát tài, phát lộc được trồng trong một chậu sẽ có ý nghĩa khác nhau. 2 cây: Tình duyên và hôn nhân.\n3 cây: Mang đến hạnh phúc, trường thọ, sự giàu có. 5 cây: Sức khỏe. 8 cây: Thịnh vượng, phát tài. 9 cây: May mắn.'),
(38, 5, 'Hoa Trạng Nguyên', 'img/product_img/hoa-trang-nguyen.png', '', 350000, 'Cây Trạng Nguyên là biểu tượng cho sự thành đạt, đỗ đạt trong con đường học hành. Với màu sắc đỏ thắm, cây trạng nguyên vừa mang lại hạnh phúc, may mắn vừa mang lại thành công cho các thành viên trong gia đình. Đặc biệt, những gia đình có con cháu sắp bước vào những cuộc thi cử quan trọng đều chọn cây hoa trạng nguyện bày trong nhà với hy vọng con cháu học giỏi, đỗ đạt cao.'),
(39, 5, 'Hoa Đỗ Quyên', 'img/product_img/hoa-do-quyen.png', '', 370000, 'Hoa Đỗ Quyên với sắc đỏ, sắc hồng giúp mang sắc xuân cho ngôi nhà của bạn. Ngoài ra, loài hoa này tượng trưng cho sự may mắn, phú quý và thành đạt, giúp hóa giải khí xấu cho gia đình.\nHoa đỗ quyên rất dễ trồng và chăm sóc. Vì vậy, đây là loài hoa thích hợp để lựa chọn trưng bày trong nhà trong dịp Tết Nguyên Đán sắp tới.'),
(40, 5, 'Cây Kim Tiền', 'img/product_img/cay-kim-tien.png', '', 420000, 'Cây Kim Tiền được gọi là cây phát tài, tượng trưng cho sự may mắn, phát tài phát lộc và thịnh vượng. Vì vậy, nếu muốn lựa chọn cây cảnh trang trí Tết và mang lại may mắn, tài lộc cho gia đình trong năm mới thì đây là sự lựa chọn tuyệt vời cho bạn.'),
(41, 4, 'Bông Lan Trứng Muối', 'img/product_img/bong-lan-trung-muoi.png', '', 150000, 'Nếu ai đã từng thưởng thức qua những chiếc bánh bông lan trứng muối chà bông phô mai thì chắc hẳn sẽ không bao giờ quên được cái hương vị của nó. Một chiếc bánh bông lan trứng muối ngon là sự kết tinh của vị mằn mặn bùi bùi của trứng muối cùng chà bông thêm vào đó là miếng phô mai béo béo hòa cùng vị ngọt thanh của chiếc bánh khiến ai cũng say mê.'),
(42, 4, 'Bánh Kem Trái Cây ', 'img/product_img/banh-kem-trai-cay.png', '', 440000, 'Bánh Kem Trái Cây là sự kết hợp giữa kem tươi ngọt béo và những miếng trái cây mọng nước, ngọt ngào, không quá ngấy, phù hợp khẩu vị nhiều người.\nTừ những quả trái cây tươi, chua ngọt hòa quyện với cốt bánh mềm mịn, béo ngậy. Nghe đến thôi cũng đã cảm thấy thơm ngon, hấp dẫn đúng không nào? Hãy cùng với chúng tôi để khám phá cách làm bánh kem trái cây ngon tuyệt hảo thôi nào!'),
(43, 4, 'Bánh Poured Fondant', 'img/product_img/banh-poured-fondant.png', '', 420000, 'Bánh Poured Fondant được làm từ đường nấu chảy, nước, bột ngô và bổ sung các hương liệu. Loại này thường được dùng để tạo lớp phủ cho bánh vì có độ láng mịn và dùng trong một số nhân của các loại bánh ngọt cỡ vừa như cupcake, pastry,...'),
(44, 1, 'Bó Hồng Tươi', 'img/product_img/bo-hong-tuoi.png', '', 550000, 'Bó Hồng Tươi tặng sinh nhật đẹp, giao hoa tận nơi, với nhiều mẫu đẹp, điện hoa uy tín, giá rẻ, cam kết chất lượng, miễn phí vận chuyển nội thành');

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
  `password` varchar(64) NOT NULL,
  `address` longtext DEFAULT NULL,
  `phone_number` varchar(11) NOT NULL,
  `status` enum('activate','deactivate') NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `delete_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `full_name`, `year_of_birth`, `gender`, `email`, `password`, `address`, `phone_number`, `status`, `create_at`, `delete_at`) VALUES
(1, 'Vũ Ngọc Ánh', 1997, 'female', 'Anhvn@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '561 Lạc Long Quân, Quy Nhơn, Bình Định', '02567308668', 'activate', '2022-11-16 10:41:46', NULL),
(2, 'Đinh Quốc Chương', 1999, 'male', 'Chuongdq@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '23 Phan Bội Châu,Quy Nhơn, Bình Định', '02567308668', 'activate', '2023-11-01 11:04:28', NULL),
(3, 'Trịnh Minh Dương', 2000, 'male', 'Duongtm@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '231 Lê Hồng Phong, Quy Nhơn, Bình Định', '02567308668', 'deactivate', '2023-11-01 08:04:40', '2023-11-15 11:08:24'),
(4, 'Lê Đồng Tâm', 2002, 'male', 'Tamld@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '456 Hùng Vương, Quy Nhơn, Bình Định', '02567308668', 'activate', '2023-09-06 11:04:53', NULL),
(5, 'Phan Thu Thảo', 2001, 'female', 'Thaopt@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '213 Âu Cơ, Quy Nhơn, Bình Định', '02567308668', 'activate', '2023-11-03 11:05:13', NULL),
(6, 'Đường Mỹ Hà', 2003, 'female', 'Hadm@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '1112 Hùng Vương, Quy Nhơn, Bình Định', '02567308668', 'activate', '2023-11-04 11:05:25', NULL),
(7, 'Nguyễn Tuấn Nghĩa', 2004, 'male', 'Nghiant@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '21 Đào Duy Tử, Quy Nhơn, Bình Định', '02567308668', 'activate', '2023-09-07 11:06:50', NULL),
(8, 'Bùi Quang Tuấn', 1992, 'male', 'Tuanbq@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Hẻm 220 Nguyễn Thái Học, Quy Nhơn, Bình Định', '02567308668', 'deactivate', '2023-11-02 11:07:17', '2023-11-17 11:08:59'),
(9, 'Trần Thu Ngân', 1998, 'female', 'Ngantt@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '38 Võ Lai, Quy Nhơn, Bình Định', '02567308668', 'activate', '2023-09-06 11:07:38', NULL),
(10, 'Nguyễn Thục Ngân', 2001, 'female', 'Ngannt@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '456 Trần Hưng Đạo, Quy Nhơn, Bình Định', '02567308668', 'activate', '2023-10-24 11:09:10', NULL),
(11, 'Bùi Ngọc Bảo Trân', 2000, 'female', 'Tranbnb@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '561 Lạc Long Quân, Quy Nhơn', '02567308668', 'activate', '2023-10-12 11:09:22', NULL),
(12, 'Phạm Ngọc Quyền', 1994, 'male', 'Quyenpn@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '17 Trần Thị Kỷ, thị xã An Nhơn, Bình Định', '02567308668', 'deactivate', '2023-10-10 11:09:47', '2023-11-16 11:19:22'),
(13, 'Nguyễn Trung Dũng', 1999, 'male', 'Dungnt@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '44 Tăng Bạt Hổ, huyện Tuy Phước, Bình Định', '02567308668', 'activate', '2023-10-23 11:10:51', NULL),
(14, 'Nguyễn Tấn Kiệt', 2002, 'male', 'Kietnt@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '521 Tây Sơn, tp.Quy Nhơn, Bình Định', '02567308668', 'activate', '2023-11-06 11:11:33', NULL),
(15, 'Nguyễn Dương', 2000, 'male', 'Duongn@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '34 Nguyễn Trân, thị xã Hoài Nhơn, Bình Định', '02567308668', 'activate', '2023-10-26 11:11:46', NULL),
(16, 'Đoàn Nguyễn Huyền Trang', 2005, 'female', 'Trangdnh@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '22 Đào Duy Từ, tp.Quy Nhơn, Bình Định', '02567308668', 'activate', '2023-10-03 11:11:57', NULL),
(17, 'Đào Thanh Trúc', 2002, 'female', 'Trucdt@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '307 Nguyễn Thị Minh Khai, tp.Quy Nhơn, Bình Định', '02567308668', 'activate', '2023-10-16 11:12:45', NULL),
(18, 'Trương Thế Cảnh', 1997, 'male', 'Canhtt@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '5D Tăng Bạt Hổ, tp.Quy Nhơn, Bình Định ', '02567308668', 'activate', '2023-10-11 11:13:02', NULL),
(19, 'Phạm Quốc Toàn', 2004, 'male', 'Toanpq@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '65 Quang Trung, thị xã Hoài Nhơn, Bình Định', '02567308668', 'activate', '2023-09-22 11:13:29', NULL),
(20, 'Phạm Thanh Trúc', 1990, 'female', 'Trucpt@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '295 Trần Phú, thị xã Hoài Nhơn, Bình Định', '02567308668', 'activate', '2023-09-14 11:13:57', NULL),
(21, 'Phan Bảo Nhi', 1999, 'female', 'Nhipb@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '1126 Hùng Vương, tp.Quy Nhơn, Bình Định', '02567308668', 'activate', '2023-10-16 11:21:26', NULL),
(22, 'Phan Mai Sơn', 2003, 'male', 'Sonpm@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '25 Nguyễn Thị Định, tp.Quy Nhơn, Bình Định', '02567308668', 'activate', '2023-10-23 11:21:26', NULL),
(23, 'Đặng Ngọc Hưng', 2001, 'male', 'Hungdn@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '71 Bùi Thị Xuân, huyện Tây Sơn, Bình Định', '02567308668', 'activate', '2023-10-30 11:21:26', NULL),
(24, 'Lâm Mỹ Linh', 1996, 'female', 'Linhlm@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '94 Mai Xuân Thưởng, tp.Quy Nhơn, Bình Định', '02567308668', 'activate', '2023-10-15 11:21:26', NULL),
(25, 'Lê Thị Chí Thương', 1998, 'female', 'Thuongltc@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '85/24 hoàng văn thụ, tp.Quy Nhơn, Bình Định', '02567308668', 'activate', '2023-10-12 11:21:26', NULL),
(26, 'Đặng Kiều Duyên', 2002, 'female', 'Duyendk@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '67 Chế Lan Viên, thị xã An Nhơn, Bình Định', '02567308668', 'activate', '2023-10-09 11:21:26', NULL),
(27, 'Vũ Việt Thắng', 1991, 'male', 'Thangvt@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '333 Quang Trung, huyện Phù Cát, Bình Định', '02567308668', 'deactivate', '2023-09-13 11:20:34', '2023-11-15 11:20:51'),
(28, 'Vũ Văn Dũng', 2000, 'male', 'Dungvv@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '57A Nguyễn Huệ, tp.Quy Nhơn, Bình Định', '02567308668', 'activate', '2023-11-07 11:20:01', NULL),
(29, 'Phạm Đức Nghĩa', 2003, 'male', 'Nghiapd@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '114B 31 tháng 3, tp.Quy Nhơn, Bình Định', '02567308668', 'activate', '2023-10-05 11:21:26', NULL),
(30, 'Lê Uyển Nhi', 2001, 'female', 'Nhilu@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Lô 01 Ngọc Hồi, huyện Tây Sơn, Bình Định', '02567308668', 'activate', '2023-10-01 11:21:26', NULL),
(43, 'Le Quoc C', 2000, 'male', 'abcd@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '5/20/17 Hoàng Hoa Thám, TP.Quy Nhơn', '0363475716', 'activate', '2023-11-23 20:47:39', NULL);

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
  ADD UNIQUE KEY `email_2` (`email`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

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
