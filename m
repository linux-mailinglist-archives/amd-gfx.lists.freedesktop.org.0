Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFhjOLUZymlR5QUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Mar 2026 08:35:33 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAD3355FD2
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Mar 2026 08:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B85910E3B6;
	Mon, 30 Mar 2026 06:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EGsNMCD/";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EC210E3B6;
 Mon, 30 Mar 2026 06:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774852528; x=1806388528;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3YEWEDFdGeb8+xmVBhVZgs3VmhzuMoNWRWo753eYyyg=;
 b=EGsNMCD/mBimXxBaAZjDywaEgW5bI0ERSDpqP+1e+WY5Gj8WhR6AV6tk
 mF7XCE4frqGnJFT1d8/WducTzpVvKJIlI9qvTkvncwEioCTmwT6iQgApB
 ImB6BZlVWr71YvjUOVDL85GduPhH8MJwVdwuIpoh0y2TV74hHkVq9aTvg
 ln+8xmFi+o3vWMU9veihETPcvvFEcTtLfQPZvkUOssSgle4JTG1VBkcDF
 0oAkBn7vy+X2hto6ThW1vVT2oI3VXF7SX774/0gO1/zA0KZWt5frfs6jt
 KHrVxlRbUPHT3cN0L9GzLCj1MFvPkHqYOerkyEReDHToeAK0rOG3i4oMO g==;
X-CSE-ConnectionGUID: esJjy2UhRHuZwYltEP5prg==
X-CSE-MsgGUID: 31Ri9+CjTuWoIZnH00ZkNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79700318"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="79700318"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2026 23:35:26 -0700
X-CSE-ConnectionGUID: beCFwWSgS+2lbCcJcK8YAQ==
X-CSE-MsgGUID: CS8WvW4LQ5uO+j83pKobFQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2)
 ([10.211.93.152])
 by fmviesa003.fm.intel.com with ESMTP; 29 Mar 2026 23:35:25 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1w76Da-00000000841-3q9D;
 Mon, 30 Mar 2026 06:35:22 +0000
Date: Mon, 30 Mar 2026 08:34:38 +0200
From: kernel test robot <lkp@intel.com>
To: Adriano Vero <litaliano00.contact@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, jani.nikula@linux.intel.com,
 alexander.deucher@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, christian.koenig@amd.com,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Adriano Vero <litaliano00.contact@gmail.com>
Subject: Re: [PATCH 1/2] drm/edid: populate monitor_range from DisplayID
 Dynamic Video Timing block
Message-ID: <202603300847.vflE6oJO-lkp@intel.com>
References: <20260328132027.22383-1-litaliano00.contact@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328132027.22383-1-litaliano00.contact@gmail.com>
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,linux.intel.com,amd.com,igalia.com,lists.freedesktop.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,git-scm.com:url,intel.com:dkim,intel.com:email,intel.com:mid,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 0EAD3355FD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Adriano,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v7.0-rc6 next-20260327]
[cannot apply to drm-misc/drm-misc-next daeinki-drm-exynos/exynos-drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adriano-Vero/drm-amd-display-remove-manual-DisplayID-VRR-parsing-from-freesync-caps/20260330-002329
base:   https://gitlab.freedesktop.org/drm/kernel.git drm-next
patch link:    https://lore.kernel.org/r/20260328132027.22383-1-litaliano00.contact%40gmail.com
patch subject: [PATCH 1/2] drm/edid: populate monitor_range from DisplayID Dynamic Video Timing block
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260330/202603300847.vflE6oJO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603300847.vflE6oJO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603300847.vflE6oJO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_edid.c:6525 function parameter 'connector' not described in 'drm_get_monitor_range_displayid'
>> Warning: drivers/gpu/drm/drm_edid.c:6525 function parameter 'drm_edid' not described in 'drm_get_monitor_range_displayid'
>> Warning: drivers/gpu/drm/drm_edid.c:6525 function parameter 'connector' not described in 'drm_get_monitor_range_displayid'
>> Warning: drivers/gpu/drm/drm_edid.c:6525 function parameter 'drm_edid' not described in 'drm_get_monitor_range_displayid'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
