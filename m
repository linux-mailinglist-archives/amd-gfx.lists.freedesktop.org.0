Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1A67050C0
	for <lists+amd-gfx@lfdr.de>; Tue, 16 May 2023 16:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DCB10E243;
	Tue, 16 May 2023 14:30:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B7510E242
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 May 2023 14:30:04 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-56183784dd3so12519277b3.3
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 May 2023 07:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684247403; x=1686839403;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=4YEPKrVR9zT024XK7Pjo91EG5vcxIVFCJtB9CTxRlDM=;
 b=hqHcxjQbJBGZla48WsupFSE1qX/Q50O/tDR9HRispcTqhozzhNaDapI1iUI+nV5Dqa
 +1YztNS7sMj7wiHDm0+uAOJXhAOMuPVrU6pHbFstZqhwb/IN4HRrOjpIO8eadjPxWAiv
 74ZKC4fPNkL7uHLKcrORbKVAL6lyxZVoThJRc2570yDONMDvXbttp+1WyG/KPEVI0Mbj
 /NITT/iX9eusiaFbGu44753OhtSEHfnh4iDWqcOdXFdq/GRuHbEd3f6wqf1Ezyk3tHWu
 lGLELXUKPIoHXEUyM1vl7ctdC6KLkFsE4Fe4uGvSVPO5JyNR6ut5eE1mOnGUTpwSdULf
 SuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684247403; x=1686839403;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4YEPKrVR9zT024XK7Pjo91EG5vcxIVFCJtB9CTxRlDM=;
 b=ePm1oPuZt/VKxGrIuQfsLzAcdhoXOBdP7qbdJPw3svJvlGYsaF0MJ++3+iam2704xV
 4LG7XgSWHyVCRl+UVoOpG50P0RpU7o+/2MNu+APpUbA2/ZerbO2hKwuuKMVCe2cS/Jp5
 R7IP6leH+43gaSfalJmM8b+ksKa1RV4FIDcwZGCvBxV0Y4kXney0nrK9+gPYvhWzqBvn
 LSn82FiqIc+3ectfLrnL3Cnctcp2uOtIU4nmaxEbSeuhownxdqNMpS3KonlZTOXpz2ae
 SKZJvBHvig5WzWeSFLXcMPq4OKowFagz6juHij8T+yc2foi2SLjAvWE5gTgdkL3yqIot
 nwqA==
X-Gm-Message-State: AC+VfDy+aOOZsUXg2kvdRWK9106iITpy34c/Xlseysf7Ns6vD+7bFAvL
 qLxI3eJbzAsLrQYD2yRyMDhe0UjguEc=
X-Google-Smtp-Source: ACHHUZ6nLWUlEK0uTVg2ClJoaxJ9mV14xuwTnG5GvNICmdUhSrCvtGUgZ3UVfCgP00Yml5lYnHv0fvo+YTM=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:c903:0:b0:556:cacc:1f1d with SMTP id
 o3-20020a81c903000000b00556cacc1f1dmr22415308ywi.8.1684247402987; Tue, 16 May
 2023 07:30:02 -0700 (PDT)
Date: Tue, 16 May 2023 07:30:01 -0700
In-Reply-To: <b97e8c2a-b629-f597-d011-395071011f1b@redhat.com>
Mime-Version: 1.0
References: <cover.1684097001.git.lstoakes@gmail.com>
 <b61d5999a4fc6d50b7e073cc3c3efa8fe79bbd94.1684097002.git.lstoakes@gmail.com>
 <ZGKC9fHoE+kDs0ar@google.com>
 <b97e8c2a-b629-f597-d011-395071011f1b@redhat.com>
Message-ID: <ZGOTadDG/b0904YI@google.com>
Subject: Re: [PATCH v5 1/6] mm/gup: remove unused vmas parameter from
 get_user_pages()
From: Sean Christopherson <seanjc@google.com>
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="us-ascii"
X-Mailman-Approved-At: Tue, 16 May 2023 14:30:33 +0000
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
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 amd-gfx@lists.freedesktop.org, "H . Peter Anvin" <hpa@zytor.com>,
 David Airlie <airlied@gmail.com>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-sgx@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Dimitri Sivanich <dimitri.sivanich@hpe.com>,
 Lorenzo Stoakes <lstoakes@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xinhui Pan <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Christian Konig <christian.koenig@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Pavel Begunkov <asml.silence@gmail.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, May 16, 2023, David Hildenbrand wrote:
> On 15.05.23 21:07, Sean Christopherson wrote:
> > On Sun, May 14, 2023, Lorenzo Stoakes wrote:
> > > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > > index cb5c13eee193..eaa5bb8dbadc 100644
> > > --- a/virt/kvm/kvm_main.c
> > > +++ b/virt/kvm/kvm_main.c
> > > @@ -2477,7 +2477,7 @@ static inline int check_user_page_hwpoison(unsigned long addr)
> > >   {
> > >   	int rc, flags = FOLL_HWPOISON | FOLL_WRITE;
> > > -	rc = get_user_pages(addr, 1, flags, NULL, NULL);
> > > +	rc = get_user_pages(addr, 1, flags, NULL);
> > >   	return rc == -EHWPOISON;
> > 
> > Unrelated to this patch, I think there's a pre-existing bug here.  If gup() returns
> > a valid page, KVM will leak the refcount and unintentionally pin the page.  That's
> 
> When passing NULL as "pages" to get_user_pages(), __get_user_pages_locked()
> won't set FOLL_GET. As FOLL_PIN is also not set, we won't be messing with
> the mapcount of the page.

Ah, that's what I'm missing.

> So even if get_user_pages() returns "1", we should be fine.
> 
> 
> Or am I misunderstanding your concern?

Nope, you covered everything.  I do think we can drop the extra gup() though,
AFAICT it's 100% redundant.  But it's not a bug.

Thanks!
