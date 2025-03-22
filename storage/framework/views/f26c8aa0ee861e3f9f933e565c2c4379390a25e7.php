
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
        <?php echo $__env->make('utilities.messages', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <section class="content-header">
            <div class="row">
                <div class="col-md-6">
                    <h2 class="top-left-header"><?php echo e(isset($title) && $title ? $title : ''); ?></h2>
                    <input type="hidden" class="datatable_name" data-title="<?php echo e(isset($title) && $title ? $title : ''); ?>"
                        data-id_name="datatable">
                </div>
                <div class="col-md-offset-4 col-md-2">

                </div>
            </div>
        </section>


        <div class="box-wrapper">

            <div class="table-box">
                <!-- /.box-header -->
                <div class="table-responsive">
                    <table id="datatable" class="table table-striped">
                        <thead>
                            <tr>
                                <th class="width_10_p"><?php echo app('translator')->get('index.quotation'); ?></th>
                                <th class="width_10_p"><?php echo app('translator')->get('index.waiting_for_confirmation'); ?></th>
                                <th class="width_10_p"><?php echo app('translator')->get('index.waiting_for_production'); ?></th>
                                <th class="width_10_p"><?php echo app('translator')->get('index.in_production'); ?></th>
                                <th class="width_10_p"><?php echo app('translator')->get('index.ready_for_shipment'); ?></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="text-center align-baseline">
                                    <?php $__currentLoopData = $order_quotation; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <div class="card border-bottom mb-2">
                                            <div class="card-body text-left fs-6">
                                                <p>#<?php echo e($value->reference_no); ?></p>
                                                <ul>
                                                    <?php $__currentLoopData = $value->details; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $details): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <li><?php echo e($details->product->name); ?></li>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                </ul>
                                                <p><?php echo app('translator')->get('index.total'); ?> : <strong class="text-right"><?php echo e($value->total_amount); ?></strong></p>
                                                <p><?php echo app('translator')->get('index.cost'); ?> : <strong class="text-right"><?php echo e($value->total_cost); ?></strong></p>
                                                <p><?php echo app('translator')->get('index.profit'); ?> : <strong class="text-right"><?php echo e($value->total_profit); ?></strong></p>
                                                <p><?php echo app('translator')->get('index.delivery_date'); ?> : <strong class="text-right"><?php echo e($value->delivery_date); ?></strong></p>
                                            </div>
                                        </div>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </td>
                                <td class="text-center align-baseline">
                                    <?php $__currentLoopData = $waiting_for_confirmation; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <div class="card border-bottom mb-2">
                                            <div class="card-body text-left fs-6">
                                                <p>#<?php echo e($value->reference_no); ?></p>
                                                <ul>
                                                    <?php $__currentLoopData = $value->details; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $details): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <li><?php echo e($details->product->name); ?></li>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                </ul>
                                                <p><?php echo app('translator')->get('index.total'); ?> : <strong class="text-right"><?php echo e($value->total_amount); ?></strong></p>
                                                <p><?php echo app('translator')->get('index.cost'); ?> : <strong class="text-right"><?php echo e($value->total_cost); ?></strong></p>
                                                <p><?php echo app('translator')->get('index.profit'); ?> : <strong class="text-right"><?php echo e($value->total_profit); ?></strong></p>
                                                <p><?php echo app('translator')->get('index.delivery_date'); ?> : <strong class="text-right"><?php echo e($value->delivery_date); ?></strong></p>
                                            </div>
                                        </div>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </td>
                                <td class="text-center align-baseline">
                                    <?php $__currentLoopData = $waiting_for_production; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <div class="card border-bottom mb-2">
                                            <div class="card-body text-left fs-6">
                                                <p>#<?php echo e($value->reference_no); ?></p>
                                                <ul>
                                                    <?php $__currentLoopData = $value->details; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $details): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <li><?php echo e($details->product->name); ?></li>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                </ul>
                                                <p><?php echo app('translator')->get('index.total'); ?> : <strong class="text-right"><?php echo e($value->total_amount); ?></strong></p>
                                                <p><?php echo app('translator')->get('index.cost'); ?> : <strong class="text-right"><?php echo e($value->total_cost); ?></strong></p>
                                                <p><?php echo app('translator')->get('index.profit'); ?> : <strong class="text-right"><?php echo e($value->total_profit); ?></strong></p>
                                                <p><?php echo app('translator')->get('index.delivery_date'); ?> : <strong class="text-right"><?php echo e($value->delivery_date); ?></strong></p>
                                            </div>
                                        </div>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </td>
                                <td class="text-center align-baseline">
                                    <?php $__currentLoopData = $in_production; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <div class="card border-bottom mb-2">
                                            <div class="card-body text-left fs-6">
                                                <p>#<?php echo e($value->reference_no); ?></p>
                                                <ul>
                                                    <?php $__currentLoopData = $value->details; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $details): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <li><?php echo e($details->product->name); ?></li>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                </ul>
                                                <p><?php echo app('translator')->get('index.total'); ?> : <strong class="text-right"><?php echo e($value->total_amount); ?></strong></p>
                                                <p><?php echo app('translator')->get('index.cost'); ?> : <strong class="text-right"><?php echo e($value->total_cost); ?></strong></p>
                                                <p><?php echo app('translator')->get('index.profit'); ?> : <strong class="text-right"><?php echo e($value->total_profit); ?></strong></p>
                                                <p><?php echo app('translator')->get('index.delivery_date'); ?> : <strong class="text-right"><?php echo e($value->delivery_date); ?></strong></p>
                                            </div>
                                        </div>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </td>
                                <td class="text-center align-baseline">
                                    <?php $__currentLoopData = $ready_for_shipment; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <div class="card border-bottom mb-2">
                                            <div class="card-body text-left fs-6">
                                                <p>#<?php echo e($value->reference_no); ?></p>
                                                <ul>
                                                    <?php $__currentLoopData = $value->details; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $details): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <li><?php echo e($details->product->name); ?></li>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                </ul>
                                                <p><?php echo app('translator')->get('index.total'); ?> : <strong class="text-right"><?php echo e($value->total_amount); ?></strong></p>
                                                <p><?php echo app('translator')->get('index.cost'); ?> : <strong class="text-right"><?php echo e($value->total_cost); ?></strong></p>
                                                <p><?php echo app('translator')->get('index.profit'); ?> : <strong class="text-right"><?php echo e($value->total_profit); ?></strong></p>
                                                <p><?php echo app('translator')->get('index.delivery_date'); ?> : <strong class="text-right"><?php echo e($value->delivery_date); ?></strong></p>
                                            </div>
                                        </div>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- /.box-body -->
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

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /opt/homebrew/var/www/iproduction/resources/views/pages/customer_order/order-status.blade.php ENDPATH**/ ?>