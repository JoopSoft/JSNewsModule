/*globals jQuery, window, Sys */
'use strict';

(function ($, Sys) {
    //function dnnEditBasicSettings() {
    //    $('#dnnEditBasicSettings').dnnPanels();
    //    $('#dnnEditBasicSettings .dnnFormExpandContent a').dnnExpandAll({ expandText: '<%=Localization.GetString("ExpandAll", LocalResourceFile)%>', collapseText: '<%=Localization.GetString("CollapseAll", LocalResourceFile)%>', targetArea: '#dnnEditBasicSettings' });
    //}

    //dnnEditBasicSettings();
    //Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
    //    dnnEditBasicSettings();
    //});

    $(document).ready(function () {

        //CUSTOM MODULE FOR CHECKING EXISTING AN ELEMENS
        jQuery.fn.exists = function () {
            return this.length > 0;
        };

        var $lnkAdd = '<i class="fa fa-plus-circle"></i>',
            $lnkEdit = '<i class="fa fa-pencil"></i>',
            $lnkDelete = '<i class="fa fa-trash-o"></i>',
            $lnkBack = '<i class="fa fa-angle-left"></i>',
            $lnkUp = '<i class="fa fa-angle-up"></i>',
            $lnkHome = '<i class="fa fa-home"></i>',
            $lnkAll = '<i class="fa fa-external-link"></i>',
            $lnkUpload = '<i class="fa fa-upload"></i>',
            $lnkSave = '<i class="fa fa-floppy-o"></i>',
            $lnkCancel = '<i class="fa fa-ban"></i>',
            $lnkInfo = '<i class="fa fa-info-circle"></i>',
            $lnkClose = '<i class="fa fa-close"></i>',
            $lnkWarning = '<i class="fa fa-warning"></i>',
            $lnkSettings = '<i class="fa fa-cog"></i>',
            $lnkImage = '<i class="fa fa-picture-o"></i>',
            $lnkPrev = '<i class="fa fa-angle-left"></i>',
            $lnkNext = '<i class="fa fa-angle-right"></i>',
            $lnkCheck = '<i class="fa fa-check"></i>',
            $lnkCalendar = '<i class="fa fa-calendar"></i>',

            $largeIcon = 'fa-lg';

        //PUSHED MIXED UP ICON AND TEXT ONTO ELEMENTS
        $('.JSNews .link-add').prepend($lnkAdd + ' ');
        $('.JSNews .link-edit').prepend($lnkEdit + ' ');
        $('.JSNews .link-delete').prepend($lnkDelete + ' ');
        $('.JSNews .link-back').prepend($lnkBack + ' ');
        $('.JSNews .link-up').prepend($lnkUp + ' ');
        $('.JSNews .link-home').prepend($lnkHome + ' ');
        $('.JSNews .link-all').prepend($lnkAll + ' ');
        $('.JSNews .link-upload').prepend($lnkUpload + ' ');
        $('.JSNews .link-save').prepend($lnkSave + ' ');
        $('.JSNews .link-cancel').prepend($lnkCancel + ' ');
        $('.JSNews .link-info').prepend($lnkInfo + ' ');
        $('.JSNews .link-prev').prepend($lnkPrev + ' ');
        $('.JSNews .link-close').prepend($lnkClose + ' ');
        $('.JSNews .link-warning').prepend($lnkWarning + ' ');
        $('.JSNews .link-settings').prepend($lnkSettings + ' ');
        $('.JSNews .link-image').prepend($lnkImage + ' ');
        $('.JSNews .link-check').prepend(' ' + $lnkCheck);
        $('.JSNews .link-calendar').prepend(' ' + $lnkCalendar);
        $('.JSNews .link-next').append(' ' + $lnkNext);

        //PUSHED ONLY ICONS ON ELEMTNS
        $('.JSNews .link-add.no-txt').html($lnkAdd);
        $('.JSNews .link-edit.no-txt').html($lnkEdit);
        $('.JSNews .link-delete.no-txt').html($lnkDelete);
        $('.JSNews .link-back.no-txt').html($lnkBack);
        $('.JSNews .link-up.no-txt').html($lnkUp);
        $('.JSNews .link-home.no-txt').html($lnkHome);
        $('.JSNews .link-all.no-txt').html($lnkAll);
        $('.JSNews .link-upload.no-txt').html($lnkUpload);
        $('.JSNews .link-save.no-txt').html($lnkSave);
        $('.JSNews .link-cancel.no-txt').html($lnkCancel);
        $('.JSNews .link-info.no-txt').html($lnkInfo);
        $('.JSNews .link-prev.no-txt').html($lnkPrev);
        $('.JSNews .link-next.no-txt').html($lnkNext);
        $('.JSNews .link-close.no-txt').html($lnkClose);
        $('.JSNews .link-warning.no-txt').html($lnkWarning);
        $('.JSNews .link-settings.no-txt').html($lnkSettings);
        $('.JSNews .link-image.no-txt').html($lnkImage);
        $('.JSNews .link-check.no-txt').html($lnkCheck);
        $('.JSNews .link-calendar.no-txt').html(' ' + $lnkCalendar);


        $('.JSNews a.dnnFormHelp').html($lnkInfo);

        //BIG ICON ON CLOSE POPUP BUTTON
        $('.JSNews .close-action .fa').addClass('fa-5x');
        
        //BOOTSTRAP FRAMEWORK
        //$('.JSNews [data-toggle="collapse"]').collapse();

        $('.JSNews [data-toggle="tooltip"]').tooltip({
            placement: 'auto bottom'
        });

        //CUTTING TEXT BY ELLIPSIS PLUGIN
        if ($('.JSNews .rpt-list .ellipsis').exists()) $('.JSNews .rpt-list .ellipsis').ellipsis({
            row: 5,
            onlyFullWords: true
        });
        if ($('.JSNews .rpt-list .ellipsis p').exists()) $('.JSNews .rpt-list .ellipsis p').ellipsis({
            row: 5,
            onlyFullWords: true
        });

        //CUTTING TEXT BY ELLIPSIS PLUGIN
        if ($('.JSNews .rpt-accordion .ellipsis').exists()) $('.JSNews .rpt-accordion .ellipsis').ellipsis({
            row: 1,
            onlyFullWords: true
        });
        if ($('.JSNews .rpt-accordion .ellipsis p').exists()) $('.JSNews .rpt-accordion .ellipsis p').ellipsis({
            row: 1,
            onlyFullWords: true
        });

        //FANCYBOX POPUP IMAGE PLUGIN
        if ($('.JSNews a.link-popup').exists()) $('.JSNews a.link-popup').fancybox({
            padding: 0,
            closeClick: true,
            closeBtn: true,
            openEffect: 'elastic',
            closeEffect: 'elastic',
            helpers: {
                //title: null,
                title: {
                    type: 'over' // 'float', 'inside', 'outside' or 'over'
                },
                //overlay: null,
                overlay: {
                    showEarly: false
                }
            }

        });
        
        //REMOVING TOOLTIPS FROM ALL DISABLED ELEMENTS
        $('.JSNews [disbled="disabled"], .JSNews .aspNetDisabled, .JSNews .dnnDisabled').tooltip('destroy');


        //AUTO CLOSE POPUP PANEL
        $('.JSNews .popup').each(function () {

            var $this = $(this),
                $timer = 0,
                $total = 4;

            if ($this.is('.auto-close-box')) {

                $this.find('.popup-wrapper').append($('<div>', { 'class': 'progress-bar' }).css('width', '0%'));

                var $interval = setInterval(function () {

                    $timer++; //$timer = ($timer + 1) % 361;

                    $this.find('.progress-bar').css('width', '100%');

                    if ($timer === $total) {
                        clearInterval($interval);
                        $('.JSNews .popup.auto-close-box').remove();
                    }
                    //console.log($timer);
                }, 1000);
            }

            //if ($this.is('.confirm-box')) $('.JSNews .popup.confirm-box').remove();
        });

        //DISPALY/HIDE PANEL DEFINITION
        $('.JSNews .hidder input:checkbox')
            .each(function () {
                var $this = $(this),
                    $target = $this.parent().data('target');

                if ($this.is(':checked')) {
                    $($target).show();
                    $($target + '.reverse').hide();
                } else {
                    $($target).hide();
                    $($target + '.reverse').show();
                }
            })
            .bind('change', function () {
                var $this = $(this),
                    $target = $this.parent().data('target');

                if ($this.is(':checked')) {
                    $($target).show();
                    $($target + '.reverse').hide();
                } else {
                    $($target).hide();
                    $($target + '.reverse').show();
                }
            });

        $('.JSNews .unhidder input:checkbox')
            .each(function () {
                var $this = $(this),
                    $target = $this.parent().data('target');

                if ($this.is(':checked')) {
                    $($target).hide();
                    $($target + '.reverse').show();
                } else {
                    $($target).show();
                    $($target + '.reverse').hide();
                }
            })
            .bind('change', function () {
                var $this = $(this),
                    $target = $this.parent().data('target');

                if ($this.is(':checked')) {
                    $($target).hide();
                    $($target + '.reverse').show();
                } else {
                    $($target).show();
                    $($target + '.reverse').hide();
                }
            });

        $('.JSNews input:file')
            .each(function () {
                var $this = $(this),
                    $target = $this.data('target');

                if ($this.val() != '') {
                    $($target).show();
                    $($target + '.reverse').hide();
                } else {
                    $($target).hide();
                    $($target + '.reverse').show();
                }
            })
            .bind('change', function () {
                var $this = $(this),
                    $target = $this.data('target');

                if ($this.val() != '') {
                    $($target).show();
                    $($target + '.reverse').hide();
                } else {
                    $($target).hide();
                    $($target + '.reverse').show();
                }
            });

        $('.JSNews .check-equal')
            .each(function () {
                if ($(this).val() === $(this).data('equal')) $($(this).data('target')).show();
                else $($(this).data('target')).hide();
            })
            .bind('change', function () {
                if ($(this).val() === $(this).data('equal')) $($(this).data('target')).show();
                else $($(this).data('target')).hide();
            });

        $('.JSNews .hidder-radio input:radio')
            .each(function () {
                if ($(this).is(':checked')) {
                    if ($(this).val() !== 'auto') $($(this).closest('.hidder-radio').data('target')).show();
                    else $($(this).closest('.hidder-radio').data('target')).hide();
                }
            })
            .bind('change', function () {
                if ($(this).is(':checked')) {
                    if ($(this).val() !== 'auto') $($(this).closest('.hidder-radio').data('target')).show();
                    else $($(this).closest('.hidder-radio').data('target')).hide();
                }
            });

        $('.JSNews .hidder-radio-option input:radio')
            .each(function () {
                if ($(this).is(':checked')) $($(this).parent().data('target')).show();
                else $($(this).parent().data('target')).hide();
            })
            .bind('change', function () {
                if ($(this).is(':checked')) {
                    var $groupedClass = $(this).closest('.hidder-radio-option').data('grouped-class');
                    $('.JSNews ' + $groupedClass).hide();
                    $($(this).parent().data('target')).show();
                }
            });


        //SELECT PICKER CUSTOM PLUGIN DEFINITION
        //SINGLE SELECT OPTIONS
        if ($('.JSNews .selectpicker.single-select').exists()) $('.JSNews .selectpicker.single-select').selectpicker({
            actionsBox: false,
            //container: false,
            //countSelectedText:'',
            //dropupAuto: true,
            //header: false,
            //hideDisabled: false,
            //iconBase: 'glyphicon',
            liveSearch: false,
            liveSearchPlaceholder: 'Search',
            maxOptions: 1,
            mobile: false,
            multipleSeparator: ' | ',
            noneSelectedText: 'Select',
            selectedTextFormat: 'values',
            selectOnTab: false,
            showContent: true,
            showIcon: true,
            showSubtext: false,
            showTick: true,
            size: 'auto',
            style: 'btn-primary',
            tickIcon: 'glyphicon-ok',
            title: null,
            width: '50%'
        });

        //MULTI SELECT OPTIONS
        if ($('.JSNews .selectpicker.multi-select').exists()) $('.JSNews .selectpicker.multi-select').selectpicker({
            actionsBox: true,
            //container: false,
            //countSelectedText:'',
            //dropupAuto: true,
            //header: false,
            //hideDisabled: false,
            //iconBase: 'glyphicon',
            liveSearch: false,
            liveSearchPlaceholder: 'Search',
            maxOptions: false,
            mobile: false,
            multipleSeparator: ' | ',
            noneSelectedText: 'Select',
            selectedTextFormat: 'count',
            selectOnTab: false,
            showContent: true,
            showIcon: true,
            showSubtext: false,
            showTick: false,
            size: 6,
            style: 'btn-primary',
            tickIcon: 'glyphicon-ok',
            title: null,
            width: '50%'
        });

        //GET PARTIAL POSTBACK ON UPDATEPANEL REFRESH
        var prm = Sys.WebForms.PageRequestManager.getInstance();

        if (prm != null) {
            prm.add_endRequest(function (sender, e) {
                if (sender._postBackSettings.panelsToUpdate != null) {
                    RefreshPostBack();
                }
            });
        };

        function RefreshPostBack() {
            $('.JSNews .selectpicker.single-select').selectpicker({
                actionsBox: false,
                //container: false,
                //countSelectedText:'',
                //dropupAuto: true,
                //header: false,
                //hideDisabled: false,
                //iconBase: 'glyphicon',
                liveSearch: false,
                liveSearchPlaceholder: 'Search',
                maxOptions: 1,
                mobile: false,
                multipleSeparator: ' | ',
                noneSelectedText: 'Select',
                selectedTextFormat: 'values',
                selectOnTab: false,
                showContent: true,
                showIcon: true,
                showSubtext: false,
                showTick: true,
                size: 'auto',
                style: 'btn-primary',
                tickIcon: 'glyphicon-ok',
                title: null,
                width: '50%'
            });
            $('.JSNews .selectpicker.multi-select').selectpicker({
                actionsBox: true,
                //container: false,
                //countSelectedText:'',
                //dropupAuto: true,
                //header: false,
                //hideDisabled: false,
                //iconBase: 'glyphicon',
                liveSearch: false,
                liveSearchPlaceholder: 'Search',
                maxOptions: false,
                mobile: false,
                multipleSeparator: ' | ',
                noneSelectedText: 'Select',
                selectedTextFormat: 'count',
                selectOnTab: false,
                showContent: true,
                showIcon: true,
                showSubtext: false,
                showTick: false,
                size: 6,
                style: 'btn-primary',
                tickIcon: 'glyphicon-ok',
                title: null,
                width: '50%'
            });

            $('.JSNews .selectpicker').selectpicker('render');

            $('.JSNews a.dnnFormHelp').html($lnkInfo);
        };
        

        //CHECK TO SEE IF THE WINDOW IS TOP IF NOT THEN DISPLAY BUTTON
        $(window).scroll(function () {
            if ($(this).scrollTop() > 100) {
                $('.JSNews .scroll-action').fadeIn();
                //$('.JSNews .dnnFormSectionHead').animate({ 'top': $('.JSNews .dnnFormSectionHead').height() + 'px' }, 300).addClass('fixed');


            } else {
                $('.JSNews .scroll-action').fadeOut();
                //$('.JSNews .dnnFormSectionHead').animate({ 'top': '-=76' }, 300).removeClass('fixed');

            }
        });
                    
        //CLICK EVENT TO SCROLL TO TOP
        $('.JSNews .scroll-action').click(function () {
            $('html, body').animate({ scrollTop: 0 }, 300);
            return false;
        });

    });
})(jQuery, window.Sys);

