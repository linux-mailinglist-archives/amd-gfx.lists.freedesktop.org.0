Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /JrKG8JeV2pIKgEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jul 2026 12:19:46 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFC775CE5E
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jul 2026 12:19:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ursulin.net header.s=google header.b=hlMGXabw;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=none
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5586910EF9A;
	Wed, 15 Jul 2026 10:19:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6771B10E034
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Jul 2026 10:19:43 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4953ddae026so2749125e9.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Jul 2026 03:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1784110782; x=1784715582; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bRzTwkXH6xGawDP7fc9UhZlTlCmnDu73EAsqN4QfQcg=;
 b=hlMGXabwA68iQbotbz4HHeJR7UZiViofLRQN/e1xvPmaasIAA921BnvcuUHYcM1f27
 kgL3jTzTwtrhJsXC4eKoeKXdM5gcyz2c8KS1LcbW7JO/5tENAJFZc+Im088h/gfSYeKE
 PD8ekf4OkQzcubvoVQ6Y89AXf3yzrEr3g2PbRg2hA5r70WPBD16daKUKOBJJszjBzc9P
 dgRIrxQe/wLOVVj9DxY17xjgNVZ6ulZBg6rmKb9qLw7hriMsPAQy37E3wA3jaXqwf7pE
 lsy+K2iQo5IONFNx+itJpu7BG9OqAQgFf7JOMYBuleAi1cLxnf1C3FFQyWSKB5f9f9ei
 Vmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784110782; x=1784715582;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bRzTwkXH6xGawDP7fc9UhZlTlCmnDu73EAsqN4QfQcg=;
 b=bcHSLuv3ANNEIXLrVxLZU2ImhF9txSIM4U/rubQhtiws9+438qlCn83TEjWeR2jph/
 dAXLqzjc24kHk6nq9KbXUw7quC/5pFNJf1pUyuyBxU0vyoVzgg07V++5V9oNAg83FFjK
 Fu7vWFBq01TtXJiFzIjdy1KHQX7LDmIUN2sMZCfvUHouoSXQ8aWjhMUv3cu12nRd4lQa
 f+tcslVieelbZcCiw+GlKkigHfdlXmh16FMdQYbw9UqYkzQz0oRxk+Lup6BIHmTLtO4x
 iRWU59KqadwpVKO0WrWEIhIRDa6jzYVpwPzskAvWdDEU1JTlgQ3wqApPSVTjexxL1sdr
 NZiw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpPj85+zS60Ls/jsAODN4cJzSgSNMumSAElPhATf2lLHReJ3dwUpGM2ISLGIHEeyGUedDTflcKv@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz86r7BaUBZHUrDHro8i3mKrQSoPuShT3a+aPpJisNpIsUqKHdw
 bGxrbeuqkLBZyNlWHRxy/g0MPY+7cW6s0G1l9RYL/lgZqyIgqdS/AZJ3NaDqlK7RJIY=
X-Gm-Gg: AfdE7ckKb3DQ5BjgyAwmJUXehj88YAyQF8h6xFDP7+FiE7ARqK9fDjyktZo/q3fce0K
 APHEn1I+xEak2/VLGPcyQ/eqQSpDuZenVYkyE1cCruC674l7fR0bujJ13bx0ZSXciBxy0xJblES
 Ym0aQsT/l7/MOFG7poiwh6xsZRUIMWfvoVMP1d0essRi1D1VX1+GsS2JTJrrHX/SE00j0UbDrzg
 5qYJDdwRKRniuJyxaiyrnsV7rCMYACJbabw8RW+zCw0vkKzVWnIkZXH5CRQ6xXP9IKUDyLOykud
 ELYFc8F8f/jwK8ff1G77ADnk3LuOOZCrxzHeduejWUlummmDBR+fPEIW3JH47mgK03xIvCc+NkU
 xqYuqCNhUPo/+lNQnVSGxMDbLPWc3RF6QjvCiTFlQ5tlCihHAUFX7SRRHU5aro+rHMod0zLNPq8
 9cD2xfdAY2vTTmNtONUs9or0namJMB81A+UQ==
