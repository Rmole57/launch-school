function cancelSchedule(scheduleId) {
  const promise = new Promise((resolve, reject) => {
    const xhr = new XMLHttpRequest();
    xhr.open('DELETE', `/api/schedules/${scheduleId}`);
    xhr.send();

    xhr.addEventListener('load', event => {
      switch (xhr.status) {
        case 204:
          resolve('Schedule successfully deleted!');
          break;
        case 403:
        case 404:
          reject(xhr.responseText);
      }
    });
  });
  
  promise.then(message => {
    alert(message);
    window.location.href = '/cancel-schedule.html';
  }).catch(message => {
    alert(message);
    form.reset();
  });
}
