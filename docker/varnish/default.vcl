vcl 4.0;

backend default {
    .host = "nginx";
    .port = "80";
}

sub vcl_recv {
    # Кешировать только GET и HEAD запросы
    if (req.method != "GET" && req.method != "HEAD") {
        return (pass);
    }

    if (req.url ~ "^/l-a/?") {
        return (pass);
    }

    # Кешировать index.php на 2 минуты
    if (req.url == "/index.php") {
        set req.url = "/index.php";
        return (hash);
    }
}

sub vcl_backend_response {
    # Устанавливаем время кеширования
    if (bereq.url == "/index.php") {
        set beresp.ttl = 2m;
    }
}

sub vcl_deliver {
    # Добавление заголовка для проверки кэша
    if (obj.hits > 0) {
        set resp.http.X-Cache = "HIT";
    } else {
        set resp.http.X-Cache = "MISS";
    }

    # Добавить информацию о количестве хитов объекта
    set resp.http.X-Cache-Hits = obj.hits;
}
