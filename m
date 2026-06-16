Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UxxIAKo+MWp5fAUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 14:16:42 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B3E68F36C
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 14:16:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ursulin.net header.s=google header.b=tl8eMbHi;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=none
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA70010E277;
	Tue, 16 Jun 2026 12:16:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DCE10E78C
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jun 2026 12:16:38 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-beeba001887so604410666b.3
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jun 2026 05:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1781612197; x=1782216997; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bx9y/uWxvEmwAQubomITARfrNFmmuiV9OcDl8elwdRI=;
 b=tl8eMbHiedA+uDrx20ZsS16yWFUQWK5sgzvwX9MX4ds/jauKPNWvNdevMMlE0VnUba
 fgAxQNo3z0qNGt1Ev4vKB6Ge3jAo7MRIOSnRUtWbsUm+WdGEZcbOq8oZ7ABvq3hNU7FN
 mf1Nn1XQEqjGfeZXJCC6FT0wVYRCA+awbJkPlv++4eQYSNCsXa6E5iFF7SpQxhPFVBYK
 7OdDCqzYxM5DRi7vo/n2NV7zTB1i0P5AqTX59QyabCGE0YL8isCk2Lr+6Qud799+FseZ
 0R5+9Q/B5jobw0T8Wd9Ne0whWHdOYrm913RfvwwuvFH1Z9iVw21Xe+vTkagpXmIPTfiB
 Ks9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781612197; x=1782216997;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bx9y/uWxvEmwAQubomITARfrNFmmuiV9OcDl8elwdRI=;
 b=nmMc3QURhksc2a7sDFr0Rf5YSQmER3q8byTPohoBUIr2ObwvrV66HjEIDmk1xtc39Q
 nLhyWw8BH3nWZLjs3hlGAhg8+Hyy0/bcBV6L1gXX/Oy5gGKyqilVTuJbatPsllwuTCAr
 yaaqVA3ka25X2Q0RZdZAcgNJhw+4xEKChf9nk+c1tbA9vNp25yBIMjemnPiEXnY4FClN
 Uheg5T5fxqSbjpDaWfN8V7IbQGSN7h8NHw1fBwPsoC+ieDAHBsLyeSsqUXBoLz9K4Mou
 tme8xKYdx8zbyDb2V5+CERU4m7PfwDsccKyV8BcbAYRgprFRbCpLwnj63UEkHX1fNnu5
 /Bbg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Zi6WRC7Wr+7S44PEQbxOC69FWkB4LllAbOT/xfS1IJvnsIqzG+PTYkTEcflocjbzuhh41ql/S@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8rfAARIfGRSRClw3J/ZaFo75qhBXJIVoD6NsoJETy3YcDHo2Z
 nxaxaKXhAjU/azdAq1KhJEH6bM/82pQ9chEttNcRQ7NYhzZsWrmftJy//kHVvnrG520=
X-Gm-Gg: Acq92OGsqIjoSWMpnawyQFADbfr2B+W8wg4IFlicaPPsWZE0fbtM2XnsyyDHZrxCV/I
 v+14/JygaBFW2f3NnVU/wyrCP7lTZF8+dFlMcz16ztKoVBTHIVVvAeB4x6AX/V9VDtKgVEKox8y
 gFW30Nd/AOaYAoyarLdmYDh1CrwZWYqtkgn/zi11M4Z+xs2WRrSRBhA1yGDCDR9ozJceIb9gzDj
 643i/KR8nQ8sZ7vg6tlueYAJ021yAFSRqFA9Hn5OcZtPtkdDczlJ7hmd78YmBfhEuNymDArrQsR
 yaweymrW/8gyKTLKU0oSp/I6llT0yv0k9EP3hP1yAt9GpOmSSxcoyfwR1lcrHfqc9sGExVWLQ0v
 W8OutYqau/UdBtI7SErM3t2/MuWyvnqa3sgWRl2FXhhdPd9zoDVmiPqKSv40eXZKkzWI/glVEtG
 P/eyl4ZblqGYKUYfum3Toj9uLxDaptKHuUfAgqvp2KgFtxcLb/PXDXmkw=
X-Received: by 2002:a17:907:72c5:b0:bf0:2253:ad67 with SMTP id
 a640c23a62f3a-bff4c9eaa4amr771375266b.46.1781612196734; 
 Tue, 16 Jun 2026 05:16:36 -0700 (PDT)
