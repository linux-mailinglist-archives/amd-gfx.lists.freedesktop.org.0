Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB1D21C82
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 19:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA9A89950;
	Fri, 17 May 2019 17:31:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1293D896DD;
 Fri, 17 May 2019 14:49:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C624E1715;
 Fri, 17 May 2019 07:49:39 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 3BA583F71E; Fri, 17 May 2019 07:49:34 -0700 (PDT)
Date: Fri, 17 May 2019 15:49:31 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
Message-ID: <20190517144931.GA56186@arrakis.emea.arm.com>
References: <cover.1557160186.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1557160186.git.andreyknvl@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 17 May 2019 17:31:14 +0000
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgQW5kcmV5LAoKT24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDY6MzA6NDZQTSArMDIwMCwgQW5k
cmV5IEtvbm92YWxvdiB3cm90ZToKPiBPbmUgb2YgdGhlIGFsdGVybmF0aXZlIGFwcHJvYWNoZXMg
dG8gdW50YWdnaW5nIHRoYXQgd2FzIGNvbnNpZGVyZWQgaXMgdG8KPiBjb21wbGV0ZWx5IHN0cmlw
IHRoZSBwb2ludGVyIHRhZyBhcyB0aGUgcG9pbnRlciBlbnRlcnMgdGhlIGtlcm5lbCB3aXRoCj4g
c29tZSBraW5kIG9mIGEgc3lzY2FsbCB3cmFwcGVyLCBidXQgdGhhdCB3b24ndCB3b3JrIHdpdGgg
dGhlIGNvdW50bGVzcwo+IG51bWJlciBvZiBkaWZmZXJlbnQgaW9jdGwgY2FsbHMuIFdpdGggdGhp
cyBhcHByb2FjaCB3ZSB3b3VsZCBuZWVkIGEgY3VzdG9tCj4gd3JhcHBlciBmb3IgZWFjaCBpb2N0
bCB2YXJpYXRpb24sIHdoaWNoIGRvZXNuJ3Qgc2VlbSBwcmFjdGljYWwuCgpUaGUgbW9yZSBJIGxv
b2sgYXQgdGhpcyBwcm9ibGVtLCB0aGUgbGVzcyBjb252aW5jZWQgSSBhbSB0aGF0IHdlIGNhbgpz
b2x2ZSBpdCBpbiBhIHdheSB0aGF0IHJlc3VsdHMgaW4gYSBzdGFibGUgQUJJIGNvdmVyaW5nIGlv
Y3RscygpLiBXaGlsZQpmb3IgdGhlIEFuZHJvaWQga2VybmVsIGNvZGViYXNlIGl0IGNvdWxkIGJl
IHNpbXBsZXIgYXMgeW91IGRvbid0IHVwZ3JhZGUKdGhlIGtlcm5lbCB2ZXJzaW9uIGV2ZXJ5IDIu
NSBtb250aHMsIGZvciB0aGUgbWFpbmxpbmUga2VybmVsIHRoaXMKZG9lc24ndCBzY2FsZS4gQW55
IHJ1bi10aW1lIGNoZWNrcyBhcmUgcmVsYXRpdmVseSBsaW1pdGVkIGluIHRlcm1zIG9mCmRyaXZl
cnMgY292ZXJlZC4gQmV0dGVyIHN0YXRpYyBjaGVja2luZyB3b3VsZCBiZSBuaWNlIGFzIGEgbG9u
ZyB0ZXJtCnNvbHV0aW9uIGJ1dCB3ZSBkaWRuJ3QgZ2V0IGFueXdoZXJlIHdpdGggdGhlIGRpc2N1
c3Npb24gbGFzdCB5ZWFyLgoKSU1PIChSRkMgZm9yIG5vdyksIEkgc2VlIHR3byB3YXlzIGZvcndh
cmQ6CgoxLiBNYWtlIHRoaXMgYSB1c2VyIHNwYWNlIHByb2JsZW0gYW5kIGRvIG5vdCBhbGxvdyB0
YWdnZWQgcG9pbnRlcnMgaW50bwogICB0aGUgc3lzY2FsbCBBQkkuIEEgbGliYyB3cmFwcGVyIHdv
dWxkIGhhdmUgdG8gY29udmVydCBzdHJ1Y3R1cmVzLAogICBwYXJhbWV0ZXJzIGJlZm9yZSBwYXNz
aW5nIHRoZW0gaW50byB0aGUga2VybmVsLiBOb3RlIHRoYXQgd2UgY2FuCiAgIHN0aWxsIHN1cHBv
cnQgdGhlIGhhcmR3YXJlIE1URSBpbiB0aGUga2VybmVsIGJ5IGVuYWJsaW5nIHRhZ2dlZAogICBt
ZW1vcnkgcmFuZ2VzLCBzYXZpbmcvcmVzdG9yaW5nIHRhZ3MgZXRjLiBidXQgbm90IGFsbG93aW5n
IHRhZ2dlZAogICBhZGRyZXNzZXMgYXQgdGhlIHN5c2NhbGwgYm91bmRhcnkuCgoyLiBTaW1pbGFy
IHNoaW0gdG8gdGhlIGFib3ZlIGxpYmMgd3JhcHBlciBidXQgaW5zaWRlIHRoZSBrZXJuZWwKICAg
KGFyY2gvYXJtNjQgb25seTsgbW9zdCBwb2ludGVyIGFyZ3VtZW50cyBjb3VsZCBiZSBjb3ZlcmVk
IHdpdGggYW4KICAgX19TQ19DQVNUIHNpbWlsYXIgdG8gdGhlIHMzOTAgb25lKS4gVGhlcmUgYXJl
IHR3byBkaWZmZXJlbmNlcyBmcm9tCiAgIHdoYXQgd2UndmUgZGlzY3Vzc2VkIGluIHRoZSBwYXN0
OgoKICAgYSkgdGhpcyBpcyBhbiBvcHQtaW4gYnkgdGhlIHVzZXIgd2hpY2ggd291bGQgaGF2ZSB0
byBleHBsaWNpdGx5IGNhbGwKICAgICAgcHJjdGwoKS4gSWYgaXQgcmV0dXJucyAtRU5PVFNVUFAg
ZXRjLiwgdGhlIHVzZXIgd29uJ3QgYmUgYWxsb3dlZAogICAgICB0byBwYXNzIHRhZ2dlZCBwb2lu
dGVycyB0byB0aGUga2VybmVsLiBUaGlzIHdvdWxkIHByb2JhYmx5IGJlIHRoZQogICAgICByZXNw
b25zaWJpbGl0eSBvZiB0aGUgQyBsaWIgdG8gbWFrZSBzdXJlIGl0IGRvZXNuJ3QgdGFnIGhlYXAK
ICAgICAgYWxsb2NhdGlvbnMuIElmIHRoZSB1c2VyIGRpZCBub3Qgb3B0LWluLCB0aGUgc3lzY2Fs
bHMgYXJlIHJvdXRlZAogICAgICB0aHJvdWdoIHRoZSBub3JtYWwgcGF0aCAobm8gdW50YWdnaW5n
IGFkZHJlc3Mgc2hpbSkuCgogICBiKSBpb2N0bCgpIGFuZCBvdGhlciBibGFja2xpc3RlZCBzeXNj
YWxscyAocHJjdGwpIHdpbGwgbm90IGFjY2VwdAogICAgICB0YWdnZWQgcG9pbnRlcnMgKHRvIGJl
IGRvY3VtZW50ZWQgaW4gVmljZW56bydzIEFCSSBwYXRjaGVzKS4KCkl0IGRvZXNuJ3Qgc29sdmUg
dGhlIHByb2JsZW1zIHdlIGFyZSB0cnlpbmcgdG8gYWRkcmVzcyBidXQgMi5hIHNhdmVzIHVzCmZy
b20gYmxpbmRseSByZWxheGluZyB0aGUgQUJJIHdpdGhvdXQga25vd2luZyBob3cgdG8gZWFzaWx5
IGFzc2VzcyBuZXcKY29kZSBiZWluZyBtZXJnZWQgKG92ZXIgNTAwSyBsaW5lcyBiZXR3ZWVuIGtl
cm5lbCB2ZXJzaW9ucykuIEV4aXN0aW5nCmFwcGxpY2F0aW9ucyAod2hvIGRvbid0IG9wdC1pbikg
d29uJ3QgaW5hZHZlcnRlbnRseSBzdGFydCB1c2luZyB0aGUgbmV3CkFCSSB3aGljaCBjb3VsZCBy
aXNrIGJlY29taW5nIGRlLWZhY3RvIEFCSSB0aGF0IHdlIG5lZWQgdG8gc3VwcG9ydCBvbgp0aGUg
bG9uZyBydW4uCgpPcHRpb24gMSB3b3VsZG4ndCBzb2x2ZSB0aGUgaW9jdGwoKSBwcm9ibGVtIGVp
dGhlciBhbmQgd2hpbGUgaXQgbWFrZXMKdGhpbmdzIHNpbXBsZXIgZm9yIHRoZSBrZXJuZWwsIEkg
YW0gYXdhcmUgdGhhdCBpdCdzIHNsaWdodGx5IG1vcmUKY29tcGxpY2F0ZWQgaW4gdXNlciBzcGFj
ZSAoYnV0IEkgcmVhbGx5IGRvbid0IG1pbmQgaWYgeW91IHByZWZlciBvcHRpb24KMSA7KSkuCgpU
aGUgdGFnZ2VkIHBvaW50ZXJzICh3aGV0aGVyIGh3YXNhbiBvciBNVEUpIHNob3VsZCBpZGVhbGx5
IGJlIGEKdHJhbnNwYXJlbnQgZmVhdHVyZSBmb3IgdGhlIGFwcGxpY2F0aW9uIHdyaXRlciBidXQg
SSBkb24ndCB0aGluayB3ZSBjYW4Kc29sdmUgaXQgZW50aXJlbHkgYW5kIG1ha2UgaXQgc2VhbWxl
c3MgZm9yIHRoZSBtdWx0aXR1ZGUgb2YgaW9jdGxzKCkuCkknZCBzYXkgeW91IG9ubHkgb3B0IGlu
IHRvIHN1Y2ggZmVhdHVyZSBpZiB5b3Uga25vdyB3aGF0IHlvdSBhcmUgZG9pbmcKYW5kIHRoZSB1
c2VyIGNvZGUgdGFrZXMgY2FyZSBvZiBzcGVjaWZpYyBjYXNlcyBsaWtlIGlvY3RsKCksIGhlbmNl
IHRoZQpwcmN0bCgpIHByb3Bvc2FsIGV2ZW4gZm9yIHRoZSBod2FzYW4uCgpDb21tZW50cyB3ZWxj
b21lZC4KCi0tIApDYXRhbGluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
