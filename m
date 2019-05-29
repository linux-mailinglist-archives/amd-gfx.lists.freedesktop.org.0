Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB322E236
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 18:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF816E0C9;
	Wed, 29 May 2019 16:24:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 054336E07B;
 Wed, 29 May 2019 15:18:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95CC8341;
 Wed, 29 May 2019 08:18:48 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9C163F5AF;
 Wed, 29 May 2019 08:18:42 -0700 (PDT)
Date: Wed, 29 May 2019 16:18:40 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v15 05/17] arms64: untag user pointers passed to memory
 syscalls
Message-ID: <20190529151839.GF28398@e103592.cambridge.arm.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
 <20190527143719.GA59948@MBP.local>
 <20190528145411.GA709@e119886-lin.cambridge.arm.com>
 <20190528154057.GD32006@arrakis.emea.arm.com>
 <20190528155644.GD28398@e103592.cambridge.arm.com>
 <20190528163400.GE32006@arrakis.emea.arm.com>
 <20190529124224.GE28398@e103592.cambridge.arm.com>
 <20190529132341.27t3knoxpb7t7y3g@mbp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190529132341.27t3knoxpb7t7y3g@mbp>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Wed, 29 May 2019 16:24:50 +0000
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
 Dmitry Vyukov <dvyukov@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Murray <andrew.murray@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMDI6MjM6NDJQTSArMDEwMCwgQ2F0YWxpbiBNYXJpbmFz
