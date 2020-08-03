Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C89A323AB73
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Aug 2020 19:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADDE6E2D7;
	Mon,  3 Aug 2020 17:17:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A6A6E2D7
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Aug 2020 17:17:05 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9115022B4E
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Aug 2020 17:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596475023;
 bh=ZfW2vhvSScmUs7HxUE0FsgQ1dlDVdrRmbY/gG/hY7hg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Np7Qal28gMw4vcH1iKZe+TCqR6WclB8Xl5dpKtQX+V2iYlgPe7V6F8enqvaZFIEk2
 I/Mthwxs+qNrkOId4Kwi++aCgOrG1nb2jiaXJkC5c1dj2bJ7lcaLS3wS0GK5Mj1eMN
 /F+YS18i6ApdnLrSIBlXk7GDgD7KvH9c8mG8Tmg8=
Received: by mail-lf1-f54.google.com with SMTP id k13so20905694lfo.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 03 Aug 2020 10:17:04 -0700 (PDT)
X-Gm-Message-State: AOAM5313qFwqWTLECOuTZHHy1XADSHVSsJv8o9vAVizCdpXjw7A1DvKr
 k0/oRR026C+tx7YkpSsk26Y74QS26TywIKAtqHZA6A==
X-Google-Smtp-Source: ABdhPJw3cLd2NyF1JTZLmIChK5azh663lCruYa9l5xMzdcEl0b7NT7N2OX4JjEA6xNE9eK5dDwiBzSwU4LUpGRtccrQ=
X-Received: by 2002:a5d:65d2:: with SMTP id e18mr15622569wrw.70.1596475021990; 
 Mon, 03 Aug 2020 10:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <1594684087-61184-1-git-send-email-fenghua.yu@intel.com>
 <1594684087-61184-13-git-send-email-fenghua.yu@intel.com>
 <CALCETrXnO4oh+WyxtSM-j_pP4QgkSg24=y76OBEHxXxAfJtPhA@mail.gmail.com>
 <f6d34d59-e6eb-ee9f-d247-8fb2f0e37549@intel.com>
 <CALCETrXLFwzCzoE8ZjciBO_WSK8StyTfO1yXVm4v2qFQZpfasg@mail.gmail.com>
 <12fbdc01-e444-8d10-5790-e3495fc8a837@intel.com>
In-Reply-To: <12fbdc01-e444-8d10-5790-e3495fc8a837@intel.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Mon, 3 Aug 2020 10:16:50 -0700
X-Gmail-Original-Message-ID: <CALCETrWR1hL=eXAkn=OG1vtAPvC9n1jGqyNuyXpYw8QwPENo1A@mail.gmail.com>
Message-ID: <CALCETrWR1hL=eXAkn=OG1vtAPvC9n1jGqyNuyXpYw8QwPENo1A@mail.gmail.com>
Subject: Re: [PATCH v6 12/12] x86/traps: Fix up invalid PASID
To: Dave Hansen <dave.hansen@intel.com>
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
Cc: Ravi V Shankar <ravi.v.shankar@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, H Peter Anvin <hpa@zytor.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Joerg Roedel <joro@8bytes.org>, x86 <x86@kernel.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>, Christoph Hellwig <hch@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Sohil Mehta <sohil.mehta@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Tony Luck <tony.luck@intel.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 iommu <iommu@lists.linux-foundation.org>,
 Jacob Jun Pan <jacob.jun.pan@intel.com>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Aug 3, 2020 at 9:37 AM Dave Hansen <dave.hansen@intel.com> wrote:
>
> On 8/3/20 8:12 AM, Andy Lutomirski wrote:
> > I could easily be convinced that the PASID fixup is so trivial and so
> > obviously free of misfiring in a way that causes an infinite loop that
> > this code is fine.  But I think we first need to answer the bigger
> > question of why we're doing a lazy fixup in the first place.
>
> There was an (internal to Intel) implementation of this about a year ago
> that used smp_call_function_many() to force the MSR state into all
> threads of a process.  I took one look at it, decided there was a 0%
> chance of it actually functioning and recommended we find another way.
> While I'm sure it could be done more efficiently, the implementation I
> looked at took ~200 lines of code and comments.  It started to look too
> much like another instance of mm->cpumask for my comfort.

If I were implementing this, I would try making switch_mm_irqs_off()
do, roughly:

void load_mm_pasid(...) {
  if (cpu_feature_enabled(X86_FEATURE_ENQCMD))
    tsk->xstate[offset] = READ_ONCE(next->context.pasid);
}

This costs one cache miss, although the cache line in question is
about to be read anyway.  It might be faster to, instead, do:

void load_mm_pasid(...) {
  u32 pasid = READ_ONCE(next->context.pasid);

  if (tsk->xstate[offset] != pasid)
    tsk->state[offset] = pasid;
}

so we don't dirty the cache line in the common case.  The actual
generated code ought to be pretty good -- surely the offset of PASID
in XSTATE is an entry in an array somewhere that can be found with a
single read, right?

The READ_ONCE is because this could race against a write to
context.pasid, so this code needs to be at the end of the function
where it's protected by mm_cpumask.  With all this done, the pasid
update is just on_each_cpu_mask(mm_cpumask(mm), load_mm_pasid, mm,
true).

This looks like maybe 20 lines of code.  As an added bonus, it lets us
free PASIDs early if we ever decide we want to.




May I take this opportunity to ask Intel to please put some real
thought into future pieces of CPU state?  Here's a summary of some
things we have:

- Normal extended state (FPU, XMM, etc): genuinely per thread and only
ever used explicitly.  Actually makes sense with XSAVE(C/S).

- PKRU: affects CPL0-originated memory accesses, so it needs to be
eagerly loaded in the kernel.  Does not make sense with XRSTOR(C/S),
but it's in there anyway.

- CR3: per-mm state.  Makes some sense in CR3, but it's tangled up
with CR4 in nasty ways.

- LDTR: per-mm on Linux and mostly obsolete everyone.  In it's own
register, so it's not a big deal.

- PASID: per-mm state (surely Intel always intended it to be per-mm,
since it's for shared _virtual memory_!).  But for some reason it's in
an MSR (which is slow), and it's cleverly, but not that cleverly,
accessible with XSAVES/XRSTORS.  Doesn't actually make sense.  Also,
PASID is lazy-loadable, but the mechanism for telling the kernel that
a lazy load is needed got flubbed.

- TILE: genuinely per-thread, but it's expensive so it's
lazy-loadable.  But the lazy-load mechanism reuses #NM, and it's not
fully disambiguated from the other use of #NM.  So it sort of works,
but it's gross.

- "KERNEL_GS_BASE", i.e. the shadow GS base.  This is logically
per-user-thread state, but it's only accessible in MSRs.  For some
reason this is *not* in XSAVES/XRSTORS state, nor is there any
efficient way to access it at all.

- Segment registers: can't be properly saved except by hypervisors,
and can almost, but not quite, be properly loaded (assuming the state
was sane to begin with) by normal kernels.  Just don't try to load 1,
2, or 3 into any of them.

Sometimes I think that this is all intended to be as confusing as
possible and that it's all a ploy to keep context switches slow and
complicated.  Maybe Intel doesn't actually want to compete with other
architectures that can context switch quickly?


It would be really nice if we had a clean way to load per-mm state
(see my private emails about this), a clean way to load CPL3 register
state, and a clean way to load per-user-thread *kernel* register state
(e.g. PKRU and probably PKRS).  And there should be an exception that
says "user code accessed a lazy-loaded resource that isn't loaded, and
this is the resource it tried to access".
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
