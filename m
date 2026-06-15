Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BAjqK8wPMGrIMgUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 16:44:28 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CB36874D1
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 16:44:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ursulin.net header.s=google header.b=Knbq5g11;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=none
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DD210E4DF;
	Mon, 15 Jun 2026 14:44:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1584B10E4E6
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2026 14:44:25 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-687ed9aabb3so6292660a12.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2026 07:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1781534663; x=1782139463; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8KWl6b27RDPIoIJvaxVRCHtc/DjgyRIf4BmLnNVlfeE=;
 b=Knbq5g11uqZj+GgQzN46IVEwmXWOPiIxdOxfVLUaXGJpu1TH11Pjhp9UMJS2vmz25y
 SiuBpgl2tuqXMKdaoCTvyYhb7Mc0ozHNjIfhImN/kPqWqcGIqQr6lEavDBQiAW1kzWNC
 JvCZ2SRw4zMERPgxGASyQD+9Mp1Gb2FtB76mXf8No0m1iHjqbfnmJhoxJd0TD9jtsvfi
 kzxoLTXWphvMv5gJE+mDgKFSegv4gLoZxA02SCzxtazn5DUJB0foNGoM2OIxNLrVqvs0
 cfxq8AsIf9G6+W96Pq0T5Sxgy9r8kA8IDhyKu4BIg/rtt/eOBS/EIGY3Bvv1vso86vMl
 VX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781534663; x=1782139463;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8KWl6b27RDPIoIJvaxVRCHtc/DjgyRIf4BmLnNVlfeE=;
 b=b9FFF81K1cu3rmtufACnjVm+WMiibNaaAEJm0/+eFBlEWRbG2SkoRq3LDrKS1Q3VF4
 xMpayVG6XlvNyQOKGbdHmu6MuGmplU/OVC7HIW8GUHaCbpHhpuZ3bPLM2hkCS9e/A8Oj
 IyIyxHPreOSOo2ij5OWC/m90y19UyPokWPQKiQPXJJq7H8ZzUxVATkINVukzE8XPH275
 j/mTBMYutKMiXJx3u47DXoLfbhqz97Fbhh1c4zeH9cezRmaM1gbwVWSsujWzuriMkGir
 at4r8P9VIdWPMR3DcO9W8gMTRd14OtwrdTllKHOfIJ6t/iQFvh4nomDmyvt3KS7Hv3cI
 Yk7A==
X-Forwarded-Encrypted: i=1;
 AFNElJ/xp6sXjBYDS8jDSKw+rP9Hb56DwP99XA75/Y8oGrlvxCQwmzw21Mizb6YYm1r/XeSxOQGFYhY7@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwR79PMJqQemdnWs79hnqt9NeXVgt5Ytzk+ivVob7sOx+H6rAOf
 7MnFQLZl5NtWm+ChtVPcCDwA8ni7tf9Z8ZLgkYEK5sErJ8iOdyPKE3vH2KMjvUYFDrM=
X-Gm-Gg: Acq92OGaYp7/kumk4XWrPYYcvmKIncUnEPVCEcXKBAvcj8O3k2hgtP3gcTBGpWKm86h
 pMTflbeddCywkkBvdXJ5NA+92wUcACumiRJ2F/5XWHg+e/LhG125q72dM3rHHoVA96I2uSUg1Yg
 R5LFAc25lGTunELIE4sDfz1lRBgcu/dLtWFT2c93mT0UIC9Towhi0NseA2g9QCt0tUp++ynrBaA
 zjAo0lQryPeYD4OwVfmyvDWX6Ec0/ecI9kYae4pRtr6kMcx3oAjAAJCgv0hO2g7Zst3JjLywZQA
 mfQ1BMMc8GfF6KwuEcq/b4i33NqnG3YMNLvHx1ipaOdMEjvRbksrKB/iBj/Pou+jfcZR0VsX3sT
 8SaSWDDD7JRocTDtkpOW9OKdU+XZ/N3Q9wxiTlsiUJMDgHjrWZKlqmTgjglNex6PVsMVCz/ZBvK
 vQkyX/1j4W0fTt4RZcWQq/GuleNPpBzvl214NW/K2mbLPDpvNduYJpt5U=
X-Received: by 2002:a05:6402:26d1:b0:68b:d82b:fbd with SMTP id
 4fb4d7f45d1cf-693c6a7bc5amr4808182a12.24.1781534663593; 
 Mon, 15 Jun 2026 07:44:23 -0700 (PDT)
Received: from [192.168.0.116] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-693791de4a6sm3530030a12.9.2026.06.15.07.44.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 07:44:22 -0700 (PDT)
Message-ID: <828817bb-8d69-429f-b206-7c9858eeca72@ursulin.net>
Date: Mon, 15 Jun 2026 15:44:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/amdgpu/ih: Add retry_cam_ack IH function pointer
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Natalie Vock <natalie.vock@gmx.de>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Amir Shetaia <Amir.Shetaia@amd.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <maraeo@gmail.com>
References: <20260525114507.24566-1-timur.kristof@gmail.com>
 <20260525114507.24566-5-timur.kristof@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260525114507.24566-5-timur.kristof@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:timur.kristof@gmail.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:natalie.vock@gmx.de,m:mario.limonciello@amd.com,m:Amir.Shetaia@amd.com,m:maraeo@gmail.com,m:timurkristof@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,amd.com,gmx.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,amd-gfx-bounces@lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14CB36874D1


