document.addEventListener("DOMContentLoaded", function () {
    const container = document.getElementById("reservationDetails");

    const urlParams = new URLSearchParams(window.location.search);
    const reservationId = urlParams.get("id");

    if (!reservationId) {
        container.innerHTML = "<p class='error'>Reservation ID not found in URL.</p>";
        return;
    }

    fetch(`/hotel/api/reservations/get_reservation_details.php?id=${reservationId}`, {
        headers: {
            "Authorization": `Bearer ${localStorage.getItem("token")}`
        }
    })
    .then(res => res.json())
    .then(data => {
        if (data.status !== "success") {
            container.innerHTML = `<p class='error'>${data.message}</p>`;
            return;
        }

        const r = data.data.reservation;
        const services = data.data.services.map(s => s.service_type).join(", ") || "None";

        container.innerHTML = `
            <p><strong>Room:</strong> ${r.room_type} (Room #${r.room_number})</p>
            <p><strong>Check-In:</strong> ${r.check_in}</p>
            <p><strong>Check-Out:</strong> ${r.check_out}</p>
            <p><strong>Status:</strong> ${r.status}</p>
            <p><strong>Adults:</strong> ${r.adults}</p>
            <p><strong>Children:</strong> ${r.children}</p>
            <p><strong>Special Requests:</strong> ${r.special_requests || "None"}</p>
            <hr>
            <p><strong>Payment Method:</strong> ${r.payment_method}</p>
            <p><strong>Advance Payment Method:</strong> ${r.advance_payment_method}</p>
            <p><strong>Advance Payment:</strong> ₱${r.advance_payment || 0}</p>
            <p><strong>Total Amount:</strong> ₱${r.total_amount}</p>
            <p><strong>PWD Discount:</strong> ${r.pwd_discount * 100 || 0}%</p>
            <p><strong>Additional Services:</strong> ${services}</p>
            <p><strong>Created At:</strong> ${new Date(r.created_at).toLocaleString()}</p>
            <p><strong>Updated At:</strong> ${new Date(r.updated_at).toLocaleString()}</p>
        `;

        // Optionally show file links if any proof is uploaded
        if (r.payment_proof) {
            container.innerHTML += `<p><strong>Payment Proof:</strong> <a href="/uploads/${r.payment_proof}" target="_blank">View</a></p>`;
        }

        if (r.advance_payment_file) {
            container.innerHTML += `<p><strong>Advance Payment File:</strong> <a href="/uploads/${r.advance_payment_file}" target="_blank">View</a></p>`;
        }
    })
    .catch(err => {
        console.error(err);
        container.innerHTML = "<p class='error'>Failed to load reservation details.</p>";
    });
});
