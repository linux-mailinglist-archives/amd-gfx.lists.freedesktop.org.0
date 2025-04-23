Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02296A97DA1
	for <lists+amd-gfx@lfdr.de>; Wed, 23 Apr 2025 05:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4AB910E185;
	Wed, 23 Apr 2025 03:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="pjh1pdQC";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 407 seconds by postgrey-1.36 at gabe;
 Wed, 23 Apr 2025 03:55:48 UTC
Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com
 [51.81.35.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F36410E185
 for <amd-gfx@lists.freedesktop.org>; Wed, 23 Apr 2025 03:55:44 +0000 (UTC)
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
 by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 04B3521510
 for <amd-gfx@lists.freedesktop.org>; Wed, 23 Apr 2025 03:48:53 +0000 (UTC)
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.156])
 by relay5.mymailcheap.com (Postfix) with ESMTPS id 15D9020076
 for <amd-gfx@lists.freedesktop.org>; Wed, 23 Apr 2025 03:48:42 +0000 (UTC)
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
 by relay4.mymailcheap.com (Postfix) with ESMTPS id D5F30209CE;
 Wed, 23 Apr 2025 03:48:27 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 by nf2.mymailcheap.com (Postfix) with ESMTPSA id D6E3440168;
 Wed, 23 Apr 2025 03:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
 t=1745380105; bh=2XL6ixfoDpURIpoCw5CidzLKNggYQxj1Gaju6sbV1kU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pjh1pdQCK38Wp8MSJgAvBRaRjTLU++31bZOoNV8JxG+KbVUcHVgAZ0OpH7CSzmGIO
 zf3crQabzIzTw28HzTC7Gyr+fI87AvUX5vhlE7vVofccmszqi6SuG7mlun/VEpueZK
 ewAvMZe65/WopydXRQRDIHrsZ42YPYdOAPz5PfsE=
Received: from [198.18.0.1] (unknown [203.175.14.48])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 23EED4036E;
 Wed, 23 Apr 2025 03:48:18 +0000 (UTC)
Message-ID: <ab7f1ba8-a49c-41a1-9b6f-ca142fbbe9d2@aosc.io>
Date: Wed, 23 Apr 2025 11:48:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] drm/amd/display: Stop control flow if the divisior
 is zero
To: Tiezhu Yang <yangtiezhu@loongson.cn>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Huacai Chen <chenhuacai@loongson.cn>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 loongarch@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Kexy Biscuit <kexybiscuit@aosc.io>
References: <20250114132856.19463-1-yangtiezhu@loongson.cn>
Content-Language: en-US
From: Mingcong Bai <jeffbai@aosc.io>
In-Reply-To: <20250114132856.19463-1-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D6E3440168
X-Rspamd-Server: nf2.mymailcheap.com
X-Spamd-Result: default: False [0.00 / 10.00]; SUBJECT_RANDOM_CHARS_1(0.10)[];
 MIME_GOOD(-0.10)[text/plain];
 ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_ONE(0.00)[1];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[16]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
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

Hi all,

在 2025/1/14 21:28, Tiezhu Yang 写道:
> As far as I can tell, with the current existing macro definitions, there
> is no better way to do the minimal and proper changes to stop the control
> flow if the divisior is zero.
> 
> In order to keep the current ability for the aim of debugging and avoid
> printing the warning message twice, it is better to only use ASSERT_BUG()
> and SPL_ASSERT_BUG() directly after doing the following two steps:
> 
> (1) Add ASSERT_BUG() macro definition
> (2) Add SPL_ASSERT_BUG() macro definition
> 
> This version is based on 6.13-rc7, tested on x86 and LoongArch.
> 
> Tiezhu Yang (3):
>    drm/amd/display: Add ASSERT_BUG() macro definition
>    drm/amd/display: Add SPL_ASSERT_BUG() macro definition
>    drm/amd/display: Harden callers of division functions
> 
>   drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c  |  2 +-
>   drivers/gpu/drm/amd/display/dc/os_types.h           |  7 +++++++
>   drivers/gpu/drm/amd/display/dc/spl/spl_debug.h      | 11 +++++++++++
>   drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c |  2 +-
>   4 files changed, 20 insertions(+), 2 deletions(-)
> 

Gentle ping on this series...

Harry and Huacai, can you please take a look at this updated series 
(since you have both provided comments on previous revisions?), thank you!

Best Regards,
Mingcong Bai
