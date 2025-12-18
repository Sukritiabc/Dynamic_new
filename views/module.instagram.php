<?php 
$insta='';
// query the user media
$fields = "id,caption,media_type,media_url,permalink,thumbnail_url,timestamp,username";
$token = "EAAKZCAVM1KpkBPN0Td6yLTjgZBNlqrPeAphHqCzCQ3fLEoGECXBttTADV3yOgq5iOUCku1kpXQ1f7buMHmHjRXC8eFagFJpoUEKpQYMbFH1ZAPZBKyBQ8W5F3SyEen07DpXi1v8ZBIdZCs87Bl7LKgG0SUZCZAd6fRoCamQc0byW92wDNdwoRD7p6YcbAn2B";
$limit = 100000;
 
$json_feed_url="https://graph.facebook.com/v19.0/17841471264146124/media?fields={$fields}&access_token={$token}&limit={$limit}";
// pr($json_feed_url,1);
// $json_feed = @file_get_contents($json_feed_url);
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $json_feed_url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); // Optional depending on host
$json_feed = curl_exec($ch);
curl_close($ch);
$contents = json_decode($json_feed, true, 512, JSON_BIGINT_AS_STRING);

$instaHTML = '';
$moreHTML = '';
$count = 0;
$batchHTML = '';
$card ='';

if (!empty($contents["data"])) {
foreach ($contents["data"] as $index => $post) {
    $card = ''; // Reset per item

    $username = isset($post["username"]) ? $post["username"] : "";
    $caption = isset($post["caption"]) ? $post["caption"] : "";
    $media_url = isset($post["media_url"]) ? $post["media_url"] : "";
    $permalink = isset($post["permalink"]) ? $post["permalink"] : "";
    $media_type = isset($post["media_type"]) ? $post["media_type"] : "";

    $card .= '<div class="col-md-3 insta__item" >';
    $card .= '<div class="insta-card">';

    if ($media_type == "VIDEO") {
        $card .= "<video controls style='width:100%; display: block !important;'>
                    <source src='" . $media_url . "' type='video/mp4'>
                    Your browser does not support the video tag.
                  </video>";
    } else {
        $card .= '<img src="' . $media_url . '" alt="Instagram Image">';
    }

    $card .= '</div></div>';

    $batchHTML .= $card;
    $count++;

    // Every 4 items or last one, wrap in row
    if ($count % 8 == 0 || $index == count($contents["data"]) - 1) {
        $row = '<div class="row clearfix insta__listing">' . $batchHTML . '</div>';

        if ($count <= 8) {
            $instaHTML .= $row;
        } else {
            $moreHTML .= $row;
        }

        $batchHTML = ''; // Reset for next row
    }
}
}



$jVars['module:instagram-feed'] = '' .
            $instaHTML . $moreHTML . '
        ';
