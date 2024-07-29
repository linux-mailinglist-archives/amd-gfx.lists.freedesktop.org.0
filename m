Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B1B93F189
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jul 2024 11:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD48410E38D;
	Mon, 29 Jul 2024 09:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lZ/iGgKS";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F5310E387;
 Mon, 29 Jul 2024 09:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722246473; x=1753782473;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=RsomBzoCT2Ys4129Ye8pTLrTKipGkhhvsMm7FxcIZXM=;
 b=lZ/iGgKSb+RqpysLPiw8OsO+kmi7GVCmIYvEmYSPg6se1dIttXGURaEx
 NBeRmuzBkGXpqeCDI91GrVrD8kOI+d/JCUWISF0HYl0cagcxtMq992Hrf
 UT7Wr2/YL6PMcIyUlxVOAVoz4OLIDpYowz1iMGPCxWqLPozwR9PTDr9SJ
 Ck0KYeBTvVb7GGkthYJgpWdYQT8H0PT+YJA5gSrRIim6qpgIKP9jxK3wa
 qlcUPT1U+X+8xZnOHr78YKJOPb+K5o1uQqOPUuoKu3jcVo9BkVzsVQo/H
 qnEt8jopZj3ULCvQpuJPogRYlA1VjQBztwW3LrmyHeJhA+E0/CvOFlpOU A==;
X-CSE-ConnectionGUID: Y+UHa8hgTY+lk2LujTrBLA==
X-CSE-MsgGUID: /8v8S5fIRzehR759xlLC5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="23851502"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="23851502"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 02:47:52 -0700
X-CSE-ConnectionGUID: 2yMcJEKfRiiYRrkCukWK5w==
X-CSE-MsgGUID: V5lA0qVPRZ20S6Se2HssBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="58062474"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.185])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 02:47:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Alex Deucher <alexdeucher@gmail.com>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <linux@weissschuh.net>
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6n?=
 =?utf-8?Q?ig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Xinhui Pan <Xinhui.Pan@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/radeon: convert bios_hardcoded_edid to drm_edid
In-Reply-To: <CADnq5_NwCJV0exdGJ+nCFKdSZ-D85LsLQqCucF54jxtSa=yvSA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240726-amdgpu-edid-bios-v2-0-8a0326654253@weissschuh.net>
 <20240726-amdgpu-edid-bios-v2-2-8a0326654253@weissschuh.net>
 <CADnq5_NwCJV0exdGJ+nCFKdSZ-D85LsLQqCucF54jxtSa=yvSA@mail.gmail.com>
Date: Mon, 29 Jul 2024 12:47:45 +0300
Message-ID: <874j88zfzy.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 26 Jul 2024, Alex Deucher <alexdeucher@gmail.com> wrote:
> Applied the series.  Thanks!

Ah, replied to patch 1 before noticing this. Never mind about the
bikeshedding. :)

BR,
Jani.

-- 
Jani Nikula, Intel
