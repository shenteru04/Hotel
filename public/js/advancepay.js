     // Handle payment method selection
        document.addEventListener('DOMContentLoaded', function() {
            const paymentOptions = document.querySelectorAll('.payment-option');
            const gcashInstructions = document.getElementById('gcashInstructions');
            const bankInstructions = document.getElementById('bankInstructions');

            paymentOptions.forEach(option => {
                option.addEventListener('click', function() {
                    // Update visual selection
                    paymentOptions.forEach(opt => opt.classList.remove('selected'));
                    this.classList.add('selected');
                    
                    // Check the radio button inside
                    const radio = this.querySelector('input[type="radio"]');
                    radio.checked = true;
                    
                    // Show appropriate instructions
                    const method = this.dataset.method;
                    gcashInstructions.style.display = method === 'gcash' ? 'block' : 'none';
                    bankInstructions.style.display = method === 'bank' ? 'block' : 'none';
                    
                    // Toggle required attribute on file inputs
                    document.getElementById('paymentProof').required = method === 'gcash';
                    document.getElementById('bankReceipt').required = method === 'bank';
                });
            });

            // Initialize with first option selected if none selected
            if (!document.querySelector('input[name="advancePaymentMethod"]:checked')) {
                paymentOptions[0].click();
            }
        });