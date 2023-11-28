const form = document.getElementById('register-form');
const fullNameInp = document.getElementById('fullname');
const yearOfBirthInp = document.getElementById('yearOfBirth');
const addressInp = document.getElementById('address');
const phoneNumberInp = document.getElementById('phone_number');
const emailInp = document.getElementById('email');
const errorMessage = document.getElementById('error-message');

form.addEventListener('submit', function (send) {
    event.preventDefault();

    removeExtraSpaces(fullNameInp);
    
    const emailValue = emailInp.value;

    if (!isValidEmail(emailValue)) {
        errorMessage.textContent = 'Email không hợp lệ!';
        emailInp.focus();
        return;
    }
});

emailInp.addEventListener('input', function () {
    removeSpaces(emailInp);
});

function removeExtraSpaces(input) {
    input.value = input.value.replace(/\s+/g, ' ').trim();
}

function isValidEmail(email) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

function removeSpaces(input) {
    input.value = input.value.replace(/\s/g, '');
}