Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDB7A397A4
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Feb 2025 10:53:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE48610E657;
	Tue, 18 Feb 2025 09:53:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 588 seconds by postgrey-1.36 at gabe;
 Mon, 17 Feb 2025 17:26:29 UTC
Received: from rudorff.com (rudorff.com [193.31.26.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7A510E567
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Feb 2025 17:26:29 +0000 (UTC)
Received: from [IPV6:2a02:3102:8418:1620::bd0]
 (dynamic-2a02-3102-8418-1620-0000-0000-0000-0bd0.310.pool.telefonica.de
 [IPv6:2a02:3102:8418:1620::bd0])
 by rudorff.com (Postfix) with ESMTPSA id 2D764401A5;
 Mon, 17 Feb 2025 18:16:39 +0100 (CET)
Message-ID: <8573a8d0-7586-4d1f-91a5-cd850f84b10a@rudorff.com>
Date: Mon, 17 Feb 2025 18:16:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] amdgpu/pm/legacy: fix suspend/resume issues
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
Cc: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>, lijo.lazar@amd.com
References: <20250217152638.672864-1-alexander.deucher@amd.com>
Content-Language: en-US, de-DE
From: "chr[]" <chris@rudorff.com>
In-Reply-To: <20250217152638.672864-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 18 Feb 2025 09:53:37 +0000
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

On 17.02.25 16:26, Alex Deucher wrote:
> From: "chr[]" <chris@rudorff.com>
> 
> resume and irq handler happily races in set_power_state()
> 
> * amdgpu_legacy_dpm_compute_clocks() needs lock
> * protect irq work handler
> * fix dpm_enabled usage
> 
> v2: fix clang build, integrate Lijo's comments (Alex)
> 
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/2524
> Fixes: 3712e7a49459 ("drm/amd/pm: unified lock protections in amdgpu_dpm.c")
> Tested-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name> # on Oland PRO
> Signed-off-by: chr[] <chris@rudorff.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>   drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c    | 25 +++++++++++++-----
>   .../gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c    |  8 ++++--
>   drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c    | 26 ++++++++++++++-----
>   3 files changed, 45 insertions(+), 14 deletions(-)
> 

Hi @all,

thanks for the review and thanks for the rework.

I'm going to test onto v6.8.78 right now.

Maybe it's worth to mention this is a good candidate for backports?!

chr[]




