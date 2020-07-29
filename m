Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088A8231B63
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Jul 2020 10:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C37B6E487;
	Wed, 29 Jul 2020 08:40:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4D06E487
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Jul 2020 08:40:57 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id df16so461332edb.9
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Jul 2020 01:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=nHwGEXIDdEWM1SFuSLiTPO0DKMAF3HcCaneii2+wsDE=;
 b=GRt6rfYguekDhCMsI09KenqDJfZqCkJtJB3QDhT3OqO73pKbJCeyzRwgXbvJhTYk98
 9Lfic3axcW3RLQ+6pXHMrY3lOvswUAoX93B3ZiH7o66LbK6eIU4HiTFqKCb55lSdYKlX
 3kTeb+r0xsLeyy4KKJ3nK/BfL3nhSCEYToL95h6K8s3NemhVfTHb6c8y+7ah4SG6Ep+P
 wpPgC3YL8KioUxz8eXZSvjVvU7SausseaiMZug+CiWMXo/ugP2QG4FThGfBN4f0x1NqY
 E1OGbbF4fXhlRZmcwLHqbmKGZkEFr412cDU5E+pAPGBgBUR0YITj4bjiF4cvlLLZRnqQ
 DdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=nHwGEXIDdEWM1SFuSLiTPO0DKMAF3HcCaneii2+wsDE=;
 b=oo4GWOgVtMEskYudt6HQrTKh2WypB3MKVM1UKUFZOlzMl/oT2wmjfRM0sdLeg6uhh4
 y5NZVqeoUDskyA2EngGeIzmplyxaTkzxzi051n9x2XTLamhfJdrnYYHHvdsp2eG2higG
 6NMYS8F3cMOWD1j59+qGHVOfL4B3Lgey3WkqF+MRNtYPRIHvpi5yjXddSNjDfgOsyVF1
 WiaMrI49kAdvv6U52/kFvZmndxaQ92OireC8su6leTA7A+OWxRngt1mIYLJc/hyLWJPk
 eReore+8G4KYz7Qf9z4xEQyme/yk3/X/i/TuPV4fF4pclQjotjXctycnMOvsp/Aepyxk
 T7FA==
X-Gm-Message-State: AOAM530Np8+0HN+wJ59t+mrocXbRJHOviG1KtN/cXP5H0rdsPoVZvWso
 pUmdd+gdHgwVvU2RYbGqFQh7vKVo
X-Google-Smtp-Source: ABdhPJwYrG219kWDkHmt6+cyrS/hdi6nFf6xtkMSZ0Ap1v7xIqRDuQ2xgSBX8Z2QZh8x3HQYO+9Ruw==
X-Received: by 2002:a50:fa4c:: with SMTP id c12mr28101174edq.5.1596012056436; 
 Wed, 29 Jul 2020 01:40:56 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id u8sm1007920ejm.65.2020.07.29.01.40.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2020 01:40:55 -0700 (PDT)
Subject: Re: [PATCH 01/14] drm/amdgpu: handle bo size 0 in
 amdgpu_bo_create_kernel_at
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20200728224605.3919-1-alexander.deucher@amd.com>
 <20200728224605.3919-2-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ee51f338-6554-f3df-9a7a-3b3411b7ca3f@gmail.com>
Date: Wed, 29 Jul 2020 10:40:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728224605.3919-2-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am 29.07.20 um 00:45 schrieb Alex Deucher:
> Just return early to match other bo_create functions.
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 5ac7b5561475..16a37caa654a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -366,6 +366,11 @@ int amdgpu_bo_create_kernel_at(struct amdgpu_device *adev,
>   	unsigned int i;
>   	int r;
>   
> +	if (!size) {
> +		amdgpu_bo_unref(bo_ptr);
> +		return 0;
> +	}
> +

Maybe we could just check if amdgpu_bo_create_reserved() allocated a BO 
or not since we have the same check there already.

Christian.

>   	offset &= PAGE_MASK;
>   	size = ALIGN(size, PAGE_SIZE);
>   

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
