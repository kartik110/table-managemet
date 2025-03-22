
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
                                <th class="width_10_p"><?php echo app('translator')->get('index.type'); ?></th>
                                <th class="width_10_p"><?php echo app('translator')->get('index.customer'); ?></th>
                                <th class="width_10_p"><?php echo app('translator')->get('index.created_on'); ?></th>
                                <th class="width_10_p"><?php echo app('translator')->get('index.created_by'); ?></th>
                                <th class="width_10_p"><?php echo app('translator')->get('index.product_count'); ?></th>
                                <th class="width_10_p"><?php echo app('translator')->get('index.total_value'); ?></th>
                                <th class="width_10_p"><?php echo app('translator')->get('index.cost'); ?></th>
                                <th class="width_10_p"><?php echo app('translator')->get('index.profit'); ?></th>
                                <th class="width_10_p"><?php echo app('translator')->get('index.delivery_date'); ?></th>
                                <th class="width_3_p"><?php echo app('translator')->get('index.actions'); ?></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if($obj && !empty($obj)): ?>
                                <?php
                                $i = count($obj);
                                ?>
                            <?php endif; ?>
                            <?php $__currentLoopData = $obj; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <tr>
                                    <td><?php echo e($value->order_type); ?></td>
                                    <td><?php echo e($value->customer->name); ?></td>
                                    <td><?php echo e($value->created_at); ?></td>
                                    <td><?php echo e(getUserName($value->created_by)); ?></td>
                                    <td><?php echo e($value->total_product); ?></td>
                                    <td><?php echo e(getAmtCustom($value->total_amount)); ?></td>
                                    <td><?php echo e(getAmtCustom($value->total_cost)); ?></td>
                                    <td><?php echo e(getAmtCustom($value->total_profit)); ?></td>
                                    <td><?php echo e(getDateFormat($value->delivery_date)); ?></td>
                                    <td>
                                        <?php if(routePermission('order.view-details')): ?>
                                            <a href="<?php echo e(url('customer-orders')); ?>/<?php echo e(encrypt_decrypt($value->id, 'encrypt')); ?>" class="button-info"
                                                data-bs-toggle="tooltip" data-bs-placement="top"
                                                title="<?php echo app('translator')->get('index.view_details'); ?>"><i class="fa fa-eye tiny-icon"></i></a>
                                        <?php endif; ?>
                                        <?php if(routePermission('order.edit')): ?>
                                            <a href="<?php echo e(url('customer-orders')); ?>/<?php echo e(encrypt_decrypt($value->id, 'encrypt')); ?>/edit"
                                                class="button-success" data-bs-toggle="tooltip" data-bs-placement="top"
                                                title="<?php echo app('translator')->get('index.edit'); ?>"><i class="fa fa-edit tiny-icon"></i></a>
                                        <?php endif; ?>
                                        <?php if(routePermission('order.print-invoice')): ?>
                                            <a href="javascript:void()" class="button-info print_invoice"
                                                data-id="<?php echo e($value->id); ?>" data-bs-toggle="tooltip"
                                                data-bs-placement="top" title="<?php echo app('translator')->get('index.print_invoice'); ?>"><i
                                                    class="fa fa-print tiny-icon"></i></a>
                                        <?php endif; ?>
                                        <?php if(routePermission('order.download-invoice')): ?>
                                            <a href="<?php echo e(route('customer-order-download', encrypt_decrypt($value->id, 'encrypt'))); ?>"
                                                class="button-info" data-bs-toggle="tooltip" data-bs-placement="top"
                                                title="<?php echo app('translator')->get('index.download_invoice'); ?>"><i class="fa fa-download tiny-icon"></i></a>
                                        <?php endif; ?>
                                        <?php if(routePermission('order.delete')): ?>
                                            <a href="#" class="delete button-danger"
                                                data-form_class="alertDelete<?php echo e($value->id); ?>" type="submit"
                                                data-bs-toggle="tooltip" data-bs-placement="top" title="<?php echo app('translator')->get('index.delete'); ?>">
                                                <form action="<?php echo e(route('customer-orders.destroy', $value->id)); ?>"
                                                    class="alertDelete<?php echo e($value->id); ?>" method="post">
                                                    <?php echo csrf_field(); ?>
                                                    <?php echo method_field('DELETE'); ?>
                                                    <i class="fa fa-trash tiny-icon"></i>
                                                </form>

                                            </a>
                                        <?php endif; ?>

                                    </td>
                                </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
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
    <script src="<?php echo $baseURL . 'frequent_changing/js/order.js'; ?>"></script>
    
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /opt/homebrew/var/www/iproduction/resources/views/pages/customer_order/index.blade.php ENDPATH**/ ?>