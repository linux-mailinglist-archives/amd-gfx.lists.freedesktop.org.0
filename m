Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B70E523A92F
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Aug 2020 17:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5420689E8C;
	Mon,  3 Aug 2020 15:12:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0385D89D89
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Aug 2020 15:12:31 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 62E8F22B4E
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Aug 2020 15:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596467550;
 bh=+PZ/awBxxRTMw2BeBwqmtU59rWiDwd7Tyrz4gbzxrPI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=j8DVLALFzty9tmkF9Ajx7bdReJCf64ghCz6Sui0YjEceE9XQJ6DT7RKhcIOV09FdK
 ywTBNbcWf4FUeickkTRjT8bQ2jpfZ0CuA/Etom411mS/TNnnbyxEYP1P20umqqKjtD
 CIknzkHjIA5ZTC5jSC0inNpo23GEYJrY4I8uwj0A=
Received: by mail-wm1-f49.google.com with SMTP id 9so14618135wmj.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 03 Aug 2020 08:12:31 -0700 (PDT)
X-Gm-Message-State: AOAM532pjkE3Q7Y3ws/dd/5HjAlnpwVYt3ZzfyEjPTqLX/0OYXlHiJH5
 OUCiRhhlN6nXyDNKWNiblHA1knwsS2BIlNFIKF2h9Q==
X-Google-Smtp-Source: ABdhPJwiaA4kvJyZgwWanbpbA2UDgr/APeGodXtQoq2MM4XlnMkdWJK9xJVz1B9yxVMecsh5WGJ2L5eyBMVqiOoZypY=
X-Received: by 2002:a1c:7e02:: with SMTP id z2mr436874wmc.138.1596467549637;
 Mon, 03 Aug 2020 08:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <1594684087-61184-1-git-send-email-fenghua.yu@intel.com>
 <1594684087-61184-13-git-send-email-fenghua.yu@intel.com>
 <CALCETrXnO4oh+WyxtSM-j_pP4QgkSg24=y76OBEHxXxAfJtPhA@mail.gmail.com>
 <f6d34d59-e6eb-ee9f-d247-8fb2f0e37549@intel.com>
In-Reply-To: <f6d34d59-e6eb-ee9f-d247-8fb2f0e37549@intel.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Mon, 3 Aug 2020 08:12:18 -0700
X-Gmail-Original-Message-ID: <CALCETrXLFwzCzoE8ZjciBO_WSK8StyTfO1yXVm4v2qFQZpfasg@mail.gmail.com>
Message-ID: <CALCETrXLFwzCzoE8ZjciBO_WSK8StyTfO1yXVm4v2qFQZpfasg@mail.gmail.com>
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

On Mon, Aug 3, 2020 at 8:03 AM Dave Hansen <dave.hansen@intel.com> wrote:
>
> On 7/31/20 4:34 PM, Andy Lutomirski wrote:
> >> Thomas suggested to provide a reason for the #GP caused by executing ENQCMD
> >> without a valid PASID value programmed. #GP error codes are 16 bits and all
> >> 16 bits are taken. Refer to SDM Vol 3, Chapter 16.13 for details. The other
> >> choice was to reflect the error code in an MSR. ENQCMD can also cause #GP
> >> when loading from the source operand, so its not fully comprehending all
> >> the reasons. Rather than special case the ENQCMD, in future Intel may
> >> choose a different fault mechanism for such cases if recovery is needed on
> >> #GP.
> > Decoding the user instruction is ugly and sets a bad architecture
> > precedent, but we already do it in #GP for UMIP.  So I'm unconvinced.
>
> I'll try to do one more bit of convincing. :)
>
> In the end, we need a way to figure out if the #GP was from a known "OK"
> source that we can fix up.  You're right that we could fire up the
> instruction decoder to help answer that question.  But, it (also)
> doesn't easily yield a perfect answer as to the source of the #GP, it
> always involves a user copy, and it's a larger code impact than what
> we've got.
>
> I think I went and looked at fixup_umip_exception(), and compared it to
> the alternative which is essentially just these three lines of code:
>
> > +     /*
> > +      * If the current task already has a valid PASID in the MSR,
> > +      * the #GP must be for some other reason.
> > +      */
> > +     if (current->has_valid_pasid)
> > +             return false;
> ...> +  /* Now the current task has a valid PASID in the MSR. */
> > +     current->has_valid_pasid = 1;
>
> and *I* was convinced that instruction decoding wasn't worth it.
>
> There's a lot of stuff that fixup_umip_exception() does which we don't
> have to duplicate, but it's going to be really hard to get it anywhere
> near as compact as what we've got.
>

I could easily be convinced that the PASID fixup is so trivial and so
obviously free of misfiring in a way that causes an infinite loop that
this code is fine.  But I think we first need to answer the bigger
question of why we're doing a lazy fixup in the first place.

--Andy
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
