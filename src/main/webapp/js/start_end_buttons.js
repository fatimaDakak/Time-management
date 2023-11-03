        function startWork() {
            var now = new Date();
            var startTime = formatTime(now.getHours(), now.getMinutes());
            var startDate = formatDate(now);

            // Store the start time and date in hidden input fields
            document.getElementById("start-time").value = startTime;
            document.getElementById("start-date").value = startDate;

            // Disable the "Start Work" button
            document.getElementById("start-button").disabled = true;
        }

        function formatTime(hours, minutes) {
            return (hours < 10 ? "0" : "") + hours + ":" + (minutes < 10 ? "0" : "") + minutes;
        }

        function formatDate(date) {
            var year = date.getFullYear();
            var month = date.getMonth() + 1; // Month is zero-based
            var day = date.getDate();

            return year + "-" + (month < 10 ? "0" : "") + month + "-" + (day < 10 ? "0" : "") + day;
        }
        
        
         