Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0961F9FB8
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2020 20:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5A76E4CA;
	Mon, 15 Jun 2020 18:56:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DCB6E4BB
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2020 18:55:30 +0000 (UTC)
IronPort-SDR: w4jcaUX+1ZN4R4tX+x0CqRcq/ZZuZvQxKDiCmpzEu1et25UjPmLcjXdeUvMbsAKIKXfiOYLSxQ
 NE/0mZouHTUQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2020 11:55:29 -0700
IronPort-SDR: 7AOfFl+Q9Zk9+pLDv+ctsLfdexol4Ooa9fms1lqtuvgDaDmflZdjgu5bI2sLLO96QFzKhPty0n
 Vry9GVkoZi+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,515,1583222400"; d="scan'208";a="382630204"
Received: from romley-ivt3.sc.intel.com ([172.25.110.60])
 by fmsmga001.fm.intel.com with ESMTP; 15 Jun 2020 11:55:30 -0700
Date: Mon, 15 Jun 2020 11:55:29 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 12/12] x86/traps: Fix up invalid PASID
Message-ID: <20200615185529.GD13792@romley-ivt3.sc.intel.com>
References: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
 <1592008893-9388-13-git-send-email-fenghua.yu@intel.com>
 <20200615075649.GK2497@hirez.programming.kicks-ass.net>
 <20200615154854.GB13792@romley-ivt3.sc.intel.com>
 <20200615160357.GA2531@hirez.programming.kicks-ass.net>
 <20200615181259.GC13792@romley-ivt3.sc.intel.com>
 <20200615183116.GD2531@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615183116.GD2531@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Mon, 15 Jun 2020 18:56:27 +0000
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
Cc: Dave Hansen <dave.hansen@intel.com>, H Peter Anvin <hpa@zytor.com>,
 Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Joerg Roedel <joro@8bytes.org>, x86 <x86@kernel.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>, Ingo Molnar <mingo@redhat.com>,
 Ravi V Shankar <ravi.v.shankar@intel.com>, Yu-cheng Yu <yu-cheng.yu@intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Sohil Mehta <sohil.mehta@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Tony Luck <tony.luck@intel.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Jacob Jun Pan <jacob.jun.pan@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi, Peter,

On Mon, Jun 15, 2020 at 08:31:16PM +0200, Peter Zijlstra wrote:
> On Mon, Jun 15, 2020 at 11:12:59AM -0700, Fenghua Yu wrote:
> > > I don't get why you need a rdmsr here, or why not having one would
> > > require a TIF flag. Is that because this MSR is XSAVE/XRSTOR managed?
> > 
> > My concern is TIF flags are precious (only 3 slots available). Defining
> > a new TIF flag may be not worth it while rdmsr() can check if PASID
> > is valid in the MSR. And performance here might not be a big issue
> > in #GP.
> > 
> > But if you think using TIF flag is better, I can define a new TIF flag
> > and maintain it per thread (init 0 when clone()/fork(), set 1 in fixup()).
> > Then we can avoid using rdmsr() to check valid PASID in the MSR.
> 
> WHY ?!?! What do you need a TIF flag for?

We need "a way" to check if the per thread MSR has a valid PASID. If yes,
no need to fix up the MSR (wrmsr()), and let other handler to handle the #GP.
Otherwise, apply the heuristics and fix up the MSR and exit the #GP.

The way to check the valid PASID in the MSR is rdmsr() in this series.
A TIF flag will be much faster than rdmsr() and seems a sutiable way
to check valid PASID status per thread. That's why it could replace
rdmsr() to check PASID in the MSR.

Or do you suggest to add a random new flag in struct thread_info instead
of a TIF flag?

Thanks.

-Fenghua

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
