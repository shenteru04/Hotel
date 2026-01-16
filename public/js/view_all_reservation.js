document.addEventListener('DOMContentLoaded', async function() {
    const tbody = document.getElementById('allReservations');
    const token = localStorage.getItem('token');

    if (!token) {
        window.location.href = 'login.html';
        return;
    }

    try {
        const response = await fetch('../api/reservations/get_reservations.php', {
            method: 'GET',
            headers: {
                'Authorization': `Bearer ${token}`
            }
        });
        const data = await response.json();

        if (data.status === 'success' && data.data.reservations.length > 0) {
            tbody.innerHTML = data.data.reservations.map(reservation => {
                const checkIn = new Date(reservation.check_in).toLocaleDateString();
                const checkOut = new Date(reservation.check_out).toLocaleDateString();
                const room = reservation.room_number ? `${reservation.room_number} (${reservation.room_type})` : 'N/A';
                // Guest info not available in current API, leave blank or update if available
                const guest = reservation.guest_name || '';
                const status = reservation.status || '';
                const amount = reservation.total_amount ? `$${parseFloat(reservation.total_amount).toFixed(2)}` : 'N/A';
                return `
                    <tr>
                        <td>${reservation.id}</td>
                        <td>${room}</td>
                        <td>${guest}</td>
                        <td>${checkIn} to ${checkOut}</td>
                        <td>${status.charAt(0).toUpperCase() + status.slice(1)}</td>
                        <td>${amount}</td>
                    </tr>
                `;
            }).join('');
        } else {
            tbody.innerHTML = `<tr><td colspan="6" class="text-center py-4">No reservations found.</td></tr>`;
        }
    } catch (error) {
        tbody.innerHTML = `<tr><td colspan="6" class="text-center py-4 text-danger">Failed to load reservations.</td></tr>`;
    }
});