Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C88F25AE918
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Sep 2022 15:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6724010E65F;
	Tue,  6 Sep 2022 13:08:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3DD9E10E566;
 Tue,  6 Sep 2022 11:42:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E59AE139F;
 Tue,  6 Sep 2022 04:42:48 -0700 (PDT)
Received: from [10.57.15.197] (unknown [10.57.15.197])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACCB33F534;
 Tue,  6 Sep 2022 04:42:37 -0700 (PDT)
Message-ID: <5f4d77c3-ec58-659e-0b03-a799b3782a31@arm.com>
Date: Tue, 6 Sep 2022 12:42:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] drm/amdgpu: cleanup coding style in amdgpu_drv.c
Content-Language: en-GB
To: Jingyu Wang <jingyuwang_vip@163.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, evan.quan@amd.com, mario.limonciello@amd.com,
 Felix.Kuehling@amd.com, andrey.grodzovsky@amd.com, olomon.chiu@amd.com
References: <4362da59f466d8c41c9a3ea91348266280b6a594>
 <20220904191513.15159-1-jingyuwang_vip@163.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220904191513.15159-1-jingyuwang_vip@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 06 Sep 2022 13:08:36 +0000
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 2022-09-04 20:15, Jingyu Wang wrote:
[...]
> @@ -565,8 +566,8 @@ module_param_named(timeout_period, amdgpu_watchdog_timer.period, uint, 0644);
>    */
>   #ifdef CONFIG_DRM_AMDGPU_SI
>   
> -#if defined(CONFIG_DRM_RADEON) || defined(CONFIG_DRM_RADEON_MODULE)
> -int amdgpu_si_support = 0;
> +#if IS_ENABLED(CONFIG_DRM_RADEON) || defined(CONFIG_DRM_RADEON_MODULE)

Hint: read the checkpatch warning again more closely, and consider what 
IS_ENABLED() does and therefore why this is still not quite right.

Robin.

> +int amdgpu_si_support;
>   MODULE_PARM_DESC(si_support, "SI support (1 = enabled, 0 = disabled (default))");
>   #else
>   int amdgpu_si_support = 1;
