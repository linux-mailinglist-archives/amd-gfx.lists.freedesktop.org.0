Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06922873AF
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 10:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735626ED0D;
	Fri,  9 Aug 2019 08:02:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91C76ECDA
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 23:09:06 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id m12so5546687plt.5
 for <amd-gfx@lists.freedesktop.org>; Thu, 08 Aug 2019 16:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PshILyRjCCo0C5QCJz7frN2AnaNP8oJw8QYaH2iANig=;
 b=Ir9nCLEa5+FlvXUxGOFCyBfeqowBZOtOkq9+TSeGw/aEoRMfPUuxCn1iTr5Ay3zfzg
 GMTLIrMSB2hB+CORPNXGWkikS7rrgoX8Wq8MoJBO6FcEDmDz6pWdPAYL3ZodXeV+N9P/
 glfdcrQlZ9jhfXP+lKwovIWV6j5ss40LSk/2lGLR3zvs4yOa4PA2idWj4pydYTPvZNko
 pc1hJhdmTy2cwQ2QnuEDXyJDjK9W5aAAFiL2pnOygD1bIxDvsliqzpzUYT/4bovQWz4x
 dedCQaw3i5d/R9K9YS3tMuJVFRHDZwdTctc+z+OeE0U/mNfKG/8nSyycF4fr/oM4Zz+/
 KV1Q==
X-Gm-Message-State: APjAAAUq6N1MRGzzOjyNT4HcwLdzaDmBz9H9CzPurrXOY6p3OSbHQa8G
 y6lqq/TMma9/odZjob/BOtozDw==
X-Google-Smtp-Source: APXvYqwRMwQCoIwwE1SVnXBBenp7lYzRwUiHs8nPiovNgZn+1R84ViErtlLi11BYuAEM5u5dpbcusw==
X-Received: by 2002:a17:902:d70a:: with SMTP id
 w10mr15179356ply.251.1565305746634; 
 Thu, 08 Aug 2019 16:09:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id o130sm157376311pfg.171.2019.08.08.16.09.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 08 Aug 2019 16:09:05 -0700 (PDT)
Date: Thu, 8 Aug 2019 16:09:04 -0700
From: Kees Cook <keescook@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v19 00/15] arm64: untag user pointers passed to the kernel
Message-ID: <201908081608.A4F6711@keescook>
References: <cover.1563904656.git.andreyknvl@google.com>
 <CAAeHK+yc0D_nd7nTRsY4=qcSx+eQR0VLut3uXMf4NEiE-VpeCw@mail.gmail.com>
 <20190724140212.qzvbcx5j2gi5lcoj@willie-the-truck>
 <CAAeHK+xXzdQHpVXL7f1T2Ef2P7GwFmDMSaBH4VG8fT3=c_OnjQ@mail.gmail.com>
 <20190724142059.GC21234@fuggles.cambridge.arm.com>
 <20190806171335.4dzjex5asoertaob@willie-the-truck>
 <CAAeHK+zF01mxU+PkEYLkoVu-ZZM6jNfL_OwMJKRwLr-sdU4Myg@mail.gmail.com>
 <201908081410.C16D2BD@keescook>
 <20190808153300.09d3eb80772515f0ea062833@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808153300.09d3eb80772515f0ea062833@linux-foundation.org>
X-Mailman-Approved-At: Fri, 09 Aug 2019 08:02:49 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PshILyRjCCo0C5QCJz7frN2AnaNP8oJw8QYaH2iANig=;
 b=dbDwiA4Adn6NNb5EvA73thvbmUP2keuqre4+n/NxwEHqhexDztnDaNh7AsRSTZZe49
 hYpD3IzLcNsObNJn7jV0JwQOyof3bHoudWE9xbxMphJZ3xC6+cAju3iiWanCTUgT+RRy
 5BTDqjSStXzv50strdYe4GteQ70uxl48L/KiQ=
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
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDM6MzM6MDBQTSAtMDcwMCwgQW5kcmV3IE1vcnRvbiB3
cm90ZToKPiBPbiBUaHUsIDggQXVnIDIwMTkgMTQ6MTI6MTkgLTA3MDAgS2VlcyBDb29rIDxrZWVz
Y29va0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+IAo+ID4gPiBUaGUgb25lcyB0aGF0IGFyZSBsZWZ0
IGFyZSB0aGUgbW0gb25lczogNCwgNSwgNiwgNyBhbmQgOC4KPiA+ID4gCj4gPiA+IEFuZHJldywg
Y291bGQgeW91IHRha2UgYSBsb29rIGFuZCBnaXZlIHlvdXIgQWNrZWQtYnkgb3IgcGljayB0aGVt
IHVwIGRpcmVjdGx5Pwo+ID4gCj4gPiBHaXZlbiB0aGUgc3Vic3lzdGVtIEFja3MsIGl0IHNlZW1z
IGxpa2UgMy0xMCBhbmQgMTIgY291bGQgYWxsIGp1c3QgZ28KPiA+IHZpYSBBbmRyZXc/IEkgaG9w
ZSBoZSBhZ3JlZXMuIDopCj4gCj4gSSdsbCBncmFiIGV2ZXJ5dGhpbmcgdGhhdCBoYXMgbm90IHll
dCBhcHBlYXJlZCBpbiBsaW51eC1uZXh0LiAgSWYgbW9yZQo+IG9mIHRoZXNlIHBhdGNoZXMgYXBw
ZWFyIGluIGxpbnV4LW5leHQgSSdsbCBkcm9wIHRob3NlIGFzIHdlbGwuCj4gCj4gVGhlIHJldmll
dyBkaXNjdXNzaW9uIGFnYWluc3QgIiBbUEFUQ0ggdjE5IDAyLzE1XSBhcm02NDogSW50cm9kdWNl
Cj4gcHJjdGwoKSBvcHRpb25zIHRvIGNvbnRyb2wgdGhlIHRhZ2dlZCB1c2VyIGFkZHJlc3NlcyBB
QkkiIGhhcyBwZXRlcmVkCj4gb3V0IGluY29uY2x1c2l2ZWx5LiAgcHJjdGwoKSB2cyBhcmNoX3By
Y3RsKCkuCgpJJ3ZlIGFsd2F5cyBkaXNsaWtlZCBhcmNoX3ByY3RsKCkgZXhpc3RpbmcgYXQgYWxs
LiBHaXZlbiB0aGF0IHRhZ2dpbmcgaXMKbGlrZWx5IHRvIGJlIGEgbXVsdGktYXJjaGl0ZWN0dXJh
bCBmZWF0dXJlLCBpdCBzZWVtcyBsaWtlIHRoZSBjb250cm9scwpzaG91bGQgbGl2ZSBpbiBwcmN0
bCgpIHRvIG1lLgoKLS0gCktlZXMgQ29vawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
