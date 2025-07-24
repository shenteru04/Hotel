document.addEventListener('DOMContentLoaded', function() {
    const token = localStorage.getItem('token');
    const user = JSON.parse(localStorage.getItem('user'));
    
    if (!token || !user) {
        window.location.href = 'login.html';
        return;
    }

    // Load user profile
    if (document.getElementById('profileForm')) {
        loadUserProfile();
        
        document.getElementById('profileForm').addEventListener('submit', async function(e) {
            e.preventDefault();
            
            const formData = {
                id: user.id,
                email: document.getElementById('email').value,
                first_name: document.getElementById('firstName').value,
                last_name: document.getElementById('lastName').value,
                phone: document.getElementById('phone').value
            };
            
            try {
                const response = await fetch('/api/users/update_profile.php', {
                    method: 'PUT',
                    headers: {
                        'Content-Type': 'application/json',
                        'Authorization': `Bearer ${token}`
                    },
                    body: JSON.stringify(formData)
                });
                
                const data = await response.json();
                
                if (data.status === 'success') {
                    showAlert('Profile updated successfully!', 'success');
                    
                    // Update stored user data
                    const updatedUser = {
                        ...user,
                        email: formData.email,
                        first_name: formData.first_name,
                        last_name: formData.last_name
                    };
                    localStorage.setItem('user', JSON.stringify(updatedUser));
                    
                    // Update UI
                    updateProfileDisplay(updatedUser);
                } else {
                    showAlert(data.message, 'danger');
                }
            } catch (error) {
                showAlert('An error occurred while updating profile', 'danger');
                console.error('Profile update error:', error);
            }
        });
    }

    // Load all users (for admin)
    if (document.getElementById('usersTable') && user.role === 'admin') {
        loadAllUsers();
    }

    // Functions
    async function loadUserProfile() {
        try {
            const response = await fetch(`/api/users/get_user.php?id=${user.id}&stats=true`, {
                headers: {
                    'Authorization': `Bearer ${token}`
                }
            });
            
            const data = await response.json();
            
            if (data.status === 'success') {
                populateProfileForm(data.data.user);
                displayProfileStats(data.data.stats);
            }
        } catch (error) {
            console.error('Error loading user profile:', error);
        }
    }

    function populateProfileForm(userData) {
        document.getElementById('email').value = userData.email;
        document.getElementById('firstName').value = userData.first_name;
        document.getElementById('lastName').value = userData.last_name;
        document.getElementById('phone').value = userData.phone || '';
        
        // Update profile display
        updateProfileDisplay(userData);
    }

    function updateProfileDisplay(userData) {
        const profileName = document.getElementById('profileName');
        if (profileName) {
            profileName.textContent = `${userData.first_name} ${userData.last_name}`;
        }
        
        const profileEmail = document.getElementById('profileEmail');
        if (profileEmail) {
            profileEmail.textContent = userData.email;
        }
        
        const avatar = document.querySelector('.user-avatar');
        if (avatar) {
            const initials = `${userData.first_name.charAt(0)}${userData.last_name.charAt(0)}`;
            avatar.textContent = initials;
        }
    }

    function displayProfileStats(stats) {
        const statsContainer = document.getElementById('profileStats');
        if (!statsContainer) return;
        
        statsContainer.innerHTML = `
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Your Stats</h5>
                    <p>Total Reservations: ${stats.reservations ? Object.values(stats.reservations).reduce((a, b) => a + b, 0) : 0}</p>
                    <p>Pending: ${stats.reservations?.pending || 0}</p>
                    <p>Confirmed: ${stats.reservations?.confirmed || 0}</p>
                    <p>Total Spent: $${stats.total_spent || 0}</p>
                </div>
            </div>
        `;
    }

    async function loadAllUsers() {
        try {
            const response = await fetch('/api/users/list_users.php', {
                headers: {
                    'Authorization': `Bearer ${token}`
                }
            });
            
            const data = await response.json();
            
            if (data.status === 'success') {
                const tbody = document.querySelector('#usersTable tbody');
                tbody.innerHTML = '';
                
                data.data.forEach(user => {
                    const row = document.createElement('tr');
                    
                    row.innerHTML = `
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.email}</td>
                        <td>${user.first_name} ${user.last_name}</td>
                        <td><span class="badge ${getRoleBadgeClass(user.role)}">${user.role}</span></td>
                        <td>${new Date(user.created_at).toLocaleDateString()}</td>
                    `;
                    
                    tbody.appendChild(row);
                });
            }
        } catch (error) {
            console.error('Error loading users:', error);
        }
    }

    function getRoleBadgeClass(role) {
        switch(role) {
            case 'admin':
                return 'badge-danger';
            case 'receptionist':
                return 'badge-warning';
            default:
                return 'badge-success';
        }
    }

    function showAlert(message, type) {
        const alertDiv = document.createElement('div');
        alertDiv.className = `alert alert-${type} mt-3`;
        alertDiv.textContent = message;
        
        const container = document.querySelector('main') || document.body;
        container.prepend(alertDiv);
        
        setTimeout(() => {
            alertDiv.remove();
        }, 5000);
    }
});