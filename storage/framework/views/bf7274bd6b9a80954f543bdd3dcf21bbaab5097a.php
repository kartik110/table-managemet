<?php $__env->startSection('content'); ?>
<section class="main-content-wrapper">
    <?php echo $__env->make('utilities.messages', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <section class="content-header">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1>Production Tables</h1>
                <a href="<?php echo e(route('tables.create')); ?>" class="btn btn-primary">
                    <i class="fas fa-plus-circle me-2"></i> Add New Table
                </a>
            </div>
    </section>


    <div class="box-wrapper">
        <div class="card-header">
            <h5 class="card-title mb-0">All Tables</h5>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Table Name</th>
                            <th>Floor</th>
                            <th>Number of Seats</th>
                            <th>Description</th>
                            <th class="text-end">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $__empty_1 = true; $__currentLoopData = $tables; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $table): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                            <tr>
                                <td><?php echo e($table->name); ?></td>
                                <td><?php echo e($table->floor); ?></td>
                                <td><?php echo e($table->seats); ?></td>
                                <td><?php echo e($table->description); ?></td>
                                <td class="text-end">
                                    <div class="btn-group" role="group">
                                        <a href="<?php echo e(route('tables.edit', $table)); ?>" class="btn btn-sm btn-outline-primary">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <form action="<?php echo e(route('tables.destroy', $table)); ?>" method="POST" class="d-inline" onsubmit="return confirm('Are you sure you want to delete this table?');">
                                            <?php echo csrf_field(); ?>
                                            <?php echo method_field('DELETE'); ?>
                                            <button type="submit" class="btn btn-sm btn-outline-danger">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                            <tr>
                                <td colspan="5" class="text-center">No tables found. Create your first table.</td>
                            </tr>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /opt/homebrew/var/www/iproduction/resources/views/tables/index.blade.php ENDPATH**/ ?>