Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R9yyNAqlMmqR3AUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2026 15:45:46 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3575D69A3BE
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2026 15:45:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=damsy.net header.s=202408e header.b=cj96wZ+7;
	dkim=pass header.d=damsy.net header.s=202408r header.b=uEIE0U+u;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=none
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BFD10EA06;
	Wed, 17 Jun 2026 13:45:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF0710EA06
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jun 2026 13:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; r=y; 
 h=From:To:Subject:Date:Message-ID; t=1781703938; bh=HeGNJOmo8KEarrPjWiaHIv5
 MiTqcwKdtANPH9jARSdw=; b=cj96wZ+7ns9kEvMH3BZ5X3mGYyPBVk6eq0nlxXLJIP/TJ0USZH
 ZDtoj7btFB7C1Lae82f7dRJKbHhZEGQZgwAQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed;
 r=y; 
 h=From:To:Subject:Date:Message-ID; t=1781703938; bh=HeGNJOmo8KEarrPjWiaHIv5
 MiTqcwKdtANPH9jARSdw=; b=uEIE0U+u/WQsHwBycCxA0Q5UEgHSIgca3oJwUh4HwDAYxBTiW5
 zG7obW5zv6z9YX1JjeAh5YYcPUo47tKuzICeL0d4fAls9fhdBom6j9WaFeosc0yhvBjHn6fZWm8
 SlLjRkYvFYGztItGC4/v9WwMJcskBl/YvKGf9vBCkbXxz6/2pf7Jbs39e9nl7R3ntB3XiwXaodN
 BhdBURHROIEdu2I1//xvBYGbaZXjPdC9e+AzZCMuQtRqKJ8GcAJAgVOA1PzSNHNrtJ9hof0oE1H
 /yqXz2hvZcG3+hocEroMH/SAJIfA6F+XWOakvRCmvA20ngej3ZzXzllJmZ5ybNJPJSA==;
Message-ID: <de08e4f5-dad1-441c-9397-48f7991f41ec@damsy.net>
Date: Wed, 17 Jun 2026 15:45:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/amdgpu: delay ttm buffer func enablement on
 xgmi
To: "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260616125040.9977-1-pierre-eric.pelloux-prayer@amd.com>
 <20260616125040.9977-2-pierre-eric.pelloux-prayer@amd.com>
 <SA0PR12MB7091079B864676A8379E6B7997E52@SA0PR12MB7091.namprd12.prod.outlook.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <SA0PR12MB7091079B864676A8379E6B7997E52@SA0PR12MB7091.namprd12.prod.outlook.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[damsy.net:s=202408e,damsy.net:s=202408r];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[damsy.net];
	FORGED_RECIPIENTS(0.00)[m:Lijo.Lazar@amd.com,m:Pierre-eric.Pelloux-prayer@amd.com,m:Alexander.Deucher@amd.com,m:Christian.Koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[damsy.net:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[pierre-eric@damsy.net,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric@damsy.net,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,lists.freedesktop.org:email,amd.com:email,ffwll.ch:email,damsy.net:dkim,damsy.net:mid,damsy.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3575D69A3BE



Le 16/06/2026 à 16:41, Lazar, Lijo a écrit :
> Public
> 
> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Pierre-Eric Pelloux-Prayer
> Sent: Tuesday, June 16, 2026 6:21 PM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Pelloux-Prayer, Pierre-Eric <Pierre-eric.Pelloux-prayer@amd.com>
> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org
> Subject: [PATCH v1 2/2] drm/amdgpu: delay ttm buffer func enablement on xgmi
> 
> When amdgpu_init_minimal_xgmi is used, SDMA engines init is delayed so amdgpu_ttm_enable_buffer_funcs must be called later.
> 
> Without this, the check for num_buffer_funcs_scheds will fail and using ttm buffer funcs later will fail.
> 
> Fixes: 3a5da695c8d1 ("drm/amdgpu: only use working sdma schedulers for ttm")
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   | 2 ++
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 57e10afb4714..2e8954fa5c40 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2479,7 +2479,8 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
>          if (r)
>                  goto init_failed;
> 
> -       amdgpu_ttm_enable_buffer_funcs(adev);
> +       if (amdgpu_ip_member_of_hwini(adev, AMD_IP_BLOCK_TYPE_SDMA))
> +               amdgpu_ttm_enable_buffer_funcs(adev);
> 
>          /* Don't init kfd if whole hive need to be reset during init */
>          if (adev->init_lvl->level != AMDGPU_INIT_LEVEL_MINIMAL_XGMI) { diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> index faac80a8a6eb..c0dca209335e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> @@ -1663,6 +1663,8 @@ static void amdgpu_xgmi_reset_on_init_work(struct work_struct *work)
>                  if (r && r != -EHWPOISON)
>                          dev_err(tmp_adev->dev,
>                                  "error during bad page data initialization");
> +
> +               amdgpu_ttm_enable_buffer_funcs(tmp_adev);
> 
> <lijo> This gets enabled in the resume path after xgmi reset. It is not needed here.

Good point. I've modified the patch in v2.

Thanks,
Pierre-Eric


> 
> Thanks,
> Lijo
> 
>          }
>   }
> 
> --
> 2.43.0
