<?php $__env->startSection('content'); ?>
<section class="main-content-wrapper">
    <?php echo $__env->make('utilities.messages', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <section class="content-header">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1>Table Mapping History</h1>
                <a href="<?php echo e(route('history.export')); ?>" class="btn btn-success">
                    <i class="fas fa-file-export me-2"></i> Export to CSV
                </a>
            </div>
    </section>


    <div class="box-wrapper">
        <div class="card-body">
            <?php if(count($mappingHistory) > 0): ?>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead class="table-light">
                            <tr>
                                <th style="width: 150px;">Date</th>
                                <th>Table Assignments</th>
                                <th style="width: 100px;">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $__currentLoopData = $mappingHistory; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $date => $tables): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <tr>
                                    <td class="align-middle"><?php echo e(\Carbon\Carbon::parse($date)->format('d/m/Y')); ?></td>
                                    <td>
                                        <?php $__currentLoopData = $tables; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $tableId => $tableData): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <div class="mb-2">
                                                <strong><?php echo e($tableData['table_name']); ?>:</strong>
                                                <?php $__currentLoopData = $tableData['users']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                    <?php echo e($user->name); ?><?php echo e($index < count($tableData['users']) - 1 ? ',' : ''); ?>

                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            </div>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </td>
                                    <td class="text-center">
                                        <a href="<?php echo e(route('history.show', $date)); ?>" class="btn btn-sm btn-outline-primary">
                                            <i class="fas fa-eye"></i> View
                                        </a>
                                    </td>
                                </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </tbody>
                    </table>
                </div>
            <?php else: ?>
                <div class="alert alert-info">
                    No mapping history found. Please adjust your filter criteria or create some daily mappings first.
                </div>
            <?php endif; ?>
        </div>
    </div>
</section>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /opt/homebrew/var/www/iproduction/resources/views/history/index.blade.php ENDPATH**/ ?>