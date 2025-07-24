// public/js/auth.js
document.addEventListener('DOMContentLoaded', function() {
    // ======================
    // Helper Functions
    // ======================
    
    function showAlert(message, type = 'danger', container = '.auth-container') {
        // Remove existing alerts
        document.querySelectorAll('.alert').forEach(alert => alert.remove());
        
        const alertDiv = document.createElement('div');
        alertDiv.className = `alert alert-${type}`;
        alertDiv.textContent = message;
        
        const target = document.querySelector(container) || document.body;
        const form = target.querySelector('form');
        if (form) {
            target.insertBefore(alertDiv, form);
        } else {
            target.prepend(alertDiv);
        }
        
        // Auto-remove after 5 seconds
        setTimeout(() => {
            if (alertDiv.parentNode) {
                alertDiv.remove();
            }
        }, 5000);
    }

    function displayFormErrors(errors) {
        // Clear previous errors
        document.querySelectorAll('.is-invalid').forEach(el => el.classList.remove('is-invalid'));
        document.querySelectorAll('.invalid-feedback').forEach(el => el.textContent = '');

        // Add new errors
        errors.forEach(error => {
            const fieldName = error.field;
            let input = document.getElementById(fieldName);
            
            // Try alternative field names
            if (!input) {
                const alternativeNames = {
                    'first_name': 'firstName',
                    'last_name': 'lastName'
                };
                const altName = alternativeNames[fieldName];
                if (altName) {
                    input = document.getElementById(altName);
                }
            }
            
            if (input) {
                input.classList.add('is-invalid');
                const feedback = input.parentElement.querySelector('.invalid-feedback');
                if (feedback) {
                    feedback.textContent = error.message;
                }
            }
        });
    }

    function clearFormErrors() {
        document.querySelectorAll('.is-invalid').forEach(el => el.classList.remove('is-invalid'));
        document.querySelectorAll('.invalid-feedback').forEach(el => el.textContent = '');
        document.querySelectorAll('.alert').forEach(alert => alert.remove());
    }

    async function handleApiResponse(response) {
        const contentType = response.headers.get('content-type');
        if (!contentType || !contentType.includes('application/json')) {
            throw new Error('Server returned invalid response');
        }

        try {
            const data = await response.json();
            return {
                ok: response.ok,
                status: response.status,
                data
            };
        } catch (error) {
            throw new Error('Failed to parse server response');
        }
    }

    function redirectByRole(role) {
        const routes = {
            'admin': 'dashboard_admin.html',
            'receptionist': 'dashboard_receptionist.html',
            'customer': 'dashboard_customer.html'
        };
        const target = routes[role] || 'dashboard_customer.html';
        window.location.href = target;
    }

    // ======================
    // Login Handler
    // ======================
    const loginForm = document.getElementById('loginForm');
    if (loginForm) {
        loginForm.addEventListener('submit', async function(e) {
            e.preventDefault();
            clearFormErrors();
            
            const submitBtn = loginForm.querySelector('button[type="submit"]');
            const originalText = submitBtn.textContent;
            submitBtn.disabled = true;
            submitBtn.innerHTML = '<span class="spinner-border spinner-border-sm"></span> Logging in...';

            try {
                const credentials = {
                    username: document.getElementById('username').value.trim(),
                    password: document.getElementById('password').value.trim()
                };

                // Basic validation
                if (!credentials.username || !credentials.password) {
                    showAlert('Please fill in all fields');
                    return;
                }

                const response = await fetch('/hotel/api/auth/login.php', {
                    method: 'POST',
                    headers: { 
                        'Content-Type': 'application/json',
                        'Accept': 'application/json'
                    },
                    body: JSON.stringify(credentials)
                });

                const { ok, status, data } = await handleApiResponse(response);

                if (ok && data.status === 'success') {
                    // Store user data with consistent key names
                    localStorage.setItem('token', data.token);
                    localStorage.setItem('user', JSON.stringify({
                        id: data.user.id,
                        username: data.user.username,
                        email: data.user.email,
                        first_name: data.user.first_name,
                        last_name: data.user.last_name,
                        role: data.user.role,
                        phone: data.user.phone,
                        created_at: data.user.created_at
                    }));
                    
                    showAlert('Login successful! Redirecting...', 'success');
                    setTimeout(() => redirectByRole(data.user.role), 1000);
                } else {
                    const errorMsg = data.message || `Login failed (Status: ${status})`;
                    if (data.errors && Array.isArray(data.errors)) {
                        displayFormErrors(data.errors);
                    } else {
                        showAlert(errorMsg);
                    }
                }
            } catch (error) {
                console.error('Login error:', error);
                showAlert('Connection error. Please check your internet connection and try again.');
            } finally {
                submitBtn.disabled = false;
                submitBtn.textContent = originalText;
            }
        });
    }

    // ======================
    // Auto-redirect if logged in
    // ======================
    const protectedPages = ['login.html', 'register.html'];
    const currentPage = window.location.pathname.split('/').pop();
    
    if (protectedPages.includes(currentPage)) {
        const token = localStorage.getItem('token');
        const userStr = localStorage.getItem('user');
        
        if (token && userStr) {
            try {
                const user = JSON.parse(userStr);
                if (user && user.role) {
                    redirectByRole(user.role);
                }
            } catch (e) {
                // Invalid user data, clear storage
                localStorage.removeItem('token');
                localStorage.removeItem('user');
            }
        }
    }

    // ======================
    // Universal Logout Handler
    // ======================
    const logoutBtn = document.getElementById('logoutBtn');
    if (logoutBtn) {
        logoutBtn.addEventListener('click', async function() {
            try {
                const token = localStorage.getItem('token');
                if (token) {
                    // Try to call logout endpoint
                    await fetch('/hotel/api/auth/logout.php', {
                        method: 'POST',
                        headers: {
                            'Authorization': `Bearer ${token}`,
                            'Content-Type': 'application/json'
                        }
                    });
                }
            } catch (error) {
                console.error('Logout API error:', error);
            } finally {
                // Always clear storage and redirect
                localStorage.removeItem('token');
                localStorage.removeItem('user');
                window.location.href = 'index.html';
            }
        });
    }
});