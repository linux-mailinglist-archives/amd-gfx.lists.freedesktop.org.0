Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D6B4C86B4
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Mar 2022 09:41:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E6810EB9C;
	Tue,  1 Mar 2022 08:41:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B2D10E1FB
 for <amd-gfx@lists.freedesktop.org>; Tue,  1 Mar 2022 00:41:27 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id s25so19743164lji.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 28 Feb 2022 16:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cUh7YOptqnvj33mIS3WykOaibv0ctq8lQu0USbAcExo=;
 b=gduPBw6Te4zeyjZyaNuQQxqABiMq6fHp34ckrObT/FmzNLnDhHL/6KerjIgP5i0R8H
 Vm0a8HwZ8W8PnRRZRxnIsSc7yENLFtSGfKUqeeqvjpp8888PKIgF8NBwqM5k9ZzIrQCZ
 iYuicfiGesL4zlgkSDywOQeUUhyrP2kMozUBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cUh7YOptqnvj33mIS3WykOaibv0ctq8lQu0USbAcExo=;
 b=NvagWhXwcTS1zXJxcZNj0qjfHlFQ8ZU6dOZvtJnAsJtLQOyQ/mIeihSXG9W6pGJN7J
 lipFVxOOJCwCCxzHhTmKJAk2qqZWmxf1x/a2IGTH8FyennJXljHhN3XVDEwzurY5rOTU
 3AaEg44IY6GBz15c80iLgJGG7S4/aiyX5qEt0c5Wn3jM6MoC0cXjhed9XL3i4G7veawH
 D/I9hQSkUIhjD41goGF7J2EtSpS01eAKO309f8W5L0ZJymRtiYjAQk2XvlAPFDdF/muN
 stGrcPvySgSbRs96qOa1nwmJ/sZLab0hq9CDu370Y8lP/to4tIVGurTSWpNdqfdmBB8o
 3TBw==
X-Gm-Message-State: AOAM530QHGgs0OVh0ljkgpsyTeimU7bIjXXlt9Nf0Indd7Dc19I+m1KE
 rFkFenfDps+aTteFoaz5yBYzdPcYwEXmR9d2H7c=
X-Google-Smtp-Source: ABdhPJw1PTcjPCN2Hw8nEa3xlWtRimSPybK/+Br9fx2iJVCOlmfpvAihQRaSFjyH2siF55paQTI+mg==
X-Received: by 2002:a2e:2f0e:0:b0:246:1a59:8f04 with SMTP id
 v14-20020a2e2f0e000000b002461a598f04mr16083219ljv.409.1646095285554; 
 Mon, 28 Feb 2022 16:41:25 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43]) by smtp.gmail.com with ESMTPSA id
 p3-20020a19f003000000b004434cd6f3bbsm1213089lfc.42.2022.02.28.16.41.21
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 16:41:22 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id j15so24221295lfe.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 28 Feb 2022 16:41:21 -0800 (PST)
X-Received: by 2002:ac2:4d91:0:b0:443:127b:558a with SMTP id
 g17-20020ac24d91000000b00443127b558amr14552706lfe.542.1646095280878; Mon, 28
 Feb 2022 16:41:20 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <FC710A1A-524E-481B-A668-FC258F529A2E@gmail.com>
In-Reply-To: <FC710A1A-524E-481B-A668-FC258F529A2E@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 16:41:04 -0800
X-Gmail-Original-Message-ID: <CAHk-=whLK11HyvpUtEftOjc3Gup2V77KpAQ2fycj3uai=qceHw@mail.gmail.com>
Message-ID: <CAHk-=whLK11HyvpUtEftOjc3Gup2V77KpAQ2fycj3uai=qceHw@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: Jakob Koschel <jakobkoschel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 01 Mar 2022 08:41:34 +0000
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev, "Bos,
 H.J." <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, samba-technical@lists.samba.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 1:47 PM Jakob Koschel <jakobkoschel@gmail.com> wrote:
>
> The goal of this is to get compiler warnings right? This would indeed be great.

Yes, so I don't mind having a one-time patch that has been gathered
using some automated checker tool, but I don't think that works from a
long-term maintenance perspective.

So if we have the basic rule being "don't use the loop iterator after
the loop has finished, because it can cause all kinds of subtle
issues", then in _addition_ to fixing the existing code paths that
have this issue, I really would want to (a) get a compiler warning for
future cases and (b) make it not actually _work_ for future cases.

Because otherwise it will just happen again.

> Changing the list_for_each_entry() macro first will break all of those cases
> (e.g. the ones using 'list_entry_is_head()).

So I have no problems with breaking cases that we basically already
have a patch for due to  your automated tool. There were certainly
more than a handful, but it didn't look _too_ bad to just make the
rule be "don't use the iterator after the loop".

Of course, that's just based on that patch of yours. Maybe there are a
ton of other cases that your patch didn't change, because they didn't
match your trigger case, so I may just be overly optimistic here.

But basically to _me_, the important part is that the end result is
maintainable longer-term. I'm more than happy to have a one-time patch
to fix a lot of dubious cases if we can then have clean rules going
forward.

> I assumed it is better to fix those cases first and then have a simple
> coccinelle script changing the macro + moving the iterator into the scope
> of the macro.

So that had been another plan of mine, until I actually looked at
changing the macro. In the one case I looked at, it was ugly beyond
belief.

It turns out that just syntactically, it's really nice to give the
type of the iterator from outside the way we do now. Yeah, it may be a
bit odd, and maybe it's partly because I'm so used to the
"list_for_each_list_entry()" syntax, but moving the type into the loop
construct really made it nasty - either one very complex line, or
having to split it over two lines which was even worse.

Maybe the place I looked at just happened to have a long typename, but
it's basically always going to be a struct, so it's never a _simple_
type. And it just looked very odd adn unnatural to have the type as
one of the "arguments" to that list_for_each_entry() macro.

So yes, initially my idea had been to just move the iterator entirely
inside the macro. But specifying the type got so ugly that I think
that

        typeof (pos) pos

trick inside the macro really ends up giving us the best of all worlds:

 (a) let's us keep the existing syntax and code for all the nice cases
that did everything inside the loop anyway

 (b) gives us a nice warning for any normal use-after-loop case
(unless you explicitly initialized it like that
sgx_mmu_notifier_release() function did for no good reason

 (c) also guarantees that even if you don't get a warning,
non-converted (or newly written) bad code won't actually _work_

so you end up getting the new rules without any ambiguity or mistaken

> With this you are no longer able to set the 'outer' pos within the list
> iterator loop body or am I missing something?

Correct. Any assignment inside the loop will be entirely just to the
local loop case. So any "break;" out of the loop will have to set
another variable - like your updated patch did.

> I fail to see how this will make most of the changes in this
> patch obsolete (if that was the intention).

I hope my explanation above clarifies my thinking: I do not dislike
your patch, and in fact your patch is indeed required to make the new
semantics work.

What I disliked was always the maintainability of your patch - making
the rules be something that isn't actually visible in the source code,
and letting the old semantics still work as well as they ever did, and
having to basically run some verification pass to find bad users.

(I also disliked your original patch that mixed up the "CPU
speculation type safety" with the actual non-speculative problems, but
that was another issue).

                Linus
