document.addEventListener('DOMContentLoaded', function() {
    const token = localStorage.getItem('token');
    const user = JSON.parse(localStorage.getItem('user'));
    
    if (!token || !user) {
        window.location.href = 'login.html';
        return;
    }

    // Load rooms for management
    if (document.getElementById('roomsTable')) {
        loadRooms();
    }

    // Room upgrade/downgrade handlers
    document.addEventListener('click', async function(e) {
        if (e.target.classList.contains('upgrade-room-btn')) {
            e.preventDefault();
            const reservationId = e.target.getAttribute('data-reservation-id');
            await showUpgradeDialog(reservationId);
        }
        
        if (e.target.classList.contains('downgrade-room-btn')) {
            e.preventDefault();
            const reservationId = e.target.getAttribute('data-reservation-id');
            await showDowngradeDialog(reservationId);
        }
    });

    // Functions
    async function loadRooms() {
        try {
            const response = await fetch('/api/rooms/get_rooms.php', {
                headers: {
                    'Authorization': `Bearer ${token}`
                }
            });
            
            const data = await response.json();
            
            if (data.status === 'success') {
                const tbody = document.querySelector('#roomsTable tbody');
                tbody.innerHTML = '';
                
                data.data.rooms.forEach(room => {
                    const row = document.createElement('tr');
                    
                    row.innerHTML = `
                        <td>${room.id}</td>
                        <td>${room.room_number}</td>
                        <td>${room.type}</td>
                        <td>$${room.price}</td>
                        <td>${room.capacity}</td>
                        <td><span class="badge ${getRoomStatusBadgeClass(room.status)}">${room.status}</span></td>
                        <td>
                            ${room.status === 'maintenance' 
                                ? `<button class="btn btn-sm btn-success set-available-btn" data-id="${room.id}">Set Available</button>`
                                : `<button class="btn btn-sm btn-warning set-maintenance-btn" data-id="${room.id}">Set Maintenance</button>`}
                        </td>
                    `;
                    
                    tbody.appendChild(row);
                });
                
                // Add event listeners to status buttons
                document.querySelectorAll('.set-available-btn').forEach(btn => {
                    btn.addEventListener('click', function() {
                        const roomId = this.getAttribute('data-id');
                        updateRoomStatus(roomId, 'available');
                    });
                });
                
                document.querySelectorAll('.set-maintenance-btn').forEach(btn => {
                    btn.addEventListener('click', function() {
                        const roomId = this.getAttribute('data-id');
                        updateRoomStatus(roomId, 'maintenance');
                    });
                });
            }
        } catch (error) {
            console.error('Error loading rooms:', error);
        }
    }

    async function showUpgradeDialog(reservationId) {
        try {
            // Get current reservation details
            const resResponse = await fetch(`/api/reservations/get_reservation_details.php?id=${reservationId}`, {
                headers: {
                    'Authorization': `Bearer ${token}`
                }
            });
            
            const resData = await resResponse.json();
            
            if (resData.status !== 'success') {
                showAlert('Failed to get reservation details', 'danger');
                return;
            }
            
            const reservation = resData.data.reservation;
            
            // Get available upgrade rooms
            const roomsResponse = await fetch(`/api/rooms/get_rooms.php?status=available&min_price=${reservation.room_rate + 1}`, {
                headers: {
                    'Authorization': `Bearer ${token}`
                }
            });
            
            const roomsData = await roomsResponse.json();
            
            if (roomsData.status !== 'success' || roomsData.data.rooms.length === 0) {
                showAlert('No upgrade options available', 'warning');
                return;
            }
            
            // Show upgrade dialog (simplified - in a real app you'd use a modal)
            const roomList = roomsData.data.rooms.map(room => 
                `${room.room_number} - ${room.type} ($${room.price}/night)`
            ).join('\n');
            
            const roomId = prompt(`Available upgrade options:\n\n${roomList}\n\nEnter the room number you want to upgrade to:`);
            
            if (roomId) {
                const selectedRoom = roomsData.data.rooms.find(r => r.room_number === roomId);
                if (selectedRoom) {
                    await processRoomChange(reservationId, selectedRoom.id, 'upgrade');
                } else {
                    showAlert('Invalid room selection', 'danger');
                }
            }
        } catch (error) {
            console.error('Upgrade error:', error);
            showAlert('Error processing upgrade', 'danger');
        }
    }

    async function showDowngradeDialog(reservationId) {
        try {
            // Get current reservation details
            const resResponse = await fetch(`/api/reservations/get_reservation_details.php?id=${reservationId}`, {
                headers: {
                    'Authorization': `Bearer ${token}`
                }
            });
            
            const resData = await resResponse.json();
            
            if (resData.status !== 'success') {
                showAlert('Failed to get reservation details', 'danger');
                return;
            }
            
            const reservation = resData.data.reservation;
            
            // Get available downgrade rooms
            const roomsResponse = await fetch(`/api/rooms/get_rooms.php?status=available&max_price=${reservation.room_rate - 1}`, {
                headers: {
                    'Authorization': `Bearer ${token}`
                }
            });
            
            const roomsData = await roomsResponse.json();
            
            if (roomsData.status !== 'success' || roomsData.data.rooms.length === 0) {
                showAlert('No downgrade options available', 'warning');
                return;
            }
            
            // Show downgrade dialog
            const roomList = roomsData.data.rooms.map(room => 
                `${room.room_number} - ${room.type} ($${room.price}/night)`
            ).join('\n');
            
            const roomId = prompt(`Available downgrade options:\n\n${roomList}\n\nEnter the room number you want to downgrade to:`);
            
            if (roomId) {
                const selectedRoom = roomsData.data.rooms.find(r => r.room_number === roomId);
                if (selectedRoom) {
                    await processRoomChange(reservationId, selectedRoom.id, 'downgrade');
                } else {
                    showAlert('Invalid room selection', 'danger');
                }
            }
        } catch (error) {
            console.error('Downgrade error:', error);
            showAlert('Error processing downgrade', 'danger');
        }
    }

    async function processRoomChange(reservationId, newRoomId, actionType) {
        try {
            const endpoint = actionType === 'upgrade' 
                ? '/api/rooms/upgrade_room.php' 
                : '/api/rooms/downgrade_room.php';
            
            const response = await fetch(endpoint, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${token}`
                },
                body: JSON.stringify({
                    reservation_id: reservationId,
                    new_room_id: newRoomId
                })
            });
            
            const data = await response.json();
            
            if (data.status === 'success') {
                showAlert(`Room ${actionType} successful!`, 'success');
                
                // Refresh relevant data
                if (document.getElementById('reservationsTable')) {
                    // Assuming we're on a reservations page
                    const event = new Event('reservationsUpdated');
                    document.dispatchEvent(event);
                }
            } else {
                showAlert(data.message, 'danger');
            }
        } catch (error) {
            console.error(`Room ${actionType} error:`, error);
            showAlert(`Error during room ${actionType}`, 'danger');
        }
    }

    async function updateRoomStatus(roomId, newStatus) {
        if (!confirm(`Are you sure you want to set this room to ${newStatus}?`)) return;
        
        try {
            // In a real app, you'd have an API endpoint for this
            // For now, we'll simulate it
            showAlert(`Room status updated to ${newStatus}`, 'success');
            
            // Refresh room list
            loadRooms();
        } catch (error) {
            console.error('Error updating room status:', error);
            showAlert('Failed to update room status', 'danger');
        }
    }

    function getRoomStatusBadgeClass(status) {
        switch(status) {
            case 'available':
                return 'badge-success';
            case 'occupied':
                return 'badge-primary';
            default:
                return 'badge-warning';
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