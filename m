Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B882828C926
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Oct 2020 09:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6C26E8B5;
	Tue, 13 Oct 2020 07:17:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E9B6E5A4;
 Mon, 12 Oct 2020 19:53:57 +0000 (UTC)
IronPort-SDR: Z08Z665rO5PXmGF8O9qZun9jaiChMKPlORx0oMpDPzMtgzruua8epwfF6EUWUlLMA5q1BCHcuX
 eCECJhl1pgqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="183261281"
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; d="scan'208";a="183261281"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 12:53:56 -0700
IronPort-SDR: fkO3cV1AstS50IlWJFeIR7IMIWTUvxOVu0RxBH9tBAb2aFjzmjvlioAsa4gAQcEu3X0zxNtHVX
 KqidbmrXoAPg==
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; d="scan'208";a="530096227"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 12:53:54 -0700
Date: Mon, 12 Oct 2020 12:53:54 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH RFC PKS/PMEM 22/58] fs/f2fs: Utilize new kmap_thread()
Message-ID: <20201012195354.GC2046448@iweiny-DESK2.sc.intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-23-ira.weiny@intel.com>
 <20201009213434.GA839@sol.localdomain>
 <20201010003954.GW20115@casper.infradead.org>
 <20201010013036.GD1122@sol.localdomain>
 <20201012065635.GB2046448@iweiny-DESK2.sc.intel.com>
 <20201012161946.GA858@sol.localdomain>
 <5d621db9-23d4-e140-45eb-d7fca2093d2b@intel.com>
 <20201012164438.GA20115@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201012164438.GA20115@casper.infradead.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-Mailman-Approved-At: Tue, 13 Oct 2020 07:17:50 +0000
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
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linux-mmc@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Dave Hansen <dave.hansen@intel.com>,
 target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Thomas Gleixner <tglx@linutronix.de>, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, linux-afs@lists.infradead.org,
 Eric Biggers <ebiggers@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 intel-wired-lan@lists.osuosl.org, kexec@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 bpf@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Fenghua Yu <fenghua.yu@intel.com>, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-um@lists.infradead.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, io-uring@vger.kernel.org, linux-cachefs@redhat.com,
 linux-nfs@vger.kernel.org, linux-mm@kvack.org,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Oct 12, 2020 at 05:44:38PM +0100, Matthew Wilcox wrote:
> On Mon, Oct 12, 2020 at 09:28:29AM -0700, Dave Hansen wrote:
> > kmap_atomic() is always preferred over kmap()/kmap_thread().
> > kmap_atomic() is _much_ more lightweight since its TLB invalidation is
> > always CPU-local and never broadcast.
> > 
> > So, basically, unless you *must* sleep while the mapping is in place,
> > kmap_atomic() is preferred.
> 
> But kmap_atomic() disables preemption, so the _ideal_ interface would map
> it only locally, then on preemption make it global.  I don't even know
> if that _can_ be done.  But this email makes it seem like kmap_atomic()
> has no downsides.

And that is IIUC what Thomas was trying to solve.

Also, Linus brought up that kmap_atomic() has quirks in nesting.[1]

From what I can see all of these discussions support the need to have something
between kmap() and kmap_atomic().

However, the reason behind converting call sites to kmap_thread() are different
between Thomas' patch set and mine.  Both require more kmap granularity.
However, they do so with different reasons and underlying implementations but
with the _same_ resulting semantics; a thread local mapping which is
preemptable.[2]  Therefore they each focus on changing different call sites.

While this patch set is huge I think it serves a valuable purpose to identify a
large number of call sites which are candidates for this new semantic.

Ira

[1] https://lore.kernel.org/lkml/CAHk-=wgbmwsTOKs23Z=71EBTrULoeaH2U3TNqT2atHEWvkBKdw@mail.gmail.com/
[2] It is important to note these implementations are not incompatible with
each other.  So I don't see yet another 'kmap_something()' being required.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
