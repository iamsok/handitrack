template courtesy of https://github.com/LaunchAcademy/simple-jquery-tabs

$(function() {
  $('.tabs-nav a').on('click', function(event) {
    // Prevent the link from being followed (stay on same page)
    event.preventDefault();

    // Update current tab
    var $currentTab = $(this);
    $currentTab.addClass('active');
    $currentTab.siblings().removeClass('active');

    // Update current tab pane
    var currentTabPaneSelector = $currentTab.attr('href');
    var $currentTabPane = $(currentTabPaneSelector);
    $currentTabPane.addClass('active');
    $currentTabPane.siblings().removeClass('active');
  });
});
