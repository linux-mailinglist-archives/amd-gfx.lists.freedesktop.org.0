Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W1kMLKNTVmrD3QAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2026 17:20:03 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F047565B0
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2026 17:20:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ursulin.net header.s=google header.b=G4WhmOGZ;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=none
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB9710E592;
	Tue, 14 Jul 2026 15:20:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6230810E592
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2026 15:20:00 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-698aa7ba320so2950245a12.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2026 08:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1784042399; x=1784647199; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=MSRtcgNKLvqHa5ywkuCHjj1SjCq3OAPUmFPULOOkLkQ=;
 b=G4WhmOGZPwGSca0rLzzXIidoHywLvjKRItPoCLesg7lfFd0CNVcAh8actPDUmASC/7
 0Dwgsz8O+MkxtCAhHnxk6ujqyo/Dp62GNEfywvJrZvWJ4eKv0k4X5WW3UE6YlfcLhsha
 Ddt00ZKbujeCHtC1RNCPs3jvcDPAhof3a2e6Pa9ijfo8QwJsP9BvquCspWr8NO5MBLiA
 NI31p+KbfQfowrZoF5f1JUGwOsi+7S8abl0btCECRnpSYMvbzzXkvYCKeHJ5jV/1bg54
 QcUvgbO6SPqBVBPiJzH5f2YGw0V8QCJuD1iWkPc7Oea/r/wdAOB4x/EViO0fM0JUPgs3
 /RsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784042399; x=1784647199;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MSRtcgNKLvqHa5ywkuCHjj1SjCq3OAPUmFPULOOkLkQ=;
 b=BAkh86aKqXeC+ShnuQQfJo3BIkAn92Mj9Kxo36YkOdpBCo9fFG3HL9N6AO8VTK/XX4
 mErtwnxV1Qf64SKJCtWoAjEUKp/rFgCzUsuCEa5OIOfdpKcp3qvwCu6/31RZFyV7SDQb
 1Vl+6rquzLfzD4eHCuZxX9TxHK8oyyCmWbgOsuayI0ESm23JuM+XeqCIF/iPhxpjXJUz
 oeM+hUPptZlrkAF892R+ZPJr8dzBuS7p+UfzuKfYfO3AQDxtN92a42WbH3hxQn/1B4hY
 vSrXqTY1XZp/7VyegIl54dEutd+iVEFNYtFu7wquWmA8PYlzeix+UPSJIiOrQb92cLad
 /SNg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpXb0YqBFX6UB2x2tTyEx33p2vUiAhf+dZ7Drr74nbiBNW47O2kVubUpaLGZ/Uhm9Mx0aGb/Ku5@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx76pOEZB6nz59eOhE/h1yaH6LQRTfMDPveJQmILyAP4VqaFw9r
 ufaOoLeVLsiq91/nEKtZrlvuadKrjfW44QuAbiTwA+1un0MFs4BNgYzP/yRRfLsMRls5f/wiu0q
 C01QwVQs=
X-Gm-Gg: AfdE7clu8/6VJlcmlpHKbwnusxgh3lDtPzrA2tPJZ0BHyliVyOH9L3rR/vLpGvJkrCr
 9/tcymM4fE7SsepCQ+FKHT1ymxmx6Gp/Y3qtwddONA9HFiZfNP2VHMUtc/iDSt+tRTPZ26NvugD
 zeqvSzBZyQADwYzOs57YCO1tI6sEyn0+cf8dspXvtdXIezwLaEB6/K5mkhKYBUlywTud4SJnqqi
 gNWUpYeaCKQY3IuciYdGl9FKQz4CKR0EcyVYIocItmzqLsqGagrkmUgPlxMgCEHE1wvSjYG+A4L
 Y2R5VwaFD4i02XRBU8yMNTXEfJpAJx5AHApIaoOr/EBDw+/87vrtJ0dxcs0CG0+OJa4EZn1Y0DL
 ML4LeIsUN3mNm/XNK1J7ChKBI4jI3bV4udLqyoClNW45UdASdShheolQEvjJRDtMxkNwRisH/K0
 7SLUazD6bshzdny6bMpwxs3UGVN4r6Lr/Y6l0ExWNP1iHq
X-Received: by 2002:a05:6402:268c:b0:697:eb97:a4ed with SMTP id
 4fb4d7f45d1cf-69c62a77bb3mr6575571a12.7.1784042398686; 
 Tue, 14 Jul 2026 08:19:58 -0700 (PDT)
Received: from [192.168.0.116] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-69cd288c93fsm1756732a12.8.2026.07.14.08.19.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2026 08:19:58 -0700 (PDT)
Message-ID: <061761c8-cdd1-47d2-abcb-718711c49cef@ursulin.net>
Date: Tue, 14 Jul 2026 16:19:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] drm/amdgpu/gfx7: Make amdgpu_gfx_mqd_sw_init() usable
 on GFX7
To: Alex Deucher <alexdeucher@gmail.com>
Cc: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, pierre-eric.pelloux-prayer@amd.com,
 Natalie Vock <natalie.vock@gmx.de>
References: <20260713125838.30607-1-timur.kristof@gmail.com>
 <20260713125838.30607-2-timur.kristof@gmail.com>
 <46f1492b-7e48-4a62-8a2b-7a058221f033@ursulin.net>
 <CADnq5_MWaSxpnMBRYsk-vqhKPvZB_ohq4yCZsu_iYMG+M2dmiA@mail.gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <CADnq5_MWaSxpnMBRYsk-vqhKPvZB_ohq4yCZsu_iYMG+M2dmiA@mail.gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:alexdeucher@gmail.com,m:timur.kristof@gmail.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:pierre-eric.pelloux-prayer@amd.com,m:natalie.vock@gmx.de,m:timurkristof@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ursulin.net:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,amd.com,gmx.de];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,ursulin.net:from_mime,ursulin.net:mid,ursulin.net:email,ursulin.net:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22F047565B0


On 14/07/2026 16:05, Alex Deucher wrote:
> On Tue, Jul 14, 2026 at 10:59 AM Tvrtko Ursulin <tursulin@ursulin.net> wrote:
>>
>>
>> On 13/07/2026 13:58, Timur Kristóf wrote:
>>> We don't use KIQ on GFX7 but otherwise MQD works the
>>> same way as GFX8 and newer.
>>>
>>> Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>> index 96c9d4f00b27..0f142c156afa 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>> @@ -420,7 +420,7 @@ int amdgpu_gfx_mqd_sw_init(struct amdgpu_device *adev,
>>>    #endif
>>>
>>>        /* create MQD for KIQ */
>>> -     if (!adev->enable_mes_kiq && !ring->mqd_obj) {
>>> +     if (adev->asic_type >= CHIP_TOPAZ && !adev->enable_mes_kiq && !ring->mqd_obj) {
>>
>> CHIP_TOPAZ is gfx7? Hm if it is then the branch would already run there.
>> So the change is limiting the branch to a subset of platforms, while the
>> patch title made me think it is enabling something on gfx7. Perhaps
>> somehow indirectly or what am I not understanding?
> 
> TOPAZ is gfx8.

Ah now I get it, thank you! Could maybe adev->gfx[0].kiq.something or be 
used to make it a bit self-documenting?
Regards,

Tvrtko

>>
>>>                /* originaly the KIQ MQD is put in GTT domain, but for SRIOV VRAM domain is a must
>>>                 * otherwise hypervisor trigger SAVE_VF fail after driver unloaded which mean MQD
>>>                 * deallocated and gart_unbind, to strict diverage we decide to use VRAM domain for
>>

