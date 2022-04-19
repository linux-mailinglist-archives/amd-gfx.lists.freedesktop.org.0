Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AB55064D8
	for <lists+amd-gfx@lfdr.de>; Tue, 19 Apr 2022 08:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBDE10E1B2;
	Tue, 19 Apr 2022 06:49:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999FD10E1B2
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 Apr 2022 06:49:25 +0000 (UTC)
Received: from [192.168.0.2] (ip5f5ae90d.dynamic.kabel-deutschland.de
 [95.90.233.13])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 0D03C61CCD785;
 Tue, 19 Apr 2022 08:49:23 +0200 (CEST)
Message-ID: <e159d11b-069d-1c09-40f2-e5438eb9ef5a@molgen.mpg.de>
Date: Tue, 19 Apr 2022 08:49:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 1/2] drm/amdkfd: Fix GWS queue count
Content-Language: en-US
To: David Yat Sin <david.yatsin@amd.com>
References: <20220419013227.2509204-1-david.yatsin@amd.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220419013227.2509204-1-david.yatsin@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Dear David,


Thank you for rerolling the patches.

Am 19.04.22 um 03:32 schrieb David Yat Sin:
> dqm->gws_queue_count and pdd->qpd.mapped_gws_queue need to be updated
> each time the queue gets evicted.
> 
> Fixes: b8020b0304c8 ("drm/amdkfd: Enable over-subscription with >1 GWS queue")
> 

For the future, no blank line is needed to separate the Fixes tag from 
the rest of the block.


Kind regards,

Paul


