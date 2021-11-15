Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF724508A6
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Nov 2021 16:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D1989B7B;
	Mon, 15 Nov 2021 15:36:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAED56E040;
 Mon, 15 Nov 2021 11:07:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="213454539"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="213454539"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 03:07:15 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="471871683"
Received: from smile.fi.intel.com ([10.237.72.184])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 03:07:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mmZpE-0072P3-CN; Mon, 15 Nov 2021 13:07:00 +0200
Date: Mon, 15 Nov 2021 13:07:00 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v1 1/3] string: Consolidate yesno() helpers under
 string.h hood
Message-ID: <YZI/VB+RhScL1wAi@smile.fi.intel.com>
References: <20210215142137.64476-1-andriy.shevchenko@linux.intel.com>
 <20211005213423.dklsii4jx37pjvb4@ldmartin-desk2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005213423.dklsii4jx37pjvb4@ldmartin-desk2>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Mon, 15 Nov 2021 15:36:48 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 amd-gfx@lists.freedesktop.org, Jakub Kicinski <kuba@kernel.org>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Eryk Brol <eryk.brol@amd.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Daniel Vetter <daniel@ffwll.ch>, Raju Rangoju <rajur@chelsio.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Oct 05, 2021 at 02:34:23PM -0700, Lucas De Marchi wrote:
> On Mon, Feb 15, 2021 at 04:21:35PM +0200, Andy Shevchenko wrote:
> > We have already few similar implementation and a lot of code that can benefit
> > of the yesno() helper.  Consolidate yesno() helpers under string.h hood.
> 
> I was taking a look on i915_utils.h to reduce it and move some of it
> elsewhere to be shared with others.  I was starting with these helpers
> and had [1] done, then Jani pointed me to this thread and also his
> previous tentative. I thought the natural place for this would be
> include/linux/string_helpers.h, but I will leave it up to you.

Seems reasonable to use string_helpers (headers and/or C-file).

> After reading the threads, I don't see real opposition to it.
> Is there a tree you plan to take this through?

I rest my series in favour of Jani's approach, so I suppose there is no go
for _this_ series.

> [1] https://lore.kernel.org/lkml/20211005212634.3223113-1-lucas.demarchi@intel.com/T/#u

-- 
With Best Regards,
Andy Shevchenko


