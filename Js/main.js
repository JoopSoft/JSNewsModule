/*globals jQuery, window, Sys */
(function ($, Sys) {
    //function dnnEditBasicSettings() {
    //    $('#dnnEditBasicSettings').dnnPanels();
    //    $('#dnnEditBasicSettings .dnnFormExpandContent a').dnnExpandAll({ expandText: '<%=Localization.GetString("ExpandAll", LocalResourceFile)%>', collapseText: '<%=Localization.GetString("CollapseAll", LocalResourceFile)%>', targetArea: '#dnnEditBasicSettings' });
    //}


    $(document).ready(function () {

        //CUSTOM MODULE FOR CHECKING EXISTING AN ELEMENS
        jQuery.fn.exists = function () { return this.length > 0; }

        var $lnkAdd = '<i class="fa fa-plus-circle"></i>',
            $lnkEdit = '<i class="fa fa-pencil"></i>',
            $lnkDelete = '<i class="fa fa-trash-o"></i>',
            $lnkBack = '<i class="fa fa-angle-left"></i>',
            $lnkHome = '<i class="fa fa-home"></i>',
            $lnkAll = '<i class="fa fa-external-link"></i>',
            $lnkUpload = '<i class="fa fa-upload"></i>',
            $lnkSave = '<i class="fa fa-floppy-o"></i>',
            $lnkCancel = '<i class="fa fa-ban"></i>',
            $lnkInfo = '<i class="fa fa-info-circle"></i>',
            $lnkClose = '<i class="fa fa-close"></i>',
            $lnkWarning = '<i class="fa fa-warning"></i>',
            $lnkImage = '<i class="fa fa-picture-o"></i>',

            $lnkPrev = '<i class="fa fa-angle-left"></i>',
            $lnkNext = '<i class="fa fa-angle-right"></i>',
            $largeIcon = 'fa-lg';
        
        
        //PUSHED MIXED UP ICON AND TEXT ONTO ELEMENTS
        $('.JSNews .link-add').prepend($lnkAdd + ' ');
        $('.JSNews .link-edit').prepend($lnkEdit + ' ');
        $('.JSNews .link-delete').prepend($lnkDelete + ' ');
        $('.JSNews .link-back').prepend($lnkBack + ' ');
        $('.JSNews .link-home').prepend($lnkHome + ' ');
        $('.JSNews .link-all').prepend($lnkAll + ' ');
        $('.JSNews .link-upload').prepend($lnkUpload + ' ');
        $('.JSNews .link-save').prepend($lnkSave + ' ');
        $('.JSNews .link-cancel').prepend($lnkCancel + ' ');
        $('.JSNews .link-info').prepend($lnkInfo + ' ');
        $('.JSNews .link-prev').prepend($lnkPrev + ' ');
        $('.JSNews .link-close').prepend($lnkClose + ' ');
        $('.JSNews .link-warning').prepend($lnkWarning + ' ');
        $('.JSNews .link-image').prepend($lnkImage + ' ');
        $('.JSNews .link-next').append(' ' + $lnkNext);

        //PUSHED ONLY ICONS ON ELEMTNS
        $('.JSNews .link-add.no-txt').html($lnkAdd);
        $('.JSNews .link-edit.no-txt').html($lnkEdit);
        $('.JSNews .link-delete.no-txt').html($lnkDelete);
        $('.JSNews .link-back.no-txt').html($lnkBack);
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
        $('.JSNews .link-image.no-txt').html($lnkImage);

        $('.JSNews a.dnnFormHelp').prepend($lnkInfo);

        //COLLAPSING BY BOOTSTRAP FRAMEWORK
        //$('.JSNews .collapse').collapse();
        
        //CUTTING TEXT BY ELLIPSIS PLUGIN
        if ($('.JSNews .rpt-list .ellipsis').exists()) $('.JSNews .rpt-list .ellipsis').ellipsis({
            row: 5,
            onlyFullWords: true
        });

        //CUTTING TEXT BY ELLIPSIS PLUGIN
        if ($('.JSNews .rpt-accordion .ellipsis').exists()) $('.JSNews .rpt-accordion .ellipsis').ellipsis({
            row: 2,
            onlyFullWords: true
        });

        //dnnEditBasicSettings();
        //Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
        //    dnnEditBasicSettings();
        //});

        if ($('.JSNews a.link-popup').exists()) $('.JSNews a.link-popup')
            .fancybox({
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


        $('.JSNews [data-toggle="tooltip"]').tooltip({
            placement: 'auto bottom'
        });


    });

}(jQuery, window.Sys));