> Signed-off-by: David Yat Sin <david.yatsin@amd.com>
> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
>   .../drm/amd/amdkfd/kfd_device_queue_manager.c | 83 +++++++++----------
>   1 file changed, 37 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index acf4f7975850..198672264492 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -130,19 +130,33 @@ void program_sh_mem_settings(struct device_queue_manager *dqm,
>   }
>   
>   static void increment_queue_count(struct device_queue_manager *dqm,
> -			enum kfd_queue_type type)
> +				  struct qcm_process_device *qpd,
> +				  struct queue *q)
>   {
>   	dqm->active_queue_count++;
> -	if (type == KFD_QUEUE_TYPE_COMPUTE || type == KFD_QUEUE_TYPE_DIQ)
> +	if (q->properties.type == KFD_QUEUE_TYPE_COMPUTE ||
> +	    q->properties.type == KFD_QUEUE_TYPE_DIQ)
>   		dqm->active_cp_queue_count++;
> +
> +	if (q->properties.is_gws) {
> +		dqm->gws_queue_count++;
> +		qpd->mapped_gws_queue = true;
> +	}
>   }
>   
>   static void decrement_queue_count(struct device_queue_manager *dqm,
> -			enum kfd_queue_type type)
> +				  struct qcm_process_device *qpd,
> +				  struct queue *q)
>   {
>   	dqm->active_queue_count--;
> -	if (type == KFD_QUEUE_TYPE_COMPUTE || type == KFD_QUEUE_TYPE_DIQ)
> +	if (q->properties.type == KFD_QUEUE_TYPE_COMPUTE ||
> +	    q->properties.type == KFD_QUEUE_TYPE_DIQ)
>   		dqm->active_cp_queue_count--;
> +
> +	if (q->properties.is_gws) {
> +		dqm->gws_queue_count--;
> +		qpd->mapped_gws_queue = false;
> +	}
>   }
>   
>   /*
> @@ -412,7 +426,7 @@ static int create_queue_nocpsch(struct device_queue_manager *dqm,
>   	list_add(&q->list, &qpd->queues_list);
>   	qpd->queue_count++;
>   	if (q->properties.is_active)
> -		increment_queue_count(dqm, q->properties.type);
> +		increment_queue_count(dqm, qpd, q);
>   
>   	/*
>   	 * Unconditionally increment this counter, regardless of the queue's
> @@ -601,13 +615,8 @@ static int destroy_queue_nocpsch_locked(struct device_queue_manager *dqm,
>   		deallocate_vmid(dqm, qpd, q);
>   	}
>   	qpd->queue_count--;
> -	if (q->properties.is_active) {
> -		decrement_queue_count(dqm, q->properties.type);
> -		if (q->properties.is_gws) {
> -			dqm->gws_queue_count--;
> -			qpd->mapped_gws_queue = false;
> -		}
> -	}
> +	if (q->properties.is_active)
> +		decrement_queue_count(dqm, qpd, q);
>   
>   	return retval;
>   }
> @@ -700,12 +709,11 @@ static int update_queue(struct device_queue_manager *dqm, struct queue *q,
>   	 * dqm->active_queue_count to determine whether a new runlist must be
>   	 * uploaded.
>   	 */
> -	if (q->properties.is_active && !prev_active)
> -		increment_queue_count(dqm, q->properties.type);
> -	else if (!q->properties.is_active && prev_active)
> -		decrement_queue_count(dqm, q->properties.type);
> -
> -	if (q->gws && !q->properties.is_gws) {
> +	if (q->properties.is_active && !prev_active) {
> +		increment_queue_count(dqm, &pdd->qpd, q);
> +	} else if (!q->properties.is_active && prev_active) {
> +		decrement_queue_count(dqm, &pdd->qpd, q);
> +	} else if (q->gws && !q->properties.is_gws) {
>   		if (q->properties.is_active) {
>   			dqm->gws_queue_count++;
>   			pdd->qpd.mapped_gws_queue = true;
> @@ -767,11 +775,7 @@ static int evict_process_queues_nocpsch(struct device_queue_manager *dqm,
>   		mqd_mgr = dqm->mqd_mgrs[get_mqd_type_from_queue_type(
>   				q->properties.type)];
>   		q->properties.is_active = false;
> -		decrement_queue_count(dqm, q->properties.type);
> -		if (q->properties.is_gws) {
> -			dqm->gws_queue_count--;
> -			qpd->mapped_gws_queue = false;
> -		}
> +		decrement_queue_count(dqm, qpd, q);
>   
>   		if (WARN_ONCE(!dqm->sched_running, "Evict when stopped\n"))
>   			continue;
> @@ -817,7 +821,7 @@ static int evict_process_queues_cpsch(struct device_queue_manager *dqm,
>   			continue;
>   
>   		q->properties.is_active = false;
> -		decrement_queue_count(dqm, q->properties.type);
> +		decrement_queue_count(dqm, qpd, q);
>   	}
>   	pdd->last_evict_timestamp = get_jiffies_64();
>   	retval = execute_queues_cpsch(dqm,
> @@ -888,11 +892,7 @@ static int restore_process_queues_nocpsch(struct device_queue_manager *dqm,
>   		mqd_mgr = dqm->mqd_mgrs[get_mqd_type_from_queue_type(
>   				q->properties.type)];
>   		q->properties.is_active = true;
> -		increment_queue_count(dqm, q->properties.type);
> -		if (q->properties.is_gws) {
> -			dqm->gws_queue_count++;
> -			qpd->mapped_gws_queue = true;
> -		}
> +		increment_queue_count(dqm, qpd, q);
>   
>   		if (WARN_ONCE(!dqm->sched_running, "Restore when stopped\n"))
>   			continue;
> @@ -950,7 +950,7 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
>   			continue;
>   
>   		q->properties.is_active = true;
> -		increment_queue_count(dqm, q->properties.type);
> +		increment_queue_count(dqm, &pdd->qpd, q);
>   	}
>   	retval = execute_queues_cpsch(dqm,
>   				KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
> @@ -1378,7 +1378,7 @@ static int create_kernel_queue_cpsch(struct device_queue_manager *dqm,
>   			dqm->total_queue_count);
>   
>   	list_add(&kq->list, &qpd->priv_queue_list);
> -	increment_queue_count(dqm, kq->queue->properties.type);
> +	increment_queue_count(dqm, qpd, kq->queue);
>   	qpd->is_debug = true;
>   	execute_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
>   	dqm_unlock(dqm);
> @@ -1392,7 +1392,7 @@ static void destroy_kernel_queue_cpsch(struct device_queue_manager *dqm,
>   {
>   	dqm_lock(dqm);
>   	list_del(&kq->list);
> -	decrement_queue_count(dqm, kq->queue->properties.type);
> +	decrement_queue_count(dqm, qpd, kq->queue);
>   	qpd->is_debug = false;
>   	execute_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0);
>   	/*
> @@ -1467,7 +1467,7 @@ static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
>   	qpd->queue_count++;
>   
>   	if (q->properties.is_active) {
> -		increment_queue_count(dqm, q->properties.type);
> +		increment_queue_count(dqm, qpd, q);
>   
>   		execute_queues_cpsch(dqm,
>   				KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
> @@ -1683,15 +1683,11 @@ static int destroy_queue_cpsch(struct device_queue_manager *dqm,
>   	list_del(&q->list);
>   	qpd->queue_count--;
>   	if (q->properties.is_active) {
> -		decrement_queue_count(dqm, q->properties.type);
> +		decrement_queue_count(dqm, qpd, q);
>   		retval = execute_queues_cpsch(dqm,
>   				KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
>   		if (retval == -ETIME)
>   			qpd->reset_wavefronts = true;
> -		if (q->properties.is_gws) {
> -			dqm->gws_queue_count--;
> -			qpd->mapped_gws_queue = false;
> -		}
>   	}
>   
>   	/*
> @@ -1932,7 +1928,7 @@ static int process_termination_cpsch(struct device_queue_manager *dqm,
>   	/* Clean all kernel queues */
>   	list_for_each_entry_safe(kq, kq_next, &qpd->priv_queue_list, list) {
>   		list_del(&kq->list);
> -		decrement_queue_count(dqm, kq->queue->properties.type);
> +		decrement_queue_count(dqm, qpd, kq->queue);
>   		qpd->is_debug = false;
>   		dqm->total_queue_count--;
>   		filter = KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES;
> @@ -1945,13 +1941,8 @@ static int process_termination_cpsch(struct device_queue_manager *dqm,
>   		else if (q->properties.type == KFD_QUEUE_TYPE_SDMA_XGMI)
>   			deallocate_sdma_queue(dqm, q);
>   
> -		if (q->properties.is_active) {
> -			decrement_queue_count(dqm, q->properties.type);
> -			if (q->properties.is_gws) {
> -				dqm->gws_queue_count--;
> -				qpd->mapped_gws_queue = false;
> -			}
> -		}
> +		if (q->properties.is_active)
> +			decrement_queue_count(dqm, qpd, q);
>   
>   		dqm->total_queue_count--;
>   	}
