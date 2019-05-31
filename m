Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B28C0310B0
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 16:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B70D89568;
	Fri, 31 May 2019 14:56:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754868941D
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 14:22:00 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id 196so4144683pgc.6
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 07:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lqGZhr1OXDcqw01dRW7YMwNNKArDZmNdR/78N+BPrn4=;
 b=GP3L1xtwGJfIjSqtFx1ysMRm448cKGVByGNn3nzS52gDB58ZRqKD2kW4KtcNqv0RAt
 QN8s5M0eGIJ/Ht/P9TMzqdzxHXk3LotqUh8Poa9krc+2EaQiQNvh6AZXnyXfixCbvxpg
 m7pV/hq/6tiF6a5HynDprC4vsMFx45R+EpDDv16ZkT5msyF3aCuWok7SVcWJ0OfKGTYB
 7yFCTBnGeyHt59A+hVDLVufI4uXsgDMdDcUmc58iFn4r8JBTNUYU/WPvsmoi1Qdrx5zN
 O50MJgP6JMDY1/ePdjD+MmlS6WOuGx9LMjkhvqvL4HwKkR9zhg8wOVPM99OAfjHLzfDJ
 8A4w==
X-Gm-Message-State: APjAAAXxvEXCdXP1figWg20k8vSBsnuIwoNKwJe7HYrDOd9KYQxzuHy0
 zdTwBo2znZtpUZIoXCUs9sSV45/j7yIA+i0SmUYlhQ==
X-Google-Smtp-Source: APXvYqyJDYvC63I4W5Lhta3XMIDWbZrlVf994VbGlX5pPuRIANXUx7mxbvFt5+YOh/Wqr0oXVm0H7EASqzCT8eMwsG4=
X-Received: by 2002:a65:64d9:: with SMTP id t25mr9532741pgv.130.1559312519598; 
 Fri, 31 May 2019 07:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
 <e31d9364eb0c2eba8ce246a558422e811d82d21b.1557160186.git.andreyknvl@google.com>
 <20190522141612.GA28122@arrakis.emea.arm.com>
In-Reply-To: <20190522141612.GA28122@arrakis.emea.arm.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Fri, 31 May 2019 16:21:48 +0200
Message-ID: <CAAeHK+wUerHQOV2PuaTwTxcCucZHZodLwg48228SB+ymxEqT2A@mail.gmail.com>
Subject: Re: [PATCH v15 17/17] selftests, arm64: add a selftest for passing
 tagged pointers to kernel
