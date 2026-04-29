Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JL2NI1d88ml2rwEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Apr 2026 23:47:03 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E20FF49AAE8
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Apr 2026 23:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F25A10E11E;
	Wed, 29 Apr 2026 21:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R97ggd10";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E5310E11E;
 Wed, 29 Apr 2026 21:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777499219; x=1809035219;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=71tGufHLVIhR0fNvIFCqJV7iDKZTxt3CByNLikQkMms=;
 b=R97ggd10HZc4WM3hy2PZ0tgdgNmbNYHCTaNRV3ZvGSAIsZCZKVKEspse
 BGAIDok1XhnfGv/dCzSQO6HwgkMdmpVMeNPyJ0KZLyDJL4/xOYvcbLwc7
 zN7eGXhU3fL79XyWuUk4T2C3cNi9MCn7YfiiqoMOWZt2C6454gNNAUL2f
 Ha3p9Ep65+ytMbVqhiHdQgD0bIMNUVhREyll55lqFWEBMGVv5Vw0CAvNI
 1Ev7lukKy6V+fC9Vc57jNczUdHvqMJ0HqBCV958M/HPha00B1tMGvX48Q
 /cC0mgEBHB33NBuNLr47D97onCS/ticpHe8VRhHAD5yeNdfWjODoCpDCK g==;
X-CSE-ConnectionGUID: lWshXW9STNOOkqZzgsWB0w==
X-CSE-MsgGUID: GKlSJR43QXSp5JlG/sSaKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="77605820"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="77605820"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 14:46:58 -0700
X-CSE-ConnectionGUID: +s3H4it+QXiQB+LfIGOC2Q==
X-CSE-MsgGUID: 8kWWS6+1QTWaDfj6KbDk9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="272509355"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 29 Apr 2026 14:46:55 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wICk8-00000000BZU-0a6Q;
 Wed, 29 Apr 2026 21:46:52 +0000
Date: Thu, 30 Apr 2026 05:46:27 +0800
From: kernel test robot <lkp@intel.com>
To: Evgenii Burenchev <evg28bur@yandex.ru>, stable@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Evgenii Burenchev <evg28bur@yandex.ru>, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/radeon/rs780: prevent division by zero in refresh
 rate calculation
Message-ID: <202604300508.yXci8rey-lkp@intel.com>
References: <20260428190318.34413-1-evg28bur@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428190318.34413-1-evg28bur@yandex.ru>
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
X-Rspamd-Queue-Id: E20FF49AAE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,yandex.ru,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FREEMAIL_TO(0.00)[yandex.ru,vger.kernel.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,01.org:url]

Hi Evgenii,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v7.1-rc1 next-20260429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Evgenii-Burenchev/drm-radeon-rs780-prevent-division-by-zero-in-refresh-rate-calculation/20260429-055830
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260428190318.34413-1-evg28bur%40yandex.ru
patch subject: [PATCH] drm/radeon/rs780: prevent division by zero in refresh rate calculation
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260430/202604300508.yXci8rey-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300508.yXci8rey-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300508.yXci8rey-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/radeon/rs780_dpm.c:68:5: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
      68 |                                 if (pi->refresh_rate == 0)
         |                                 ^
   drivers/gpu/drm/radeon/rs780_dpm.c:66:4: note: previous statement is here
      66 |                         if (crtc->mode.htotal && crtc->mode.vtotal)
         |                         ^
   1 warning generated.


vim +/if +68 drivers/gpu/drm/radeon/rs780_dpm.c

    48	
    49	static void rs780_get_pm_mode_parameters(struct radeon_device *rdev)
    50	{
    51		struct igp_power_info *pi = rs780_get_pi(rdev);
    52		struct radeon_mode_info *minfo = &rdev->mode_info;
    53		struct drm_crtc *crtc;
    54		struct radeon_crtc *radeon_crtc;
    55		int i;
    56	
    57		/* defaults */
    58		pi->crtc_id = 0;
    59		pi->refresh_rate = 60;
    60	
    61		for (i = 0; i < rdev->num_crtc; i++) {
    62			crtc = (struct drm_crtc *)minfo->crtcs[i];
    63			if (crtc && crtc->enabled) {
    64				radeon_crtc = to_radeon_crtc(crtc);
    65				pi->crtc_id = radeon_crtc->crtc_id;
    66				if (crtc->mode.htotal && crtc->mode.vtotal)
    67					pi->refresh_rate = drm_mode_vrefresh(&crtc->mode);
  > 68					if (pi->refresh_rate == 0)
    69						pi->refresh_rate = 60;
    70				break;
    71			}
    72		}
    73	}
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
