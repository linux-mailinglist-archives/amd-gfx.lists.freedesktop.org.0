Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rr6qL14WBGo2DgIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 13 May 2026 08:12:46 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEC852DF79
	for <lists+amd-gfx@lfdr.de>; Wed, 13 May 2026 08:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5F410ECA0;
	Wed, 13 May 2026 06:12:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ek3yxEEQ";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9EE10E5B9;
 Wed, 13 May 2026 06:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778652761; x=1810188761;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OPkMkAq3Vt4D5HP6HHu2QZmLTQ2yNtGT2h/4iX1OVCk=;
 b=ek3yxEEQnK3We9hdYqHJA8+r4CRF7uxGMvGwoXUKudXqBK4zi9XbqR0H
 bAHa0gBXBuJDjvJ5Q6EzDUlYgr1p4+ULkhiLnmyn5usPGGdgtUVv/iyky
 YwuTFChuGo2pNzJbzcotfMgTjzYZ7FTW7u+JtcIugluJAH0uQGQ2utUkQ
 Z+IHRX7Y5CkLrspqU+iNG9crHO6wEt5MB4rHaGuQoCUW7xaeq/zRNHJAn
 L6tbg6J3J/ZKmdiMWxlQhsqyoy+kMK0HpaOPEekH3zGp8hlPNzVHRyFsC
 4SuJsOVhOFuN0G96OPidxbU9fhNTJBIGvc0JSqa/SzCbo5qepIgVeP1yH Q==;
X-CSE-ConnectionGUID: GSlKrztqSlaVwasoNhw/Uw==
X-CSE-MsgGUID: cg935qKlRvSgfM6f9iyXBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="82140627"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="82140627"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 23:12:41 -0700
X-CSE-ConnectionGUID: pqJwWXPsStqD1mkHu0/tWg==
X-CSE-MsgGUID: /9iG0Hx1S6yY/5vviuDzhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="231599572"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f)
 ([10.211.93.152])
 by fmviesa009.fm.intel.com with ESMTP; 12 May 2026 23:12:38 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wN2pg-000000008UD-29dc;
 Wed, 13 May 2026 06:12:36 +0000
Date: Wed, 13 May 2026 08:12:04 +0200
From: kernel test robot <lkp@intel.com>
To: Andre Jun Hirata <andrejhirata@usp.br>, kenneth.feng@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 gabriel.dimant@usp.br, guilhermesangabriel@usp.br,
 Andre Jun Hirata <andrejhirata@usp.br>
Subject: Re: [PATCH v5] drm/amd/pm: Use guard(mutex) instead of manual
 lock+unlock
Message-ID: <202605130808.IJrao3wX-lkp@intel.com>
References: <20260508230312.6108-1-andrejhirata@usp.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508230312.6108-1-andrejhirata@usp.br>
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
X-Rspamd-Queue-Id: 2CEC852DF79
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[usp.br,amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:mid,intel.com:dkim,git-scm.com:url]
X-Rspamd-Action: no action

Hi Andre,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on next-20260508]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andre-Jun-Hirata/drm-amd-pm-Use-guard-mutex-instead-of-manual-lock-unlock/20260513-040937
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260508230312.6108-1-andrejhirata%40usp.br
patch subject: [PATCH v5] drm/amd/pm: Use guard(mutex) instead of manual lock+unlock
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260513/202605130808.IJrao3wX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130808.IJrao3wX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605130808.IJrao3wX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c:247:40: error: expected ';' after return statement
     247 |         return smu_mode1_reset_is_support(smu)
         |                                               ^
         |                                               ;
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c:833:24: warning: unused variable 'vstate' [-Wunused-variable]
     833 |         struct amd_vce_state *vstate = NULL;
         |                               ^~~~~~
   1 warning and 1 error generated.


vim +247 drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c

   238	
   239	bool amdgpu_dpm_is_mode1_reset_supported(struct amdgpu_device *adev)
   240	{
   241		struct smu_context *smu = adev->powerplay.pp_handle;
   242	
   243		if (!is_support_sw_smu(adev))
   244			return false;
   245	
   246		guard(mutex)(&adev->pm.mutex);
 > 247		return smu_mode1_reset_is_support(smu)
   248	}
   249	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
