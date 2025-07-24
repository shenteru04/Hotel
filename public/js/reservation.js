document.addEventListener('DOMContentLoaded', function () {
    const CONFIG = {
        API_BASE_URL: '/hotel/api',
        PRICES: {
            late_checkout: 15,
            airport_pickup: 30,
            pwd_discount: 0.2,
            advance_payment_percentage: 0.3
        },
        MAX_FILE_SIZE: 2 * 1024 * 1024 // 2MB
    };

    const elements = {
        form: document.getElementById('reservationForm'),
        roomId: document.getElementById('roomId'),
        checkIn: document.getElementById('checkIn'),
        checkOut: document.getElementById('checkOut'),
        adults: document.getElementById('adults'),
        children: document.getElementById('children'),
        specialRequests: document.getElementById('specialRequests'),
        paymentMethod: document.querySelectorAll('input[name="paymentMethod"]'),
        paymentDetails: document.getElementById('paymentDetails'),
        pwdDiscount: document.getElementById('pwdDiscount'),
        additionalServices: document.querySelectorAll('#customerFields input[type="checkbox"]'),
        totalAmount: document.getElementById('totalAmount'),
        advanceAmount: document.getElementById('advanceAmount'),
        gcashAmount: document.getElementById('gcashAmount'),
        bankAmount: document.getElementById('bankAmount'),
        discountNote: document.getElementById('discountNote'),
        cancelBtn: document.getElementById('cancelBtn'),
        profileName: document.getElementById('profileName'),
        userAvatar: document.getElementById('userAvatar'),
        logoutBtn: document.getElementById('logoutBtn'),
        paymentProof: document.getElementById('paymentProof'),
        bankReceipt: document.getElementById('bankReceipt')
    };

    initReservationSystem();

    function initReservationSystem() {
        try {
            const userData = localStorage.getItem('user');
            const token = localStorage.getItem('token');
            
            if (!token || !userData) {
                return redirectToLogin();
            }

            const user = JSON.parse(userData);
            if (!user || !user.id) {
                console.error('Invalid user data in localStorage');
                return redirectToLogin();
            }

            initUserDisplay(user);
            setupEventListeners();
            loadAvailableRooms();
        } catch (e) {
            console.error('Initialization error:', e);
            redirectToLogin();
        }
    }

    function redirectToLogin() {
        window.location.href = '/hotel/login.html';
    }

    function initUserDisplay(user) {
        if (!user) return;

        let username = 'Guest';
        if (user.username) {
            username = user.username;
        } else if (user.email) {
            username = user.email.split('@')[0];
        }

        if (elements.profileName) {
            elements.profileName.textContent = username;
        }

        if (elements.userAvatar) {
            const initial = username.charAt(0).toUpperCase();
            elements.userAvatar.textContent = initial || 'G';
        }

        if (elements.logoutBtn) {
            elements.logoutBtn.addEventListener('click', () => {
                localStorage.removeItem('token');
                localStorage.removeItem('user');
                redirectToLogin();
            });
        }
    }

    function setupEventListeners() {
        if (elements.form) elements.form.addEventListener('submit', handleFormSubmit);
        if (elements.cancelBtn) elements.cancelBtn.addEventListener('click', () => window.location.href = 'dashboard_customer.html');

        const calcEls = [
            elements.roomId, elements.checkIn, elements.checkOut,
            elements.pwdDiscount, ...Array.from(elements.additionalServices || [])
        ];
        calcEls.forEach(el => el && el.addEventListener('change', calculateTotal));

        elements.paymentMethod.forEach(radio => {
            radio.addEventListener('change', () => {
                if (!elements.paymentDetails) return;
                if (radio.value === 'cash') {
                    elements.paymentDetails.disabled = true;
                    elements.paymentDetails.placeholder = 'Not required for cash payment';
                    elements.paymentDetails.value = '';
                } else {
                    elements.paymentDetails.disabled = false;
                    elements.paymentDetails.placeholder = radio.value === 'gcash'
                        ? 'GCash reference number'
                        : 'Card last 4 digits';
                }
            });
        });

        const today = new Date().toISOString().split('T')[0];
        if (elements.checkIn) {
            elements.checkIn.min = today;
            elements.checkIn.addEventListener('change', () => {
                if (elements.checkOut) {
                    elements.checkOut.min = elements.checkIn.value;
                    if (elements.checkOut.value < elements.checkIn.value) {
                        elements.checkOut.value = '';
                    }
                    calculateTotal();
                }
            });
        }
    }

    async function loadAvailableRooms() {
        if (!elements.roomId) return;

        try {
            showRoomLoadingState();
            const params = new URLSearchParams();
            if (elements.checkIn.value) params.append('check_in', elements.checkIn.value);
            if (elements.checkOut.value) params.append('check_out', elements.checkOut.value);

            const url = `${CONFIG.API_BASE_URL}/rooms/get_available_rooms.php?${params.toString()}`;
            const response = await fetch(url, {
                headers: {
                    'Authorization': `Bearer ${localStorage.getItem('token')}`,
                    'X-Requested-With': 'XMLHttpRequest'
                }
            });

            const data = await response.json();
            if (!response.ok) throw new Error(data.message || `HTTP ${response.status}`);

            if (data.status === 'success') {
                populateRoomSelect(data.data.rooms || []);
            } else {
                throw new Error(data.message || 'Invalid response format');
            }
        } catch (err) {
            console.error('Error loading rooms:', err);
            showError('Failed to load available rooms. Please try again.');
            showRoomError();
        }
    }

    function showRoomLoadingState() {
        elements.roomId.innerHTML = '<option>Loading rooms...</option>';
        elements.roomId.disabled = true;
    }

    function populateRoomSelect(rooms) {
        elements.roomId.innerHTML = '<option value="">Select a room</option>';
        if (!rooms.length) {
            elements.roomId.innerHTML = '<option value="">No available rooms</option>';
            return;
        }
        rooms.forEach(r => {
            const opt = document.createElement('option');
            opt.value = r.id;
            opt.textContent = `${r.room_number} - ${r.type} ($${r.price}/night)`;
            opt.dataset.price = r.price;
            opt.dataset.capacity = r.capacity;
            elements.roomId.appendChild(opt);
        });
        elements.roomId.disabled = false;
        calculateTotal();
    }

    function calculateTotal() {
        if (!elements.roomId || !elements.totalAmount) return;
        const sel = elements.roomId.options[elements.roomId.selectedIndex];
        const nights = calculateNights();
        const pwd = elements.pwdDiscount.checked;
        let roomPrice = sel?.value ? parseFloat(sel.dataset.price) : 0;

        let servicesTotal = 0;
        elements.additionalServices.forEach(cb => {
            if (cb.checked && cb.id !== 'pwdDiscount' && CONFIG.PRICES[cb.value]) {
                servicesTotal += CONFIG.PRICES[cb.value];
            }
        });

        const subtotal = (roomPrice * nights) + servicesTotal;
        const discount = pwd ? subtotal * CONFIG.PRICES.pwd_discount : 0;
        const total = subtotal - discount;
        const advancePayment = total * CONFIG.PRICES.advance_payment_percentage;

        updateTotalDisplay(total, discount, nights, advancePayment);
    }

    function calculateNights() {
        if (!elements.checkIn.value || !elements.checkOut.value) return 0;
        const inD = new Date(elements.checkIn.value);
        const outD = new Date(elements.checkOut.value);
        if (outD <= inD) return 0;
        return Math.ceil((outD - inD) / (1000 * 60 * 60 * 24));
    }

    function updateTotalDisplay(total, discount, nights, advancePayment) {
        elements.totalAmount.textContent = `$${total.toFixed(2)}`;
        elements.advanceAmount.textContent = `$${advancePayment.toFixed(2)}`;
        elements.gcashAmount.textContent = `$${advancePayment.toFixed(2)}`;
        elements.bankAmount.textContent = `$${advancePayment.toFixed(2)}`;
        
        elements.discountNote.innerHTML = discount > 0
            ? `<div>${nights} night(s)</div><div>Includes 20% PWD discount ($${discount.toFixed(2)})</div>`
            : `<div>${nights} night(s)</div>`;
    }

    async function buildFormData() {
        const formData = new FormData();
        
        // Get current user data
        const userData = localStorage.getItem('user');
        if (!userData) {
            throw new Error('User not authenticated');
        }
        const user = JSON.parse(userData);
        if (!user || !user.id) {
            throw new Error('Invalid user data');
        }
        formData.append('user_id', user.id);

        // Payment method
        const advanceMethod = document.querySelector('input[name="advancePaymentMethod"]:checked');
        if (!advanceMethod) {
            throw new Error('Please select an advance payment method');
        }

        // File upload
        const fileInput = advanceMethod.value === 'gcash' 
            ? elements.paymentProof 
            : elements.bankReceipt;
        
        if (!fileInput?.files?.[0]) {
            throw new Error(`Please upload your ${advanceMethod.value} payment proof`);
        }
        const paymentFile = fileInput.files[0];
        formData.append('payment_proof', paymentFile);

        // Add form fields
        const addField = (name, value) => {
            if (value !== undefined && value !== null && value !== '') {
                formData.append(name, value);
            }
        };
        
        // Required fields
        addField('room_id', elements.roomId.value);
        addField('check_in', elements.checkIn.value);
        addField('check_out', elements.checkOut.value);
        addField('adults', elements.adults.value);
        addField('advance_payment_method', advanceMethod.value);
        
        // Optional fields
        addField('children', elements.children.value);
        addField('special_requests', elements.specialRequests.value);

        // Payment info
        const paymentMethod = document.querySelector('input[name="paymentMethod"]:checked');
        addField('payment_method', paymentMethod?.value || 'cash');
        
        if (paymentMethod?.value !== 'cash') {
            addField('payment_details', elements.paymentDetails?.value);
        }

        // Discount and services
        addField('pwd_discount', elements.pwdDiscount?.checked ? '1' : '0');
        
        // Additional services
        const additionalServices = Array.from(elements.additionalServices || [])
            .filter(cb => cb.id !== 'pwdDiscount' && cb.checked)
            .map(cb => cb.value);
        
        additionalServices.forEach(service => {
            formData.append('additional_services[]', service);
        });

        return formData;
    }

async function handleFormSubmit(e) {
    e.preventDefault();
    if (!validateForm()) return;

    try {
        const formData = await buildFormData();
        const response = await fetch(`${CONFIG.API_BASE_URL}/reservations/create_reservation.php`, {
            method: 'POST',
            headers: {
                'Authorization': `Bearer ${localStorage.getItem('token')}`,
                'Accept': 'application/json'
            },
            body: formData
        });

        const responseText = await response.text();
        
        // Debugging: Log the raw response
        console.log('Raw server response:', responseText);
        
        try {
            const data = JSON.parse(responseText);
            
            if (data.status === 'success') {
                showSuccess(data.message);
                setTimeout(() => window.location.href = 'dashboard_customer.html', 2000);
            } else {
                throw new Error(data.message || 'Request failed');
            }
        } catch (parseError) {
            console.error('Failed to parse JSON:', parseError);
            
            // Check if this is a PHP error
            if (responseText.includes('Fatal error') || responseText.includes('Warning')) {
                // Extract the relevant error message
                const errorMatch = responseText.match(/<b>(Warning|Fatal error)<\/b>: (.+?) in <b>.+?<\/b>/);
                const errorMessage = errorMatch ? errorMatch[2] : 'Server-side PHP error occurred';
                
                throw new Error(`Server error: ${errorMessage}`);
            } else {
                throw new Error('Unexpected server response');
            }
        }
    } catch (err) {
        console.error('Reservation error:', err);
        showError(err.message || 'Failed to create reservation');
        
        // Additional debugging
        if (err.message.includes('Server error')) {
            console.error('Full server response:', err.message);
        }
    }
}
    function validateForm() {
        // Check required fields
        const requiredFields = [
            { id: 'roomId', message: 'Please select a room' },
            { id: 'checkIn', message: 'Please select check-in date' },
            { id: 'checkOut', message: 'Please select check-out date' },
            { id: 'adults', message: 'Please specify number of adults' }
        ];
        
        for (const field of requiredFields) {
            const element = document.getElementById(field.id);
            if (!element || !element.value) {
                showError(field.message);
                return false;
            }
        }
        
        // Check dates
        if (calculateNights() <= 0) {
            showError('Check-out date must be after check-in date');
            return false;
        }
        
        // Check advance payment method
        const advanceMethod = document.querySelector('input[name="advancePaymentMethod"]:checked');
        if (!advanceMethod) {
            showError('Please select an advance payment method');
            return false;
        }
        
        // Check payment proof
        const fileInput = advanceMethod.value === 'gcash' ? 
            elements.paymentProof : 
            elements.bankReceipt;
        
        if (!fileInput || !fileInput.files || !fileInput.files[0]) {
            showError('Please upload payment proof');
            return false;
        }
        
        const file = fileInput.files[0];
        if (file.size > CONFIG.MAX_FILE_SIZE) {
            showError('File size must be less than 2MB');
            return false;
        }
        
        const validTypes = ['image/jpeg', 'image/png', 'application/pdf'];
        if (!validTypes.includes(file.type)) {
            showError('Only JPG, PNG or PDF files are allowed');
            return false;
        }
        
        return true;
    }

    function showError(msg) {
        document.querySelector('.error-message')?.remove();
        const div = document.createElement('div');
        div.className = 'alert alert-danger error-message mb-3';
        div.textContent = msg;
        (elements.form || document.querySelector('main') || document.body).prepend(div);
        setTimeout(() => div.remove(), 5000);
    }

    function showSuccess(msg) {
        const div = document.createElement('div');
        div.className = 'alert alert-success mb-3';
        div.textContent = msg;
        (elements.form || document.querySelector('main') || document.body).prepend(div);
        setTimeout(() => div.remove(), 5000);
    }
});