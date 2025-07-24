// public/js/register.js
document.addEventListener('DOMContentLoaded', function() {
    const registerForm = document.getElementById('registerForm');
    if (!registerForm) return;

    // Helper functions (copied from auth.js or imported)
    function showAlert(message, type = 'success') {
        const alertDiv = document.createElement('div');
        alertDiv.className = `alert alert-${type} alert-dismissible fade show`;
        alertDiv.innerHTML = `
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        `;
        registerForm.prepend(alertDiv);
        setTimeout(() => alertDiv.remove(), 5000);
    }

    function displayFormErrors(errors) {
        document.querySelectorAll('.is-invalid').forEach(el => el.classList.remove('is-invalid'));
        document.querySelectorAll('.invalid-feedback').forEach(el => el.remove());

        errors.forEach(error => {
            const input = document.getElementById(error.field) || 
                         document.querySelector(`[name="${error.field}"]`);
            if (input) {
                input.classList.add('is-invalid');
                const errorDiv = document.createElement('div');
                errorDiv.className = 'invalid-feedback';
                errorDiv.textContent = error.message;
                input.parentNode.appendChild(errorDiv);
            }
        });
    }

    async function handleApiResponse(response) {
        try {
            const data = await response.json();
            return {
                ok: response.ok,
                status: response.status,
                data
            };
        } catch (error) {
            return {
                ok: false,
                status: response.status,
                data: { message: 'Failed to parse server response' }
            };
        }
    }

    registerForm.addEventListener('submit', async function(e) {
        e.preventDefault();
        const submitBtn = registerForm.querySelector('button[type="submit"]');
        submitBtn.disabled = true;
        submitBtn.innerHTML = '<span class="spinner-border spinner-border-sm" role="status"></span> Registering...';

        try {
            const userData = {
                username: document.getElementById('username').value.trim(),
                password: document.getElementById('password').value.trim(),
                email: document.getElementById('email').value.trim(),
                first_name: document.getElementById('firstName').value.trim(),
                last_name: document.getElementById('lastName').value.trim(),
                phone: document.getElementById('phone').value.trim()
            };

            // Client-side validation
            const errors = [];
            if (!userData.username) errors.push({ field: 'username', message: 'Username is required' });
            if (!userData.password) errors.push({ field: 'password', message: 'Password is required' });
            if (userData.password.length < 8) errors.push({ field: 'password', message: 'Password must be at least 8 characters' });
            if (!userData.email) errors.push({ field: 'email', message: 'Email is required' });
            if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(userData.email)) errors.push({ field: 'email', message: 'Invalid email format' });
            if (!userData.first_name) errors.push({ field: 'first_name', message: 'First name is required' });
            if (!userData.last_name) errors.push({ field: 'last_name', message: 'Last name is required' });

            if (errors.length > 0) {
                displayFormErrors(errors);
                throw new Error('Validation failed');
            }

            const response = await fetch('/hotel/api/auth/register.php', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(userData)
            });

            const { ok, status, data } = await handleApiResponse(response);

            if (!ok) {
                if (status === 409) {
                    throw new Error(data.message || 'Username or email already exists');
                } else if (status === 400) {
                    if (data.errors) displayFormErrors(data.errors);
                    throw new Error(data.message || 'Validation failed');
                }
                throw new Error(data?.message || `Registration failed (Status: ${status})`);
            }

            // Registration successful
            showAlert('Registration successful! You can now login.', 'success');
            registerForm.reset();

            // Redirect to login after delay
            setTimeout(() => {
                window.location.href = 'index.html';
            }, 2000);

        } catch (error) {
            console.error('Registration error:', error);
            showAlert(error.message, 'danger');
        } finally {
            submitBtn.disabled = false;
            submitBtn.textContent = 'Register';
        }
    });
});