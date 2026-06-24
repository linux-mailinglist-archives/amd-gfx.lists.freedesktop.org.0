Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9ncGAJ/hO2rGeggAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 15:54:39 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5876BEDFD
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 15:54:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ursulin.net header.s=google header.b=NitXaka6;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=none
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8F210E07A;
	Wed, 24 Jun 2026 13:54:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24D910E07A
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 13:54:34 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-693c51a8a19so1919521a12.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 06:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1782309273; x=1782914073; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=opzrn55ygNVnbEZtFazraR6/mmU4CQWts+7ghKyTVVg=;
 b=NitXaka6D1nPhYjvmOdVHRkR70NBUo1wnlXWLvdqkXwT6yWmHciBQHnVa8pn4Y0Bjh
 jqNmPDjCJowHglTqEYJECDjfNI4vTgyr+BXD0P3vj9yy0S2vkcBKUUEdvPseqVhDmwjA
 5ypmn1WwFeljqKHAEj7iG7G7gDe2tjGGsG7vQ1TO3gLPJh//qKWm2mzmGYclSdpgm3dX
 2ZNIMnkgQDcaAcMbSjSXF5wi/kw6y4obGBo0KAM3HBQpcduIYpwl+iL3EPhl9CJLl8uE
 PX19FhFYbUUmDneGqh/cJY7vyz1OoiBVPOuZTENGNfnIyaEv2p4wpZ6+GA7Z3xG/jjkj
 dICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782309273; x=1782914073;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=opzrn55ygNVnbEZtFazraR6/mmU4CQWts+7ghKyTVVg=;
 b=gjKwdTL8gj4EqznPdR+FmuDlOIGmZ4pJxn7oG3kY8lUqZUrs5thDYmQ4KX5pKoEATf
 nqK9Lj+0Uy0evJrkm6DkNjRWTudSSuYFj3MRYpMgUg2H1apNXGkYX0lXAkfZQWURVGEQ
 yyZTYkUpqVAmcEuckhlr34ePg/t0R9ANV64Kl9P7gzyhUzqCEnQUuTHtK2NvSiIeSL6e
 /jKbzhrLALSvlidTRdNbQ9va0bIi2ot0de6SP1s5OSNIM120lV0aCFl3slndWonqh0N1
 Fv9lAv266ZrqCIjir+7sSaZt0zgLO+ale9bvEVgdtf+5FtJELtzDQjUWeDQm+wCxh4ET
 zY/w==
X-Forwarded-Encrypted: i=1;
 AFNElJ94PPesiAD6Y/B0/jSI+gfauZ4AC6x9CeHtwT7FzmDFlx2fR3HM1VWQM2gN0SbJPtvN3m/229uW@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwL+4FbsqcA/Fh46qOZRruHew6CgTP48AEc8OxSmlXjdvdkfmo1
 SuFI9qqFNrJTtvvNbLUEJzN/ftIakiocGlLEH7RMYV/+pqmGVr29bq+yV5LjVbGxLXs=
X-Gm-Gg: AfdE7cmMK/0RBHCPlreaOihadmLxPvCc3ra1kWjnV9AxWsA2Qs5i+MpNG2D+TXUXCfn
 Tji0cD7HPMZ6+L66eJJNDYT8eHT0KkvDHiYzpxdXVUxj9x1T4IVlcrA1Tocrar7Cash9IxN+SU3
 1V6YfAb4sQLY0mzUDBO/kSRxvcRvIgqCXZfCW/ZnFXz5EiExPUAnNxCXmqiscFC051ppTGVDtH0
 OZXXsNYJWNmy89ZhOPRHgW2qUTGESokA7IBe+976YXNW31LOq54eaDiYLNJxiBIVkEC+FJGVBvE
 bD2nJi1HsfayqxeHYVS9rtyZ9NrPDza8JcqZFiAJvV+gYOX4oe5OTtj8r9NG9KunE4YVrreSDyg
 YBhHtu3oWyxrY4fkkh2bMIzywz5n/UvY7804UL+vIQx3QJRudGQ85D8tYC7taTDz2oU1c92mMMa
 CSTDe5l35/GKa8/hJmPkg6/293hKLA4jll4Q==
X-Received: by 2002:a17:907:9309:b0:c08:28f5:e767 with SMTP id
 a640c23a62f3a-c107d10bfe7mr492831066b.15.1782309272643; 
 Wed, 24 Jun 2026 06:54:32 -0700 (PDT)
