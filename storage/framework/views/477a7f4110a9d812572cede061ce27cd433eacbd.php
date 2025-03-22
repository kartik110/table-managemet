<?php $__env->startPush('styles'); ?>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
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
        background-color: rgba(139, 92, 246, 0.1);
        cursor: move;
    }
    
    .user-container {
        min-height: 100px;
    }
    
    .table-card.drag-over {
        background-color: rgba(13, 110, 253, 0.1);
    }
    
    .nav-tabs .nav-link.active {
        font-weight: 600;
    }
</style>
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>
<section class="main-content-wrapper">
    <?php echo $__env->make('utilities.messages', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <section class="content-header">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1>Table Mapping for <?php echo e($date->format('d M Y')); ?></h1>
            <div>
                <input type="date" id="mapping-date" class="form-control" value="<?php echo e($date->format('Y-m-d')); ?>">
            </div>
        </div>
    </section>


    <div class="box-wrapper">
        <div class="card mb-4">
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
                                    <div class="table-card" 
                                         data-table-id="<?php echo e($table->id); ?>" 
                                         ondragover="event.preventDefault();" 
                                         ondrop="dropUser(event, <?php echo e($table->id); ?>)"
                                         ondragenter="this.classList.add('drag-over')"
                                         ondragleave="this.classList.remove('drag-over')">
                                        <div class="table-title"><?php echo e($table->name); ?></div>
                                        <div class="user-container" id="table-<?php echo e($table->id); ?>-users">
                                            <?php if(isset($usersByTable[$table->id])): ?>
                                                <?php $__currentLoopData = $usersByTable[$table->id]; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <div class="user-item" 
                                                     draggable="true" 
                                                     ondragstart="dragUser(event, <?php echo e($user->id); ?>, <?php echo e($table->id); ?>)"
                                                     data-user-id="<?php echo e($user->id); ?>">
                                                    <?php echo e($user->name); ?>

                                                </div>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
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
                
                <div class="d-flex justify-content-end gap-2 mt-4">
                    <button id="reset-button" class="btn btn-outline-secondary">
                        Reset to Default
                    </button>
                    <button id="save-button" class="btn btn-primary">
                        Save Daily Mapping
                    </button>
                </div>
            </div>
        </div>
        
    </div>

</section>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>
<script>
    // Current mappings to track changes
    let currentMappings = {};
    
    // Drag and drop functionality
    function dragUser(event, userId, currentTableId) {
        event.dataTransfer.setData('userId', userId);
        event.dataTransfer.setData('currentTableId', currentTableId);
    }
    
    function dropUser(event, newTableId) {
        event.preventDefault();
        const userId = event.dataTransfer.getData('userId');
        const currentTableId = event.dataTransfer.getData('currentTableId');
        
        if (currentTableId != newTableId) {
            const userElement = document.querySelector(`[data-user-id="${userId}"]`);
            const newTableContainer = document.getElementById(`table-${newTableId}-users`);
            
            if (userElement && newTableContainer) {
                newTableContainer.appendChild(userElement);
                
                // Update mappings
                currentMappings[userId] = newTableId;
            }
        }
        
        event.target.closest('.table-card').classList.remove('drag-over');
    }
    
    // Date change handler
    document.getElementById('mapping-date').addEventListener('change', function() {
        window.location.href = "<?php echo e(route('daily-mapping.index')); ?>?date=" + this.value;
    });
    
    // Save mappings
    document.getElementById('save-button').addEventListener('click', function() {
        const mappings = [];
        
        // Convert currentMappings object to array
        for (const userId in currentMappings) {
            mappings.push({
                user_id: parseInt(userId),
                table_id: currentMappings[userId]
            });
        }
        
        // If no changes, collect current state
        if (mappings.length === 0) {
            document.querySelectorAll('.user-item').forEach(userElement => {
                const userId = userElement.dataset.userId;
                const tableId = userElement.closest('.table-card').dataset.tableId;
                
                mappings.push({
                    user_id: parseInt(userId),
                    table_id: parseInt(tableId)
                });
            });
        }
        
        // Send to server
        fetch("<?php echo e(route('daily-mapping.store')); ?>", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': '<?php echo e(csrf_token()); ?>'
            },
            body: JSON.stringify({
                mappings: mappings,
                date: '<?php echo e($formattedDate); ?>'
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Daily mapping saved successfully!');
                // Reset tracking
                currentMappings = {};
            }
        })
        .catch(error => {
            console.error('Error saving mappings:', error);
            alert('Failed to save mappings. Please try again.');
        });
    });
    
    // Reset to default
    document.getElementById('reset-button').addEventListener('click', function() {
        if (confirm('Are you sure you want to reset to default table assignments?')) {
            fetch("<?php echo e(route('daily-mapping.reset')); ?>", {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '<?php echo e(csrf_token()); ?>'
                },
                body: JSON.stringify({
                    date: '<?php echo e($formattedDate); ?>'
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    window.location.reload();
                }
            })
            .catch(error => {
                console.error('Error resetting mappings:', error);
                alert('Failed to reset mappings. Please try again.');
            });
        }
    });
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /opt/homebrew/var/www/iproduction/resources/views/daily-history/index.blade.php ENDPATH**/ ?>