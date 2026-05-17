Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vz4KK3ROCWp1UQQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sun, 17 May 2026 07:13:24 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF00E55F485
	for <lists+amd-gfx@lfdr.de>; Sun, 17 May 2026 07:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9107C10E07A;
	Sun, 17 May 2026 05:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NOgoTXo6";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B2C10E07A;
 Sun, 17 May 2026 05:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778994800; x=1810530800;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NrreUJmMhVo7G49aHntbm9vYheKC7kN4qSsf+o47kg0=;
 b=NOgoTXo6TKEFyGAChmJ/1+5n43APU6wqMJPx0zLC50vC9fEbo+US5Edi
 XC8fVY3MI+XoTlWkQw4vkqkDmiVQAHdY2ntu+7002K/w3frgyz+gsc+Lf
 NTq+RXKwni1XSunPIvQrJsXutz0id5OSTY4SdqQnJ+sKTS+3HuSb7DxUC
 tkBK6UPZK7PjBEQd7KlrkSUbKT20ZkxyXJEURFfO7iQK/VzRojnNbQbpY
 v+xO/PsSjOi7jD7CcuWrA7q5bIGvRtegzyrU7QnrR5l1lcGiVaq/9Z6r/
 SRqFdcNtgTVGWG6RL20JN+xowY6aBvlfpHbXD+15loXMRLiovc8T0cjda w==;
X-CSE-ConnectionGUID: zS7grUTdQnKlyTiPuE54gA==
X-CSE-MsgGUID: KT6dNsRxRh2jqRshatFMAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="79931404"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="79931404"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2026 22:13:19 -0700
X-CSE-ConnectionGUID: YxTgBYiNQzeVW9Wus7i42g==
X-CSE-MsgGUID: e6csiXYLTB67IPqF+Dngsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="236053818"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 16 May 2026 22:13:18 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wOToR-000000001NS-2aT4;
 Sun, 17 May 2026 05:13:15 +0000
Date: Sun, 17 May 2026 13:12:45 +0800
From: kernel test robot <lkp@intel.com>
To: Gilles Risch <gilles.risch@gmail.com>, alexander.deucher@amd.com
Cc: oe-kbuild-all@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Gilles Risch <gilles.risch@gmail.com>
Subject: Re: [PATCH] drm/radeon: fix eDP resume from suspend on iMac11, 1 /
 DCE3.1 systems
Message-ID: <202605171301.73YzX9wA-lkp@intel.com>
References: <20260516185226.3005-1-gilles.risch@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516185226.3005-1-gilles.risch@gmail.com>
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
X-Rspamd-Queue-Id: DF00E55F485
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,lists.freedesktop.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,git-scm.com:url,gitlab.freedesktop.org:url,intel.com:email,intel.com:mid,intel.com:dkim]
X-Rspamd-Action: no action

Hi Gilles,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gilles-Risch/drm-radeon-fix-eDP-resume-from-suspend-on-iMac11-1-DCE3-1-systems/20260517-025343
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260516185226.3005-1-gilles.risch%40gmail.com
patch subject: [PATCH] drm/radeon: fix eDP resume from suspend on iMac11, 1 / DCE3.1 systems
config: riscv-randconfig-002-20260517 (https://download.01.org/0day-ci/archive/20260517/202605171301.73YzX9wA-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605171301.73YzX9wA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605171301.73YzX9wA-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/radeon/atombios_encoders.c: In function 'atombios_set_edp_panel_power':
>> drivers/gpu/drm/radeon/atombios_encoders.c:1386:14: error: implicit declaration of function 'ASIC_IS_DCE31'; did you mean 'ASIC_IS_DCE3'? [-Wimplicit-function-declaration]
    1386 |         if (!ASIC_IS_DCE31(rdev))
         |              ^~~~~~~~~~~~~
         |              ASIC_IS_DCE3


vim +1386 drivers/gpu/drm/radeon/atombios_encoders.c

  1372	
  1373	bool
  1374	atombios_set_edp_panel_power(struct drm_connector *connector, int action)
  1375	{
  1376		struct radeon_connector *radeon_connector = to_radeon_connector(connector);
  1377		struct drm_device *dev = radeon_connector->base.dev;
  1378		struct radeon_device *rdev = dev->dev_private;
  1379		union dig_transmitter_control args;
  1380		int index = GetIndexIntoMasterTable(COMMAND, UNIPHYTransmitterControl);
  1381		uint8_t frev, crev;
  1382	
  1383		if (connector->connector_type != DRM_MODE_CONNECTOR_eDP)
  1384			goto done;
  1385	
> 1386		if (!ASIC_IS_DCE31(rdev))
  1387			goto done;
  1388	
  1389		if ((action != ATOM_TRANSMITTER_ACTION_POWER_ON) &&
  1390		    (action != ATOM_TRANSMITTER_ACTION_POWER_OFF))
  1391			goto done;
  1392	
  1393		if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
  1394			goto done;
  1395	
  1396		memset(&args, 0, sizeof(args));
  1397	
  1398		args.v1.ucAction = action;
  1399	
  1400		atom_execute_table(rdev->mode_info.atom_context, index, (uint32_t *)&args, sizeof(args));
  1401	
  1402		/* wait for the panel to power up */
  1403		if (action == ATOM_TRANSMITTER_ACTION_POWER_ON) {
  1404			int i;
  1405	
  1406			for (i = 0; i < 300; i++) {
  1407				if (radeon_hpd_sense(rdev, radeon_connector->hpd.hpd))
  1408					return true;
  1409				mdelay(1);
  1410			}
  1411			return false;
  1412		}
  1413	done:
  1414		return true;
  1415	}
  1416	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
