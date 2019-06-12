Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDB842735
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 15:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627278966B;
	Wed, 12 Jun 2019 13:12:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7948949C
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 11:08:47 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 19so8634183pfa.4
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 04:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w620wCIkG8GXS/KYH0IDoZ7ej5kJ3WmWx8LtN+LbTUQ=;
 b=Pom/bxFvUm8h31n88VwQM4dxrSTrJtTU3nYeXfdKu7gkQueaEJa3P/d3pvVc8IRGEP
 p+69CY9k39R7K7uyk8nbmtKc627UsHoT/0Mh6flkERBkHxK8qMvAFcYqI27lM5fi9OH/
 3AqJmSZIDThsIV2ywsLCZYeXOtOEWmxhXgr6mR3FBVUbiT+RBv6xEswGnwuz70Z6e7bi
 mQWBj/eeTADbKnqN6LGqf61l6hMaov5LJFbx3PN6xGR/irALSjt9x9S88s/5KV2UEDdW
 DWczHMSvTzbpmj0NrC45w/r+mWMxOvt0015A8JJynfm955a9l29PK4xkbwBEOao+SsfF
 ukrw==
X-Gm-Message-State: APjAAAVTBIDh/ukFgA3GAdE3C9tcKMHn4W+Rsoyg26tLI+c3oqZtZcnH
 81k0o9/oJ/og5Ev/OXO87a/25uKdGNuKOL7Dl2R4ProG0zBjlA==
X-Google-Smtp-Source: APXvYqxvUwlKkJ1D0n5ZAgi1aKr005PngCLgks22Vr4JdWsBWlki9wY2M2Qsc1xcmNb71INK9Pq98aEQaKS4b6HnOls=
X-Received: by 2002:aa7:97bb:: with SMTP id d27mr18449962pfq.93.1560337726555; 
 Wed, 12 Jun 2019 04:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
 <e410843d00a4ecd7e525a7a949e605ffc6c394c4.1559580831.git.andreyknvl@google.com>
 <d0dffcf8-d7bf-a7b4-5766-3a6f87437851@oracle.com>
In-Reply-To: <d0dffcf8-d7bf-a7b4-5766-3a6f87437851@oracle.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Wed, 12 Jun 2019 13:08:35 +0200
Message-ID: <CAAeHK+yTmU9Vz0OB4b7bcgjU3W1v6NFxgpiy4tud7j0AHXkwtw@mail.gmail.com>
Subject: Re: [PATCH v16 04/16] mm: untag user pointers in do_pages_move
To: Khalid Aziz <khalid.aziz@oracle.com>
X-Mailman-Approved-At: Wed, 12 Jun 2019 13:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=w620wCIkG8GXS/KYH0IDoZ7ej5kJ3WmWx8LtN+LbTUQ=;
 b=VggNUJ7a0brq2Ev6nAJQqO2O72gohucw8zeY5YtHck9VQOLSeh4HE1gegC/6IXwwZQ
 yGU57RiXcKZXz6rEKzU45Xf6W2ce+VRfcbyLnBuDiGAB0WY+oQBhpKyfWyvJoxfZX9DP
 yh5EZsvMAI815IqL/1YdyEKkghoO2fuJKDAzd5Q9y/OjjRwPS+GPbIwNDHqKiLuIYdn3
 FS/k/NQyAktrRCCDybeyESanVpXbjmTwdROU2U/U+lx1nc+kfxYxbzF+ximhp+/PoGPk
 LddaTqB/qiSjwgqbl0KdSRDedqW9qTDDWoaJfcFucWGR/PYqdZ87SzwkAPpr4TVyN7Wo
 N3Qg==
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMTA6MTggUE0gS2hhbGlkIEF6aXogPGtoYWxpZC5heml6
QG9yYWNsZS5jb20+IHdyb3RlOgo+Cj4gT24gNi8zLzE5IDEwOjU1IEFNLCBBbmRyZXkgS29ub3Zh
bG92IHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRl
bmRzIGFybTY0IGtlcm5lbCBBQkkgdG8gYWxsb3cgdG8KPiA+IHBhc3MgdGFnZ2VkIHVzZXIgcG9p
bnRlcnMgKHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+ID4g
dGhhbiAweDAwKSBhcyBzeXNjYWxsIGFyZ3VtZW50cy4KPiA+Cj4gPiBkb19wYWdlc19tb3ZlKCkg
aXMgdXNlZCBpbiB0aGUgaW1wbGVtZW50YXRpb24gb2YgdGhlIG1vdmVfcGFnZXMgc3lzY2FsbC4K
PiA+Cj4gPiBVbnRhZyB1c2VyIHBvaW50ZXJzIGluIHRoaXMgZnVuY3Rpb24uCj4gPgo+ID4gUmV2
aWV3ZWQtYnk6IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Cj4g
PiAtLS0KPiA+ICBtbS9taWdyYXRlLmMgfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvbW0vbWlncmF0ZS5jIGIvbW0vbWlncmF0ZS5j
Cj4gPiBpbmRleCBmMmVjYzI4NTVhMTIuLjM5MzBiYjZmYTY1NiAxMDA2NDQKPiA+IC0tLSBhL21t
L21pZ3JhdGUuYwo+ID4gKysrIGIvbW0vbWlncmF0ZS5jCj4gPiBAQCAtMTYxNyw2ICsxNjE3LDcg
QEAgc3RhdGljIGludCBkb19wYWdlc19tb3ZlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCBub2RlbWFz
a190IHRhc2tfbm9kZXMsCj4gPiAgICAgICAgICAgICAgIGlmIChnZXRfdXNlcihub2RlLCBub2Rl
cyArIGkpKQo+ID4gICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0X2ZsdXNoOwo+ID4gICAg
ICAgICAgICAgICBhZGRyID0gKHVuc2lnbmVkIGxvbmcpcDsKPiA+ICsgICAgICAgICAgICAgYWRk
ciA9IHVudGFnZ2VkX2FkZHIoYWRkcik7Cj4KPiBXaHkgbm90IGp1c3QgImFkZHIgPSAodW5zaWdu
ZWQgbG9uZyl1bnRhZ2dlZF9hZGRyKHApOyIKCldpbGwgZG8gaW4gdGhlIG5leHQgdmVyc2lvbi4g
SSB0aGluayBJJ2xsIGFsc28gbWVyZ2UgdGhpcyBjb21taXQgaW50bwp0aGUgInVudGFnIHVzZXIg
cG9pbnRlcnMgcGFzc2VkIHRvIG1lbW9yeSBzeXNjYWxscyIgb25lLgoKPgo+IC0tCj4gS2hhbGlk
Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
