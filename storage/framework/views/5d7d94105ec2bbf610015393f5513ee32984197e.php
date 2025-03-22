<?php
    $orderType = isset($customerOrder->order_type) && $customerOrder->order_type ? $customerOrder->order_type : '';
?>
<input type="hidden" name="currency" id="only_currency_sign" value=<?php echo e(getCurrencyOnly()); ?>>
<div>
    <div class="row">
        <div class="col-sm-12 mb-2 col-md-4">
            <div class="form-group">
                <label><?php echo app('translator')->get('index.reference_no'); ?> <span class="required_star">*</span></label>

                <input type="text" name="reference_no" id="code"
                    class="check_required form-control <?php $__errorArgs = ['reference_no'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                    placeholder="<?php echo e(__('index.reference_no')); ?>"
                    value="<?php echo e(isset($customerOrder->reference_no) ? $customerOrder->reference_no : $ref_no); ?>"
                    onfocus="select()" readonly>
                <div class="text-danger d-none"></div>
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
        </div>


        <div class="col-sm-12 mb-2 col-md-4">
            <div class="form-group">
                <label><?php echo app('translator')->get('index.customer'); ?> <span class="required_star">*</span></label>
                <select name="customer_id" id="customer_id"
                    class="form-control <?php $__errorArgs = ['customer_id'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> select2" placeholder="Please Select">
                    <?php $__currentLoopData = $customers; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $customer): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <?php
                        $customer_id = $key;
                        ?>
                        <option value="<?php echo e($key); ?>"
                            <?php echo e(isset($customerOrder->customer_id) && $customerOrder->customer_id == $customer_id ? 'selected' : ''); ?>>
                            <?php echo e($customer); ?></option>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </select>
                <div class="text-danger d-none"></div>
                <?php $__errorArgs = ['customer_id'];
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
                <label><?php echo app('translator')->get('index.type'); ?> <span class="required_star">*</span></label>

                <select name="order_type" id="order_type"
                    class="form-control <?php $__errorArgs = ['order_type'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> select2" placeholder="Please Select">
                    <?php $__currentLoopData = $orderTypes; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $orderType): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <option value="<?php echo e($key); ?>"
                            <?php echo e(isset($customerOrder->order_type) && $customerOrder->order_type == $key ? 'selected' : ''); ?>>
                            <?php echo e($orderType); ?></option>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </select>
                <div class="text-danger d-none"></div>
                <?php $__errorArgs = ['order_type'];
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

        <div class="clearfix"></div>

        <div class="col-sm-12 col-md-6 mb-2 col-lg-4">
            <div class="form-group">
                <label><?php echo app('translator')->get('index.delivery_date'); ?> <span class="required_star">*</span></label>
                <input type="text" name="delivery_date" id="delivery_date"
                    class="form-control <?php $__errorArgs = ['delivery_date'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> customDatepicker" readonly
                    placeholder="Delivery Date"
                    value="<?php echo e(isset($customerOrder->delivery_date) ? $customerOrder->delivery_date : old('delivery_date')); ?>">
                <div class="text-danger d-none"></div>
                <?php $__errorArgs = ['delivery_date'];
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

        <div class="col-sm-12 col-md-6 mb-2 col-lg-8">
            <div class="form-group">
                <label><?php echo app('translator')->get('index.delivery_address'); ?></label>

                <input type="text" name="delivery_address" id="delivery_address"
                    class="form-control <?php $__errorArgs = ['delivery_address'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                    placeholder="<?php echo e(__('index.delivery_address')); ?>"
                    value="<?php echo e(isset($customerOrder->delivery_address) ? $customerOrder->delivery_address : old('delivery_address')); ?>">
                <div class="text-danger d-none"></div>
                <?php $__errorArgs = ['delivery_address'];
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
            <div class="table-responsive" id="fprm">
                <table class="table">
                    <thead>
                        <tr>
                            <th class="w-50-p"><?php echo app('translator')->get('index.sn'); ?></th>
                            <th class="w-220-p"><?php echo app('translator')->get('index.product'); ?></th>
                            <th class="w-220-p"><?php echo app('translator')->get('index.quantity'); ?></th>
                            <th class="w-220-p"><?php echo app('translator')->get('index.unit_price'); ?></th>
                            <th class="w-220-p"><?php echo app('translator')->get('index.discount'); ?></th>
                            <th class="w-220-p"><?php echo app('translator')->get('index.subtotal'); ?></th>
                            <th class="w-220-p"><?php echo app('translator')->get('index.cost'); ?></th>
                            <th class="w-220-p"><?php echo app('translator')->get('index.profit'); ?></th>
                            <th class="w-220-p"><?php echo app('translator')->get('index.delivery_date'); ?></th>
                            <th class="w-220-p"><?php echo app('translator')->get('index.production_status'); ?></th>
                            <th class="w-220-p"><?php echo app('translator')->get('index.delivered'); ?></th>
                            <th class="ir_txt_center"><?php echo app('translator')->get('index.actions'); ?></th>
                        </tr>
                    </thead>
                    <tbody class="add_trm">
                        <?php $i = 0; ?>
                        <?php if(isset($orderDetails) && $orderDetails): ?>
                            <?php $__currentLoopData = $orderDetails; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <?php $i++; ?>
                                <tr class="rowCount" data-id="<?php echo e($value->id); ?>">
                                    <td class="width_1_p ir_txt_center"><?php echo e($i); ?></td>

                                    <td>
                                        <select name="product[]" id="fproduct_id_<?php echo e($i); ?>"
                                            class="form-control <?php $__errorArgs = ['title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> fproduct_id select2">
                                            <option value=""><?php echo app('translator')->get('index.please_select'); ?></option>
                                            <?php $__currentLoopData = $productList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <option value="<?php echo e($product->id); ?>" <?php if($product->id == $value->product_id): echo 'selected'; endif; ?>>
                                                    <?php echo e($product->name); ?>

                                                </option>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </select>
                                    </td>

                                    <td>
                                        <input type="number" name="quantity[]" onfocus="this.select();"
                                            class="check_required form-control <?php $__errorArgs = ['title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> integerchk quantity_c"
                                            placeholder="Quantity" value="<?php echo e($value->quantity); ?>"
                                            id="quantity_<?php echo e($i); ?>">
                                    </td>

                                    <td>
                                        <div class="input-group">
                                            <input type="text" name="unit_price[]" onfocus="this.select();"
                                                class="check_required form-control <?php $__errorArgs = ['title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> integerchk unit_price_c"
                                                placeholder="Unit Price" value="<?php echo e($value->unit_price); ?>"
                                                id="unit_price_<?php echo e($i); ?>">
                                            <span class="input-group-text"> <?php echo e($setting->currency); ?></span>
                                        </div>
                                    </td>

                                    <td>
                                        <div class="input-group">
                                            <input type="text" id="discount_percent_<?php echo e($i); ?>"
                                                name="discount_percent[]" onfocus="this.select();"
                                                class="check_required form-control <?php $__errorArgs = ['title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> integerchk discount_percent_c"
                                                value="<?php echo e($value->discount_percent); ?>" placeholder="Discount">
                                            <span class="input-group-text">%</span>
                                        </div>
                                    </td>

                                    <td>
                                        <div class="input-group">
                                            <input type="number" id="sub_total_<?php echo e($i); ?>"
                                                name="sub_total[]"
                                                class="form-control <?php $__errorArgs = ['title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> sub_total_c"
                                                value="<?php echo e($value->sub_total); ?>" placeholder="Subtotal"
                                                readonly="">
                                            <span class="input-group-text"> <?php echo e($setting->currency); ?></span>
                                        </div>
                                    <td>
                                        <div class="input-group">
                                            <input type="number" id="cost_<?php echo e($i); ?>" name="cost[]"
                                                class="form-control <?php $__errorArgs = ['title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> cost_c"
                                                value="<?php echo e($value->total_cost); ?>" placeholder="Cost" readonly="">
                                            <span class="input-group-text"> <?php echo e($setting->currency); ?></span>
                                        </div>
                                    </td>

                                    <td>
                                        <div class="input-group">
                                            <input type="number" id="profit_<?php echo e($i); ?>" name="profit[]"
                                                class="form-control <?php $__errorArgs = ['title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> profit_c"
                                                value="<?php echo e($value->profit); ?>" placeholder="Profit" readonly="">
                                            <span class="input-group-text"> <?php echo e($setting->currency); ?></span>
                                        </div>
                                    </td>
                                    <td>
                                        <?php echo Form::text('delivery_date_product[]', $value->delivery_date, [
                                            'class' => 'form-control customDatepicker',
                                            'placeholder' => 'Delivery Date',
                                        ]); ?>

                                    </td>
                                    <td>
                                        <select name="status[]" id="fstatus_id_<?php echo e($i); ?>"
                                            class="form-control <?php $__errorArgs = ['title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> fstatus_id select2">
                                            <option value="none" <?php echo e($value->status == 'none' ? 'selected' : ''); ?>>
                                                <?php echo app('translator')->get('index.none'); ?>
                                            </option>
                                            <option value="in_progress"
                                                <?php echo e($value->status == 'in_progress' ? 'selected' : ''); ?>>
                                                <?php echo app('translator')->get('index.in_progress'); ?>
                                            </option>
                                            <option value="done" <?php echo e($value->status == 'done' ? 'selected' : ''); ?>>
                                                <?php echo app('translator')->get('index.done'); ?>
                                            </option>
                                        </select>
                                    </td>
                                    <td>
                                        <input type="number" name="delivered_qty[]"
                                            class="check_required form-control <?php $__errorArgs = ['title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> integerchk"
                                            placeholder="<?php echo app('translator')->get('index.delivered'); ?>" value="<?php echo e($value->delivered_qty); ?>"
                                            id="delivered_<?php echo e($i); ?>">
                                    </td>
                                    <td class="ir_txt_center"><a class="btn btn-xs del_row dlt_button"><iconify-icon
                                                icon="solar:trash-bin-minimalistic-broken"></iconify-icon></a></td>
                                </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        <?php endif; ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th colspan="5">Total</th>
                            <th>
                                <div class="input-group">
                                    <input type="number" name="total_subtotal" id="total_subtotal"
                                        value="<?php echo e(isset($customerOrder->total_amount) ? $customerOrder->total_amount : 0); ?>"
                                        class="form-control input_aligning" placeholder="<?php echo app('translator')->get('index.total'); ?>"
                                        readonly="">
                                    <span class="input-group-text"> <?php echo e($setting->currency); ?></span>
                                </div>
                            </th>
                            <th>
                                <div class="input-group">
                                    <input type="number" name="total_cost" id="total_cost"
                                        value="<?php echo e(isset($customerOrder->total_cost) ? $customerOrder->total_cost : 0); ?>"
                                        class="form-control input_aligning" placeholder="<?php echo app('translator')->get('index.cost'); ?>"
                                        readonly="">
                                    <span class="input-group-text"> <?php echo e($setting->currency); ?></span>
                                </div>
                            </th>
                            <th>
                                <div class="input-group">
                                    <input type="number" name="total_profit" id="total_profit"
                                        value="<?php echo e(isset($customerOrder->total_profit) ? $customerOrder->total_profit : 0); ?>"
                                        class="form-control input_aligning" placeholder="<?php echo app('translator')->get('index.profit'); ?>"
                                        readonly="">
                                    <span class="input-group-text"> <?php echo e($setting->currency); ?></span>
                                </div>
                            </th>
                        </tr>
                    </tfoot>
                </table>
                <button id="finishProduct" class="btn bg-blue-btn w-10" type="button"><?php echo app('translator')->get('index.add_more'); ?></button>
            </div>
        </div>
    </div>
    <div class="row mt-2 gap-2">
        <button class="btn bg-blue-btn w-20 stockCheck" data-bs-toggle="modal" data-bs-target="#stockCheck"
            type="button"><?php echo app('translator')->get('index.check_stock'); ?></button>
        <button class="btn bg-blue-btn w-20 estimateCost" data-bs-toggle="modal" data-bs-target="#estimateCost"
            type="button"><?php echo app('translator')->get('index.estimate_cost_date'); ?></button>
    </div>

    <div class="row mt-3 <?php echo e(isset($orderInvoice) && count($orderInvoice) > 0 ? '' : 'd-none'); ?>"
        id="invoice_quotations_sections">
        <div class="col-md-12">
            <h4 class="header_right"><?php echo app('translator')->get('index.invoice_quotations'); ?></h4>

            <div class="table-responsive" id="fprm">
                <table class="table">
                    <thead>
                        <tr>
                            <th class="width_1_p"><?php echo app('translator')->get('index.sn'); ?></th>
                            <th class="width_10_p"><?php echo app('translator')->get('index.type'); ?></th>
                            <th class="width_20_p"><?php echo app('translator')->get('index.date'); ?></th>
                            <th class="width_20_p"><?php echo app('translator')->get('index.amount'); ?></th>
                            <th class="width_20_p"><?php echo app('translator')->get('index.paid'); ?></th>
                            <th class="width_20_p"><?php echo app('translator')->get('index.due'); ?></th>
                            <th class="width_20_p"><?php echo app('translator')->get('index.order_due'); ?></th>
                            <th class="width_3_p ir_txt_center"><?php echo app('translator')->get('index.actions'); ?></th>
                        </tr>
                    </thead>
                    <tbody class="add_order_inv">
                        <?php $i = 0; ?>
                        <?php if(isset($orderInvoice) && $orderInvoice): ?>
                            <?php $__currentLoopData = $orderInvoice; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <?php $i++; ?>
                                <tr class="rowCount" data-id="<?php echo e($value->id); ?>">
                                    <td class="width_1_p ir_txt_center"><?php echo e($i); ?></td>
                                    <td>
                                        <select name="invoice_type[]" id="invoice_type_<?php echo e($i); ?>"
                                            class="form-control <?php $__errorArgs = ['title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> invoice_type select2">
                                            <option value="Invoice"
                                                <?php echo e($value->invoice_type == 'Invoice' ? 'selected' : ''); ?>>
                                                <?php echo app('translator')->get('index.invoice'); ?>
                                            </option>
                                            <option value="Quotation"
                                                <?php echo e($value->invoice_type == 'Quotation' ? 'selected' : ''); ?>>
                                                <?php echo app('translator')->get('index.quotation'); ?>
                                            </option>
                                        </select>
                                    </td>
                                    <td>
                                        <?php echo Form::text('invoice_date[]', $value->invoice_date, [
                                            'class' => 'form-control customDatepicker',
                                            'placeholder' => 'Invoice Date',
                                        ]); ?>

                                    </td>
                                    <td>
                                        <div class="input-group">
                                            <input type="number" id="invoice_amount_<?php echo e($i); ?>"
                                                name="invoice_amount[]"
                                                class="form-control <?php $__errorArgs = ['title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> invoice_amount_c"
                                                value="<?php echo e($value->invoice_amount); ?>" placeholder="Amount">
                                            <span class="input-group-text"> <?php echo e($setting->currency); ?></span>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="input-group">
                                            <input type="number" id="paid_amount_<?php echo e($i); ?>"
                                                name="invoice_paid[]"
                                                class="form-control <?php $__errorArgs = ['title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> paid_amount_c"
                                                value="<?php echo e($value->paid_amount); ?>" placeholder="Paid">
                                            <span class="input-group-text"> <?php echo e($setting->currency); ?></span>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="input-group">
                                            <input type="number" id="due_amount_<?php echo e($i); ?>"
                                                name="invoice_due[]"
                                                class="form-control <?php $__errorArgs = ['title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> due_amount_c"
                                                value="<?php echo e($value->due_amount); ?>" placeholder="Due">
                                            <span class="input-group-text"> <?php echo e($setting->currency); ?></span>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="input-group">
                                            <input type="number" id="order_due_amount_<?php echo e($i); ?>"
                                                name="invoice_order_due[]"
                                                class="form-control <?php $__errorArgs = ['title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> order_due_amount_c"
                                                value="<?php echo e($value->order_due_amount); ?>" placeholder="Order Due">
                                            <span class="input-group-text"> <?php echo e($setting->currency); ?></span>
                                        </div>
                                    </td>
                                    <td class="ir_txt_center">
                                        <?php if($value->invoice_type !== 'Quotation' && $loop->index !== 0): ?>
                                            <a class="btn btn-xs del_inv_row dlt_button"><iconify-icon
                                                    icon="solar:trash-bin-minimalistic-broken"></iconify-icon>
                                            </a>
                                        <?php endif; ?>

                                    </td>
                                </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        <?php endif; ?>
                    </tbody>
                </table>
                <button id="orderInvoices" class="btn bg-blue-btn w-10 mt-2" data-bs-toggle="modal"
                    data-bs-target="#invoiceModal" type="button"
                    <?php echo e($orderType == 'Quotation' ? 'disabled' : ''); ?>><?php echo app('translator')->get('index.add_more'); ?></button>
            </div>
        </div>
    </div>

    <div class="row mt-3" id="deliveries_section">
        <div class="col-md-12">
            <h4 class="header_right"><?php echo app('translator')->get('index.deliveries'); ?></h4>

            <div class="table-responsive <?php echo e(isset($orderDeliveries) && count($orderDeliveries) > 0 ? '' : 'd-none'); ?>"
                id="fprm">
                <table class="table">
                    <thead>
                        <tr>
                            <th class="width_1_p"><?php echo app('translator')->get('index.sn'); ?></th>
                            <th class="width_10_p"><?php echo app('translator')->get('index.product'); ?></th>
                            <th class="width_20_p"><?php echo app('translator')->get('index.quantity'); ?></th>
                            <th class="width_20_p"><?php echo app('translator')->get('index.date'); ?></th>
                            <th class="width_20_p"><?php echo app('translator')->get('index.status'); ?></th>
                            <th class="width_20_p"><?php echo app('translator')->get('index.note'); ?></th>
                            <th class="width_3_p ir_txt_center"><?php echo app('translator')->get('index.actions'); ?></th>
                        </tr>
                    </thead>
                    <tbody class="add_deliveries">
                        <?php $i = 0; ?>
                        <?php if(isset($orderDeliveries) && $orderDeliveries): ?>
                            <?php $__currentLoopData = $orderDeliveries; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <?php $i++; ?>
                                <tr class="rowCount" data-id="<?php echo e($value->id); ?>">
                                    <td class="width_1_p ir_txt_center"><?php echo e($i); ?></td>
                                    <td>
                                        <input type="hidden" name="delivaries_product[]"
                                            value="<?php echo e($value->product_id); ?>">
                                        <input type="text" name="delivaries_product[]" onfocus="this.select();"
                                            class="check_required form-control <?php $__errorArgs = ['title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> delivery_product_c"
                                            placeholder="Product"
                                            value="<?php echo e(getProductNameById($value->product_id)); ?>"
                                            id="delivery_product_<?php echo e($i); ?>" readonly>
                                    </td>
                                    <td>
                                        <input type="number" name="delivaries_quantity[]" onfocus="this.select();"
                                            class="check_required form-control <?php $__errorArgs = ['title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> integerchk delivery_quantity_c"
                                            placeholder="Quantity" value="<?php echo e($value->quantity); ?>"
                                            id="delivery_quantity_<?php echo e($i); ?>">
                                    </td>
                                    <td>
                                        <?php echo Form::text('delivaries_date[]', $value->delivery_date, [
                                            'class' => 'form-control customDatepicker',
                                            'placeholder' => 'Delivery Date',
                                        ]); ?>

                                    </td>
                                    <td>
                                        <select name="delivaries_status[]" id="delivery_status_<?php echo e($i); ?>"
                                            class="form-control <?php $__errorArgs = ['title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> delivery_status select2">
                                            <option value="none" <?php echo e($value->status == 'none' ? 'selected' : ''); ?>>
                                                <?php echo app('translator')->get('index.none'); ?>
                                            </option>
                                            <option value="in_progress"
                                                <?php echo e($value->status == 'in_progress' ? 'selected' : ''); ?>>
                                                <?php echo app('translator')->get('index.in_progress'); ?>
                                            </option>
                                            <option value="done" <?php echo e($value->status == 'done' ? 'selected' : ''); ?>>
                                                <?php echo app('translator')->get('index.done'); ?>
                                            </option>
                                        </select>
                                    </td>
                                    <td>
                                        <input type="text" name="delivaries_note[]" onfocus="this.select();"
                                            class="check_required form-control <?php $__errorArgs = ['title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> delivery_note_c"
                                            placeholder="Note" value="<?php echo e($value->delivery_note); ?>"
                                            id="delivery_note_<?php echo e($i); ?>">
                                    </td>
                                    <td class="ir_txt_center">
                                        <a class="btn btn-xs del_del_row dlt_button"><iconify-icon
                                                icon="solar:trash-bin-minimalistic-broken"></iconify-icon>
                                        </a>
                                    </td>
                                </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
            <button id="orderDeliveries" class="btn bg-blue-btn w-10 mt-2" data-bs-toggle="modal"
                data-bs-target="#deliveryModal" type="button"><?php echo app('translator')->get('index.add_more'); ?></button>
        </div>
    </div>


    <div class="row mt-3">
        <div class="col-sm-6 col-md-6 mb-2">
            <div class="form-group">
                <label><?php echo app('translator')->get('index.quotation_note'); ?></label>
                <textarea name="quotation_note" id="quotation_note" class="form-control <?php $__errorArgs = ['title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                    placeholder="<?php echo e(__('index.quotation_note')); ?>" rows="3"></textarea>
            </div>
        </div>

        <div class="col-sm-6 col-md-6 mb-2">
            <div class="form-group">
                <label><?php echo app('translator')->get('index.internal_note'); ?></label>
                <textarea name="internal_note" id="internal_note" class="form-control <?php $__errorArgs = ['title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                    placeholder="<?php echo e(__('index.internal_note')); ?>" rows="3"></textarea>
            </div>
        </div>
    </div>


    <div class="row mt-2">
        <div class="col-sm-12 col-md-6 mb-2 d-flex gap-3">
            <button type="submit" name="submit" value="submit"
                class="btn bg-blue-btn order_submit_button"><iconify-icon
                    icon="solar:check-circle-broken"></iconify-icon><?php echo app('translator')->get('index.submit'); ?></button>
            <a class="btn bg-second-btn" href="<?php echo e(route('customer-orders.index')); ?>"><iconify-icon
                    icon="solar:round-arrow-left-broken"></iconify-icon><?php echo app('translator')->get('index.back'); ?></a>
        </div>
    </div>
</div>

<select id="hidden_product" class="display_none">
    <?php $__currentLoopData = $productList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <option value="<?php echo e($value->id ?? ''); ?>"><?php echo e($value->name ?? ''); ?></option>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
</select>
<input type="hidden" id="default_currency" value="<?php echo e($setting->currency); ?>" />
<?php /**PATH /opt/homebrew/var/www/iproduction/resources/views/pages/customer_order/_form.blade.php ENDPATH**/ ?>