On 25/05/2026 12:45, Timur Kristóf wrote:
> Instead of writing the doorbell in amdgpu_gmc_handle_retry_fault()
> directly, add an IH function pointer which can be defined in
> a different way for different IH versions.
> 
> This is to allow implementing the filter CAM without a doorbell.
> 
> Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h  | 1 +
>   drivers/gpu/drm/amd/amdgpu/ih_v7_0.c    | 6 ++++++
>   drivers/gpu/drm/amd/amdgpu/vega20_ih.c  | 8 +++++++-
>   4 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> index 52258f1341c2..d790b7619ccd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -565,7 +565,7 @@ int amdgpu_gmc_handle_retry_fault(struct amdgpu_device *adev,
>   
>   		ret = amdgpu_vm_handle_fault(adev, entry->pasid, entry->vmid, node_id,
>   					     addr, entry->timestamp, write_fault);
> -		WDOORBELL32(adev->irq.retry_cam_doorbell_index, cam_index);
> +		adev->irq.ih_funcs->retry_cam_ack(adev, cam_index);

How does not map which IP generations can end up calling it? Presumably 
your selection of ih_v7_0 and vega20_ih.c is an insightful one, but for 
me I see amdgpu_gmc_handle_retry_fault() is called from 
gmc_v9_0_process_interrupt, gmc_v10_0_process_interrupt, 
gmc_v11_0_process_interrupt and gmc_v12_0_process_interrupt(). Is there 
a map somewhere which shows which GMC versions go with which IH blocks?

Regards,

Tvrtko

>   		if (ret)
>   			return 1;
>   	} else {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h
> index 444437c30088..e6e34f6e86f4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h
> @@ -97,6 +97,7 @@ struct amdgpu_ih_funcs {
>   	const char *(*node_id_to_die_name)(struct amdgpu_device *adev,
>   					   unsigned int node_id,
>   					   char *buf, size_t size);
> +	void (*retry_cam_ack)(struct amdgpu_device *adev, u32 cam_index);
>   };
>   
>   #define amdgpu_ih_get_wptr(adev, ih) (adev)->irq.ih_funcs->get_wptr((adev), (ih))
> diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c b/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
> index 6de9e87e04e1..c2431f4c2671 100644
> --- a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
> @@ -289,6 +289,11 @@ static uint32_t ih_v7_0_setup_retry_doorbell(u32 doorbell_index)
>   	return val;
>   }
>   
> +static void ih_v7_0_retry_cam_ack(struct amdgpu_device *adev, u32 cam_index)
> +{
> +	WDOORBELL32(adev->irq.retry_cam_doorbell_index, cam_index);
> +}
> +
>   #define regIH_RING1_CLIENT_CFG_INDEX_V7_1             0x122
>   #define regIH_RING1_CLIENT_CFG_INDEX_V7_1_BASE_IDX    0
>   #define regIH_RING1_CLIENT_CFG_DATA_V7_1              0x123
> @@ -858,6 +863,7 @@ static const struct amdgpu_ih_funcs ih_v7_0_funcs = {
>   	.decode_iv_ts = amdgpu_ih_decode_iv_ts_helper,
>   	.set_rptr = ih_v7_0_set_rptr,
>   	.node_id_to_die_name = ih_v7_0_node_id_to_die_name,
> +	.retry_cam_ack = ih_v7_0_retry_cam_ack,
>   };
>   
>   static void ih_v7_0_set_interrupt_funcs(struct amdgpu_device *adev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
> index 85846fd08ce4..30a82fff3ff7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
> @@ -293,6 +293,11 @@ static uint32_t vega20_setup_retry_doorbell(u32 doorbell_index)
>   	return val;
>   }
>   
> +static void vega20_retry_cam_ack(struct amdgpu_device *adev, u32 cam_index)
> +{
> +	WDOORBELL32(adev->irq.retry_cam_doorbell_index, cam_index);
> +}
> +
>   /**
>    * vega20_ih_irq_init - init and enable the interrupt ring
>    *
> @@ -738,7 +743,8 @@ static const struct amdgpu_ih_funcs vega20_ih_funcs = {
>   	.get_wptr = vega20_ih_get_wptr,
>   	.decode_iv = amdgpu_ih_decode_iv_helper,
>   	.decode_iv_ts = amdgpu_ih_decode_iv_ts_helper,
> -	.set_rptr = vega20_ih_set_rptr
> +	.set_rptr = vega20_ih_set_rptr,
> +	.retry_cam_ack = vega20_retry_cam_ack,
>   };
>   
>   static void vega20_ih_set_interrupt_funcs(struct amdgpu_device *adev)

