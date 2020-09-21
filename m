Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE0F272453
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Sep 2020 14:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7202D6E34D;
	Mon, 21 Sep 2020 12:54:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CB16E343
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Sep 2020 12:54:56 +0000 (UTC)
Received: from localhost (unknown [70.37.104.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 03C71218AC;
 Mon, 21 Sep 2020 12:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600692896;
 bh=WT8BUuGkQbBbADczGnO26fqsByS/9yUtHE6jBj8ZmdY=;
 h=Date:From:To:To:To:To:CC:Cc:Cc:Subject:In-Reply-To:References:
 From;
 b=yN3f6QLevzkHmZncB7sOIZ6LgKTTMeQ8nwMzn1zdIv7RWCWw2pQZl3EtX63vEVa6Z
 Wq8zTnCXzfLWen+EE5L+THc564Kth8IubWZC0gJKDY2xhNIzOGoa7yaK4qmSTX3Afa
 al0gZjABNt7e79YBSFzLoxbD9+A8WhmxyF3+pwSc=
Date: Mon, 21 Sep 2020 12:54:55 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Qingqing Zhuo <qingqing.zhuo@amd.com>
To: Wesley Chalmers <Wesley.Chalmers@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 07/15] drm/amd/display: Fix ODM policy implementation
In-Reply-To: <20200916193635.5169-8-qingqing.zhuo@amd.com>
References: <20200916193635.5169-8-qingqing.zhuo@amd.com>
Message-Id: <20200921125456.03C71218AC@mail.kernel.org>
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
Cc: Sunpeng.Li@amd.com, Harry.Wentland@amd.com, stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi

[This is an automated email]

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: all

The bot has tested the following trees: v5.8.10, v5.4.66, v4.19.146, v4.14.198, v4.9.236, v4.4.236.

v5.4.66: Failed to apply! Possible dependencies:
    2b77dcc5e5aa ("drm/amd/display: rename core_dc to dc")
    48af9b91b129 ("drm/amd/display: Don't allocate payloads if link lost")
    4c1a1335dfe0 ("drm/amd/display: Driverside changes to support PSR in DMCUB")
    7f7652ee8c8c ("drm/amd/display: enable single dp seamless boot")
    904fb6e0f4e8 ("drm/amd/display: move panel power seq to new panel struct")
    9ae1b27f31d0 ("drm/amd/display: fix hotplug during display off")
    9dac88d8792a ("drm/amd/display: Add driver support for enabling PSR on DMCUB")
    ab4a4072f260 ("drm/amd/display: exit PSR during detection")
    b739ab3a4fe6 ("drm/amd/display: Fix incorrect backlight register offset for DCN")
    d4252eee1f7c ("drm/amd/display: Add debugfs entry to force YUV420 output")
    d462fcf5012b ("drm/amd/display: Update hdcp display config")
    e0d08a40a63b ("drm/amd/display: Add debugfs entry for reading psr state")
    e78a312f81c8 ("drm/amd/display: use requested_dispclk_khz instead of clk")
    ef5a7d266e82 ("drm/amd/display: skip enable stream on disconnected display")

v4.19.146: Failed to apply! Possible dependencies:
    1f6010a96273 ("drm/amd/display: Improve spelling, grammar, and formatting of amdgpu_dm.c comments")
    813d20dccf93 ("drm/amd/display: Fix multi-thread writing to 1 state")
    8c3db1284a01 ("drm/amdgpu: fill in amdgpu_dm_remove_sink_from_freesync_module")
    904fb6e0f4e8 ("drm/amd/display: move panel power seq to new panel struct")
    98e6436d3af5 ("drm/amd/display: Refactor FreeSync module")
    a87fa9938749 ("drm/amd/display: Build stream update and plane updates in dm")
    a94d5569b232 ("drm/amd: Add DM DMCU support")
    b739ab3a4fe6 ("drm/amd/display: Fix incorrect backlight register offset for DCN")
    b8592b48450b ("drm/amd/display: Initial documentation for AMDgpu DC")
    dc88b4a684d2 ("drm/amd/display: make clk mgr soc specific")
    eb3dc8978596 ("drm/amd/display: Use private obj helpers for dm_atomic_state")

v4.14.198: Failed to apply! Possible dependencies:
    1296423bf23c ("drm/amd/display: define DC_LOGGER for logger")
    1b0c0f9dc5ca ("drm/amdgpu: move userptr BOs to CPU domain during CS v2")
    3fe89771cb0a ("drm/amdgpu: stop reserving the BO in the MMU callback v3")
    4562236b3bc0 ("drm/amd/dc: Add dc display driver (v2)")
    60de1c1740f3 ("drm/amdgpu: use a rw_semaphore for MMU notifiers")
    74c49c7ac14f ("drm/amdgpu/display: Add calcs code for DCN")
    904fb6e0f4e8 ("drm/amd/display: move panel power seq to new panel struct")
    9a18999640fa ("drm/amdgpu: move MMU notifier related defines to amdgpu_mn.h")
    9cca0b8e5df0 ("drm/amdgpu: move amdgpu_cs_sysvm_access_required into find_mapping")
    a216ab09955d ("drm/amdgpu: fix userptr put_page handling")
    b72cf4fca2bb ("drm/amdgpu: move taking mmap_sem into get_user_pages v2")
    b739ab3a4fe6 ("drm/amd/display: Fix incorrect backlight register offset for DCN")
    ca666a3c298f ("drm/amdgpu: stop using BO status for user pages")
    dc88b4a684d2 ("drm/amd/display: make clk mgr soc specific")
    f3efec54ed6a ("drm/amd/display: Allow option to use worst-case watermark")

v4.9.236: Failed to apply! Possible dependencies:
    1296423bf23c ("drm/amd/display: define DC_LOGGER for logger")
    1cec20f0ea0e ("dma-buf: Restart reservation_object_wait_timeout_rcu() after writes")
    248a1d6f1ac4 ("drm/amd: fix include notation and remove -Iinclude/drm flag")
    4562236b3bc0 ("drm/amd/dc: Add dc display driver (v2)")
    74c49c7ac14f ("drm/amdgpu/display: Add calcs code for DCN")
    78010cd9736e ("dma-buf/fence: add an lockdep_assert_held()")
    904fb6e0f4e8 ("drm/amd/display: move panel power seq to new panel struct")
    b739ab3a4fe6 ("drm/amd/display: Fix incorrect backlight register offset for DCN")
    dc88b4a684d2 ("drm/amd/display: make clk mgr soc specific")
    f3efec54ed6a ("drm/amd/display: Allow option to use worst-case watermark")
    f54d1867005c ("dma-buf: Rename struct fence to dma_fence")
    fedf54132d24 ("dma-buf: Restart reservation_object_get_fences_rcu() after writes")

v4.4.236: Failed to apply! Possible dependencies:
    0f477c6dea70 ("staging/android/sync: add sync_fence_create_dma")
    1296423bf23c ("drm/amd/display: define DC_LOGGER for logger")
    1f7371b2a5fa ("drm/amd/powerplay: add basic powerplay framework")
    248a1d6f1ac4 ("drm/amd: fix include notation and remove -Iinclude/drm flag")
    288912cb95d1 ("drm/amdgpu: use $(src) in Makefile (v2)")
    375fb53ec1be ("staging: android: replace explicit NULL comparison")
    395dec6f6bc5 ("Documentation: add doc for sync_file_get_fence()")
    4325198180e5 ("drm/amdgpu: remove GART page addr array")
    4562236b3bc0 ("drm/amd/dc: Add dc display driver (v2)")
    62304fb1fc08 ("dma-buf/sync_file: de-stage sync_file")
    74c49c7ac14f ("drm/amdgpu/display: Add calcs code for DCN")
    904fb6e0f4e8 ("drm/amd/display: move panel power seq to new panel struct")
    a1d29476d666 ("drm/amdgpu: optionally enable GART debugfs file")
    a8fe58cec351 ("drm/amd: add ACP driver support")
    b70f014d58b9 ("drm/amdgpu: change default sched jobs to 32")
    b739ab3a4fe6 ("drm/amd/display: Fix incorrect backlight register offset for DCN")
    c784c82a3fd6 ("Documentation: add Sync File doc")
    d4cab38e153d ("staging/android: prepare sync_file for de-staging")
    d7fdb0ae9d11 ("staging/android: rename sync_fence to sync_file")
    dc88b4a684d2 ("drm/amd/display: make clk mgr soc specific")
    f3efec54ed6a ("drm/amd/display: Allow option to use worst-case watermark")
    f54d1867005c ("dma-buf: Rename struct fence to dma_fence")
    fac8434dab96 ("Documentation: Fix some grammar mistakes in sync_file.txt")
    fdba11f4079e ("drm/amdgpu: move all Kconfig options to amdgpu/Kconfig")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