Received: from [192.168.0.116] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c0c5e49aa07sm668422366b.10.2026.06.24.06.54.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 06:54:31 -0700 (PDT)
Message-ID: <5dc2e31f-7e28-4076-9842-2c4245c01e67@ursulin.net>
Date: Wed, 24 Jun 2026 14:54:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/amdgpu/vm: Add fence argument to
 amdgpu_vm_handle_fault()
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Natalie Vock <natalie.vock@gmx.de>, Amir Shetaia <Amir.Shetaia@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20260529103059.21470-1-timur.kristof@gmail.com>
 <20260529103059.21470-2-timur.kristof@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260529103059.21470-2-timur.kristof@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[ursulin.net];
	FORGED_RECIPIENTS(0.00)[m:timur.kristof@gmail.com,m:Alexander.Deucher@amd.com,m:christian.koenig@amd.com,m:natalie.vock@gmx.de,m:Amir.Shetaia@amd.com,m:maraeo@gmail.com,m:mario.limonciello@amd.com,m:timurkristof@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,amd.com,gmx.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[ursulin.net:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,ursulin.net:dkim,ursulin.net:mid,ursulin.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B5876BEDFD


On 29/05/2026 11:30, Timur Kristóf wrote:
> Allow the caller to respond to when the VM update is finished.
> 
> Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 4 ++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 5 ++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  | 2 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c  | 4 ++--
>   4 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> index d790b7619ccd4..26aea960e2759 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -564,7 +564,7 @@ int amdgpu_gmc_handle_retry_fault(struct amdgpu_device *adev,
>   		}
>   
>   		ret = amdgpu_vm_handle_fault(adev, entry->pasid, entry->vmid, node_id,
> -					     addr, entry->timestamp, write_fault);
> +					     addr, entry->timestamp, write_fault, NULL);
>   		adev->irq.ih_funcs->retry_cam_ack(adev, cam_index);
>   		if (ret)
>   			return 1;
> @@ -587,7 +587,7 @@ int amdgpu_gmc_handle_retry_fault(struct amdgpu_device *adev,
>   		 * tables
>   		 */
>   		if (amdgpu_vm_handle_fault(adev, entry->pasid, entry->vmid, node_id,
> -					   addr, entry->timestamp, write_fault))
> +					   addr, entry->timestamp, write_fault, NULL))
>   			return 1;
>   	}
>   	return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index b523a7b97d6f1..8c3ba7213eb22 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2962,13 +2962,14 @@ struct amdgpu_vm *amdgpu_vm_lock_by_pasid(struct amdgpu_device *adev,
>    *           GFX 9.4.3.
>    * @addr: Address of the fault
>    * @write_fault: true is write fault, false is read fault
> + * @fence: optional resulting fence, signaled after update is done
>    *
>    * Try to gracefully handle a VM fault. Return true if the fault was handled and
>    * shouldn't be reported any more.
>    */
>   bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
>   			    u32 vmid, u32 node_id, uint64_t addr,
> -			    uint64_t ts, bool write_fault)
> +			    uint64_t ts, bool write_fault, struct dma_fence **fence)
>   {
>   	bool is_compute_context = false;
>   	struct amdgpu_bo *root;
> @@ -3034,6 +3035,8 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
>   
>   	r = amdgpu_vm_update_pdes(adev, vm, true);
>   
> +	*fence = vm->last_update;

Unless the heat wave is severely interfering with my ability to read 
code, fence here is mostly NULL and who owns the reference is suspect. 
Did you mean like this:

if (fence)
	*fence = dma_fence_get(vm->last_update);

Kernel doc should perhaps clarify along the lines of:

"@fence: If non-null, returns a fence with an extra reference for the 
caller, which is signaled after update is done.".

Regards,

Tvrtko

> +
>   error_unlock:
>   	amdgpu_bo_unreserve(root);
>   	if (r < 0)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index cc096c005e348..72da6b3d98c70 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -589,7 +589,7 @@ void amdgpu_vm_put_task_info(struct amdgpu_task_info *task_info);
>   
>   bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
>   			    u32 vmid, u32 node_id, uint64_t addr, uint64_t ts,
> -			    bool write_fault);
> +			    bool write_fault, struct dma_fence **fence);
>   
>   struct amdgpu_vm *amdgpu_vm_lock_by_pasid(struct amdgpu_device *adev,
>   					  struct amdgpu_bo **root, u32 pasid);
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c
> index 855cd29cbffaa..da18c02013966 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c
> @@ -155,7 +155,7 @@ static int gmc_v12_1_process_interrupt(struct amdgpu_device *adev,
>   			cam_index = entry->src_data[3] & 0x3ff;
>   
>   			ret = amdgpu_vm_handle_fault(adev, entry->pasid, entry->vmid, node_id,
> -							addr, entry->timestamp, write_fault);
> +							addr, entry->timestamp, write_fault, NULL);
>   			WDOORBELL32(adev->irq.retry_cam_doorbell_index, cam_index);
>   			if (ret)
>   				return 1;
> @@ -178,7 +178,7 @@ static int gmc_v12_1_process_interrupt(struct amdgpu_device *adev,
>   			 * tables
>   			 */
>   			if (amdgpu_vm_handle_fault(adev, entry->pasid, entry->vmid, node_id,
> -						   addr, entry->timestamp, write_fault))
> +						   addr, entry->timestamp, write_fault, NULL))
>   				return 1;
>   		}
>   	}

