document.addEventListener('DOMContentLoaded', function () {
    const CONFIG = {
        API_BASE_URL: '/hotel/api'
    };

    const elements = {
        profileName: document.getElementById('profileName'),
        welcomeName: document.getElementById('welcomeName'),
        userAvatar: document.getElementById('userAvatar'),
        logoutBtn: document.getElementById('logoutBtn'),
        newReservationBtn: document.getElementById('newReservationBtn'),
        upcomingReservations: document.getElementById('upcomingReservations'),
        profileLink: document.getElementById('profileLink'),
        updateProfileBtn: document.getElementById('updateProfileBtn')
    };

    initDashboard();

    function initDashboard() {
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
            loadReservations();
        } catch (e) {
            console.error('Initialization error:', e);
            redirectToLogin();
        }
    }

    function redirectToLogin() {
        window.location.href = '/hotel/public/index.html';
    }

    function initUserDisplay(user) {
        if (!user) return;

        let username = 'Guest';
        if (user.username) {
            username = user.username;
        } else if (user.email) {
            username = user.email.split('@')[0];
        } else if (user.first_name || user.last_name) {
            username = `${user.first_name || ''} ${user.last_name || ''}`.trim();
        }

        // Update profile name in header
        if (elements.profileName) {
            elements.profileName.textContent = username;
        }

        // Update welcome message
        if (elements.welcomeName) {
            elements.welcomeName.textContent = username;
        }

        // Update avatar
        if (elements.userAvatar) {
            const initial = username.charAt(0).toUpperCase();
            elements.userAvatar.textContent = initial || 'G';
        }
    }

    function setupEventListeners() {
        // Logout button
        if (elements.logoutBtn) {
            elements.logoutBtn.addEventListener('click', () => {
                localStorage.removeItem('token');
                localStorage.removeItem('user');
                redirectToLogin();
            });
        }

        // New reservation button
        if (elements.newReservationBtn) {
            elements.newReservationBtn.addEventListener('click', () => {
                window.location.href = 'reservation.html';
            });
        }

        // Profile link
        if (elements.profileLink) {
            elements.profileLink.addEventListener('click', (e) => {
                e.preventDefault();
                // You can implement profile page later
                showInfo('Profile management coming soon!');
            });
        }

        // Update profile button
        if (elements.updateProfileBtn) {
            elements.updateProfileBtn.addEventListener('click', () => {
                // You can implement profile update later
                showInfo('Profile update coming soon!');
            });
        }
    }

    async function loadReservations() {
        if (!elements.upcomingReservations) return;

        try {
            showLoadingState();
            
            const response = await fetch(`${CONFIG.API_BASE_URL}/reservations/get_reservations.php`, {
                headers: {
                    'Authorization': `Bearer ${localStorage.getItem('token')}`,
                    'X-Requested-With': 'XMLHttpRequest'
                }
            });

            const data = await response.json();
            
            if (!response.ok) {
                throw new Error(data.message || `HTTP ${response.status}`);
            }

            if (data.status === 'success') {
                displayReservations(data.data.reservations || []);
            } else {
                throw new Error(data.message || 'Invalid response format');
            }
        } catch (err) {
            console.error('Error loading reservations:', err);
            showError('Failed to load reservations. Please try again.');
            showReservationError();
        }
    }

    function showLoadingState() {
        const tbody = elements.upcomingReservations.querySelector('tbody');
        if (tbody) {
            tbody.innerHTML = '<tr><td colspan="7" class="loading">Loading reservations...</td></tr>';
        }
    }

    function displayReservations(reservations) {
        const tbody = elements.upcomingReservations.querySelector('tbody');
        if (!tbody) return;

        if (!reservations.length) {
            tbody.innerHTML = '<tr><td colspan="7" class="loading">No reservations found.</td></tr>';
            return;
        }

        tbody.innerHTML = reservations.map(reservation => {
            const statusBadge = getStatusBadge(reservation.status);
            const actionButtons = getActionButtons(reservation);
            
            return `
                <tr>
                    <td>#${reservation.id}</td>
                    <td>${reservation.room_number || `Room ${reservation.room_id}`}</td>
                    <td>${formatDate(reservation.check_in)}</td>
                    <td>${formatDate(reservation.check_out)}</td>
                    <td>${statusBadge}</td>
                    <td>$${parseFloat(reservation.total_amount).toFixed(2)}</td>
                    <td>${actionButtons}</td>
                </tr>
            `;
        }).join('');

        // Add event listeners to action buttons
        addActionButtonListeners();
    }

    function getStatusBadge(status) {
        const statusMap = {
            'pending': { class: 'badge-warning', text: 'Pending' },
            'confirmed': { class: 'badge-success', text: 'Confirmed' },
            'checked_in': { class: 'badge-success', text: 'Checked In' },
            'checked_out': { class: 'badge-secondary', text: 'Checked Out' },
            'cancelled': { class: 'badge-danger', text: 'Cancelled' },
            'completed': { class: 'badge-success', text: 'Completed' }
        };

        const statusInfo = statusMap[status] || { class: 'badge-secondary', text: 'Unknown' };
        return `<span class="badge ${statusInfo.class}">${statusInfo.text}</span>`;
    }

    function getActionButtons(reservation) {
        const buttons = [];
        
        // View button - always available
        buttons.push(`<button class="btn-sm" onclick="viewReservation(${reservation.id})">View</button>`);
        
        // Cancel button - only for pending and confirmed reservations
        if (['pending', 'confirmed'].includes(reservation.status)) {
            buttons.push(`<button class="btn-sm" style="background-color: #dc3545;" onclick="cancelReservation(${reservation.id})">Cancel</button>`);
        }
        
        return buttons.join(' ');
    }

    function addActionButtonListeners() {
        // Make functions globally available
        window.viewReservation = viewReservation;
        window.cancelReservation = cancelReservation;
    }

    async function viewReservation(reservationId) {
        try {
            const response = await fetch(`${CONFIG.API_BASE_URL}/reservations/get_reservation.php?id=${reservationId}`, {
                headers: {
                    'Authorization': `Bearer ${localStorage.getItem('token')}`,
                    'X-Requested-With': 'XMLHttpRequest'
                }
            });

            const data = await response.json();
            
            if (data.status === 'success') {
                showReservationDetails(data.data);
            } else {
                throw new Error(data.message);
            }
        } catch (err) {
            console.error('Error viewing reservation:', err);
            showError('Failed to load reservation details.');
        }
    }

    async function cancelReservation(reservationId) {
        if (!confirm('Are you sure you want to cancel this reservation?')) {
            return;
        }

        try {
            const response = await fetch(`${CONFIG.API_BASE_URL}/reservations/cancel_reservation.php`, {
                method: 'POST',
                headers: {
                    'Authorization': `Bearer ${localStorage.getItem('token')}`,
                    'Content-Type': 'application/json',
                    'X-Requested-With': 'XMLHttpRequest'
                },
                body: JSON.stringify({ reservation_id: reservationId })
            });

            const data = await response.json();
            
            if (data.status === 'success') {
                showSuccess('Reservation cancelled successfully.');
                loadReservations(); // Reload the reservations table
            } else {
                throw new Error(data.message);
            }
        } catch (err) {
            console.error('Error cancelling reservation:', err);
            showError('Failed to cancel reservation. Please try again.');
        }
    }

    function showReservationDetails(reservation) {
        const modal = document.createElement('div');
        modal.className = 'modal-overlay';
        modal.innerHTML = `
            <div class="modal-content">
                <div class="modal-header">
                    <h3>Reservation Details</h3>
                    <button class="modal-close">&times;</button>
                </div>
                <div class="modal-body">
                    <p><strong>Reservation ID:</strong> #${reservation.id}</p>
                    <p><strong>Room:</strong> ${reservation.room_number || `Room ${reservation.room_id}`}</p>
                    <p><strong>Check-in:</strong> ${formatDate(reservation.check_in)}</p>
                    <p><strong>Check-out:</strong> ${formatDate(reservation.check_out)}</p>
                    <p><strong>Guests:</strong> ${reservation.adults} Adults${reservation.children ? `, ${reservation.children} Children` : ''}</p>
                    <p><strong>Status:</strong> ${getStatusBadge(reservation.status)}</p>
                    <p><strong>Total Amount:</strong> $${parseFloat(reservation.total_amount).toFixed(2)}</p>
                    <p><strong>Advance Payment:</strong> $${parseFloat(reservation.advance_payment || 0).toFixed(2)}</p>
                    ${reservation.special_requests ? `<p><strong>Special Requests:</strong> ${reservation.special_requests}</p>` : ''}
                </div>
            </div>
        `;

        document.body.appendChild(modal);

        // Close modal functionality
        const closeBtn = modal.querySelector('.modal-close');
        const closeModal = () => {
            document.body.removeChild(modal);
        };

        closeBtn.addEventListener('click', closeModal);
        modal.addEventListener('click', (e) => {
            if (e.target === modal) closeModal();
        });
    }

    function showReservationError() {
        const tbody = elements.upcomingReservations.querySelector('tbody');
        if (tbody) {
            tbody.innerHTML = '<tr><td colspan="7" class="loading" style="color: #dc3545;">Failed to load reservations</td></tr>';
        }
    }

    function formatDate(dateString) {
        if (!dateString) return 'N/A';
        const date = new Date(dateString);
        return date.toLocaleDateString('en-US', {
            year: 'numeric',
            month: 'short',
            day: 'numeric'
        });
    }

    function showError(message) {
        showAlert(message, 'error');
    }

    function showSuccess(message) {
        showAlert(message, 'success');
    }

    function showInfo(message) {
        showAlert(message, 'info');
    }

    function showAlert(message, type) {
        // Remove existing alerts
        document.querySelectorAll('.alert').forEach(alert => alert.remove());

        const alertClass = type === 'error' ? 'alert-danger' : 
                          type === 'success' ? 'alert-success' : 
                          'alert-info';

        const alert = document.createElement('div');
        alert.className = `alert ${alertClass}`;
        alert.textContent = message;
        alert.style.position = 'fixed';
        alert.style.top = '20px';
        alert.style.right = '20px';
        alert.style.zIndex = '9999';
        alert.style.maxWidth = '400px';

        document.body.appendChild(alert);

        // Auto remove after 5 seconds
        setTimeout(() => {
            if (alert.parentNode) {
                alert.parentNode.removeChild(alert);
            }
        }, 5000);
    }
});