Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 434FD2DE6C
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 15:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361F46E316;
	Wed, 29 May 2019 13:37:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 11A0689F2D;
 Tue, 28 May 2019 15:41:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE9D7341;
 Tue, 28 May 2019 08:41:06 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 027FD3F59C; Tue, 28 May 2019 08:41:00 -0700 (PDT)
Date: Tue, 28 May 2019 16:40:58 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH v15 05/17] arms64: untag user pointers passed to memory
 syscalls
Message-ID: <20190528154057.GD32006@arrakis.emea.arm.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
 <20190527143719.GA59948@MBP.local>
 <20190528145411.GA709@e119886-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528145411.GA709@e119886-lin.cambridge.arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 29 May 2019 13:37:24 +0000
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
 linux-arm-kernel@lists.infradead.org, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDM6NTQ6MTFQTSArMDEwMCwgQW5kcmV3IE11cnJheSB3
cm90ZToKPiBPbiBNb24sIE1heSAyNywgMjAxOSBhdCAwMzozNzoyMFBNICswMTAwLCBDYXRhbGlu
IE1hcmluYXMgd3JvdGU6Cj4gPiBPbiBNb24sIE1heSAwNiwgMjAxOSBhdCAwNjozMDo1MVBNICsw
MjAwLCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+ID4gPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBv
ZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMgYXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+ID4g
PiBwYXNzIHRhZ2dlZCB1c2VyIHBvaW50ZXJzICh3aXRoIHRoZSB0b3AgYnl0ZSBzZXQgdG8gc29t
ZXRoaW5nIGVsc2Ugb3RoZXIKPiA+ID4gdGhhbiAweDAwKSBhcyBzeXNjYWxsIGFyZ3VtZW50cy4K
PiA+ID4gCj4gPiA+IFRoaXMgcGF0Y2ggYWxsb3dzIHRhZ2dlZCBwb2ludGVycyB0byBiZSBwYXNz
ZWQgdG8gdGhlIGZvbGxvd2luZyBtZW1vcnkKPiA+ID4gc3lzY2FsbHM6IGJyaywgZ2V0X21lbXBv
bGljeSwgbWFkdmlzZSwgbWJpbmQsIG1pbmNvcmUsIG1sb2NrLCBtbG9jazIsCj4gPiA+IG1tYXAs
IG1tYXBfcGdvZmYsIG1wcm90ZWN0LCBtcmVtYXAsIG1zeW5jLCBtdW5sb2NrLCBtdW5tYXAsCj4g
PiA+IHJlbWFwX2ZpbGVfcGFnZXMsIHNobWF0IGFuZCBzaG1kdC4KPiA+ID4gCj4gPiA+IFRoaXMg
aXMgZG9uZSBieSB1bnRhZ2dpbmcgcG9pbnRlcnMgcGFzc2VkIHRvIHRoZXNlIHN5c2NhbGxzIGlu
IHRoZQo+ID4gPiBwcm9sb2d1ZXMgb2YgdGhlaXIgaGFuZGxlcnMuCj4gPiA+IAo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Cj4gPiAK
PiA+IEFjdHVhbGx5LCBJIGRvbid0IHRoaW5rIGFueSBvZiB0aGVzZSB3cmFwcGVycyBnZXQgY2Fs
bGVkIChoYXZlIHlvdQo+ID4gdGVzdGVkIHRoaXMgcGF0Y2g/KS4gRm9sbG93aW5nIGNvbW1pdCA0
Mzc4YTdkNGJlMzAgKCJhcm02NDogaW1wbGVtZW50Cj4gPiBzeXNjYWxsIHdyYXBwZXJzIiksIEkg
dGhpbmsgd2UgaGF2ZSBvdGhlciBtYWNybyBuYW1lcyBmb3Igb3ZlcnJpZGluZyB0aGUKPiA+IHN5
c18qIG9uZXMuCj4gCj4gV2hhdCBpcyB0aGUgdmFsdWUgaW4gYWRkaW5nIHRoZXNlIHdyYXBwZXJz
PwoKTm90IG11Y2ggdmFsdWUsIGluaXRpYWxseSBwcm9wb3NlZCBqdXN0IHRvIGtlZXAgdGhlIGNv
cmUgY2hhbmdlcyBzbWFsbC4KSSdtIGZpbmUgd2l0aCBtb3ZpbmcgdGhlbSBiYWNrIGluIHRoZSBn
ZW5lcmljIGNvZGUgKGJ1dCBzZWUgYmVsb3cpLgoKSSB0aGluayBhbm90aGVyIGFzcGVjdCBpcyBo
b3cgd2UgZGVmaW5lIHRoZSBBQkkuIElzIGFsbG93aW5nIHRhZ3MgdG8KbWxvY2soKSBmb3IgZXhh
bXBsZSBzb21ldGhpbmcgc3BlY2lmaWMgdG8gYXJtNjQgb3Igd291bGQgc3BhcmMgQURJIG5lZWQK
dGhlIHNhbWU/IEluIHRoZSBhYnNlbmNlIG9mIG90aGVyIGFyY2hpdGVjdHVyZXMgZGVmaW5pbmcg
c3VjaCBBQkksIG15CnByZWZlcmVuY2Ugd291bGQgYmUgdG8ga2VlcCB0aGUgd3JhcHBlcnMgaW4g
dGhlIGFyY2ggY29kZS4KCkFzc3VtaW5nIHNwYXJjIHdvbid0IGltcGxlbWVudCB1bnRhZ2dlZF9h
ZGRyKCksIHdlIGNhbiBwbGFjZSB0aGUgbWFjcm9zCmJhY2sgaW4gdGhlIGdlbmVyaWMgY29kZSBi
dXQsIGFzIHBlciB0aGUgcmV2aWV3IGhlcmUsIHdlIG5lZWQgdG8gYmUgbW9yZQpyZXN0cmljdGl2
ZSBvbiB3aGVyZSB3ZSBhbGxvdyB0YWdnZWQgYWRkcmVzc2VzLiBGb3IgZXhhbXBsZSwgaWYgbW1h
cCgpCmdldHMgYSB0YWdnZWQgYWRkcmVzcyB3aXRoIE1BUF9GSVhFRCwgaXMgaXQgZXhwZWN0ZWQg
dG8gcmV0dXJuIHRoZSB0YWc/CgpNeSB0aG91Z2h0cyBvbiBhbGxvd2luZyB0YWdzIChxdWljayBs
b29rKToKCmJyayAtIG5vCmdldF9tZW1wb2xpY3kgLSB5ZXMKbWFkdmlzZSAtIHllcwptYmluZCAt
IHllcwptaW5jb3JlIC0geWVzCm1sb2NrLCBtbG9jazIsIG11bmxvY2sgLSB5ZXMKbW1hcCAtIG5v
ICh3ZSBtYXkgY2hhbmdlIHRoaXMgd2l0aCBNVEUgYnV0IG5vdCBmb3IgVEJJKQptbWFwX3Bnb2Zm
IC0gbm90IHVzZWQgb24gYXJtNjQKbXByb3RlY3QgLSB5ZXMKbXJlbWFwIC0geWVzIGZvciBvbGRf
YWRkcmVzcywgbm8gZm9yIG5ld19hZGRyZXNzIChvbiBwYXIgd2l0aCBtbWFwKQptc3luYyAtIHll
cwptdW5tYXAgLSBwcm9iYWJseSBubyAobW1hcCBkb2VzIG5vdCByZXR1cm4gdGFnZ2VkIHB0cnMp
CnJlbWFwX2ZpbGVfcGFnZXMgLSBubyAoYWxzbyBkZXByZWNhdGVkIHN5c2NhbGwpCnNobWF0LCBz
aG1kdCAtIHNoYWxsIHdlIGFsbG93IHRhZ2dlZCBhZGRyZXNzZXMgb24gc2hhcmVkIG1lbW9yeT8K
ClRoZSBhYm92ZSBpcyBvbmx5IGFib3V0IHRoZSBUQkkgQUJJIHdoaWxlIGlnbm9yaW5nIGhhcmR3
YXJlIE1URS4gRm9yIHRoZQpsYXR0ZXIsIHdlIG1heSB3YW50IHRvIGNoYW5nZSB0aGUgbW1hcCgp
IHRvIGFsbG93IHByZS1jb2xvdXJpbmcgb24gcGFnZQpmYXVsdCB3aGljaCBtZWFucyB0aGF0IG11
bm1hcCgpL21wcm90ZWN0KCkgc2hvdWxkIGFsc28gc3VwcG9ydCB0YWdnZWQKcG9pbnRlcnMuIFBv
c3NpYmx5IG1yZW1hcCgpIGFzIHdlbGwgYnV0IHdlIG5lZWQgdG8gZGVjaWRlIHdoZXRoZXIgaXQK
c2hvdWxkIGFsbG93IHJlLWNvbG91cmluZyB0aGUgcGFnZSAocHJvYmFibHkgbm8sIGluIHdoaWNo
IGNhc2UKb2xkX2FkZHJlc3MgYW5kIG5ld19hZGRyZXNzIHNob3VsZCBoYXZlIHRoZSBzYW1lIHRh
ZykuIEZvciBzb21lIG9mIHRoZXNlCndlJ2xsIGVuZCB1cCB3aXRoIGFybTY0IHNwZWNpZmljIHdy
YXBwZXJzIGFnYWluLCB1bmxlc3Mgc3BhcmMgQURJIGFkb3B0cwpleGFjdGx5IHRoZSBzYW1lIEFC
SSByZXN0cmljdGlvbnMuCgotLSAKQ2F0YWxpbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
