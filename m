Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB0717A414
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Mar 2020 12:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F656E25B;
	Thu,  5 Mar 2020 11:20:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87D66E25B
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Mar 2020 11:20:51 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g134so5817676wme.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 05 Mar 2020 03:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=i5kzqdQPZlZeg5SBCjg0BngvijlY4KY263dACCJ83LY=;
 b=u55mOjkI+vLOdQ8ju7zzKD0aVJOQziiFeenRW9xOUr2YfJbny9iAXff7eAqzilmdYU
 TlxQ05w8QrJVudhJeR/bKnI6c8o8OHqXTl3gM4Gcaq8JB1hO/UoAPau/h5p18RhhmiDW
 PZQX7xsqzUEfBygLWlKEI1A7wVf4QkDQFYH4liHqFwcjxVU4Qs9K8blfBYXqh3BDq9R5
 AQMJh8wjbhajFxEtNtyOfjeU2EDXU6oeKRtm0SeVZ2XCY2Qb9ulcj6gCwZdyvRMXIk+U
 37BUw/y7Cr9LApm7YAoTOABJSAtiRa2Aasn8c8l3C7gBdEW6S7IAYiKNLBnY/sF3wha9
 E8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=i5kzqdQPZlZeg5SBCjg0BngvijlY4KY263dACCJ83LY=;
 b=pxV7QpixjJEpCDbx0TjHKsvYtk0ZeAq6vO+ugWzZkiY46ZS/AedS2PKfzNLejDsFT+
 HJZuIKjktKnkY/CuTLmiJegloRttcsqX7Ct7/1TpJLzLBmpCWeAYXXK2v+eYsPYf6ZXn
 lWVUxCuypG54jB9Ent6YOEHQygNOShNuSdO9OTsVbRO06ulxDnUl/1OPvbxllAof3xZR
 G4XN3HPBd531Xaig569IEuQDO+NSE2Rnaker4/VtbQM2JOuYQuCnXf9SmdwoyWVbXJZP
 zraJxTs9hqLSeuBR9c+XbyoiNrFO1p4bYBuLQCtqZ2XF7RQAnVNDAo062P4Fpmbbk1Bh
 qGVg==
X-Gm-Message-State: ANhLgQ2GEIRLLWB2gaeE53nZep9KLckArwJciMU/XDOU/1rG1eL4nhyG
 q/oxdceeJ05Ue50AGyop06vp5/9n
X-Google-Smtp-Source: ADFU+vsd8Hj3r9mC2mYilTZsgFzzeXcrpbcycGtrkIrrijYfc618H09vwoCyblsqprPEVctupu2vgw==
X-Received: by 2002:a1c:a50d:: with SMTP id o13mr5821799wme.128.1583407250219; 
 Thu, 05 Mar 2020 03:20:50 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id j20sm9048963wmj.46.2020.03.05.03.20.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Mar 2020 03:20:49 -0800 (PST)
Subject: Re: [PATCH] drm/amdgpu: Update SPM_VMID with the job's vmid when
 application reserves the vmid
To: Jacob He <jacob.he@amd.com>, amd-gfx@lists.freedesktop.org
References: <20200304040636.5280-1-jacob.he@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <974e09df-c1bb-bf9e-7722-ce89c5742973@gmail.com>
Date: Thu, 5 Mar 2020 12:20:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200304040636.5280-1-jacob.he@amd.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am 04.03.20 um 05:06 schrieb Jacob He:
> SPM access the video memory according to SPM_VMID. It should be updated
> with the job's vmid right before the job is scheduled. SPM_VMID is a
> global resource
>
> Change-Id: Id3881908960398f87e7c95026a54ff83ff826700
> Signed-off-by: Jacob He <jacob.he@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index c00696f3017e..f08effb033a1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -1080,8 +1080,12 @@ int amdgpu_vm_flush(struct amdgpu_ring *ring, struct amdgpu_job *job,
>   	struct dma_fence *fence = NULL;
>   	bool pasid_mapping_needed = false;
>   	unsigned patch_offset = 0;
> +	bool update_spm_vmid_needed = (job->vm && (job->vm->reserved_vmid[vmhub] != NULL));
>   	int r;
>   
> +	if (update_spm_vmid_needed && adev->gfx.rlc.funcs->update_spm_vmid)
> +		adev->gfx.rlc.funcs->update_spm_vmid(adev, job->vmid);
> +
>   	if (amdgpu_vmid_had_gpu_reset(adev, id)) {
>   		gds_switch_needed = true;
>   		vm_flush_needed = true;
> @@ -3213,6 +3217,7 @@ int amdgpu_vm_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>   	union drm_amdgpu_vm *args = data;
>   	struct amdgpu_device *adev = dev->dev_private;
>   	struct amdgpu_fpriv *fpriv = filp->driver_priv;
> +	long timeout = msecs_to_jiffies(2000);
>   	int r;
>   
>   	switch (args->in.op) {
> @@ -3224,6 +3229,15 @@ int amdgpu_vm_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>   			return r;
>   		break;
>   	case AMDGPU_VM_OP_UNRESERVE_VMID:
> +		if (amdgpu_sriov_runtime(adev))
> +			timeout = 8 * timeout;
> +
> +		/* Wait vm idle to make sure the vmid set in SPM_VMID is
> +		 * not referenced anymore.
> +		 */
> +		r = amdgpu_vm_wait_idle(&fpriv->vm, timeout);
> +		if (r < 0)
> +			return r;

You also need to lock/unlock the whole VM around that. Otherwise 
amdgpu_vm_wait_idle() could crash.

E.g. call amdgpu_bo_reserve() on vm->root.base.bo and after you are done 
amdgpu_bo_unreserver().

Apart from that it looks good to me,
Christian.

>   		amdgpu_vmid_free_reserved(adev, &fpriv->vm, AMDGPU_GFXHUB_0);
>   		break;
>   	default:

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
