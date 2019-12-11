Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E1011B8F7
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Dec 2019 17:36:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE9A6EB8E;
	Wed, 11 Dec 2019 16:36:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BF56EB8C;
 Wed, 11 Dec 2019 16:36:49 +0000 (UTC)
Received: from localhost (unknown [40.117.208.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6FBCB222C4;
 Wed, 11 Dec 2019 16:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576082209;
 bh=NZwHo8j5VJ8rYWA8gS2cGqjVO+VP9vWz2rNyVVmBgOE=;
 h=Date:From:To:To:To:CC:Cc:Cc:Subject:In-Reply-To:References:From;
 b=sGNLbUZxIdNnlww1+nP9e8cieisaCIq233bLxNx9A0UI6MdMJRnpOYPs30wvtZjc4
 DpJrzaKEkRrXPQ+bcuvNbZo076vimOp1YPKRaGQpUhczb1JzXykCzyJL0ySEDWEHt7
 zyVsTL41ZoBWRkyhq6YgaKTUGXmKNfwDlenxbw+U=
Date: Wed, 11 Dec 2019 16:36:48 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/dp_mst: clear time slots for ports invalid
In-Reply-To: <20191206083937.9411-1-Wayne.Lin@amd.com>
References: <20191206083937.9411-1-Wayne.Lin@amd.com>
Message-Id: <20191211163649.6FBCB222C4@mail.kernel.org>
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
Cc: , harry.wentland@amd.com, Nicholas.Kazlauskas@amd.com,
 stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi,

[This is an automated email]

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: all

The bot has tested the following trees: v5.4.2, v5.3.15, v4.19.88, v4.14.158, v4.9.206, v4.4.206.

v5.4.2: Failed to apply! Possible dependencies:
    14692a3637d4 ("drm/dp_mst: Add probe_lock")
    37dfdc55ffeb ("drm/dp_mst: Cleanup drm_dp_send_link_address() a bit")
    3f9b3f02dda5 ("drm/dp_mst: Protect drm_dp_mst_port members with locking")
    50094b5dcd32 ("drm/dp_mst: Destroy topology_mgr mutexes")
    5950f0b797fc ("drm/dp_mst: Move link address dumping into a function")
    60f9ae9d0d3d ("drm/dp_mst: Remove huge conditional in drm_dp_mst_handle_up_req()")
    7cb12d48314e ("drm/dp_mst: Destroy MSTBs asynchronously")
    9408cc94eb04 ("drm/dp_mst: Handle UP requests asynchronously")
    a29d881875fc ("drm/dp_mst: Refactor drm_dp_mst_handle_up_req()")
    c485e2c97dae ("drm/dp_mst: Refactor pdt setup/teardown, add more locking")
    caf81ec6cd72 ("drm: Destroy the correct mutex name in drm_dp_mst_topology_mgr_destroy")
    dad7d84f8835 ("drm/dp_mst: Don't forget to update port->input in drm_dp_mst_handle_conn_stat()")
    e2839ff692c6 ("drm/dp_mst: Rename drm_dp_add_port and drm_dp_update_port")

v5.3.15: Failed to apply! Possible dependencies:
    14692a3637d4 ("drm/dp_mst: Add probe_lock")
    37dfdc55ffeb ("drm/dp_mst: Cleanup drm_dp_send_link_address() a bit")
    3f9b3f02dda5 ("drm/dp_mst: Protect drm_dp_mst_port members with locking")
    50094b5dcd32 ("drm/dp_mst: Destroy topology_mgr mutexes")
    562836a269e3 ("drm/dp_mst: Enable registration of AUX devices for MST ports")
    5950f0b797fc ("drm/dp_mst: Move link address dumping into a function")
    60f9ae9d0d3d ("drm/dp_mst: Remove huge conditional in drm_dp_mst_handle_up_req()")
    7cb12d48314e ("drm/dp_mst: Destroy MSTBs asynchronously")
    9408cc94eb04 ("drm/dp_mst: Handle UP requests asynchronously")
    a29d881875fc ("drm/dp_mst: Refactor drm_dp_mst_handle_up_req()")
    c485e2c97dae ("drm/dp_mst: Refactor pdt setup/teardown, add more locking")
    caf81ec6cd72 ("drm: Destroy the correct mutex name in drm_dp_mst_topology_mgr_destroy")
    dad7d84f8835 ("drm/dp_mst: Don't forget to update port->input in drm_dp_mst_handle_conn_stat()")
    e2839ff692c6 ("drm/dp_mst: Rename drm_dp_add_port and drm_dp_update_port")

v4.19.88: Failed to apply! Possible dependencies:
    1e55a53a28d3 ("drm: Trivial comment grammar cleanups")
    706246c761dd ("drm/dp_mst: Refactor drm_dp_update_payload_part1()")
    72fdb40c1a4b ("drm: extract drm_atomic_uapi.c")
    7f4de521001f ("drm/atomic: Add __drm_atomic_helper_plane_reset")
    a5ec8332d428 ("drm: Add per-plane pixel blend mode property")
    c485e2c97dae ("drm/dp_mst: Refactor pdt setup/teardown, add more locking")
    d0757afd00d7 ("drm/dp_mst: Rename drm_dp_mst_get_validated_(port|mstb)_ref and friends")
    d86552efe10a ("drm/atomic: trim driver interface/docs")
    dad7d84f8835 ("drm/dp_mst: Don't forget to update port->input in drm_dp_mst_handle_conn_stat()")
    de9f8eea5a44 ("drm/atomic_helper: Stop modesets on unregistered connectors harder")
    ebcc0e6b5091 ("drm/dp_mst: Introduce new refcounting scheme for mstbs and ports")
    fc63668656bd ("drm/dp_mst: Remove bogus conditional in drm_dp_update_payload_part1()")

v4.14.158: Failed to apply! Possible dependencies:
    0bb9c2b27f5e ("drm/dp/mst: Sideband message transaction to power up/down nodes")
    163bcc2c74a2 ("drm/atomic: Move drm_crtc_commit to drm_crtc_state, v4.")
    179c02fe90a4 ("drm/tve200: Add new driver for TVE200")
    1e55a53a28d3 ("drm: Trivial comment grammar cleanups")
    21a01abbe32a ("drm/atomic: Fix freeing connector/plane state too early by tracking commits, v3.")
    22a07038c0ea ("drm: NULL pointer dereference [null-pointer-deref] (CWE 476) problem")
    24557865c8b1 ("drm: Add Content Protection property")
    2ed077e467ee ("drm: Add drm_object lease infrastructure [v5]")
    34ca26a98ad6 ("drm/atomic_helper: Allow DPMS On<->Off changes for unregistered connectors")
    66660d4cf21b ("drm: add connector info/property for non-desktop displays [v2]")
    6d544fd6f4e1 ("drm/doc: Put all driver docs into a separate chapter")
    706246c761dd ("drm/dp_mst: Refactor drm_dp_update_payload_part1()")
    72fdb40c1a4b ("drm: extract drm_atomic_uapi.c")
    8d70f395e6cb ("drm: Add support for a panel-orientation connector property, v6")
    935774cd71fe ("drm: Add writeback connector type")
    c485e2c97dae ("drm/dp_mst: Refactor pdt setup/teardown, add more locking")
    c76f0f7cb546 ("drm: Begin an API for in-kernel clients")
    d0757afd00d7 ("drm/dp_mst: Rename drm_dp_mst_get_validated_(port|mstb)_ref and friends")
    dad7d84f8835 ("drm/dp_mst: Don't forget to update port->input in drm_dp_mst_handle_conn_stat()")
    de9f8eea5a44 ("drm/atomic_helper: Stop modesets on unregistered connectors harder")
    e96550956fbc ("drm/atomic_helper: Disallow new modesets on unregistered connectors")
    ebcc0e6b5091 ("drm/dp_mst: Introduce new refcounting scheme for mstbs and ports")
    fc63668656bd ("drm/dp_mst: Remove bogus conditional in drm_dp_update_payload_part1()")

v4.9.206: Failed to apply! Possible dependencies:
    0bb9c2b27f5e ("drm/dp/mst: Sideband message transaction to power up/down nodes")
    1cec20f0ea0e ("dma-buf: Restart reservation_object_wait_timeout_rcu() after writes")
    3f3353b7e121 ("drm/dp: Introduce MST topology state to track available link bandwidth")
    6806cdf9aa1c ("drm/kms-helpers: Use recommened kerneldoc for struct member refs")
    78010cd9736e ("dma-buf/fence: add an lockdep_assert_held()")
    9498c19b3f53 ("drm: Move tile group code into drm_connector.c")
    9a83a71ac0d5 ("drm/fences: add DOC: for explicit fencing")
    beaf5af48034 ("drm/fence: add out-fences support")
    c485e2c97dae ("drm/dp_mst: Refactor pdt setup/teardown, add more locking")
    d0757afd00d7 ("drm/dp_mst: Rename drm_dp_mst_get_validated_(port|mstb)_ref and friends")
    d807ed1c55fb ("drm: atomic: Clarify documentation around drm_atomic_crtc_needs_modeset")
    dad7d84f8835 ("drm/dp_mst: Don't forget to update port->input in drm_dp_mst_handle_conn_stat()")
    ea0dd85a75f1 ("drm/doc: use preferred struct reference in kernel-doc")
    edb1ed1ab7d3 ("drm/dp: Add DP MST helpers to atomically find and release vcpi slots")
    f54d1867005c ("dma-buf: Rename struct fence to dma_fence")
    fedf54132d24 ("dma-buf: Restart reservation_object_get_fences_rcu() after writes")

v4.4.206: Failed to apply! Possible dependencies:
    081e9c0f8b5f ("drm/atomic: kerneldoc for drm_atomic_crtc_needs_modeset")
    092d01dae09a ("drm: Reorganize helper vtables and their docs")
    0bb9c2b27f5e ("drm/dp/mst: Sideband message transaction to power up/down nodes")
    132d49d728f3 ("drm/dp-mst: Missing kernel doc")
    1eb83451ba55 ("drm: Pass the user drm_mode_fb_cmd2 as const to .fb_create()")
    286dbb8d5d80 ("drm/atomic: Rename async parameter to nonblocking.")
    373701b1fc7d ("drm: fix potential dangling else problems in for_each_ macros")
    3f3353b7e121 ("drm/dp: Introduce MST topology state to track available link bandwidth")
    441388a8a73f ("drm/mst: Don't ignore the MST PBN self-test result")
    4c5b7f3ae53b ("drm/atomic: export drm_atomic_helper_wait_for_fences()")
    5fff80bbdb6b ("drm/atomic: Allow for holes in connector state, v2.")
    6806cdf9aa1c ("drm/kms-helpers: Use recommened kerneldoc for struct member refs")
    69a0f89c0641 ("drm/dp/mst: constify drm_dp_mst_topology_cbs structures")
    9953f41799bd ("drm: Kerneldoc for drm_mode_config_funcs")
    9f2a7950e77a ("drm/atomic-helper: nonblocking commit support")
    a095caa7f5ec ("drm/atomic-helper: roll out commit synchronization")
    b516a9efb7af ("drm: Move LEAVE/ENTER_ATOMIC_MODESET to fbdev helpers")
    be9174a482b9 ("drm/atomic-helper: use for_each_*_in_state more")
    c240906d3665 ("drm/atomic-helper: Export framebuffer_changed()")
    c485e2c97dae ("drm/dp_mst: Refactor pdt setup/teardown, add more locking")
    d0757afd00d7 ("drm/dp_mst: Rename drm_dp_mst_get_validated_(port|mstb)_ref and friends")
    d807ed1c55fb ("drm: atomic: Clarify documentation around drm_atomic_crtc_needs_modeset")
    dad7d84f8835 ("drm/dp_mst: Don't forget to update port->input in drm_dp_mst_handle_conn_stat()")
    edb1ed1ab7d3 ("drm/dp: Add DP MST helpers to atomically find and release vcpi slots")
    ef8f9bea1368 ("dp/mst: add SDP stream support")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks,
Sasha
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
