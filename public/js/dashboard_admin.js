const CONFIG = {
    API_BASE_URL: '../api',
};

        // Enhanced JavaScript functionality integrated with your existing auth system
        document.addEventListener('DOMContentLoaded', function() {
            // Check authentication first
            const token = localStorage.getItem('token');
            const user = JSON.parse(localStorage.getItem('user') || '{}');
            
            if (!token || !user.id) {
                window.location.href = 'login.html';
                return;
            }

            // Initialize dashboard
            initializeDashboard(user);
            
            // Load dashboard data
            loadDashboardStats();
            loadRecentReservations();
            
            // Setup event listeners
            setupEventListeners();
        });

        function initializeDashboard(user) {
            // Set user avatar and profile name
            const userAvatar = document.getElementById('userAvatar');
            const profileName = document.getElementById('profileName');
            
            if (user) {
                let displayName = 'Admin User';
                if (user.first_name && user.last_name) {
                    displayName = `${user.first_name} ${user.last_name}`;
                } else if (user.username) {
                    displayName = user.username;
                } else if (user.email) {
                    displayName = user.email.split('@')[0];
                }
                
                profileName.textContent = displayName;
                
                // Set avatar initial
                let initial = 'A';
                if (user.first_name) {
                    initial = user.first_name.charAt(0).toUpperCase();
                } else if (user.username) {
                    initial = user.username.charAt(0).toUpperCase();
                } else if (user.email) {
                    initial = user.email.charAt(0).toUpperCase();
                }
                
                userAvatar.textContent = initial;
            }
        }

        async function loadDashboardStats() {
            const token = localStorage.getItem('token');
            
            try {
                // Load room statistics
                const roomsResponse = await fetch(`${CONFIG.API_BASE_URL}/rooms/get_room_stats.php`, {
                    headers: {
                        'Authorization': `Bearer ${token}`,
                        'Content-Type': 'application/json'
                    }
                });
                
                if (roomsResponse.ok) {
                    const roomsData = await roomsResponse.json();
                    if (roomsData.status === 'success') {
                        document.getElementById('totalRooms').textContent = roomsData.data.total_rooms || '0';
                        document.getElementById('occupiedRooms').textContent = roomsData.data.occupied_rooms || '0';
                    }
                }
                
                // Load today's statistics
                const statsResponse = await fetch(`${CONFIG.API_BASE_URL}/dashboard/get_daily_stats.php`, {
                    headers: {
                        'Authorization': `Bearer ${token}`,
                        'Content-Type': 'application/json'
                    }
                });
                
                if (statsResponse.ok) {
                    const statsData = await statsResponse.json();
                    if (statsData.status === 'success') {
                        document.getElementById('todaysCheckins').textContent = statsData.data.todays_checkins || '0';
                        document.getElementById('todaysRevenue').textContent = `${statsData.data.todays_revenue || '0'}`;
                    }
                }
            } catch (error) {
                console.error('Error loading dashboard stats:', error);
                // Fallback to default values
                document.getElementById('totalRooms').textContent = '0';
                document.getElementById('occupiedRooms').textContent = '0';
                document.getElementById('todaysCheckins').textContent = '0';
                document.getElementById('todaysRevenue').textContent = '$0';
            }
        }

        async function loadRecentReservations() {
            const tbody = document.getElementById('recentReservations');
            const token = localStorage.getItem('token');
            
            if (!tbody) return;
            
            try {
                const response = await fetch(`${CONFIG.API_BASE_URL}/reservations/get_recent_reservations.php?limit=5`, {
                    headers: {
                        'Authorization': `Bearer ${token}`,
                        'Content-Type': 'application/json'
                    }
                });
                
                const data = await response.json();
                
                if (data.status === 'success' && data.data && data.data.length > 0) {
                    tbody.innerHTML = data.data.map(reservation => {
                        const checkInDate = new Date(reservation.check_in).toLocaleDateString();
                        const checkOutDate = new Date(reservation.check_out).toLocaleDateString();
                        const guestName = reservation.guest_name || `${reservation.first_name || ''} ${reservation.last_name || ''}`.trim() || 'N/A';
                        const roomNumber = reservation.room_number || reservation.room_id;
                        const status = reservation.status || 'pending';
                        const amount = reservation.total_amount ? `${parseFloat(reservation.total_amount).toFixed(2)}` : 'N/A';
                        
                        return `
                            <tr>
                                <td>${reservation.id}</td>
                                <td>${roomNumber}</td>
                                <td>${guestName}</td>
                                <td>${checkInDate} to ${checkOutDate}</td>
                                <td><span class="status-badge status-${status.toLowerCase()}">${status.charAt(0).toUpperCase() + status.slice(1)}</span></td>
                                <td>${amount}</td>
                            </tr>
                        `;
                    }).join('');
                } else {
                    tbody.innerHTML = `
                        <tr>
                            <td colspan="6" style="text-align: center; padding: 2rem; color: #666;">
                                <i class="fas fa-calendar-times" style="font-size: 2rem; margin-bottom: 1rem; display: block;"></i>
                                No recent reservations found
                            </td>
                        </tr>
                    `;
                }
            } catch (error) {
                console.error('Error loading recent reservations:', error);
                tbody.innerHTML = `
                    <tr>
                        <td colspan="6" style="text-align: center; padding: 2rem; color: #dc3545;">
                            <i class="fas fa-exclamation-triangle" style="font-size: 2rem; margin-bottom: 1rem; display: block;"></i>
                            Error loading reservations. Please refresh the page.
                        </td>
                    </tr>
                `;
            }
        }

        function setupEventListeners() {
            // Logout functionality
            document.getElementById('logoutBtn').addEventListener('click', function() {
                if (confirm('Are you sure you want to logout?')) {
                    // Clear session and redirect
                    localStorage.removeItem('token');
                    localStorage.removeItem('user');
                    sessionStorage.clear();
                    window.location.href = 'login.html';
                }
            });

            // User avatar click
            document.getElementById('userAvatar').addEventListener('click', function() {
                showNotification('Profile settings coming soon!');
            });
        }

        function showNotification(message) {
            const notification = document.createElement('div');
            notification.className = 'notification';
            notification.innerHTML = `
                <i class="fas fa-info-circle"></i>
                ${message}
            `;
            
            document.body.appendChild(notification);
            
            setTimeout(() => notification.classList.add('show'), 100);
            setTimeout(() => {
                notification.classList.remove('show');
                setTimeout(() => document.body.removeChild(notification), 300);
            }, 3000);
        }

        // Auto-refresh dashboard data every 30 seconds
        setInterval(() => {
            loadDashboardStats();
            loadRecentReservations();
        }, 30000);