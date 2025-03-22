<?php $__env->startSection('content'); ?>
<section class="main-content-wrapper">
    <?php echo $__env->make('utilities.messages', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <section class="content-header">
            <h1>Table Mapping for <?php echo e($date->format('d M Y')); ?></h1>
            <div>
                <a href="<?php echo e(route('history.index')); ?>" class="btn btn-outline-secondary">
                    <i class="fas fa-arrow-left me-2"></i> Back to History
                </a>
            </div>
    </section>


    <div class="box-wrapper">
        <div class="card-body">
            <ul class="nav nav-tabs" id="floorTabs" role="tablist">
                <?php $__currentLoopData = $tables->keys(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $floor): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <li class="nav-item" role="presentation">
                    <button class="nav-link <?php echo e($index === 0 ? 'active' : ''); ?>" 
                            id="<?php echo e(Str::slug($floor)); ?>-tab" 
                            data-bs-toggle="tab" 
                            data-bs-target="#<?php echo e(Str::slug($floor)); ?>" 
                            type="button" 
                            role="tab" 
                            aria-controls="<?php echo e(Str::slug($floor)); ?>" 
                            aria-selected="<?php echo e($index === 0 ? 'true' : 'false'); ?>">
                        <?php echo e($floor); ?>

                    </button>
                </li>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </ul>
            
            <div class="tab-content p-3" id="floorTabsContent">
                <?php $__currentLoopData = $tables->keys(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $floor): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="tab-pane fade <?php echo e($index === 0 ? 'show active' : ''); ?>" 
                     id="<?php echo e(Str::slug($floor)); ?>" 
                     role="tabpanel" 
                     aria-labelledby="<?php echo e(Str::slug($floor)); ?>-tab">
                    
                    <div class="floor-container">
                        <h2 class="mb-4"><?php echo e($floor); ?></h2>
                        
                        <div class="row g-4">
                            <?php $__currentLoopData = $tables[$floor]; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $table): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <div class="col-md-6 col-lg-4">
                                <div class="table-card">
                                    <div class="table-title"><?php echo e($table->name); ?></div>
                                    <div class="user-container">
                                        <?php if(isset($usersByTable[$table->id])): ?>
                                            <?php $__currentLoopData = $usersByTable[$table->id]; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <div class="user-item">
                                                <?php echo e($user->name); ?>

                                            </div>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        <?php else: ?>
                                            <div class="text-muted fst-italic">No users assigned</div>
                                        <?php endif; ?>
                                    </div>
                                </div>
                            </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                    </div>
                </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
        </div>
    </div>
</section>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('styles'); ?>
<style>
    .floor-container {
        margin-bottom: 2rem;
    }
    
    .table-card {
        border: 1px solid #dee2e6;
        border-radius: 0.5rem;
        padding: 1rem;
        height: 100%;
        background-color: white;
    }
    
    .table-title {
        font-weight: 600;
        font-size: 1.1rem;
        margin-bottom: 1rem;
    }
    
    .user-item {
        padding: 0.5rem;
        margin-bottom: 0.5rem;
        border: 1px solid #dee2e6;
        border-radius: 0.375rem;
        background-color: white;
    }
    
    .user-container {
        min-height: 100px;
    }
    
    .nav-tabs .nav-link.active {
        font-weight: 600;
    }
</style>
<?php $__env->stopPush(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /opt/homebrew/var/www/iproduction/resources/views/history/show.blade.php ENDPATH**/ ?>