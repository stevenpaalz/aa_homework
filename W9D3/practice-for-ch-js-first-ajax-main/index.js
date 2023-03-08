console.log("Hello from the console!");

// Your code here

fetch("https://api.openweathermap.org/data/2.5/weather?q=London,UK&appid=bcb83c4b54aee8418983c2aff3073b3b")
    .then(response => {
        // debugger
        if (response.ok) {
            return response.json();
        } else {
            throw response;
        }
    })
    .then(response => {
        // debugger
        if (response) {
            console.log('Succcess!')
            console.log(response)
        } else {
            console.log('Failure!');
            console.log(response);
        }
    })


console.log("The AJAX request has been dispatched.")