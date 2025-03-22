<?php $__env->startPush('css'); ?>
    <link rel="stylesheet" href="<?php echo e(asset('frequent_changing/css/hide_search.css')); ?>">
<?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>
	<?php
    $baseURL = getBaseURL();
    $setting = getSettingsInfo();
    $base_color = '#6ab04c';
    if (isset($setting->base_color) && $setting->base_color) {
        $base_color = $setting->base_color;
    }
    ?>
    <section class="main-content-wrapper">
    <h2 class="d-none">&nbsp;</h2>
        <div class="alert-wrapper">
            <?php echo $__env->make('utilities.messages', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        </div>

        <section class="content-header">
            <div class="row">
                <div class="col-md-6">
                    <input type="hidden" class="datatable_name" data-title="Users" data-id_name="datatable">
                </div>
                <div class="col-md-offset-2 col-md-4">
                    <div class="btn_list m-right d-flex">
                    </div>
                </div>
            </div>
        </section>

        <div class="box-wrapper">
                <div class="row text-center">
                    <?php
                        $attendance = App\Attendance::where('employee_id',Auth::id())->whereNotNull('in_time')->where('out_time', '00:00:00')->first();
                        if(App\Attendance::where('employee_id',Auth::id())->whereNotNull('in_time')->where('out_time', '00:00:00')->exists()){
                            $logIn = false;
                            $logOut = true;
                        } else{
                            $logIn = true;
                            $logOut = false;
                        }
                    ?>

                    <?php if($logIn): ?>
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <a href="<?php echo e(route('in-attendance')); ?>" class="btn bg-blue-btn w-100 search-btn top ">
                                Check In
                            </a>
                        </div>
                        <div class="col-md-4"></div>
                    <?php endif; ?>

                    <?php if($logOut): ?>
                        <h3>Last Check In <?php echo e(date("h:i:s", strtotime($attendance->in_time))); ?></h3>
                        <div class="col-md-4"></div>
                        <div class="col-md-4 pt-0">
                            <a href="<?php echo e(route('out-attendance')); ?>" class="btn btn-md bg-red-btn text-left">
                                Check Out
                            </a>
                        </div>
                        <div class="col-md-4"></div>
                    <?php endif; ?>
                </div>
            <hr>
            <div class="table-box">
                <!-- If admin want to search attendance from manual list -->
                <form action="<?php echo e(route('check-in-out')); ?>" method="GET">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label for="from_date">From Date</label>
                                <input type="text" name="from_date" class="form-control customDatepicker" autocomplete="off" value="<?php echo e($from_date ?? ""); ?>" placeholder="From Date" readonly>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label for="to_date">To Date</label>
                                <input type="text" name="to_date" class="form-control customDatepicker" autocomplete="off" value="<?php echo e($to_date ?? ""); ?>" placeholder="To Date" readonly>
                            </div>
                        </div>

                        <div class="col-xl-2 col-lg-2 col-md-2 col-sm-12 col-12 mb-2 mt-3">
                            <div class="form-group">
                                <button type="submit" class="btn bg-blue-btn w-100 search-btn top mt-2" id="go">
                                   Search                                </button>
                            </div>
                        </div>
                    </div>
                </form>
                <hr>
                <!-- Attendance search from end -->
                <div class="table-responsive">
                    <table id="datatable" class="table">
                        <thead>
                        <tr>
                            <th class="ir_w_1"><?php echo app('translator')->get('index.sn'); ?></th>
                            <th class="ir_w_12"><?php echo app('translator')->get('index.date'); ?></th>
                            <th class="ir_w_12"><?php echo app('translator')->get('index.in_time'); ?></th>
                            <th class="ir_w_7"><?php echo app('translator')->get('index.out_time'); ?></th>
                            <th class="ir_w_7"><?php echo app('translator')->get('index.time_count'); ?></th>
                            <th class="ir_w_7"><?php echo app('translator')->get('index.note'); ?></th>
                        </tr>
                        </thead>
                        <tbody>
                            <?php $__currentLoopData = $results; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $data): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <tr>
                                    <td><?php echo e($loop->index + 1); ?></td>
                                    <td><?php echo e(getDateFormat($data->date)); ?></td>
                                    <td><?php echo e($data->in_time); ?></td>
                                    <td><?php echo e($data->out_time ?? 'N/A'); ?></td>
                                    <td>
										<?php if($data->out_time == '00:00:00'): ?>
                                            N/A
                                        <?php else: ?>
                                            <?php
                                                $get_hour = getTotalHour($data->out_time, $data->in_time);
                                            ?>
                                            <?php if(isset($get_hour) && $get_hour): ?>
                                                <?php echo e($get_hour); ?> Hour(s)
                                            <?php else: ?>
                                                0 Hour(s)
                                            <?php endif; ?>
                                        <?php endif; ?>
									</td>
                                    <td><?php echo e($data->note ?? 'N/A'); ?></td>
                                </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>
    <script src="<?php echo $baseURL . 'assets/datatable_custom/jquery-3.3.1.js'; ?>"></script>
    <script src="<?php echo $baseURL . 'assets/dataTable/jquery.dataTables.min.js'; ?>"></script>
    <script src="<?php echo $baseURL . 'assets/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js'; ?>"></script>
    <script src="<?php echo $baseURL . 'assets/dataTable/dataTables.bootstrap4.min.js'; ?>"></script>
    <script src="<?php echo $baseURL . 'assets/dataTable/dataTables.buttons.min.js'; ?>"></script>
    <script src="<?php echo $baseURL . 'assets/dataTable/buttons.html5.min.js'; ?>"></script>
    <script src="<?php echo $baseURL . 'assets/dataTable/buttons.print.min.js'; ?>"></script>
    <script src="<?php echo $baseURL . 'assets/dataTable/jszip.min.js'; ?>"></script>
    <script src="<?php echo $baseURL . 'assets/dataTable/pdfmake.min.js'; ?>"></script>
    <script src="<?php echo $baseURL . 'assets/dataTable/vfs_fonts.js'; ?>"></script>
    <script src="<?php echo $baseURL . 'frequent_changing/newDesign/js/forTable.js'; ?>"></script>
    <script src="<?php echo $baseURL . 'frequent_changing/js/custom_report.js'; ?>"></script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /opt/homebrew/var/www/iproduction/resources/views/pages/attendance/check_in_out.blade.php ENDPATH**/ ?>