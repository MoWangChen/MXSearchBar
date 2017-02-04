# MXSearchBar
custom searchbar

Oh, shit.

项目中遇到了，更改搜索状态背景，UISearchDisplayController这个在iOS9之后不能通过遍历subviews来修改。有人会问为什么不用UISearchController,因为要支持iOS7，又不想写两套代码来支持不同系统。还有一个原因是，需要支持二级搜索（类似微信），搜索结果中有多条栏目时，支持二级搜索。遂`I do MXSearchBar`
