Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vbJfEyhZV2rWKAEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jul 2026 11:55:52 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBCD75CB57
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jul 2026 11:55:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ursulin.net header.s=google header.b=WusNA65F;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=none
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D95D10EF7A;
	Wed, 15 Jul 2026 09:55:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6F710EFA1
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Jul 2026 09:55:48 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-698ab9aae16so471585a12.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Jul 2026 02:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1784109346; x=1784714146; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=FZVpmEANIsSQzT4SSojpBcve8yVwSI8zLh2O0wOMzrM=;
 b=WusNA65FHstKKDulkrNgoPydn1p3lx5vJa+Pmzk6Wg0oTld/J5qyU5UqbQPYg5Q3VS
 3UBkoz4/HU+2gSDYWaP2pc8BJ31L+OE8lEM4oxcjZXMmkqhZc8C1dZLyYHrgHKontqFJ
 sdo8qaCG8C4iiKM2G7BzBAsnzAHgDBGTUHeOqwZzXJUBwvXCACKsNl/x9+TBJbp/Iul3
 thD1NECG9qrunJ8L7DpxmwvUahkZ/Et86p+j6IwYzoRJzMLeAVmIl2nBdMZ/e/nt3Y9Z
 Ni5kMaTCquyjfn4/CHXZVi4KzJ43g0gOzxxnj5TkpMFUC3Z4qrQxLo5nkyUNgnEeNjHK
 aiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784109346; x=1784714146;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FZVpmEANIsSQzT4SSojpBcve8yVwSI8zLh2O0wOMzrM=;
 b=XS1TlmM+GxhuvKThr3QJIU0m4/zeb1sIbYK5bDP7ID91RPLjXaub5iMfiEfkvu5ok5
 fSK5rWTIFfg/O8CWfEoKHXB6W/W44dWFyDtoIhwFnUbs3K4MvpYtfA/IBAQHCB8eEPb/
 pNm0dB/UFHWuQ1ymm7uniPIwe6/APPWg8KcoP0j85b0MUVutewq1A9HJFefS0C1ACWm0
 VFIEJgdTPPbnAT9HfaV2cMs/gv77jb3VJ3HlMNHhRxmfkwAzUIZAMiiwicj/dDPSRQRk
 H0AyMpE6owqxMwRy4skyv3Krk0A3BszmdZA3rrDNosM6p3w4rr/LM1lnd9hlrOzex61d
 CXsA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpfTcRkrB5IeXp5ncM2jCU7g/F3FFTp2NBb5V/F9XczcArK8ouiUKG+dKIMFgDpw3WIB70+kwIe@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVEbi5gGu3u5f2TiL3fDcH2Ej6NIEBwIIr1ozr8Kgehq1qL1s2
 WQ8MxgOfnkwsPYcNMGnZJNgd4SNaFLe+qDBTTx4o/18XVYwAaXlObL8ggPwFEK/g5nk=
X-Gm-Gg: AfdE7clVitdsrW+OnjoMjJaod4FpRW37nTXj7rywR0zY1kIIjSKgHjSmPGHZVMAne1H
 +1fMlHZ2WhQ4+Bku1NfXV08SC9lUJX/2RoREgKDbjbX7cqhsU5iyYgkLX91X7NqMghzu2V7F/m9
 zr7W44L495ZJXS3QWKc1z/WgLjd56GPcS0o8F4ddO1m5Or7M1Wf9Wy9uBSm02chZct9uMHe2J/e
 45pGBG+seAoqOXuE4eDcAKguPw0kr6CxqUgSi9zLTF/8sDgxo1JRSgZ1x88Ngs1sBFIK8shvejn
 2KqNceyRLgTJrH5UzN7t8c3PwDP3N97pl0ne8tc4OgEQ12/tdwHNkvipGbbVJixH5IaBXpQRf1d
 oSrQ57stF09n5Lwa41CMQQ+3KbCGgAoRp6o/BmOWxLAO16TNZAUzD+xVJ+RNTOTd1K6npZgcWr2
 VcQB6/qP0axDthBRJZ7G6diyJaObt62aBBlg==
X-Received: by 2002:a17:906:f5a1:b0:c16:12ff:dc8b with SMTP id
 a640c23a62f3a-c161f3b58ecmr899396166b.54.1784109346439; 
 Wed, 15 Jul 2026 02:55:46 -0700 (PDT)
Received: from [192.168.0.116] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c16746c103dsm116236766b.24.2026.07.15.02.55.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jul 2026 02:55:46 -0700 (PDT)
Message-ID: <cebab06b-0533-4f92-9d8c-8e592f880459@ursulin.net>
Date: Wed, 15 Jul 2026 10:55:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] drm/amdgpu/gfx7: Enable IP block soft reset as a GPU
 recovery method
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, pierre-eric.pelloux-prayer@amd.com,
 Natalie Vock <natalie.vock@gmx.de>
References: <20260713125838.30607-1-timur.kristof@gmail.com>
 <20260713125838.30607-10-timur.kristof@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260713125838.30607-10-timur.kristof@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9DBCD75CB57


On 13/07/2026 13:58, Timur Kristóf wrote:
> Enable IP block soft reset as a GPU recovery method for GFX7
> graphics and compute rings.
> 
> This improves current user experience on all GFX7 chips:
> 
> * On Kaveri and Kabini there is currently no working
>    GPU recovery method so those chips currently require
>    the user to manually reset the computer when there
>    was a hang.
> 
> * On Hawaii and Bonaire, the current GPU recovery method
>    always clears the contents of VRAM, which means that
>    a buggy (hanging) app can crash the whole graphical
>    session, which is less than ideal.
> 
> Using GFX IP block soft reset means that we can now
> have a working recovery on GFX7 APUs and we can also
> move on from GFX hangs on dGPUs without crashing the
> whole system.
> 
> Tested with the "hard_reset_cp_wait" test case from the
> Hang Test Suite created by Natalie Vock and Konstantin Seurer.
> This Vulkan testcase waits for an event that never occurs,
> effectively a WAIT_REG_MEM packet that intentionally hangs.
> IP block soft reset can resolve that hang and allow
> the rest of the system to move on and keep functioning
> without needing a full ASIC reset.
> 
> Tested on the following chips:
> 
> Bonaire (Radeon HD 7790)
> Hawaii (Radeon R9 390X)
> Kaveri (A10-7850K)
> 
> Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> index 825e3d7d5f0f..1a7a6962303e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> @@ -4434,6 +4434,11 @@ static int gfx_v7_0_sw_init(struct amdgpu_ip_block *ip_block)
>   	adev->gfx.compute_supported_reset =
>   		amdgpu_get_soft_full_reset_mask(&adev->gfx.compute_ring[0]);
>   
> +	if (!amdgpu_sriov_vf(adev) && !adev->debug_disable_ip_block_soft_reset) {
> +		adev->gfx.compute_supported_reset |= AMDGPU_RESET_TYPE_IP_BLOCK_SOFT_RESET;
> +		adev->gfx.gfx_supported_reset |= AMDGPU_RESET_TYPE_IP_BLOCK_SOFT_RESET;
> +	}
> +
>   	return r;
>   }
>   

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

