module WaitForAjax
  def record_ajax_requests
    page.evaluate_script <<-JS
      window.ajaxRequests = [];
      document.addEventListener('ajax:before', function(e) {
        window.ajaxRequests.push(e.detail);
      });
    JS
  end

  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop while any_request_pending?
    end
  end

  def any_request_pending?
    page.evaluate_script <<-JS
      window.ajaxRequests.filter(function(xhr) {
        return xhr.readyState !== 4;
      }) > 0;
    JS
  end
end

RSpec.configure do |config|
  config.include WaitForAjax, type: :feature
end
