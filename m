Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34C592833
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 17:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D536E1BC;
	Mon, 19 Aug 2019 15:18:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB016E1BC
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 15:16:49 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id h3so1110747pls.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 08:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GlFmsxpfwLpG5XFQZcDJGrUJIAXAnOONymKIPYeVWy4=;
 b=b9GgkqYtyTFi4wLrh34XZtEC70BNqWx3TA0CxlJPpIV/1UG0GbOOk31wPNS2GS6XFF
 /gEqM5oPCF/7AVhu5zZJQ/HymfK39l6AyNO7kUVaf5Oq2QVMvr0pA+xAFHhGrU2LSxCc
 wwKtw7q1IBW9lkXYEEC5y/0MxxjdAGlUZD73PAXM2n0rh67DvtuXk/+cOrR52/ksoVwH
 siyjtiuFMqqHAHpOu8BokrUDFNPBbHIjpVTqvXZBgL3hYGWpp+TVfgHqfbtv0oeHRRUD
 +zWWi7T6ko/FwoSgWxLhGYOHKKaot1Kwbu2iG/mMDHuE0WY0HfkRAaQr8HdMwcBtOwJ/
 sb1g==
X-Gm-Message-State: APjAAAUxT+DQd8AjjDtS3ibT+aZq1buaQFmDmCp4M+KzAh/rwVkUPVxo
 Wd0G1DfzIInOQ1W1k1LlJWrxpwykJSZhffUwkJATJw==
X-Google-Smtp-Source: APXvYqxAVYv/X47htv2GfhrYLw10pOmVgC147AdMR4amTTESkgYjtOO9fvfN54mImyUI3YtolKb0GRqZDtWypE7Vt8Q=
X-Received: by 2002:a17:902:ab96:: with SMTP id
 f22mr23622721plr.147.1566227808825; 
 Mon, 19 Aug 2019 08:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <00eb8ba84205c59cac01b1b47615116a461c302c.1566220355.git.andreyknvl@google.com>
 <20190819150342.sxk3zzxvrxhkpp6j@willie-the-truck>
In-Reply-To: <20190819150342.sxk3zzxvrxhkpp6j@willie-the-truck>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 19 Aug 2019 17:16:37 +0200
Message-ID: <CAAeHK+xP6HnLJt_RKW67x8nbJLJp5A=av57BfwiFrA88eFn60w@mail.gmail.com>
Subject: Re: [PATCH ARM] selftests,
 arm64: fix uninitialized symbol in tags_test.c
To: Will Deacon <will@kernel.org>
X-Mailman-Approved-At: Mon, 19 Aug 2019 15:18:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=GlFmsxpfwLpG5XFQZcDJGrUJIAXAnOONymKIPYeVWy4=;
 b=GASLs+yZnKXgCHGknNLNo71e6UtRt515EbzdpWYm/Hpg75x/UubNKrVS4Ph4uPK+8D
 Ti+bZvb7RwZ8Rgn5diZiCZOC7bC9H+dTrKcVTPMW/pFv9U1AucjO/hRKCCkTBhzRIaU3
 D9sPMjOcAkw+sn0WiouQhRmANU/HoJXNnBPivxMzU2mCd+1bqEU622XIt7CtOkyBUScf
 CddY5regO8tRNMImraZP3DECenQ45DhILnBAxk2TuQ3iyHoyjpEbXWuF3zSR6z/Z8e3z
 D8kAaqFBdLd66b1BOwiK9p1SMntN4cI0JAUQgHjwyJ5ye9BNp3phuuPzg6paxdjmOKUJ
 Bduw==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Christian Koenig <Christian.Koenig@amd.com>,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, Kostya Serebryany <kcc@google.com>,
 Khalid Aziz <khalid.aziz@oracle.com>, Lee Smith <Lee.Smith@arm.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgNTowMyBQTSBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgQXVnIDE5LCAyMDE5IGF0IDAzOjE0OjQyUE0gKzAyMDAs
IEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBGaXggdGFnZ2VkX3B0ciBub3QgYmVpbmcgaW5p
dGlhbGl6ZWQgd2hlbiBUQkkgaXMgbm90IGVuYWJsZWQuCj4gPgo+ID4gRGFuIENhcnBlbnRlciA8
ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgo+Cj4gR3Vlc3NpbmcgdGhpcyB3YXMgUmVwb3J0ZWQt
YnksIG9yIGhhcyBEYW4gaW50cm9kdWNlZCBoaXMgb3duIHRhZyBub3c/IDspCgpPb3BzLCB5ZXMs
IFJlcG9ydGVkLWJ5IDopCgo+Cj4gR290IGEgbGluayB0byB0aGUgcmVwb3J0PwoKaHR0cHM6Ly93
d3cuc3Bpbmljcy5uZXQvbGlzdHMvbGludXgta3NlbGZ0ZXN0L21zZzA5NDQ2Lmh0bWwKCj4KPiBX
aWxsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
