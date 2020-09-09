Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC48E262B86
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Sep 2020 11:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443646ED7E;
	Wed,  9 Sep 2020 09:15:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C0D6ED7E
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Sep 2020 09:15:14 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id nw23so2494636ejb.4
 for <amd-gfx@lists.freedesktop.org>; Wed, 09 Sep 2020 02:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=jDSk/EIH8mKSIyGf3zG1fsxE4diyBZAwuCGQRHuI3J0=;
 b=BGpSh21a1/60PSgwZY3nWxGFYkAX/T5H72uTm4YSIZUFCiu9/E17Jh8xfq+aWbrB/O
 iGhuQftUFN4STpGsbfCW7HIkF7Sdwm8jP8zkkvp7sn7ddYMbPgeMOhCznfJYRHx5JreY
 rcuTBnrFCSXEOUCRg1woJ/XazEYNc6+qVYfzBTp2ngOwlAF8aztNtAcIob3y9hO0Lw+b
 ZpUuN0d2O4ukD9ar9uKlrEqToyeQoWjqdnmSPaRsWyT8DrZr8Tg1UxFOF7C68pAoWZQ2
 BcWHCH6FIjItD2vlRtAoN6natpKwQuyRK+xOusSOwVBofKPj+PcgDZ7HhGc0WzOOQRXx
 Qm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=jDSk/EIH8mKSIyGf3zG1fsxE4diyBZAwuCGQRHuI3J0=;
 b=HIB05xJFti/nsZzK+9Ik49f6xFZljlq5554WsmRk/rKm6L60o72xIisiM+k7gYtQaB
 GA5xVNXH9KVPusvyR9Al78WIXLjh6m+4jlGLj3wTYuEqX/QLYAL1h3vHlDataoeye6Ns
 nDeoNd14DAiHZESONce4/34/LB+UueX4r0bVQXFY9dkfC5dTdtZFzmcPeXiRJyjz0PPj
 u/Qfs+poqmcrcxQUUGd4seE9DKv4KPMtGe8CXqmIfnsl34/9I1Jixgrr1Wxf1kInVEkK
 Mp5g1KZtIK6OFB/BW0xbhy+ofV1oEntnn16M0AtngBD+RJsRMAiHwh46pMniTo3MFtsr
 yMmw==
X-Gm-Message-State: AOAM531q9LzZt8pn2a8BwYSxCdaa4IzgwmiD4FVphMlEe2m7WdOR22D9
 6navtdnhcBa2WPB20y3ETAw=
X-Google-Smtp-Source: ABdhPJxyKPj+7/wSjBwIusGihPJN9H/gzj0p77AiIFrRIVcxrfuAdH6fQnmUNif+vRDUxM2dd8x3yA==
X-Received: by 2002:a17:906:4cd6:: with SMTP id
 q22mr2615078ejt.139.1599642913384; 
 Wed, 09 Sep 2020 02:15:13 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id t6sm1456158ejc.40.2020.09.09.02.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 02:15:12 -0700 (PDT)
Subject: Re: [REGRESSION][BISECTED] 5.9-rc4 disables console on radeon
To: Mikael Pettersson <mikpelinux@gmail.com>,
 Linux Kernel list <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <CAM43=SOCs699z9E1EK3EG8BCJFw_9veWa7xWOEokvwj01NVS6Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d207de12-3143-1243-bcff-b4ccbfb32b92@gmail.com>
Date: Wed, 9 Sep 2020 11:15:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAM43=SOCs699z9E1EK3EG8BCJFw_9veWa7xWOEokvwj01NVS6Q@mail.gmail.com>
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

Yes, that is an already known issue.

We are most likely going to revert the patch ASAP.

Christian.

Am 08.09.20 um 18:27 schrieb Mikael Pettersson:
> Starting with linux-5.9-rc4, the Dell monitor on my desktop PC goes
> black during boot
> when the kernel activates the framebuffer console, except for this
> error message shown
> in the center of the screen:
>
> "Dell U2412M
>   The current input timing is not supported by the monitor display. Please
>   change your input timing to 1920x1200@60Hz or any other monitor
>   listed timing as per the monitor specifications.
>   <DVI symbol>"
>
> The monitor remains black until I reboot.
>
> All kernels up to and including 5.9-rc3 were Ok.  A git bisect identified
>
> # first bad commit: [fc8c70526bd30733ea8667adb8b8ffebea30a8ed]
> drm/radeon: Prefer lower feedback dividers
>
> as the culprit, and reverting that from -rc4 makes the console work again.
>
> Adding a bit of debugging code to that function shows:
>
> avivo_get_fb_ref_div: fb_div_new 136 fb_div_old 137
> avivo_get_fb_ref_div: fb_div_new 142 fb_div_old 143
> avivo_get_fb_ref_div: fb_div_new 136 fb_div_old 137
> avivo_get_fb_ref_div: fb_div_new 119 fb_div_old 120
> avivo_get_fb_ref_div: fb_div_new 136 fb_div_old 137
>
> during boot, where "new" is what the commit above changed the code to compute,
> and "old" is the value computed by the working code from rc3.
>
> The graphics card is a Radeon HD6450 silent model:
> 01:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
> [AMD/ATI] Caicos [Radeon HD 6450/7450/8450 / R5 230 OEM] (prog-if 00
> [VGA controller])
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
