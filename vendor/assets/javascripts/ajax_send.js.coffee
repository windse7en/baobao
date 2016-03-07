root = exports ? this
send_ajax_request = ($url, $data, $callback) ->
    $.ajax({
        url: $url,
        type: 'POST',
        dataType: 'json',
        data: $data,
        success: (data) -> 
            console.log(data)
            alert ("No results found") if data.length ==0
            $callback(data) if $callback
        error: () -> alert('Something wrong.')
    })
root.send_ajax_request = send_ajax_request