X-Received: by 2002:a05:600c:4a21:b0:493:bc4b:b8c with SMTP id
 5b1f17b1804b1-493f88389d9mr115897165e9.38.1784110781786; 
 Wed, 15 Jul 2026 03:19:41 -0700 (PDT)
Received: from [192.168.0.116] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4953c5a4c0csm31022245e9.0.2026.07.15.03.19.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jul 2026 03:19:41 -0700 (PDT)
Message-ID: <12b8dbe8-579d-4b90-a3af-ec604710299c@ursulin.net>
Date: Wed, 15 Jul 2026 11:19:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] drm/amdgpu/gfx6: Properly enable/disable priv_req
 and priv_inst interrupts
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, pierre-eric.pelloux-prayer@amd.com,
 Natalie Vock <natalie.vock@gmx.de>
References: <20260713130709.34262-1-timur.kristof@gmail.com>
 <20260713130709.34262-8-timur.kristof@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260713130709.34262-8-timur.kristof@gmail.com>
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[ursulin.net];
	FORGED_RECIPIENTS(0.00)[m:timur.kristof@gmail.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:pierre-eric.pelloux-prayer@amd.com,m:natalie.vock@gmx.de,m:timurkristof@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,amd.com,gmx.de];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ursulin.net:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ursulin.net:from_mime,ursulin.net:dkim,ursulin.net:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BAFC775CE5E


On 13/07/2026 14:07, Timur Kristóf wrote:
> These were used without ever calling get()/put() on them.
> Implement it like on GFX7-8:

Used as in how? Are they even enabled without this change and if not 
then does this patch fixes something other than being prep work for soft 
reset?

Regards,

Tvrtko

> * Call amdgpu_irq_get() from gfx_v6_0_late_init()
> * Call amdgpu_irq_put() from gfx_v6_0_hw_fini()
> 
> Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
> index 5b570a4b5c01..1c7cd265fbca 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
> @@ -3131,6 +3131,22 @@ static int gfx_v6_0_early_init(struct amdgpu_ip_block *ip_block)
>   	return 0;
>   }
>   
> +static int gfx_v6_0_late_init(struct amdgpu_ip_block *ip_block)
> +{
> +	struct amdgpu_device *adev = ip_block->adev;
> +	int r;
> +
> +	r = amdgpu_irq_get(adev, &adev->gfx.priv_reg_irq, 0);
> +	if (r)
> +		return r;
> +
> +	r = amdgpu_irq_get(adev, &adev->gfx.priv_inst_irq, 0);
> +	if (r)
> +		return r;
> +
> +	return 0;
> +}
> +
>   static int gfx_v6_0_sw_init(struct amdgpu_ip_block *ip_block)
>   {
>   	struct amdgpu_ring *ring;
> @@ -3243,6 +3259,8 @@ static int gfx_v6_0_hw_fini(struct amdgpu_ip_block *ip_block)
>   {
>   	struct amdgpu_device *adev = ip_block->adev;
>   
> +	amdgpu_irq_put(adev, &adev->gfx.priv_reg_irq, 0);
> +	amdgpu_irq_put(adev, &adev->gfx.priv_inst_irq, 0);
>   	gfx_v6_0_cp_enable(adev, false);
>   	adev->gfx.rlc.funcs->stop(adev);
>   	gfx_v6_0_fini_pg(adev);
> @@ -3532,6 +3550,7 @@ static void gfx_v6_0_emit_mem_sync(struct amdgpu_ring *ring)
>   static const struct amd_ip_funcs gfx_v6_0_ip_funcs = {
>   	.name = "gfx_v6_0",
>   	.early_init = gfx_v6_0_early_init,
> +	.late_init = gfx_v6_0_late_init,
>   	.sw_init = gfx_v6_0_sw_init,
>   	.sw_fini = gfx_v6_0_sw_fini,
>   	.hw_init = gfx_v6_0_hw_init,

