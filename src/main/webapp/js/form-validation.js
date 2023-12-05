/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


// Lấy các phần tử input cần kiểm tra
const yearOfBirthInput = document.getElementById('yearOfBirth');
const phoneNumberInput = document.getElementById('phone_number');
const passwordInput = document.getElementsByName('password')[0];
const rePasswordInput = document.getElementsByName('re-password')[0];

// Thêm sự kiện kiểm tra khi người dùng nhập dữ liệu
yearOfBirthInput.addEventListener('change', () => {
    const yearOfBirth = parseInt(yearOfBirthInput.value);
    const currentYear = new Date().getFullYear();
    if (yearOfBirth < 1900 || yearOfBirth > currentYear) {
        // Hiển thị thông báo lỗi
        alert('Năm sinh không hợp lệ');
        // Xoá giá trị không hợp lệ và tập trung vào ô nhập liệu
        yearOfBirthInput.value = '';
        yearOfBirthInput.focus();
    }
});

phoneNumberInput.addEventListener('change', () => {
    const phoneNumber = phoneNumberInput.value;
    if (phoneNumber.length !== 10) {
        alert('Số điện thoại phải có 10 chữ số');
        phoneNumberInput.value = '';
        phoneNumberInput.focus();
    }
});

passwordInput.addEventListener('change', () => {
    if (passwordInput.value.length < 6) {
        alert('Mật khẩu phải có ít nhất 6 ký tự');
        passwordInput.value = '';
        passwordInput.focus();
    }
});

rePasswordInput.addEventListener('change', () => {
    if (rePasswordInput.value.length < 6) {
        alert('Mật khẩu phải có ít nhất 6 ký tự');
        rePasswordInput.value = '';
        rePasswordInput.focus();
    }
});