Received: from [192.168.0.116] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bfdb4423439sm639963666b.2.2026.06.16.05.16.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 05:16:36 -0700 (PDT)
Message-ID: <4296af8f-8001-4a98-b942-3a2840296b7e@ursulin.net>
Date: Tue, 16 Jun 2026 13:16:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/amdgpu/gfxhub: Respect noretry flag for retry
 faults on GFX12.1
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Natalie Vock <natalie.vock@gmx.de>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Amir Shetaia <Amir.Shetaia@amd.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <maraeo@gmail.com>
References: <20260525114507.24566-1-timur.kristof@gmail.com>
 <20260525114507.24566-7-timur.kristof@gmail.com>
 <25f69c76-8140-4573-8d3e-9aa8071ee715@ursulin.net>
 <4660473.UPlyArG6xL@timur-hyperion>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <4660473.UPlyArG6xL@timur-hyperion>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,ursulin.net:dkim,ursulin.net:mid,ursulin.net:from_mime,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 54B3E68F36C


On 16/06/2026 12:57, Timur Kristóf wrote:
> On Tuesday, June 16, 2026 10:09:53 AM Central European Summer Time Tvrtko
> Ursulin wrote:
>> On 25/05/2026 12:45, Timur Kristóf wrote:
>>> When retry faults are disabled (amdgpu.noretry=1),
>>> the ENABLE_RETRY_FAULT_INTERRUPT bit should be programmed to 0.
>>>
>>> Note that retry faults are enabled by default on GFX12.1
>>> so this just fixes the case when they are explicitly disabled.
>>>
>>> Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
>>> ---
>>>
>>>    drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c
>>> b/drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c index
>>> 4c2fd1e6616e..d2edfe037da8 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c
>>> @@ -243,7 +243,7 @@ static void
>>> gfxhub_v12_1_xcc_init_system_aperture_regs(struct amdgpu_device *ade>
>>>    		tmp = REG_SET_FIELD(tmp,
> GCVM_L2_PROTECTION_FAULT_CNTL2,
>>>    		
>>>    				
> ACTIVE_PAGE_MIGRATION_PTE_READ_RETRY, 1);
>>>    		
>>>    		tmp = REG_SET_FIELD(tmp,
> GCVM_L2_PROTECTION_FAULT_CNTL2,
>>>
>>> -				    ENABLE_RETRY_FAULT_INTERRUPT,
> 0x1);
>>> +				    ENABLE_RETRY_FAULT_INTERRUPT,
> !adev->gmc.noretry);
>>>
>>>    		WREG32_SOC15(GC, GET_INST(GC, i),
>>>    		
>>>    			     regGCVM_L2_PROTECTION_FAULT_CNTL2,
> tmp);
>>>    	
>>>    	}
>>
>> If I look at 6f894c92490b ("drm/amdgpu: Enable retry faults for GFX
>> 12.1") which added this code, it also touched
>> gfxhub_v12_1_xcc_setup_vmid_config():
>>
>>       tmp = REG_SET_FIELD(tmp, GCVM_CONTEXT1_CNTL,
>>                           RETRY_PERMISSION_OR_INVALID_PAGE_FAULT,
>> -                       !amdgpu_noretry);
>> +                       1);
>>
>> Should that be changed as well?
>>
> 
> I personally don't have a GFX12.1 GPU so I have no way to verify how that
> works, which is why I try to avoid changing it unless it's pretty obvious that
> the upstream code is wrong.
> 
> Can you elaborate on what you are suggesting exactly?

I'm asking. :)

commit 6f894c92490be1bb27492a82544b4b1e4ad20915
Author: Mukul Joshi <mukul.joshi@amd.com>
Date:   Wed Mar 26 22:06:39 2025 -0400

     drm/amdgpu: Enable retry faults for GFX 12.1

Made these three changes:

gfxhub_v12_1_xcc_init_system_aperture_regs:
+                       tmp = REG_SET_FIELD(tmp, 
GCVM_L2_PROTECTION_FAULT_CNTL2,
+ 
ENABLE_RETRY_FAULT_INTERRUPT, 0x1);


gfxhub_v12_1_xcc_setup_vmid_config:
-                                           !amdgpu_noretry);
+                                           1);


mmhub_v4_2_0_mid_init_system_aperture_regs:
+               tmp = REG_SET_FIELD(tmp, MMVM_L2_PROTECTION_FAULT_CNTL2,
+                                   ENABLE_RETRY_FAULT_INTERRUPT, 0x1);


The claim from that one was that it is enabling retry faults on gfx 
12.1. If that is correct, and we look at your patch which wants respect 
the noretry modparam, but only changes one of those three.

So question is are you confident it is only that one you need to change 
to make it respect the modparam? I don't know to be clear, those are 
just things I spot while reading you patch and the relevant history 
trying to familiarise myself with this area.

Regards,

Tvrtko

