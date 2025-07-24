document.addEventListener('DOMContentLoaded', function() {
    const token = localStorage.getItem('token');
    const user = JSON.parse(localStorage.getItem('user'));
    
    if (!token || !user) {
        window.location.href = 'login.html';
        return;
    }

    // Load billing history
    if (document.getElementById('billingTable')) {
        loadBillingHistory();
    }

    // Process payment form
    if (document.getElementById('paymentForm')) {
        document.getElementById('paymentForm').addEventListener('submit', async function(e) {
            e.preventDefault();
            
            const formData = {
                reservation_id: document.getElementById('reservationId').value,
                amount: document.getElementById('amount').value,
                payment_method: document.getElementById('paymentMethod').value,
                transaction_id: document.getElementById('transactionId').value
            };
            
            try {
                const response = await fetch('/api/billing/process_payment.php', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'Authorization': `Bearer ${token}`
                    },
                    body: JSON.stringify(formData)
                });
                
                const data = await response.json();
                
                if (data.status === 'success') {
                    showAlert('Payment processed successfully!', 'success');
                    loadBillingHistory();
                    document.getElementById('paymentForm').reset();
                } else {
                    showAlert(data.message, 'danger');
                }
            } catch (error) {
                showAlert('An error occurred while processing payment', 'danger');
                console.error('Payment error:', error);
            }
        });
    }

    // Functions
    async function loadBillingHistory() {
        try {
            let url = '/api/billing/get_billing_history.php';
            if (user.role === 'customer') {
                url += `?user_id=${user.id}`;
            }
            
            const response = await fetch(url, {
                headers: {
                    'Authorization': `Bearer ${token}`
                }
            });
            
            const data = await response.json();
            
            if (data.status === 'success') {
                const tbody = document.querySelector('#billingTable tbody');
                tbody.innerHTML = '';
                
                data.data.forEach(billing => {
                    const row = document.createElement('tr');
                    
                    row.innerHTML = `
                        <td>${billing.invoice_number || 'N/A'}</td>
                        <td>${billing.reservation_id}</td>
                        <td>${billing.check_in} to ${billing.check_out}</td>
                        <td>$${billing.total_amount}</td>
                        <td>$${billing.paid_amount}</td>
                        <td>$${billing.balance}</td>
                        <td><span class="badge ${getPaymentStatusBadgeClass(billing.payment_status)}">${billing.payment_status}</span></td>
                        <td>
                            <button class="btn btn-sm btn-primary view-invoice-btn" data-id="${billing.reservation_id}">Invoice</button>
                        </td>
                    `;
                    
                    tbody.appendChild(row);
                });
                
                // Add event listeners to invoice buttons
                document.querySelectorAll('.view-invoice-btn').forEach(btn => {
                    btn.addEventListener('click', function() {
                        const reservationId = this.getAttribute('data-id');
                        viewInvoice(reservationId);
                    });
                });
            }
        } catch (error) {
            console.error('Error loading billing history:', error);
        }
    }

    async function viewInvoice(reservationId) {
        try {
            const response = await fetch(`/api/billing/get_invoice.php?reservation_id=${reservationId}`, {
                headers: {
                    'Authorization': `Bearer ${token}`
                }
            });
            
            const data = await response.json();
            
            if (data.status === 'success') {
                displayInvoiceModal(data.data);
            }
        } catch (error) {
            console.error('Error fetching invoice:', error);
        }
    }

    function displayInvoiceModal(invoiceData) {
        // Implement your invoice modal display logic here
        console.log('Invoice data:', invoiceData);
        // This would typically open a modal with the invoice details
        // and optionally provide a print/download option
    }

    function getPaymentStatusBadgeClass(status) {
        switch(status) {
            case 'paid':
                return 'badge-success';
            case 'partial':
                return 'badge-warning';
            case 'refunded':
                return 'badge-info';
            default:
                return 'badge-danger';
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