<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="frmScreening.aspx.vb" Inherits="HMIS.frmScreening" %>

<%--<!DOCTYPE html>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="mainHolder" runat="server">
    <!DOCTYPE html>
      <html xmlns="http://www.w3.org/1999/xhtml">
       <head runat="server">
        <title></title>
       </head>
      <body>
          <div class="widget-box">
									<div class="widget-header widget-header-blue widget-header-flat">
										<h4 class="widget-title lighter">Dreams Screening Form</h4>

										<div class="widget-toolbar">
											<label>
												<small class="green">
													<b>Validation</b>
												</small>

												<input id="skip-validation" type="checkbox" class="ace ace-switch ace-switch-4" />
												<span class="lbl middle"></span>
											</label>
										</div>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											<div id="fuelux-wizard-container">
												<div>
													<ul class="steps">

                                                        <li data-step="1" class="active">
															<span class="step">1</span>
															<span class="title">CODING CATEGORY</span>
														</li>

														<li data-step="2" >
															<span class="step">2</span>
															<span class="title">CHILD DEMOGRAPHICS</span>
														</li>
                                                        <li data-step="3">
															<span class="step">3</span>
															<span class="title">CONTACT DETAILS</span>
														</li>
                                                       
														<li data-step="4">
															<span class="step">4</span>
															<span class="title">CHARACTERISTICS OF THE GIRL</span>
														</li>

														<li data-step="5">
															<span class="step">5</span>
															<span class="title">ELIGIBILITY FOR DREAMS INTERVATION</span>
														</li>

														
                                                        
													</ul>
												</div>

												<hr />
                                                <form id="from1" runat="server">
												<div class="step-content pos-rel">
													<div class="step-pane active" data-step="1">

    <section>
        <form class="form-horizontal" role="form">
              
		<table class="vls" width="100%" border ="0">
            <tr>
                <td>
                     <div class="form-group">
                           <label class="control-label col-sm-3" for="pwd">COUNTY:</label>
                          <div class="col-sm-10"> 
                              <asp:TextBox ID="txtCountyy" class="form-control" runat="server" placeholder="Enter your County" required="required" />         
                          
                          </div>
                     </div>
                </td>
                 <td>
                     <div class="form-group">
                           <label class="control-label col-sm-3" for="pwd">SUBCOUNTY:</label>
                          <div class="col-sm-10">          
                          <asp:TextBox ID="txtSubCounty" runat="server" class="form-control"  placeholder="Enter Sub County Name" required="required"/>
                          </div>
                     </div>
                </td>
                 <td>
                    <div class="form-group">
                           <label class="control-label col-sm-3" for="pwd">WARD:</label>
                          <div class="col-sm-10">          
                           <asp:TextBox ID="txtWard" class="form-control"  runat="server" placeholder="Enter Ward" required="required"/>
                          </div>
                     </div>
                </td>
                
            </tr>
			<tr  class="backgrd">
                 
                <td>
                     <div class="form-group">
                           <label class="control-label col-sm-3" for="pwd">VILLAGE:</label>
                          <div class="col-sm-10"> 
                              <asp:TextBox ID="txtVillage" class="form-control" runat="server" placeholder="Enter Village Name" required="required" />         
                          
                          </div>
                     </div>
                </td>
                 <td colspan="2">
                     <div class="form-group">
                           <label class="control-label col-sm-3" for="pwd">SITE:</label>
                          <div class="col-sm-11">          
                           <asp:TextBox ID="txtSite" class="form-control" runat="server"  placeholder="Enter Site Name" required="required"/>
                          </div>
                     </div>
                </td>
               </tr>
			
		</table>
            </form>
        <div class="hr hr-dotted"></div>
        <div align="center">
        <button class="btn btn-success">Update</button>
            </div>
	</section>

								
													</div>

													<div class="step-pane" data-step="2">
														<div>
															<%--start here--%>
                 <form class="form-horizontal" role="form">
                       <div class="form-group">
                          <label class="control-label col-sm-3" for="pwd">Client Name</label>
                          <div class="col-sm-5">          
                           <asp:TextBox ID="TextBox1" class="form-control" runat="server"  placeholder="Enter Site Name" required="required"/>
                          </div>
                     </div>
                     <div class="form-group">
                          <label class="control-label col-sm-3" for="pwd">Date of Birth</label>
                          <div class="col-sm-5">          
                           <asp:TextBox ID="TextBox2" class="form-control" runat="server"  placeholder="Enter Site Name" required="required"/>
                          </div>
                     </div>
                     <div class="form-group">
                          <label class="control-label col-sm-3" for="pwd">Sex</label>
                          <div class="col-sm-5">          
                           <asp:TextBox ID="TextBox3" class="form-control" runat="server"  placeholder="Enter Site Name" required="required"/>
                          </div>
                     </div>
                     <div class="form-group">
                          <label class="control-label col-sm-3" for="pwd">Does the girl have any disability?:</label>
                          <div class="col-sm-5">          
                           <asp:TextBox ID="TextBox4" class="form-control" runat="server"  placeholder="Enter Site Name" required="required"/>
                          </div>
                     </div>
                     <div class="form-group">
                          <label class="control-label col-sm-3" for="pwd">If Yes, Specify:</label>
                          <div class="col-sm-5">          
                           <asp:TextBox ID="TextBox5" class="form-control" runat="server"  placeholder="Enter Site Name" required="required"/>
                          </div>
                     </div>



                  </form>
                                                            
                                                            <%--end here--%>

														</div>
													</div>

													<div class="step-pane" data-step="3">

                                                        <form class="form-horizontal" role="form">
                                                            <div class="form-group">
                                                                <label class="control-label col-sm-3" for="pwd">If Yes, Specify:</label>
                                                                <div class="col-sm-5">          
                                                                <asp:RadioButtonList ID="txtlivewith" runat="server" RepeatLayout="Table" RepeatColumns="2" required="required">
                                                                    <asp:ListItem>Both Parents</asp:ListItem>
                                                                    <asp:ListItem>Father Only</asp:ListItem>
                                                                     <asp:ListItem>Husband</asp:ListItem>
                                                                     <asp:ListItem>Employer</asp:ListItem>
                                                                     <asp:ListItem>Mother Only</asp:ListItem>
                                                                     <asp:ListItem>Relatives</asp:ListItem>
                                                                     <asp:ListItem>Alone</asp:ListItem>
                                                                     <asp:ListItem>Other</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </div>
                                                           </div>
                                                            </form>


														<div class="center">
															<h3 class="blue lighter">This is step 3</h3>
														</div>
													</div>

													<div class="step-pane" data-step="4">
														<div class="center">
															<h3 class="green">Congrats!</h3>
															Your product is ready to ship! Click finish to continue!
														</div>
													</div>
												</div>
											</div>
                                            </form>
											<hr />
											<div class="wizard-actions">
												<button class="btn btn-prev">
													<i class="ace-icon fa fa-arrow-left"></i>
													Prev
												</button>

												<button class="btn btn-success btn-next" data-last="Finish">
													Next
													<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
												</button>
											</div>
										</div><!-- /.widget-main -->
									</div><!-- /.widget-body -->
								</div>
          <div id="modal-wizard" class="modal">
									<div class="modal-dialog">
										<div class="modal-content">
											<div id="modal-wizard-container">
												<div class="modal-header">
													<ul class="steps">
														<li data-step="1" class="active">
															<span class="step">1</span>
															<span class="title">Validation states</span>
														</li>

														<li data-step="2">
															<span class="step">2</span>
															<span class="title">Alerts</span>
														</li>

														<li data-step="3">
															<span class="step">3</span>
															<span class="title">Payment Info</span>
														</li>

														<li data-step="4">
															<span class="step">4</span>
															<span class="title">Other Info</span>
														</li>
													</ul>
												</div>

												<div class="modal-body step-content">
													<div class="step-pane active" data-step="1">
														<div class="center">
															<h4 class="blue">Step 1</h4>
														</div>
													</div>

													<div class="step-pane" data-step="2">
														<div class="center">
															<h4 class="blue">Step 2</h4>
														</div>
													</div>

													<div class="step-pane" data-step="3">
														<div class="center">
															<h4 class="blue">Step 3</h4>
														</div>
													</div>

													<div class="step-pane" data-step="4">
														<div class="center">
															<h4 class="blue">Step 4</h4>
														</div>
													</div>
												</div>
											</div>

											<div class="modal-footer wizard-actions">
												<button class="btn btn-sm btn-prev">
													<i class="ace-icon fa fa-arrow-left"></i>
													Prev
												</button>

												<button class="btn btn-success btn-sm btn-next" data-last="Finish">
													Next
													<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
												</button>

												<button class="btn btn-danger btn-sm pull-left" data-dismiss="modal">
													<i class="ace-icon fa fa-times"></i>
													Cancel
												</button>
											</div>
										</div>
									</div>
								</div>
          <!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="../assets/js/jquery-2.1.4.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
		<script type="text/javascript">
		    if ('ontouchstart' in document.documentElement) document.write("<script src='../assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
		</script>
		<script src="../assets/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->
		<script src="../assets/js/wizard.min.js"></script>
		<script src="../assets/js/jquery.validate.min.js"></script>
		<script src="../assets/js/jquery-additional-methods.min.js"></script>
		<script src="../assets/js/bootbox.js"></script>
		<script src="../assets/js/jquery.maskedinput.min.js"></script>
		<script src="../assets/js/select2.min.js"></script>

		<!-- ace scripts -->
		<script src="../assets/js/ace-elements.min.js"></script>
		<script src="../assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
		    jQuery(function ($) {

		        $('[data-rel=tooltip]').tooltip();

		        $('.select2').css('width', '200px').select2({ allowClear: true })
				.on('change', function () {
				    $(this).closest('form').validate().element($(this));
				});


		        var $validation = false;
		        $('#fuelux-wizard-container')
				.ace_wizard({
				    //step: 2 //optional argument. wizard will jump to step "2" at first
				    //buttons: '.wizard-actions:eq(0)'
				})
				.on('actionclicked.fu.wizard', function (e, info) {
				    if (info.step == 1 && $validation) {
				        if (!$('#validation-form').valid()) e.preventDefault();
				    }
				})
				//.on('changed.fu.wizard', function() {
				//})
				.on('finished.fu.wizard', function (e) {
				    bootbox.dialog({
				        message: "Thank you! Your information was successfully saved!",
				        buttons: {
				            "success": {
				                "label": "OK",
				                "className": "btn-sm btn-primary"
				            }
				        }
				    });
				}).on('stepclick.fu.wizard', function (e) {
				    //e.preventDefault();//this will prevent clicking and selecting steps
				});


		        //jump to a step
		        /**
				var wizard = $('#fuelux-wizard-container').data('fu.wizard')
				wizard.currentStep = 3;
				wizard.setState();
				*/

		        //determine selected step
		        //wizard.selectedItem().step



		        //hide or show the other form which requires validation
		        //this is for demo only, you usullay want just one form in your application
		        $('#skip-validation').removeAttr('checked').on('click', function () {
		            $validation = this.checked;
		            if (this.checked) {
		                $('#sample-form').hide();
		                $('#validation-form').removeClass('hide');
		            }
		            else {
		                $('#validation-form').addClass('hide');
		                $('#sample-form').show();
		            }
		        })



		        //documentation : http://docs.jquery.com/Plugins/Validation/validate


		        $.mask.definitions['~'] = '[+-]';
		        $('#phone').mask('(999) 999-9999');

		        jQuery.validator.addMethod("phone", function (value, element) {
		            return this.optional(element) || /^\(\d{3}\) \d{3}\-\d{4}( x\d{1,6})?$/.test(value);
		        }, "Enter a valid phone number.");

		        $('#validation-form').validate({
		            errorElement: 'div',
		            errorClass: 'help-block',
		            focusInvalid: false,
		            ignore: "",
		            rules: {
		                email: {
		                    required: true,
		                    email: true
		                },
		                password: {
		                    required: true,
		                    minlength: 5
		                },
		                password2: {
		                    required: true,
		                    minlength: 5,
		                    equalTo: "#password"
		                },
		                name: {
		                    required: true
		                },
		                phone: {
		                    required: true,
		                    phone: 'required'
		                },
		                url: {
		                    required: true,
		                    url: true
		                },
		                comment: {
		                    required: true
		                },
		                state: {
		                    required: true
		                },
		                platform: {
		                    required: true
		                },
		                subscription: {
		                    required: true
		                },
		                gender: {
		                    required: true,
		                },
		                agree: {
		                    required: true,
		                }
		            },

		            messages: {
		                email: {
		                    required: "Please provide a valid email.",
		                    email: "Please provide a valid email."
		                },
		                password: {
		                    required: "Please specify a password.",
		                    minlength: "Please specify a secure password."
		                },
		                state: "Please choose state",
		                subscription: "Please choose at least one option",
		                gender: "Please choose gender",
		                agree: "Please accept our policy"
		            },


		            highlight: function (e) {
		                $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
		            },

		            success: function (e) {
		                $(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
		                $(e).remove();
		            },

		            errorPlacement: function (error, element) {
		                if (element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
		                    var controls = element.closest('div[class*="col-"]');
		                    if (controls.find(':checkbox,:radio').length > 1) controls.append(error);
		                    else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
		                }
		                else if (element.is('.select2')) {
		                    error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
		                }
		                else if (element.is('.chosen-select')) {
		                    error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
		                }
		                else error.insertAfter(element.parent());
		            },

		            submitHandler: function (form) {
		            },
		            invalidHandler: function (form) {
		            }
		        });




		        $('#modal-wizard-container').ace_wizard();
		        $('#modal-wizard .wizard-actions .btn[data-dismiss=modal]').removeAttr('disabled');


		        /**
				$('#date').datepicker({autoclose:true}).on('changeDate', function(ev) {
					$(this).closest('form').validate().element($(this));
				});
				
				$('#mychosen').chosen().on('change', function(ev) {
					$(this).closest('form').validate().element($(this));
				});
				*/


		        $(document).one('ajaxloadstart.page', function (e) {
		            //in ajax mode, remove remaining elements before leaving page
		            $('[class*=select2]').remove();
		        });
		    })
		</script>

      </body>
    </html>
  
		
      
  </asp:Content>

