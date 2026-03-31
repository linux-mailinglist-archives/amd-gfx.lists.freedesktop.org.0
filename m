Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CBDA7RhzWmMcwYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Apr 2026 20:19:32 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C45637F1ED
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Apr 2026 20:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5ECD10EE6F;
	Wed,  1 Apr 2026 18:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LSqVvFyE";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319DF10EA21;
 Tue, 31 Mar 2026 09:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774948850; x=1806484850;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VZ6UZpRCisDZ0WrxY1YID/gtq9IPO92Nbhk/YRRgjAE=;
 b=LSqVvFyETniaQUyeV4ES8EEqh+7uPh0cJX1d4ZLKOYGsA9jix8eYYuv9
 DnClljOCY/nELcuWQuMqZ+h4Tu/TbF+RzXpayjEzQDoa9/k28ZfpPt2zF
 I18jONDpwDKKM7OdQ09pCY90QlYuRVPgsDcJDAR0KXch/i9mH5utPKJQx
 8tRi6+iGxejZaiXYOtUFBsaaIFLgnwP4nwIsFsDS7weIL/WURukZ1gEPt
 5zGtHIK92eWX/4laWI+nN7udmpXPH/w+wlMkaKiupR1nZR/kQY8+9euX0
 ja1mThD7+EptkZRiJeACPqryK0KTf7VlNHd7hIYGF9dFELr76frzyIuSA w==;
X-CSE-ConnectionGUID: vkT3vER2RaW3jJpCEwxi5Q==
X-CSE-MsgGUID: Zup7A+0tRVGhkWTf/oKdCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="74988488"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="74988488"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 02:20:49 -0700
X-CSE-ConnectionGUID: Q+og3cpcR76uQamTbuu8iQ==
X-CSE-MsgGUID: FjVXI9zhQQ2Rk63Ki5ODOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="226288492"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.28])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 02:20:45 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Alice Ryhl <aliceryhl@google.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 0/5] drm/exec: drm_exec polishing
Date: Tue, 31 Mar 2026 11:20:18 +0200
Message-ID: <20260331092023.81616-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 01 Apr 2026 18:19:20 +0000
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
X-Spamd-Result: default: False [0.69 / 15.00];
	DATE_IN_PAST(1.00)[32];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[linux.intel.com,amd.com,gmail.com,ffwll.ch,kernel.org,suse.de,intel.com,google.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 2C45637F1ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

During the work towards enabling exhaustive eviction using full
ww locking in TTM, Christian indicated that the path for the
drm_exec moving forward was to be a full drm_exec helper with
things like userptr validation rather than a WW transaction
abstraction. The idea was then briefly discussed to craft a
WW transaction helper and then subclass that with drm_exec
with the idea that the WW transaction helper could be used in
TTM for eviction and for other uses that didn't mandate a full
exec sequence.

Regardless whether that actually happens or not, this series
aims to clean up abuses of drm_exec internals in drivers
so that future development of drm_exec isn't blocked by
such driver usage.

Except for patch 3 which is a small cleanup only.

Thomas Hellström (5):
  drm/exec: Remove the index parameter from
    drm_exec_for_each_locked_obj[_reverse]
  drm/msm: Remove abuse of drm_exec internals
  drm/exec: Make the drm_exec_until_all_locked() macro more readable
  drm/exec, drm/xe: Avoid abusing the drm_exec retry pointer
  drm/exec, drm/xe, drm/amdgpu: Add an accessor for struct
    drm_exec::ticket

 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        | 15 ++---
 .../drm/amd/amdgpu/amdgpu_eviction_fence.c    |  3 +-
 drivers/gpu/drm/drm_exec.c                    |  6 +-
 drivers/gpu/drm/drm_gpuvm.c                   |  3 +-
 drivers/gpu/drm/msm/msm_gem.h                 |  1 +
 drivers/gpu/drm/msm/msm_gem_submit.c          |  4 +-
 drivers/gpu/drm/xe/xe_validation.c            |  4 +-
 drivers/gpu/drm/xe/xe_validation.h            |  2 +-
 drivers/gpu/drm/xe/xe_vm.c                    |  3 +-
 include/drm/drm_exec.h                        | 55 +++++++++++++------
 11 files changed, 58 insertions(+), 42 deletions(-)

-- 
2.53.0

