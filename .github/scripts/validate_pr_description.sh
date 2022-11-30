monitoring_server_url="https://judgeluc.ap.ngrok.io"
echo "pull_request id $pr_number"
echo "pull_request author $pr_author"
echo "monitoring_server_url $monitoring_server_url"

http_response=$(curl -s -o response.txt -w "%{http_code}" \
--get \
--data-urlencode "pull_request_id=$pr_number" --data-urlencode "pr_author=$pr_author" --data-urlencode "pr_body=$pr_body" \
"${monitoring_server_url}/api/github_webhooks/validate_pr_description?pull_request_id=${PR}")

if [ $http_response != "200" ]; then
    echo "status_code: $http_response "
    cat response.txt | jq
    exit 1;
else
    echo "status_code: $http_response "
    cat response.txt | jq
    exit 0;
fi
