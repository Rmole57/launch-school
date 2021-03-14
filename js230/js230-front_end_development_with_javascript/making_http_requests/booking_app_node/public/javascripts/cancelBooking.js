function cancelBooking(bookingId) {
  const promise = new Promise((resolve, reject) => {
    const xhr = new XMLHttpRequest();
    xhr.open('PUT', `/api/bookings/${bookingId}`);
    xhr.send();

    xhr.addEventListener('load', event => {
      switch (xhr.status) {
        case 204:
          resolve('Booking successfully canceled!');
          break;
        case 404:
          reject(xhr.responseText);
      }
    });
  });
  
  promise.then(message => {
    alert(message);
    window.location.href = '/cancel-booking.html';
  }).catch(message => {
    alert(message);
    form.reset();
  });
}
