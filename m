Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E158529A84
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 17:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949956E111;
	Fri, 24 May 2019 15:01:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 66C0D6E0DF;
 Fri, 24 May 2019 14:24:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 268E8A78;
 Fri, 24 May 2019 07:24:03 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65CAA3F575;
 Fri, 24 May 2019 07:23:57 -0700 (PDT)
Date: Fri, 24 May 2019 15:23:54 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
Message-ID: <20190524142352.GY28398@e103592.cambridge.arm.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
 <20190521184856.GC2922@ziepe.ca>
 <20190522134925.GV28398@e103592.cambridge.arm.com>
 <20190523002052.GF15389@ziepe.ca>
 <20190523104256.GX28398@e103592.cambridge.arm.com>
 <20190523165708.q6ru7xg45aqfjzpr@mbp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190523165708.q6ru7xg45aqfjzpr@mbp>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Fri, 24 May 2019 15:01:13 +0000
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Lee Smith <Lee.Smith@arm.com>, linux-kselftest@vger.kernel.org,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-kernel@lists.infradead.org,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDU6NTc6MDlQTSArMDEwMCwgQ2F0YWxpbiBNYXJpbmFz
IHdyb3RlOgo+IE9uIFRodSwgTWF5IDIzLCAyMDE5IGF0IDExOjQyOjU3QU0gKzAxMDAsIERhdmUg
UCBNYXJ0aW4gd3JvdGU6Cj4gPiBPbiBXZWQsIE1heSAyMiwgMjAxOSBhdCAwOToyMDo1MlBNIC0w
MzAwLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gPiA+IE9uIFdlZCwgTWF5IDIyLCAyMDE5IGF0
IDAyOjQ5OjI4UE0gKzAxMDAsIERhdmUgTWFydGluIHdyb3RlOgo+ID4gPiA+IElmIG11bHRpcGxl
IHBlb3BsZSB3aWxsIGNhcmUgYWJvdXQgdGhpcywgcGVyaGFwcyB3ZSBzaG91bGQgdHJ5IHRvCj4g
PiA+ID4gYW5ub3RhdGUgdHlwZXMgbW9yZSBleHBsaWNpdGx5IGluIFNZU0NBTExfREVGSU5FeCgp
IGFuZCBBQkkgZGF0YQo+ID4gPiA+IHN0cnVjdHVyZXMuCj4gPiA+ID4gCj4gPiA+ID4gRm9yIGV4
YW1wbGUsIHdlIGNvdWxkIGhhdmUgYSBjb3VwbGUgb2YgbXV0dWFsbHkgZXhjbHVzaXZlIG1vZGlm
aWVycwo+ID4gPiA+IAo+ID4gPiA+IFQgX19vYmplY3QgKgo+ID4gPiA+IFQgX192YWRkciAqIChv
ciBVIF9fdmFkZHIpCj4gPiA+ID4gCj4gPiA+ID4gSW4gdGhlIGZpcnN0IGNhc2UgdGhlIHBvaW50
ZXIgcG9pbnRzIHRvIGFuIG9iamVjdCAoaW4gdGhlIEMgc2Vuc2UpCj4gPiA+ID4gdGhhdCB0aGUg
Y2FsbCBtYXkgZGVyZWZlcmVuY2UgYnV0IG5vdCB1c2UgZm9yIGFueSBvdGhlciBwdXJwb3NlLgo+
ID4gPiAKPiA+ID4gSG93IHdvdWxkIHlvdSB1c2UgdGhlc2UgdHdvIGRpZmZlcmVudGx5Pwo+ID4g
PiAKPiA+ID4gU28gZmFyIHRoZSBrZXJuZWwgaGFzIHdvcmtlZCB0aGF0IF9fdXNlciBzaG91bGQg
dGFnIGFueSBwb2ludGVyIHRoYXQKPiA+ID4gaXMgZnJvbSB1c2Vyc3BhY2UgYW5kIHRoZW4geW91
IGNhbid0IGRvIGFueXRoaW5nIHdpdGggaXQgdW50aWwgeW91Cj4gPiA+IHRyYW5zZm9ybSBpdCBp
bnRvIGEga2VybmVsIHNvbWV0aGluZwo+ID4gCj4gPiBVbHRpbWF0ZWx5IGl0IHdvdWxkIGJlIGdv
b2QgdG8gZGlzYWxsb3cgY2FzdGluZyBfX29iamVjdCBwb2ludGVycyBleGVjcHQKPiA+IHRvIGNv
bXBhdGlibGUgX19vYmplY3QgcG9pbnRlciB0eXBlcywgYW5kIHRvIG1ha2UgZ2V0X3VzZXIgZXRj
LiBkZW1hbmQKPiA+IF9fb2JqZWN0Lgo+ID4gCj4gPiBfX3ZhZGRyIHBvaW50ZXJzIC8gYWRkcmVz
c2VzIHdvdWxkIGJlIGZyZWVseSBjYXN0YWJsZSwgYnV0IG5vdCB0bwo+ID4gX19vYmplY3QgYW5k
IHNvIHdvdWxkIG5vdCBiZSBkZXJlZmVyZW5jZWFibGUgZXZlbiBpbmRpcmVjdGx5Lgo+IAo+IEkg
dGhpbmsgaXQgZ2V0cyB0b28gY29tcGxpY2F0ZWQgYW5kIHRoZXJlIGFyZSBhbWJpZ3VvdXMgY2Fz
ZXMgdGhhdCB3ZQo+IG1heSBub3QgYmUgYWJsZSB0byBkaXN0aW5ndWlzaC4gRm9yIGV4YW1wbGUg
Y29weV9mcm9tX3VzZXIoKSBtYXkgYmUgdXNlZAo+IHRvIGNvcHkgYSB1c2VyIGRhdGEgc3RydWN0
dXJlIGludG8gdGhlIGtlcm5lbCwgaGVuY2UgX19vYmplY3Qgd291bGQKPiB3b3JrLCB3aGlsZSB0
aGUgc2FtZSBmdW5jdGlvbiBtYXkgYmUgdXNlZCB0byBjb3B5IG9wYXF1ZSBkYXRhIHRvIGEgZmls
ZSwKPiBzbyBfX3ZhZGRyIG1heSBiZSBhIGJldHRlciBvcHRpb24gKHVubGVzcyBJIG1pc3VuZGVy
c3Rvb2QgeW91cgo+IHByb3Bvc2FsKS4KCkNhbiB5b3UgaWxsdXN0cmF0ZT8gIEknbSBub3Qgc3Vy
ZSBvZiB5b3VyIHBvaW50IGhlcmUuCgo+IFdlIGN1cnJlbnRseSBoYXZlIFQgX191c2VyICogYW5k
IEkgdGhpbmsgaXQncyBhIGdvb2Qgc3RhcnRpbmcgcG9pbnQuIFRoZQo+IHByaW9yIGF0dGVtcHQg
WzFdIHdhcyBzaHV0IGRvd24gYmVjYXVzZSBpdCB3YXMganVzdCBoaWRpbmcgdGhlIGNhc3QKPiB1
c2luZyBfX2ZvcmNlLiBXZSdkIG5lZWQgdG8gd29yayB0aHJvdWdoIHRob3NlIGNhc2VzIGFnYWlu
IGFuZCByYXRoZXIKPiBzdGFydCBjaGFuZ2luZyB0aGUgZnVuY3Rpb24gcHJvdG90eXBlcyB0byBh
dm9pZCB1bm5lY2Vzc2FyeSBjYXN0aW5nIGluCj4gdGhlIGNhbGxlcnMgKGUuZy4gZ2V0X3VzZXJf
cGFnZXModm9pZCBfX3VzZXIgKikgb3IgY29tZSB1cCB3aXRoIGEgbmV3Cj4gdHlwZSkgd2hpbGUg
Y2hhbmdpbmcgdGhlIGV4cGxpY2l0IGNhc3RpbmcgdG8gYSBtYWNybyB3aGVyZSBpdCBuZWVkcyB0
bwo+IGJlIG9idmlvdXMgdGhhdCB3ZSBhcmUgY29udmVydGluZyBhIHVzZXIgcG9pbnRlciwgcG90
ZW50aWFsbHkgdHlwZWQKPiAodGFnZ2VkKSwgdG8gYW4gdW50eXBlZCBhZGRyZXNzIHJhbmdlLiBX
ZSBtYXkgbmVlZCBhIHVzZXJfcHRyX3RvX3Vsb25nKCkKPiBtYWNybyBvciBzaW1pbGFyIChpdCBz
ZWVtcyB0aGF0IHdlIGhhdmUgYSB1NjRfdG9fdXNlcl9wdHIsIHdhc24ndCBhd2FyZQo+IG9mIGl0
KS4KPiAKPiBJdCBtYXkgYWN0dWFsbHkgbm90IGJlIGZhciBmcm9tIHdoYXQgeW91IHN1Z2dlc3Rl
ZCBidXQgSSdkIGtlZXAgdGhlCj4gY3VycmVudCBUIF9fdXNlciAqIHRvIGRlbm90ZSBwb3NzaWJs
ZSBkZXJlZmVyZW5jZS4KClRoaXMgbWF5IG5vdCBoYXZlIGJlZW4gY2xlYXIsIGJ1dCBfX29iamVj
dCBhbmQgX192YWRkciB3b3VsZCBiZQpvcnRob2dvbmFsIHRvIF9fdXNlci4gIFNpbmNlIF9fb2Jq
ZWN0IGFuZCBfX3ZhZGRyIHN0cmljdGx5IGNvbnN0cmFpbgp3aGF0IGNhbiBiZSBkb25lIHdpdGgg
YW4gbHZhbHVlLCB0aGV5IGNvdWxkIGJlIGNhc3Qgb24sIGJ1dCBub3QgYmUKY2FzdCBvZmYgd2l0
aG91dCBfX2ZvcmNlLgoKU3lzY2FsbCBhcmd1bWVudHMgYW5kIHBvaW50ZXIgaW4gaW9jdGwgc3Ry
dWN0cyBldGMuIHdvdWxkIHR5cGljYWxseQpiZSBhbm5vdGF0ZWQgYXMgX19vYmplY3QgX191c2Vy
ICogb3IgX192YWRkciBfX3VzZXIgKi4gIFBsYWluIG9sZApfX3VzZXIgKiB3b3VsZCB3b3JrIGFz
IGJlZm9yZSwgYnV0IHdvdWxkIGJlIG1vcmUgcGVybWlzc2l2ZSBhbmQgZ2l2ZQpzdGF0aWMgYW5h
bHlzZXJzIGxlc3MgaW5mb3JtYXRpb24gdG8gZ28gb24uCgpDb252ZXJzaW9uIG9yIHVzZSBvciBf
X29iamVjdCBvciBfX3ZhZGRyIHBvaW50ZXJzIHdvdWxkIHJlcXVpcmUgc3BlY2lmaWMKQVBJcyBp
biB0aGUga2VybmVsLCBzbyB0aGF0IHdlIGNhbiBiZSBjbGVhciBhYm91dCB0aGUgc2VtYW50aWNz
LgoKRG9pbmcgdGhpbmdzIHRoaXMgd2F5IHdvdWxkIGFsbG93IG1pZ3JhdGlvbiB0byBhbm5vdGF0
aW9uIG9mIG1vc3Qgb3IgYWxsCkFCSSBwb2ludGVycyB3aXRoIF9fb2JqZWN0IG9yIF9fdmFkZHIg
b3ZlciB0aW1lLCBidXQgd2Ugd291bGRuJ3QgaGF2ZSB0bwpkbyBpdCBhbGwgaW4gb25lIGdvLiAg
UHJvYmxlbSBjYXNlcyAod2hpY2ggd29uJ3QgYmUgdGhlIG1ham9yaXR5KSBjb3VsZApjb250aW51
ZSB0byBiZSBwbGFpbiBfX3VzZXIuCgoKVGhpcyBkb2VzIG5vdCBtYWdpY2FsbHkgc29sdmUgdGhl
IGNoYWxsZW5nZXMgb2YgTVRFLCBidXQgbWlnaHQgcHJvdmlkZQp0b29scyB0aGF0IGFyZSB1c2Vm
dWwgdG8gaGVscCBhdm9pZCBiaXRyb3QgYW5kIHJlZ3Jlc3Npb25zIG92ZXIgdGltZS4KCkkgYWdy
ZWUgdGhvdWdoIHRoYXQgdGhlcmUgbWlnaHQgYmUgYSBmYWlyIG51bWJlciBvZiBvZiBjYXNlcyB0
aGF0IGRvbid0CmNvbnZlbmllbnRseSBmYWxsIHVuZGVyIF9fb2JqZWN0IG9yIF9fdmFkZHIgc2Vt
YW50aWNzLiAgSXQncyBoYXJkIHRvCmtub3cgd2l0aG91dCB0cnlpbmcgaXQuCgpfTW9zdF8gc3lz
Y2FsbCBhcmd1bWVudHMgc2VlbSB0byBiZSBmYWlybHkgb2J2aW91c2x5IG9uZSBvciBhbm90aGVy
CnRob3VnaCwgYW5kIHRoaXMgYXBwcm9hY2ggaGFzIHNvbWUgcG9zc2liaWxpdHkgb2Ygc2NhbGlu
ZyB0byBpb2N0bHMKYW5kIG90aGVyIG9kZCBpbnRlcmZhY2VzLgoKQ2hlZXJzCi0tLURhdmUKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
