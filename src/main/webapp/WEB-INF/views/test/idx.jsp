<%@ page pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta name="author" content="xiaochen">
<title>接口测试</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.6/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/webjars/jquery-ui/1.11.4/jquery-ui.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/webjars/jquery-ui/1.11.4/jquery-ui.theme.min.css">
<style>
body {
	padding: 0;
	padding-top: 20px;
}

html {
	padding: 0;
}

.container {
	min-width: 1000px;
}

label {
	display: block;
	text-align: right;
}

td {
	padding: 5px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>接口测试</h4>
					</div>
					<div class="panel-body">
						<form id="serviceTesForm" method="post" onsubmit="return false;">
							<table id="nomal-param-table" class="table">
								<colgroup>
									<col width="130">
								</colgroup>
								<thead>
									<tr>
										<th>参数名</th>
										<th>参数值</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><label>serviceId:</label></td>
										<td><select name="serviceId" class="form-control">
												<c:forEach items="${apiServiceSet}" var="apiService">
													<option value="${apiService}">${apiService}</option>
												</c:forEach>
										</select></td>
										<td><span class="help-block"></span></td>
									</tr>
									<tr id="submit-tr">
										<td colspan="3">
											<button type="submit" class="btn btn-default"
												style="width: 100%;">
												<span>Submit</span>
											</button>
										</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>
				<!--/.panel-->
			</div>
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>附加参数</h4>
					</div>
					<div class="panel-body">
						<table id="additional-param-table" class="table">
							<colgroup>
								<col width="130">
							</colgroup>
							<thead>
								<tr>
									<th>参数名</th>
									<th>参数值</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><label>passwd:</label></td>
									<td><input name="passwd" class="form-control"
										value="${param.passwd}" placeholder="非登陆可以为空" /></td>
									<td><input type="checkbox" class="checkbox" /></td>
								</tr>
								<tr>
									<td><input type="text" value=""
										class="form-control upd-field-name" /></td>
									<td><input type="text" value=""
										class="form-control dyn-field-name" /></td>
									<td><input type="checkbox" class="checkbox" /></td>
								</tr>
								<tr>
									<td><input type="text" value=""
										class="form-control upd-field-name" /></td>
									<td><input type="text" value=""
										class="form-control dyn-field-name" /></td>
									<td><input type="checkbox" /></td>
								</tr>
								<tr>
									<td><input type="text" value=""
										class="form-control upd-field-name" /></td>
									<td><input type="text" value=""
										class="form-control dyn-field-name" /></td>
									<td><input type="checkbox" /></td>
								</tr>
								<tr>
									<td><input type="text" value=""
										class="form-control upd-field-name" /></td>
									<td><input type="text" value=""
										class="form-control dyn-field-name" /></td>
									<td><input type="checkbox" /></td>
								</tr>
								<tr>
									<td><input type="text" value=""
										class="form-control upd-field-name" /></td>
									<td><input type="text" value=""
										class="form-control dyn-field-name" /></td>
									<td><input type="checkbox" /></td>
								</tr>
								<tr>
									<td><input type="text" value=""
										class="form-control upd-field-name" /></td>
									<td><input type="text" value=""
										class="form-control dyn-field-name" /></td>
									<td><input type="checkbox" /></td>
								</tr>
								<tr>
									<td><input type="text" value=""
										class="form-control upd-field-name" /></td>
									<td><input type="text" value=""
										class="form-control dyn-field-name" /></td>
									<td><input type="checkbox" /></td>
								</tr>
								<tr>
									<td><input type="text" value=""
										class="form-control upd-field-name" /></td>
									<td><input type="text" value=""
										class="form-control dyn-field-name" /></td>
									<td><input type="checkbox" /></td>
								</tr>
								<tr>
                                    <td><input type="text" value=""
                                        class="form-control upd-field-name" /></td>
                                    <td><input type="text" value=""
                                        class="form-control dyn-field-name" /></td>
                                    <td><input type="checkbox" /></td>
                                </tr>
                                <tr>
                                    <td><input type="text" value=""
                                        class="form-control upd-field-name" /></td>
                                    <td><input type="text" value=""
                                        class="form-control dyn-field-name" /></td>
                                    <td><input type="checkbox" /></td>
                                </tr>
                                <tr>
                                    <td><input type="text" value=""
                                        class="form-control upd-field-name" /></td>
                                    <td><input type="text" value=""
                                        class="form-control dyn-field-name" /></td>
                                    <td><input type="checkbox" /></td>
                                </tr>
                                <tr>
                                    <td><input type="text" value=""
                                        class="form-control upd-field-name" /></td>
                                    <td><input type="text" value=""
                                        class="form-control dyn-field-name" /></td>
                                    <td><input type="checkbox" /></td>
                                </tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!--/.panel-->
		</div>
		<!--/.row-->
	</div>
	<!-- /.container -->
	<script
		src="${pageContext.request.contextPath}/webjars/jquery/2.2.0/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/webjars/jquery-ui/1.11.4/jquery-ui.js"></script>
    <script
        src="${pageContext.request.contextPath}/webjars/zeroclipboard/2.1.6/ZeroClipboard.min.js"></script>
	<script>
        $('#additional-param-table input[type="checkbox"]').prop('checked',
                false).click(function() {
            var tmpTr = $(this).parents('tr');
            if ($(this).prop('checked')) {
                $('#submit-tr').before(tmpTr);
            } else {
                $('#additional-param-table tbody').append(tmpTr);
            }
            $('input.upd-field-name').change();
        });
        $('#additional-param-table input.upd-field-name').change(
                function() {
                    $(this).parents('tr').find('input.dyn-field-name').attr(
                            'name', $(this).val());
                });
        $('input').attr('autocomplete', 'off').prop('autocomplete', 'off');
    </script>

	<script>
        $('#serviceTesForm').submit(function() {
                            $.ajax({
                                        type : "POST",
                                        url : "${pageContext.request.contextPath}/app/ind",
                                        data : $('#serviceTesForm').serialize(),
                                        dataType : 'text',
                                        
                                        success : function(msg) {
                                            $(document).data('resJsonData', msg);
                                            var copyMsg = msg;
                                            var j = new JSONFormat(JSON
                                                    && JSON.parse ? JSON
                                                    .parse(msg) : eval('('
                                                    + msg + ')'));
                                            msg = j.toString();
                                            $('<pre id="tmpDialog">')
                                                    .css({
                                                        width : '100%',
                                                        height : '100%',
                                                        overflow : 'auto'
                                                    })
                                                    .html(msg)
                                                    .dialog(
                                                            {
                                                                title : '请求结果',
                                                                modal : true,
                                                                width : 800,
                                                                height : 600,
                                                                draggable : false,
                                                                close : function() {
                                                                    $(this).remove();
                                                                },
                                                                buttons : {
                                                                    '关闭' : function() {
                                                                        $('#tmpDialog').dialog('close');
                                                                    },
                                                                    '复制' : function() {
                                                                    }
                                                                },
                                                                open : function() {
                                                                    $(document)
                                                                            .find(
                                                                                    'button:contains("复制")')
                                                                            .attr(
                                                                                    'data-clipboard-text',
                                                                                    copyMsg);
                                                                    var client = new ZeroClipboard(
                                                                            $(
                                                                                    document)
                                                                                    .find(
                                                                                            'button:contains("复制")'));
                                                                    client
                                                                            .on(
                                                                                    "ready",
                                                                                    function(
                                                                                            readyEvent) {
                                                                                        // alert("ZeroClipboard SWF is ready!");
                                                                                        client
                                                                                                .on(
                                                                                                        "aftercopy",
                                                                                                        function(
                                                                                                                event) {

                                                                                                            $(
                                                                                                                    event.target)
                                                                                                                    .find(
                                                                                                                            'span:contains("复制")')
                                                                                                                    .html(
                                                                                                                            '重新复制');
                                                                                                        });
                                                                                    });
                                                                }
                                                            });
                                        }
                                    });
                            return false;
                        });
    </script>
	<script>
        var JSONFormat = (function() {
            var _toString = Object.prototype.toString;

            function format(object, indent_count) {
                var html_fragment = '';
                switch (_typeof(object)) {
                case 'Null':
                    0
                    html_fragment = _format_null(object);
                    break;
                case 'Boolean':
                    html_fragment = _format_boolean(object);
                    break;
                case 'Number':
                    html_fragment = _format_number(object);
                    break;
                case 'String':
                    html_fragment = _format_string(object);
                    break;
                case 'Array':
                    html_fragment = _format_array(object, indent_count);
                    break;
                case 'Object':
                    html_fragment = _format_object(object, indent_count);
                    break;
                }
                return html_fragment;
            }
            ;

            function _format_null(object) {
                return '<span class="json_null">null</span>';
            }

            function _format_boolean(object) {
                return '<span class="json_boolean">' + object + '</span>';
            }

            function _format_number(object) {
                return '<span class="json_number">' + object + '</span>';
            }

            function _format_string(object) {
                if (0 <= object.search(/^http/)) {
                    object = '<a href="' + object + '" target="_blank" class="json_link">'
                            + object + '</a>'
                }
                return '<span class="json_string">"' + object + '"</span>';
            }

            function _format_array(object, indent_count) {
                var tmp_array = [];
                for (var i = 0, size = object.length; i < size; ++i) {
                    tmp_array.push(indent_tab(indent_count)
                            + format(object[i], indent_count + 1));
                }
                return '[\n' + tmp_array.join(',\n') + '\n'
                        + indent_tab(indent_count - 1) + ']';
            }

            function _format_object(object, indent_count) {
                var tmp_array = [];
                for ( var key in object) {
                    tmp_array.push(indent_tab(indent_count)
                            + '<span class="json_key">"' + key + '"</span>:'
                            + format(object[key], indent_count + 1));
                }
                return '{\n' + tmp_array.join(',\n') + '\n'
                        + indent_tab(indent_count - 1) + '}';
            }

            function indent_tab(indent_count) {
                return (new Array(indent_count + 1)).join('   ');
            }

            function _typeof(object) {
                var tf = typeof object, ts = _toString.call(object);
                return null === object ? 'Null'
                        : 'undefined' == tf ? 'Undefined'
                                : 'boolean' == tf ? 'Boolean'
                                        : 'number' == tf ? 'Number'
                                                : 'string' == tf ? 'String'
                                                        : '[object Function]' == ts ? 'Function'
                                                                : '[object Array]' == ts ? 'Array'
                                                                        : '[object Date]' == ts ? 'Date'
                                                                                : 'Object';
            }
            ;

            function loadCssString() {
                var style = document.createElement('style');
                style.type = 'text/css';
                var code = Array.prototype.slice.apply(arguments).join('');
                try {
                    style.appendChild(document.createTextNode(code));
                } catch (ex) {
                    style.styleSheet.cssText = code;
                }
                document.getElementsByTagName('head')[0].appendChild(style);
            }

            loadCssString('.json_key{ color: purple;}',
                    '.json_null{color: red;}', '.json_string{ color: #077;}',
                    '.json_link{ color: #717171;}', '.json_array_brackets{}');

            var _JSONFormat = function(origin_data) {
                this.data = 'string' != typeof origin_data ? origin_data : JSON
                        && JSON.parse ? JSON.parse(origin_data) : eval('('
                        + origin_data + ')');
            };

            _JSONFormat.prototype = {
                constructor : JSONFormat,
                toString : function() {
                    return format(this.data, 1);
                }
            }

            return _JSONFormat;
        })();
    </script>
</body>
</html>
