document.addEventListener('DOMContentLoaded', function() {
    // DOM elements
    const addUserForm = document.getElementById('addUserForm');
    const usersTableBody = document.getElementById('usersTableBody');
    const searchUserInput = document.getElementById('searchUser');
    
    // Base API URL - adjusted for your file structure
    const API_BASE_URL = '../api/users/';
    
    // Load users on page load
    loadUsers();
    
    // Add user form submission
    addUserForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        const formData = {
            username: document.getElementById('username').value,
            password: document.getElementById('password').value,
            first_name: document.getElementById('first_name').value,
            last_name: document.getElementById('last_name').value,
            email: document.getElementById('email').value,
            phone: document.getElementById('phone').value,
            role: document.getElementById('role').value
        };
        
        fetch(`${API_BASE_URL}user_management.php`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(formData)
        })
        .then(handleResponse)
        .then(data => {
            if (data.success) {
                showSuccess('User added successfully');
                addUserForm.reset();
                loadUsers();
            } else {
                showError(data.error || 'Failed to add user');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            showError('An error occurred while adding the user');
        });
    });
    
    // Search users
    searchUserInput.addEventListener('input', function() {
        loadUsers(this.value);
    });
    
    // Improved response handler
    function handleResponse(response) {
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        const contentType = response.headers.get('content-type');
        if (!contentType || !contentType.includes('application/json')) {
            throw new TypeError("Response isn't JSON");
        }
        return response.json();
    }
    
    // Load users function
    function loadUsers(searchTerm = '') {
        usersTableBody.innerHTML = `
            <tr>
                <td colspan="8" class="text-center py-4">
                    <span class="spinner-border"></span> Loading users...
                </td>
            </tr>
        `;
        
        let url = `${API_BASE_URL}user_management.php`;
        if (searchTerm) {
            url += `?search=${encodeURIComponent(searchTerm)}`;
        }
        
        fetch(url)
        .then(handleResponse)
        .then(data => {
            if (data.success) {
                renderUsersTable(data.data);
            } else {
                showTableError(data.error || 'Unknown error');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            showTableError('Failed to load users. Please try again.');
        });
    }
    
    // Render users table
    function renderUsersTable(users) {
        if (users.length === 0) {
            usersTableBody.innerHTML = `
                <tr>
                    <td colspan="8" class="text-center py-4">
                        No users found
                    </td>
                </tr>
            `;
            return;
        }
        
        usersTableBody.innerHTML = '';
        
        users.forEach(user => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.first_name} ${user.last_name}</td>
                <td>${user.email}</td>
                <td>
                    <span class="badge ${getRoleBadgeClass(user.role)}">
                        ${user.role.charAt(0).toUpperCase() + user.role.slice(1)}
                    </span>
                </td>
                <td>${user.phone || 'N/A'}</td>
                <td>${new Date(user.created_at).toLocaleDateString()}</td>
                <td>
                    <button class="btn btn-sm btn-primary edit-user" data-id="${user.id}">
                        <i class="fas fa-edit"></i>
                    </button>
                    <button class="btn btn-sm btn-danger delete-user" data-id="${user.id}">
                        <i class="fas fa-trash-alt"></i>
                    </button>
                </td>
            `;
            usersTableBody.appendChild(row);
        });
        
        // Add event listeners to edit buttons
        document.querySelectorAll('.edit-user').forEach(button => {
            button.addEventListener('click', function() {
                const userId = this.getAttribute('data-id');
                editUser(userId);
            });
        });
        
        // Add event listeners to delete buttons
        document.querySelectorAll('.delete-user').forEach(button => {
            button.addEventListener('click', function() {
                const userId = this.getAttribute('data-id');
                deleteUser(userId);
            });
        });
    }
    
    // Helper functions
    function getRoleBadgeClass(role) {
        switch (role) {
            case 'admin': return 'bg-danger';
            case 'staff': return 'bg-warning text-dark';
            case 'guest': return 'bg-success';
            default: return 'bg-secondary';
        }
    }
    
    function showTableError(message) {
        usersTableBody.innerHTML = `
            <tr>
                <td colspan="8" class="text-center py-4 text-danger">
                    ${message}
                </td>
            </tr>
        `;
    }
    
    function showSuccess(message) {
        Swal.fire({
            icon: 'success',
            title: 'Success!',
            text: message,
            timer: 1500,
            showConfirmButton: false
        });
    }
    
    function showError(message) {
        Swal.fire({
            icon: 'error',
            title: 'Error!',
            text: message
        });
    }
    
    // Edit user function
    function editUser(userId) {
        fetch(`${API_BASE_URL}user_management.php?id=${userId}`)
        .then(handleResponse)
        .then(data => {
            if (data.success && data.data.length > 0) {
                const user = data.data[0];
                showEditUserModal(user);
            } else {
                showError(data.error || 'User not found');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            showError('Failed to fetch user data');
        });
    }
    
    // Show edit user modal
    function showEditUserModal(user) {
        Swal.fire({
            title: 'Edit User',
            html: `
                <form id="editUserForm" class="text-start">
                    <input type="hidden" id="editUserId" value="${user.id}">
                    <div class="mb-3">
                        <label for="editUsername" class="form-label">Username</label>
                        <input type="text" class="form-control" id="editUsername" value="${user.username}" required>
                    </div>
                    <div class="mb-3">
                        <label for="editPassword" class="form-label">Password (leave blank to keep current)</label>
                        <input type="password" class="form-control" id="editPassword">
                    </div>
                    <div class="mb-3">
                        <label for="editFirstName" class="form-label">First Name</label>
                        <input type="text" class="form-control" id="editFirstName" value="${user.first_name}" required>
                    </div>
                    <div class="mb-3">
                        <label for="editLastName" class="form-label">Last Name</label>
                        <input type="text" class="form-control" id="editLastName" value="${user.last_name}" required>
                    </div>
                    <div class="mb-3">
                        <label for="editEmail" class="form-label">Email</label>
                        <input type="email" class="form-control" id="editEmail" value="${user.email}" required>
                    </div>
                    <div class="mb-3">
                        <label for="editPhone" class="form-label">Phone</label>
                        <input type="text" class="form-control" id="editPhone" value="${user.phone || ''}">
                    </div>
                    <div class="mb-3">
                        <label for="editRole" class="form-label">Role</label>
                        <select class="form-select" id="editRole" required>
                            <option value="admin" ${user.role === 'admin' ? 'selected' : ''}>Admin</option>
                            <option value="staff" ${user.role === 'staff' ? 'selected' : ''}>Staff</option>
                            <option value="guest" ${user.role === 'guest' ? 'selected' : ''}>Guest</option>
                        </select>
                    </div>
                </form>
            `,
            showCancelButton: true,
            confirmButtonText: 'Update',
            focusConfirm: false,
            preConfirm: () => {
                const formData = {
                    username: document.getElementById('editUsername').value,
                    password: document.getElementById('editPassword').value,
                    first_name: document.getElementById('editFirstName').value,
                    last_name: document.getElementById('editLastName').value,
                    email: document.getElementById('editEmail').value,
                    phone: document.getElementById('editPhone').value,
                    role: document.getElementById('editRole').value
                };
                
                return fetch(`${API_BASE_URL}user_management.php?id=${user.id}`, {
                    method: 'PUT',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(formData)
                })
                .then(handleResponse)
                .then(data => {
                    if (!data.success) {
                        throw new Error(data.error || 'Failed to update user');
                    }
                    return data;
                })
                .catch(error => {
                    Swal.showValidationMessage(`Request failed: ${error.message}`);
                });
            }
        }).then((result) => {
            if (result.isConfirmed) {
                showSuccess('User updated successfully');
                loadUsers();
            }
        });
    }
    
    // Delete user function
    function deleteUser(userId) {
        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                fetch(`${API_BASE_URL}user_management.php?id=${userId}`, {
                    method: 'DELETE'
                })
                .then(handleResponse)
                .then(data => {
                    if (data.success) {
                        showSuccess('User has been deleted');
                        loadUsers();
                    } else {
                        showError(data.error || 'Failed to delete user');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    showError('An error occurred while deleting the user');
                });
            }
        });
    }
});