Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 230AE4046B5
	for <lists+amd-gfx@lfdr.de>; Thu,  9 Sep 2021 10:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4586E484;
	Thu,  9 Sep 2021 08:05:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DB16E484
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Sep 2021 08:05:02 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id u9so1209402wrg.8
 for <amd-gfx@lists.freedesktop.org>; Thu, 09 Sep 2021 01:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=RWdrOYla9aR1wZCxqUeWV3FSsYS1iOIetBPvAopBXZ0=;
 b=BOUaWev0noIo82WMc3EqCmoEkbSNKQSxocTJse7loiGLT0UuiQAPL7H9y59HBArfxt
 OytibCSsmov2w/Y4gsZSKTWr69XaeHLcjKDqJAiJwnw20qXwyumrqpxu+nthKiVUc15R
 /Wl0B4TQpmqG9tnqvHSeovSx0mB3MMr73JsZx+W4lPHzVXu78uQezFXUS4Lg7hENdlpa
 fyJ8OLFF+haEugZBsqx2fcpj1aWIn9+qwbWDS8hxuIgkJBks+T5k+aKfcQsAaar/2kM5
 sLqH7OR7lZIClqy0WeQGuavGMW7YoAZFiSfrwghLOlsAwUerFqK0VZP4n7a7Bii0FnY9
 uPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=RWdrOYla9aR1wZCxqUeWV3FSsYS1iOIetBPvAopBXZ0=;
 b=uMJA9OcC3au3OHJfpRh4acMpEJVIZO8N0B2mnzWAHflBqFgKfIL41fYbhvd8oj4zNE
 A8AsBdlnYtAVQEUM/2+lti7NpIdWFml75/Ko1emKow6nAX1KwZkC4sKOmyPjIgqewAEr
 jB9KN2sQwBU2fiwlg4UsIXWTpsrk0Wc/MGqfp5gKMICUfnCheAu5+WdwXYtoqSaoiQ32
 AxDwlJPuUQwQL8jA+3JOpZqEBdJ7Sxz9upAOi3lYK8dcZqOAIl4a166Dryxlc2GfdVY9
 +F1XQ71womsc81mBKYG67zxtb6S5MvyxxySonAKBTAIhR1YyNgQrTWehtvfTMICPV2Se
 jz7w==
X-Gm-Message-State: AOAM531154SYIdVjNgkJxcAgnEvmaPCW+bNbGiqYV5eViM9rsp+rgOhm
 TCq8pWjIt2eKUNzc3JUShzwZTwU7AlA=
X-Google-Smtp-Source: ABdhPJzM79Ya2RPNMDzDHt9TIPt64ORsLBpAzUT48i+p0itvvEmFFu1ZL/tuBixOMAqQLLnuEi/8wg==
X-Received: by 2002:adf:fb49:: with SMTP id c9mr170806wrs.44.1631174700659;
 Thu, 09 Sep 2021 01:05:00 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:7140:364b:3af8:f004?
 ([2a02:908:1252:fb60:7140:364b:3af8:f004])
 by smtp.gmail.com with ESMTPSA id d9sm1237820wrb.36.2021.09.09.01.04.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 01:05:00 -0700 (PDT)
Subject: Re: [PATCH 0/4] Fix stack usage of DML
To: Harry Wentland <harry.wentland@amd.com>, amd-gfx@lists.freedesktop.org
Cc: ndesaulniers@google.com, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org, arnd@kernel.org, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 nathan@kernel.org, linux@roeck-us.net, llvm@lists.linux.dev
References: <20210909010023.29110-1-harry.wentland@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <76749a45-64e9-c478-cf93-ac7a26b48cd8@gmail.com>
Date: Thu, 9 Sep 2021 10:04:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210909010023.29110-1-harry.wentland@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

It's nice to see at least some of them addressed, feel free to add an 
Acked-by: Christian König <christian.koenig@amd.com>

Regards,
Christian.

Am 09.09.21 um 03:00 schrieb Harry Wentland:
> With the '-Werror' enablement patch the amdgpu build was failing
> on clang builds because a bunch of functions were blowing past
> the 1024 byte stack frame default. Due to this we also noticed
> that a lot of functions were passing large structs by value
> instead of by pointer.
>
> This series attempts to fix this.
>
> There is still one remaining function that blows the 1024 limit by 40 bytes:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:3397:6:
>   
> error: stack frame size of 1064 bytes in function
> 'dml21_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than=]
>
> This will be a slightly more challenging fix but I'll see if we can get it
> below 1024 by breaking it into smaller functions.
>
> With this series I can build amdgpu with CC=clang and a stack frame limit of
> 1064.
>
> This series boots on a Radeon RX 5500 XT.
>
> Harry Wentland (4):
>    drm/amd/display: Pass display_pipe_params_st as const in DML
>    drm/amd/display: Pass all structs in display_rq_dlg_helpers by pointer
>    drm/amd/display: Fix rest of pass-by-value structs in DML
>    drm/amd/display: Allocate structs needed by dcn_bw_calc_rq_dlg_ttu in
>      pipe_ctx
>
>   .../gpu/drm/amd/display/dc/calcs/dcn_calcs.c  |  55 ++--
>   .../drm/amd/display/dc/dcn20/dcn20_resource.c |   2 +-
>   .../dc/dml/dcn20/display_rq_dlg_calc_20.c     | 158 +++++------
>   .../dc/dml/dcn20/display_rq_dlg_calc_20.h     |   4 +-
>   .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c   | 156 +++++------
>   .../dc/dml/dcn20/display_rq_dlg_calc_20v2.h   |   4 +-
>   .../dc/dml/dcn21/display_rq_dlg_calc_21.c     | 156 +++++------
>   .../dc/dml/dcn21/display_rq_dlg_calc_21.h     |   4 +-
>   .../dc/dml/dcn30/display_rq_dlg_calc_30.c     | 132 ++++-----
>   .../dc/dml/dcn30/display_rq_dlg_calc_30.h     |   4 +-
>   .../dc/dml/dcn31/display_rq_dlg_calc_31.c     | 166 ++++++------
>   .../dc/dml/dcn31/display_rq_dlg_calc_31.h     |   4 +-
>   .../drm/amd/display/dc/dml/display_mode_lib.h |   4 +-
>   .../display/dc/dml/display_rq_dlg_helpers.c   | 256 +++++++++---------
>   .../display/dc/dml/display_rq_dlg_helpers.h   |  20 +-
>   .../display/dc/dml/dml1_display_rq_dlg_calc.c | 246 ++++++++---------
>   .../display/dc/dml/dml1_display_rq_dlg_calc.h |  10 +-
>   .../gpu/drm/amd/display/dc/inc/core_types.h   |   3 +
>   18 files changed, 695 insertions(+), 689 deletions(-)
>

