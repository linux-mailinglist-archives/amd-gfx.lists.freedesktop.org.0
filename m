Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7hC6KDDwO2oYfwgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 16:56:48 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C476BF5C6
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 16:56:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ursulin.net header.s=google header.b=hl59fMXU;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=none
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D1110EF66;
	Wed, 24 Jun 2026 14:56:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F5010EF66
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 14:56:45 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4926046fbc5so11725005e9.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 07:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1782313004; x=1782917804; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1Utbd97cFZQctTuvakWxUdGz04SinxXRjd36a0NJWbA=;
 b=hl59fMXUcjrIoczO6VSw43wdEqDGrsYzjlt1+yIchM2QThKcQA1u6NEZIeWyFhek+0
 E2SXD3NDqj2bIlGgBlMjT5lXg+IwoypIU+SIVxRZ80eMqDJMgdGenC99gee3RtGUf+3R
 v8XTthO4nKjde61CrHT1I6um6Mo7KUBjZ14IYIAgzZ9gD2DH5T9OByRFpY8OUShJZz95
 NtVQXAtPAxxNV9oFRfE5s/yw0JOlAYUsBLEpwnPuFB03jh/KzK+Sp9GnEBSflJbmbTn+
 Vdd8eEnbxb6sgJYp3p1z07lDdHpBkopbjQuDLYYnhvRmRrtdk/WeAXmMvrBJEZHE66HY
 VAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782313004; x=1782917804;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Utbd97cFZQctTuvakWxUdGz04SinxXRjd36a0NJWbA=;
 b=eTRf8efFoEO4VWR3/uB3ZhjugRbZTlv5ub2nMI3r41SXPtPduSsXQ9s3MhKUC6bF/l
 n9yRx1UJ19zjn85JzCeGEK84Co4WsjjWbV9038j9/YXtPD6EdbYBtdr8y1eh5Ag1cU92
 ivSIqR/j1xe+IjlSDNLjK3aQlXuyiCHU+n6J59eQ62JTroXoGdHLReUdNFl4P/JxTITK
 BMRZHX2pccuKExtViBjMFf9/7OW1zKpr6BX246Mtpbikdhr5zwumZC3ugUwNxD2daoo3
 at6UdQkkceY1YGOAHfVlswhFGlDI+uiGKK1tNzEkVELejWMAWd7POT2VzLqVvS8ZaHws
 AHyQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9iVY8APYjW3uan0VW5i0LSPeWdEKPQXIsy/0k6Efwm2bK8pp53A2Q8rl0uuz6fKIVWCmAMFGsw@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbJq7K+m01wmfOg2vZoE0XStYJIT09KArL2ybi9Ff4cXeSD5MH
 dIKaOEMoXXqg8INVZpBbSdY0fF7cEg2qw4rRHbfokd7QDVFtk6E6N9PZ8zkWqj+SWgY=
X-Gm-Gg: AfdE7clNwZQ9kWaXWekyxVJURrRsYcQlASoYUFv/AC725C7+AOkuufjc1/b+TkVOvC9
 6CG1ghVfMgfObwfxLPzgoYNnYZpXhzBNIYFHmjrzJH9vo9Ad2WP24uPvZtrluywwMI2AFKnCVLy
 DUJs1+It1DBPuva0YQ+xV/iukspas7u8C0v1hhsUE6gY6NhgGt0qBHWLe0iu/apxeszIxP0wZQO
 rP7ccAaUUtt/4z8b16C4dUHHUFRHSsjYMZRnyqhh8ab+KwmGkWxofv73VamU3u8exfXmc9P/VSS
 Sk2zPXXYV41jdaAfi0FxGTncq2y9W8MjdSa+QRNafDb07I1qmBd1Ym8ZKOHMIyaKCAv7Yd57CAo
 Co01Kaw6kgRNHmPQi8gIMDCru6u2FG0NxEeZJua+bTKEKItinLwcy8g7f6s19sWtzohgZVHno3e
 c9g6wetMgZvX1rBkjre6LyUN8iaF3LviqOPw==
X-Received: by 2002:a05:600c:138e:b0:490:e19b:9632 with SMTP id
 5b1f17b1804b1-492632b93e5mr11027955e9.17.1782313003548; 
 Wed, 24 Jun 2026 07:56:43 -0700 (PDT)
Received: from [192.168.0.116] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4924944faa8sm369469105e9.13.2026.06.24.07.56.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 07:56:43 -0700 (PDT)
Message-ID: <5961213c-b559-4655-8589-e46b42821ac6@ursulin.net>
Date: Wed, 24 Jun 2026 15:56:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/amdgpu/vm: Use init PTE flags, and NOALLOC in
 amdgpu_vm_handle_fault()
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Natalie Vock <natalie.vock@gmx.de>, Amir Shetaia <Amir.Shetaia@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20260529103059.21470-1-timur.kristof@gmail.com>
 <20260529103059.21470-7-timur.kristof@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260529103059.21470-7-timur.kristof@gmail.com>
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:timur.kristof@gmail.com,m:Alexander.Deucher@amd.com,m:christian.koenig@amd.com,m:natalie.vock@gmx.de,m:Amir.Shetaia@amd.com,m:maraeo@gmail.com,m:mario.limonciello@amd.com,m:timurkristof@gmail.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,ursulin.net:dkim,ursulin.net:mid,ursulin.net:from_mime,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07C476BF5C6


On 29/05/2026 11:30, Timur Kristóf wrote:
> These flags seem to be necessary for retry faults to work.
> 
> Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index f5e9b97e92a8c..80c07abc81565 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -3002,7 +3002,8 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
>   	}
>   
>   	addr /= AMDGPU_GPU_PAGE_SIZE;
> -	flags = AMDGPU_PTE_VALID | AMDGPU_PTE_SNOOPED |
> +	flags = adev->gmc.init_pte_flags |
> +		AMDGPU_PTE_VALID | AMDGPU_PTE_SNOOPED |
>   		AMDGPU_PTE_SYSTEM;
>   
>   	if (is_compute_context) {
> @@ -3017,6 +3018,8 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
>   		flags |= AMDGPU_PTE_EXECUTABLE | AMDGPU_PTE_READABLE |
>   			AMDGPU_PTE_WRITEABLE;
>   
> +		if (adev->family >= AMDGPU_FAMILY_NV)
> +			flags |= AMDGPU_PTE_NOALLOC;
>   	} else {
>   		/* Let the hw retry silently on the PTE */
>   		value = 0;

Same as the previous one - I'm afraid someone from AMD will need to r-b 
this one too.

Regards,

Tvrtko

