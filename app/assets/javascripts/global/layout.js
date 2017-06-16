$(function(){
  if (!document.querySelector('.page-sidebar')) {
    return;
  }

  var sidebar, setBodyMinHeight, toggleSidebar, toggleTreeview, endTreeviewAnimation;
  sidebar = document.querySelector('.page-sidebar .sidebar');

  // 计算页面的最小高度，避免主体内容高度较小时侧边栏显示异常
  setBodyMinHeight = function(){
    var minHeight;
    minHeight = sidebar.scrollHeight + 120;
    document.body.style.minHeight =
      (minHeight > window.innerHeight ? minHeight : window.innerHeight) + 'px';
  };

  // 页面加载后立即触发一次
  setBodyMinHeight();

  toggleSidebar = function(){
    var bodyClass;
    document.body.classList.toggle('sidebar-collapsed');
    document.body.classList.toggle('sidebar-opened');

    bodyClass = [];
    if (document.body.classList.contains('sidebar-collapsed')) {
      bodyClass.push('sidebar-collapsed');
    }
    if (document.body.classList.contains('sidebar-opened')) {
      bodyClass.push('sidebar-opened');
    }

    document.cookie = "body_sidebar_class=" + bodyClass.join(' ') + "; path=/";
    setBodyMinHeight();
  };

  toggleTreeview = function(event){
    event.preventDefault();
    event.stopPropagation();

    // mini 侧边栏时不处理
    if (document.body.classList.contains('sidebar-collapsed')) {
      return;
    }

    var tree, menu;
    tree = this.parentNode;
    menu = tree.querySelector('.treeview-menu');

    // 禁用动画，需要时在启用
    menu.style.transition = 'none';

    // 折叠
    if (tree.classList.contains('active')) {
      menu.style.height = menu.scrollHeight + "px";
      // 恢复动画
      menu.style.removeProperty('transition');
      tree.classList.toggle('active');
    }
    else {
      menu.style.height = '0';
      tree.classList.toggle('active');
      menu.style.removeProperty('transition');
      menu.style.height = menu.scrollHeight + "px";
    }
  };

  endTreeviewAnimation = function(){
    var menu;
    menu = this.parentNode.nextElementSibling;
    menu.style.removeProperty('height');
  };

  $('.page-header .sidebar-toggle').on('click', toggleSidebar);
  $(sidebar).on('click', '.treeview > a', toggleTreeview);
  $('.page-sidebar').on('transitionend', '.fa-angle-left', endTreeviewAnimation);

  // 窗口改变时，重新计算 body 最小高度
  window.onresize = setBodyMinHeight;
});
