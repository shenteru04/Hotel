document.addEventListener('DOMContentLoaded', function () {
    const token = localStorage.getItem('token');
    if (!token) {
        window.location.href = '../auth/login.html';
        return;
    }

    const API = 'http://localhost/hotel/api/rooms/room_management.php';
    const tbody = document.getElementById('roomsTableBody');
    const addRoomForm = document.getElementById('addRoomForm');
    const notification = document.getElementById('notification');

    function showNotification(message, type = 'success') {
        notification.textContent = message;
        notification.className = `alert alert-${type}`;
        notification.style.display = 'block';
        setTimeout(() => {
            notification.style.display = 'none';
        }, 3000);
    }

    async function fetchRooms() {
        try {
            const response = await fetch(API, {
                method: 'GET',
                headers: { 
                    'Authorization': `Bearer ${token}`,
                    'Content-Type': 'application/json'
                }
            });

            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }

            const data = await response.json();
            
            if (data.status === 'success') {
                tbody.innerHTML = data.rooms.map(room => `
                    <tr data-id="${room.id}">
                        <td>${room.id}</td>
                        <td><input type="text" value="${room.room_number}" class="form-control form-control-sm room-number"></td>
                        <td><input type="text" value="${room.type}" class="form-control form-control-sm room-type"></td>
                        <td><input type="number" value="${room.capacity}" class="form-control form-control-sm room-capacity" min="1"></td>
                        <td><input type="number" value="${room.price}" class="form-control form-control-sm room-price" min="0" step="0.01"></td>
                        <td>
                            <select class="form-select form-select-sm room-status">
                                <option value="available" ${room.status === 'available' ? 'selected' : ''}>Available</option>
                                <option value="occupied" ${room.status === 'occupied' ? 'selected' : ''}>Occupied</option>
                                <option value="maintenance" ${room.status === 'maintenance' ? 'selected' : ''}>Maintenance</option>
                            </select>
                        </td>
                        <td><input type="text" value="${room.description || ''}" class="form-control form-control-sm room-description"></td>
                        <td><input type="text" value="${room.amenities || ''}" class="form-control form-control-sm room-amenities"></td>
                        <td>
                            <button class="btn btn-sm btn-primary save-room"><i class="fas fa-save"></i></button>
                            <button class="btn btn-sm btn-danger delete-room"><i class="fas fa-trash"></i></button>
                        </td>
                    </tr>
                `).join('');
            } else {
                showNotification(data.message || 'Failed to load rooms.', 'danger');
                tbody.innerHTML = `<tr><td colspan="9" class="text-center py-4 text-danger">${data.message || 'Failed to load rooms.'}</td></tr>`;
            }
        } catch (error) {
            console.error('Error:', error);
            showNotification('Failed to load rooms. Please try again.', 'danger');
            tbody.innerHTML = `<tr><td colspan="9" class="text-center py-4 text-danger">Failed to load rooms.</td></tr>`;
        }
    }

    addRoomForm.addEventListener('submit', async function (e) {
        e.preventDefault();
        
        const formData = {
            room_number: document.getElementById('roomNumber').value.trim(),
            type: document.getElementById('roomType').value.trim(),
            capacity: parseInt(document.getElementById('roomCapacity').value.trim()),
            price: parseFloat(document.getElementById('roomPrice').value.trim()),
            status: document.getElementById('roomStatus').value,
            description: document.getElementById('roomDescription').value.trim(),
            amenities: document.getElementById('roomAmenities').value.trim()
        };

        try {
            const response = await fetch(API, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${token}`
                },
                body: JSON.stringify(formData)
            });

            const data = await response.json();
            
            if (data.status === 'success') {
                showNotification('Room added successfully!');
                addRoomForm.reset();
                fetchRooms();
            } else {
                showNotification(data.message || 'Failed to add room.', 'danger');
            }
        } catch (error) {
            console.error('Error:', error);
            showNotification('Failed to add room. Please try again.', 'danger');
        }
    });

    tbody.addEventListener('click', async function (e) {
        const row = e.target.closest('tr');
        if (!row) return;

        const id = row.dataset.id;
        
        if (e.target.classList.contains('delete-room')) {
            if (confirm('Are you sure you want to delete this room?')) {
                try {
                    const response = await fetch(API, {
                        method: 'DELETE',
                        headers: {
                            'Content-Type': 'application/json',
                            'Authorization': `Bearer ${token}`
                        },
                        body: JSON.stringify({ id })
                    });

                    const data = await response.json();
                    
                    if (data.status === 'success') {
                        showNotification('Room deleted successfully!');
                        fetchRooms();
                    } else {
                        showNotification(data.message || 'Failed to delete room.', 'danger');
                    }
                } catch (error) {
                    console.error('Error:', error);
                    showNotification('Failed to delete room. Please try again.', 'danger');
                }
            }
        }
        
        if (e.target.classList.contains('save-room')) {
            const formData = {
                id,
                room_number: row.querySelector('.room-number').value.trim(),
                type: row.querySelector('.room-type').value.trim(),
                capacity: parseInt(row.querySelector('.room-capacity').value.trim()),
                price: parseFloat(row.querySelector('.room-price').value.trim()),
                status: row.querySelector('.room-status').value,
                description: row.querySelector('.room-description').value.trim(),
                amenities: row.querySelector('.room-amenities').value.trim()
            };

            try {
                const response = await fetch(API, {
                    method: 'PUT',
                    headers: {
                        'Content-Type': 'application/json',
                        'Authorization': `Bearer ${token}`
                    },
                    body: JSON.stringify(formData)
                });

                const data = await response.json();
                
                if (data.status === 'success') {
                    showNotification('Room updated successfully!');
                    fetchRooms();
                } else {
                    showNotification(data.message || 'Failed to update room.', 'danger');
                }
            } catch (error) {
                console.error('Error:', error);
                showNotification('Failed to update room. Please try again.', 'danger');
            }
        }
    });

    fetchRooms();
});