To: Catalin Marinas <catalin.marinas@arm.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>
X-Mailman-Approved-At: Fri, 31 May 2019 14:56:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=lqGZhr1OXDcqw01dRW7YMwNNKArDZmNdR/78N+BPrn4=;
 b=ZKOkIMzc1OQGbUNPHq03h99fyCedWbnebo6E2bMji4A+DRTaVEdXjsJpjrPcnu5SSA
 zIZPDWUgCW5bi+5Hm5xJN08EHp1zrtJRB8hJr+lkARmCPVryFs490LA/D4jT6SugJib6
 WuyNVM4Q2N7HAjjpa7DOBEdYU4LyBiJDJK5zMqDY/W6JkYNX16roPrVOH81h+nxoiBDb
 7B2l5NwJlc5O9XzC5yHflmTOv3KCBSLqmkKFOBx9Ekz6rnZxWiAE8V0PArN5B+OlAW0s
 TvC0lLDPHMJfSpKtEQaVcV+QmrjEmlTv3Oh20DkNgRQ4hUDHUKfXsDqAzpdAzgsjCOV+
 IttQ==
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Jacob Bramley <Jacob.Bramley@arm.com>,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Dmitry Vyukov <dvyukov@google.com>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgNDoxNiBQTSBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4u
bWFyaW5hc0Bhcm0uY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgTWF5IDA2LCAyMDE5IGF0IDA2OjMx
OjAzUE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBUaGlzIHBhdGNoIGlzIGEg
cGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMgYXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0
bwo+ID4gcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUgc2V0IHRv
IHNvbWV0aGluZyBlbHNlIG90aGVyCj4gPiB0aGFuIDB4MDApIGFzIHN5c2NhbGwgYXJndW1lbnRz
Lgo+ID4KPiA+IFRoaXMgcGF0Y2ggYWRkcyBhIHNpbXBsZSB0ZXN0LCB0aGF0IGNhbGxzIHRoZSB1
bmFtZSBzeXNjYWxsIHdpdGggYQo+ID4gdGFnZ2VkIHVzZXIgcG9pbnRlciBhcyBhbiBhcmd1bWVu
dC4gV2l0aG91dCB0aGUga2VybmVsIGFjY2VwdGluZyB0YWdnZWQKPiA+IHVzZXIgcG9pbnRlcnMg
dGhlIHRlc3QgZmFpbHMgd2l0aCBFRkFVTFQuCj4KPiBUaGF0J3MgcHJvYmFibHkgc3VmZmljaWVu
dCBmb3IgYSBzaW1wbGUgZXhhbXBsZS4gU29tZXRoaW5nIHdlIGNvdWxkIGFkZAo+IHRvIERvY3Vt
ZW50YXRpb24gbWF5YmUgaXMgYSBzbWFsbCBsaWJyYXJ5IHRoYXQgY2FuIGJlIExEX1BSRUxPQUQn
ZWQgc28KPiB0aGF0IHlvdSBjYW4gcnVuIGEgbG90IG1vcmUgdGVzdHMgbGlrZSBMVFAuCgpTaG91
bGQgSSBhZGQgdGhpcyBpbnRvIHRoaXMgc2VyaWVzLCBvciBzaG91bGQgdGhpcyBnbyBpbnRvIFZp
bmNlbnpvJ3MgcGF0Y2hzZXQ/Cgo+Cj4gV2UgY291bGQgYWRkIHRoaXMgdG8gc2VsZnRlc3RzIGJ1
dCBJIHRoaW5rIGl0J3MgdG9vIGdsaWJjIHNwZWNpZmljLgo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0t
LS04PC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICNpbmNsdWRlIDxzdGRs
aWIuaD4KPgo+ICNkZWZpbmUgVEFHX1NISUZUICAgICAgICg1NikKPiAjZGVmaW5lIFRBR19NQVNL
ICAgICAgICAoMHhmZlVMIDw8IFRBR19TSElGVCkKPgo+IHZvaWQgKl9fbGliY19tYWxsb2Moc2l6
ZV90IHNpemUpOwo+IHZvaWQgX19saWJjX2ZyZWUodm9pZCAqcHRyKTsKPiB2b2lkICpfX2xpYmNf
cmVhbGxvYyh2b2lkICpwdHIsIHNpemVfdCBzaXplKTsKPiB2b2lkICpfX2xpYmNfY2FsbG9jKHNp
emVfdCBubWVtYiwgc2l6ZV90IHNpemUpOwo+Cj4gc3RhdGljIHZvaWQgKnRhZ19wdHIodm9pZCAq
cHRyKQo+IHsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgdGFnID0gcmFuZCgpICYgMHhmZjsKPiAg
ICAgICAgIGlmICghcHRyKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gcHRyOwo+ICAgICAgICAg
cmV0dXJuICh2b2lkICopKCh1bnNpZ25lZCBsb25nKXB0ciB8ICh0YWcgPDwgVEFHX1NISUZUKSk7
Cj4gfQo+Cj4gc3RhdGljIHZvaWQgKnVudGFnX3B0cih2b2lkICpwdHIpCj4gewo+ICAgICAgICAg
cmV0dXJuICh2b2lkICopKCh1bnNpZ25lZCBsb25nKXB0ciAmIH5UQUdfTUFTSyk7Cj4gfQo+Cj4g
dm9pZCAqbWFsbG9jKHNpemVfdCBzaXplKQo+IHsKPiAgICAgICAgIHJldHVybiB0YWdfcHRyKF9f
bGliY19tYWxsb2Moc2l6ZSkpOwo+IH0KPgo+IHZvaWQgZnJlZSh2b2lkICpwdHIpCj4gewo+ICAg
ICAgICAgX19saWJjX2ZyZWUodW50YWdfcHRyKHB0cikpOwo+IH0KPgo+IHZvaWQgKnJlYWxsb2Mo
dm9pZCAqcHRyLCBzaXplX3Qgc2l6ZSkKPiB7Cj4gICAgICAgICByZXR1cm4gdGFnX3B0cihfX2xp
YmNfcmVhbGxvYyh1bnRhZ19wdHIocHRyKSwgc2l6ZSkpOwo+IH0KPgo+IHZvaWQgKmNhbGxvYyhz
aXplX3Qgbm1lbWIsIHNpemVfdCBzaXplKQo+IHsKPiAgICAgICAgIHJldHVybiB0YWdfcHRyKF9f
bGliY19jYWxsb2Mobm1lbWIsIHNpemUpKTsKPiB9Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