IHdyb3RlOgo+IE9uIFdlZCwgTWF5IDI5LCAyMDE5IGF0IDAxOjQyOjI1UE0gKzAxMDAsIERhdmUg
UCBNYXJ0aW4gd3JvdGU6Cj4gPiBPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCAwNTozNDowMFBNICsw
MTAwLCBDYXRhbGluIE1hcmluYXMgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgTWF5IDI4LCAyMDE5IGF0
IDA0OjU2OjQ1UE0gKzAxMDAsIERhdmUgUCBNYXJ0aW4gd3JvdGU6Cj4gPiA+ID4gT24gVHVlLCBN
YXkgMjgsIDIwMTkgYXQgMDQ6NDA6NThQTSArMDEwMCwgQ2F0YWxpbiBNYXJpbmFzIHdyb3RlOgo+
ID4gPiA+IAo+ID4gPiA+IFsuLi5dCj4gPiA+ID4gCj4gPiA+ID4gPiBNeSB0aG91Z2h0cyBvbiBh
bGxvd2luZyB0YWdzIChxdWljayBsb29rKToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBicmsgLSBubwo+
ID4gPiA+IAo+ID4gPiA+IFsuLi5dCj4gPiA+ID4gCj4gPiA+ID4gPiBtbG9jaywgbWxvY2syLCBt
dW5sb2NrIC0geWVzCj4gPiA+ID4gPiBtbWFwIC0gbm8gKHdlIG1heSBjaGFuZ2UgdGhpcyB3aXRo
IE1URSBidXQgbm90IGZvciBUQkkpCj4gPiA+ID4gCj4gPiA+ID4gWy4uLl0KPiA+ID4gPiAKPiA+
ID4gPiA+IG1wcm90ZWN0IC0geWVzCj4gPiA+ID4gCj4gPiA+ID4gSSBoYXZlbid0IGZvbGxvd2lu
ZyB0aGlzIGRpc2N1c3Npb24gY2xvc2VseS4uLiB3aGF0J3MgdGhlIHJhdGlvbmFsZSBmb3IKPiA+
ID4gPiB0aGUgaW5jb25zaXN0ZW5jaWVzIGhlcmUgKGZlZWwgZnJlZSB0byByZWZlciBtZSBiYWNr
IHRvIHRoZSBkaXNjdXNzaW9uCj4gPiA+ID4gaWYgaXQncyBlbHNld2hlcmUpLgo+ID4gPiAKPiA+
ID4gX015XyByYXRpb25hbGUgKGZlZWwgZnJlZSB0byBkaXNhZ3JlZSkgaXMgdGhhdCBtbWFwKCkg
YnkgZGVmYXVsdCB3b3VsZAo+ID4gPiBub3QgcmV0dXJuIGEgdGFnZ2VkIGFkZHJlc3MgKGlnbm9y
aW5nIE1URSBmb3Igbm93KS4gSWYgaXQgZ2V0cyBwYXNzZWQgYQo+ID4gPiB0YWdnZWQgYWRkcmVz
cyBvciBhICJ0YWdnZWQgTlVMTCIgKGZvciBsYWNrIG9mIGEgYmV0dGVyIG5hbWUpIHdlIGRvbid0
Cj4gPiA+IGhhdmUgY2xlYXIgc2VtYW50aWNzIG9mIHdoZXRoZXIgdGhlIHJldHVybmVkIGFkZHJl
c3Mgc2hvdWxkIGJlIHRhZ2dlZCBpbgo+ID4gPiB0aGlzIEFCSSByZWxheGF0aW9uLiBJJ2QgcmF0
aGVyIHJlc2VydmUgdGhpcyBzcGVjaWZpYyBiZWhhdmlvdXIgaWYgd2UKPiA+ID4gb3ZlcmxvYWQg
dGhlIG5vbi16ZXJvIHRhZyBtZWFuaW5nIG9mIG1tYXAoKSBmb3IgTVRFLiBTaW1pbGFyIHJlYXNv
bmluZwo+ID4gPiBmb3IgbXJlbWFwKCksIGF0IGxlYXN0IG9uIHRoZSBuZXdfYWRkcmVzcyBhcmd1
bWVudCAobm90IGVudGlyZWx5IHN1cmUKPiA+ID4gYWJvdXQgb2xkX2FkZHJlc3MpLgo+ID4gPiAK
PiA+ID4gbXVubWFwKCkgc2hvdWxkIHByb2JhYmx5IGZvbGxvdyB0aGUgbW1hcCgpIHJ1bGVzLgo+
ID4gPiAKPiA+ID4gQXMgZm9yIGJyaygpLCBJIGRvbid0IHNlZSB3aHkgdGhlIHVzZXIgd291bGQg
bmVlZCB0byBwYXNzIGEgdGFnZ2VkCj4gPiA+IGFkZHJlc3MsIHdlIGNhbid0IGFzc29jaWF0ZSBh
bnkgbWVhbmluZyB0byB0aGlzIHRhZy4KPiA+ID4gCj4gPiA+IEZvciB0aGUgcmVzdCwgc2luY2Ug
aXQncyBsaWtlbHkgc3VjaCBhZGRyZXNzZXMgd291bGQgaGF2ZSBiZWVuIHRhZ2dlZCBieQo+ID4g
PiBtYWxsb2MoKSBpbiB1c2VyIHNwYWNlLCB3ZSBzaG91bGQgYWxsb3cgdGFnZ2VkIHBvaW50ZXJz
Lgo+ID4gCj4gPiBUaG9zZSBhcmd1bWVudHMgc2VlbSByZWFzb25hYmxlLiAgV2Ugc2hvdWxkIHRy
eSB0byBjYXB0dXJlIHRoaXMKPiA+IHNvbWV3aGVyZSB3aGVuIGRvY3VtZW50aW5nIHRoZSBBQkku
Cj4gPiAKPiA+IFRvIGJlIGNsZWFyLCBJJ20gbm90IHN1cmUgdGhhdCB3ZSBzaG91bGQgZ3VhcmFu
dGVlIGFueXdoZXJlIHRoYXQgYQo+ID4gdGFnZ2VkIHBvaW50ZXIgaXMgcmVqZWN0ZWQ6IHJhdGhl
ciB0aGUgYmVoYXZpb3VyIHNob3VsZCBwcm9iYWJseSBiZQo+ID4gbGVmdCB1bnNwZWNpZmllZC4g
IFRoZW4gd2UgY2FuIHRpZHkgaXQgdXAgaW5jcmVtZW50YWxseS4KPiA+IAo+ID4gKFRoZSBiZWhh
dmlvdXIgaXMgdW5zcGVjaWZpZWQgdG9kYXksIGluIGFueSBjYXNlLikKPiAKPiBXaGF0IGlzIHNw
ZWNpZmllZCAob3IgcmF0aGVyIGRlLWZhY3RvIEFCSSkgdG9kYXkgaXMgdGhhdCBwYXNzaW5nIGEg
dXNlcgo+IGFkZHJlc3MgYWJvdmUgVEFTS19TSVpFIChlLmcuIG5vbi16ZXJvIHRvcCBieXRlKSB3
b3VsZCBmYWlsIGluIG1vc3QKPiBjYXNlcy4gSWYgd2UgcmVsYXggdGhpcyB3aXRoIHRoZSBUQkkg
d2UgbWF5IGVuZCB1cCB3aXRoIHNvbWUgZGUtZmFjdG8KCkkgbWF5IGJlIGJlaW5nIHRvbyBwaWNr
eSwgYnV0ICJ3b3VsZCBmYWlsIGluIG1vc3QgY2FzZXMiIHNvdW5kcyBsaWtlCiJ1bnNwZWNpZmll
ZCIgPwoKPiBBQkkgYmVmb3JlIHdlIGFjdHVhbGx5IGdldCBNVEUgaGFyZHdhcmUuIFRpZ2h0ZW5p
bmcgaXQgYWZ0ZXJ3YXJkcyBtYXkgYmUKPiBzbGlnaHRseSBtb3JlIHByb2JsZW1hdGljLCBhbHRo
b3VnaCBNVEUgbmVlZHMgdG8gYmUgYW4gZXhwbGljaXQgb3B0LWluLgo+IAo+IElPVywgSSB3b3Vs
ZG4ndCB3YW50IHRvIHVubmVjZXNzYXJpbHkgcmVsYXggdGhlIEFCSSBpZiB3ZSBkb24ndCBuZWVk
IHRvLgoKU28gbG9uZyB3ZSBkb24ndCBibG9jayBmb3Jlc2VlYWJsZSBmdXR1cmUgZGV2ZWxvcG1l
bnRzIHVubmVjZXNzYXJpbHkKZWl0aGVyIC0tIEkgYWdyZWUgdGhlcmUncyBhIGJhbGFuY2UgdG8g
YmUgc3RydWNrLgoKSSBndWVzcyB0aGlzIGNhbiBiZSByZXZpZXdlZCB3aGVuIHdlIGhhdmUgbmFp
bGVkIGRvd24gdGhlIGRldGFpbHMgYSBiaXQKZnVydGhlci4KCkNoZWVycwotLS1EYXZlCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
