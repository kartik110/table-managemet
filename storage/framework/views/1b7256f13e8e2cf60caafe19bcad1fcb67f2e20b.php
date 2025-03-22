

<?php $__env->startSection('script_top'); ?>
    <?php
    $baseURL = getBaseURL();
    $setting = getSettingsInfo();
    ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>

    <section class="main-content-wrapper">
        <section class="content-header">
            <h3 class="top-left-header">
                <?php echo e(isset($title) && $title ? $title : ''); ?>

            </h3>
        </section>


        <div class="box-wrapper">
            <div class="table-box">
                <!-- form start -->
                <?php echo Form::model(isset($obj) && $obj ? $obj : '', [
                    'id' => 'purchase_form',
                    'method' => isset($obj) && $obj ? 'PATCH' : 'POST',
                    'route' => ['rmwastes.update', isset($obj->id) && $obj->id ? $obj->id : ''],
                ]); ?>

                <?php echo csrf_field(); ?>
                <div>
                    <div class="row">
                        <div class="col-sm-12 mb-2 col-md-4">
                            <div class="form-group">
                                <label><?php echo app('translator')->get('index.reference_no'); ?> <span class="required_star">*</span></label>
                                <input type="text" name="reference_no" id="reference_no"
                                    class="check_required form-control <?php $__errorArgs = ['reference_no'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" readonly
                                    placeholder="Reference No"
                                    value="<?php echo e(isset($obj->reference_no) ? $obj->reference_no : $ref_no); ?>">
                            </div>
                            <?php $__errorArgs = ['reference_no'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                <div class="text-danger"><?php echo e($message); ?></div>
                            <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                        </div>
                        <div class="col-sm-12 col-md-6 mb-2 col-lg-4">
                            <div class="form-group">
                                <label><?php echo app('translator')->get('index.date'); ?> <span class="required_star">*</span></label>
                                <input type="text" name="date" id="date"
                                    class="form-control <?php $__errorArgs = ['date'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> customDatepicker" readonly
                                    placeholder="Date"
                                    value="<?php echo e(isset($obj->date) ? $obj->date : old('date')); ?>">
                                <p class="text-danger d-none" id="date_error"></p>
                                <?php $__errorArgs = ['date'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                    <div class="text-danger"><?php echo e($message); ?></div>
                                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                            </div>
                        </div>

                        <div class="col-sm-12 mb-2 col-md-4">

                            <div class="form-group">
                                <label><?php echo app('translator')->get('index.responsible_person'); ?> <span class="required_star">*</span></label>
                                <select name="responsible_person" id="res_person"
                                    class="form-control <?php $__errorArgs = ['responsible_person'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> select2">
                                    <option value=""><?php echo app('translator')->get('index.select'); ?></option>
                                    <?php $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($value->id); ?>"
                                            <?php echo e((isset($obj->responsible_person) && $obj->responsible_person) || old('responsible_person') == $value->id ? 'selected' : ''); ?>>
                                            <?php echo e($value->name); ?> (<?php echo e($value->phone_number); ?>)</option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>                                
                            </div>
                            <p class="text-danger d-none" id="responsible_person_error"></p>
                            <?php $__errorArgs = ['responsible_person'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                <div class="text-danger"><?php echo e($message); ?></div>
                            <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-sm-12 mb-2 col-md-4">
                            <div class="form-group">
                                <label><?php echo app('translator')->get('index.raw_material'); ?> <span class="required_star">*</span> (<?php echo app('translator')->get('index.only_stock_available_are_listed'); ?>)</label>
                                <select
                                    class="form-control <?php $__errorArgs = ['rmaterial'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> select2 select2-hidden-accessible"
                                    name="rmaterial" id="rmaterial">
                                    <option value=""><?php echo app('translator')->get('index.select'); ?></option>
                                    <?php $__currentLoopData = $rmaterials; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $rm): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <?php if($rm->current_stock > 0): ?>
                                            <?php
                                                $last_p_price = getLastThreePurchasePrice($rm->id);
                                                $option_value = $rm->id . '|' . $rm->name . ' (' . $rm->code . ')|' . $rm->name . '|' . $last_p_price . '|' . getPurchaseUnitByRMID($rm->id) . '|' . $setting->currency . '|' . $rm->current_stock . '|' . $rm->current_stock_final . '|' . getTotalFloatingStockRawMaterial($rm->id) . '|' . $rm->consumption_check ;
                                            ?>
                                            <option value="<?php echo e($option_value); ?>"><?php echo e($rm->name . '(' . $rm->code . ')'); ?></option>
                                        <?php endif; ?>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>

                                <?php $__errorArgs = ['rmaterial'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                    <div class="text-danger"><?php echo e($message); ?></div>
                                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive" id="purchase_cart">                                
                                <table class="table">
                                    <thead>
                                        <th class="w-5 text-start"><?php echo app('translator')->get('index.sn'); ?></th>
                                        <th class="w-30"><?php echo app('translator')->get('index.raw_material'); ?>(<?php echo app('translator')->get('index.code'); ?>)</th>
                                        <th class="w-20"></th>
                                        <th class="w-20"><?php echo app('translator')->get('index.quantity'); ?></th>
                                        <th class="w-20"><?php echo app('translator')->get('index.loss_amount'); ?>
                                            <i class="fa fa-question-circle" data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                title="Calcualted based on Average of Rate Per Unit of Last 3 or 2 Purchase Price or Rate Per Unit in Material profile"></i>
                                            
                                        </th>
                                        <th class="w-5 ir_txt_center"><?php echo app('translator')->get('index.actions'); ?></th>
                                    </thead>
                                    <tbody class="add_tr">                                        
                                        <?php if(isset($pruchse_rmaterials) && $pruchse_rmaterials): ?>
                                            <?php $__currentLoopData = $pruchse_rmaterials; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <tr class="rowCount" data-id="<?php echo e($value->rmaterials_id); ?>">
                                                    <td class="width_1_p ir_txt_center">
                                                        <p class="set_sn"></p>
                                                    </td>
                                                    <td><input type="hidden" value="<?php echo e($value->rmaterials_id); ?>"
                                                            name="rm_id[]"> <span
                                                            class="name_id_<?php echo e($value->rmaterials_id); ?>"><?php echo e(getRMName($value->rmaterials_id)); ?></span>
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <input type="hidden" tabindex="5" name="unit_price[]"
                                                            onfocus="this.select();"
                                                            class="check_required form-control <?php $__errorArgs = ['unit_price'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> integerchk input_aligning unit_price_c cal_row"
                                                            placeholder="Unit Price" value="<?php echo e($value->loss_amount); ?>"
                                                            id="unit_price_1">
                                                        <div class="input-group">
                                                            <input type="number" data-countid="1" tabindex="51"
                                                                id="qty_1" name="quantity_amount[]"
                                                                onfocus="this.select();"
                                                                class="check_required form-control <?php $__errorArgs = ['quantity_amount'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> integerchk aligning qty_c cal_row"
                                                                value="<?php echo e($value->waste_amount); ?>"
                                                                data-stock="<?php echo e($value->waste_amount + getCurrentStock($value->rmaterials_id)); ?>"
                                                                data-unit="<?php echo e(getPurchaseUnitByRMID($value->rmaterials_id)); ?>"
                                                                placeholder="Qty/Amount">
                                                            <span
                                                                class="input-group-text"><?php echo e(getPurchaseUnitByRMID($value->rmaterials_id)); ?></span>
                                                        </div>

                                                    </td>

                                                    <td>
                                                        <div class="input-group">
                                                            <input type="number" onfocus="select();" id="total_1"
                                                                name="total[]"
                                                                class="form-control <?php $__errorArgs = ['total'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> input_aligning total_c cal_total"
                                                                value="<?php echo e($value->loss_amount); ?>" placeholder="Total">
                                                            <span class="input-group-text"><?php echo e($setting->currency); ?></span>
                                                        </div>
                                                    </td>

                                                    <td class="ir_txt_center"><a
                                                            class="remove_this_tax_row del_row dlt_button"><iconify-icon
                                                                icon="solar:trash-bin-minimalistic-broken"></iconify-icon>
                                                        </a></td>
                                                </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        <?php endif; ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td class="w-5"></td>
                                        <td class="w-30"></td>
                                        <td class="w-20"></td>
                                        <td class="w-20"></td>
                                        <td class="w-20">
                                            <label><?php echo app('translator')->get('index.g_total'); ?> <span class="required_star">*</span></label>
                                            <div class="input-group">
                                                <input type="text" name="grand_total" id="grand_total"
                                                    class="form-control <?php $__errorArgs = ['title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" readonly
                                                    placeholder="G.Total"
                                                    value="<?php echo e(isset($obj->grand_total) ? $obj->grand_total : (isset($subtotal_shoratage) ? $subtotal_shoratage : null)); ?>">
                                                <span class="input-group-text"><?php echo e($setting->currency); ?></span>
                                            </div>
                                        </td>
                                        <td class="w-5 text-end"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label><?php echo app('translator')->get('index.note'); ?></label>
                                <textarea name="note" id="note" class="form-control <?php $__errorArgs = ['note'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" placeholder="Note"
                                    rows="3"><?php echo e(isset($obj->note) ? $obj->note : old('note')); ?></textarea>
                                <?php $__errorArgs = ['note'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                    <div class="text-danger"><?php echo e($message); ?></div>
                                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->

                <div class="row mt-2">
                    <div class="col-sm-12 col-md-6 mb-2 d-flex gap-3">
                        <button type="submit" name="submit" value="submit" class="btn bg-blue-btn"><iconify-icon
                                icon="solar:check-circle-broken"></iconify-icon><?php echo app('translator')->get('index.submit'); ?></button>
                        <a class="btn bg-second-btn" href="<?php echo e(route('rmwastes.index')); ?>"><iconify-icon
                                icon="solar:round-arrow-left-broken"></iconify-icon><?php echo app('translator')->get('index.back'); ?></a>
                    </div>
                </div>
                <?php echo Form::close(); ?>

            </div>
        </div>
    </section>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>
    <?php
    $baseURL = getBaseURL();
    ?>
    <script type="text/javascript" src="<?php echo $baseURL . 'frequent_changing/js/addRMWaste.js'; ?>"></script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /opt/homebrew/var/www/iproduction/resources/views/pages/rmwaste/addEditRmwaste.blade.php ENDPATH**/ ?>