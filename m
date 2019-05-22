Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 940372656E
	for <lists+amd-gfx@lfdr.de>; Wed, 22 May 2019 16:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBFA89A76;
	Wed, 22 May 2019 14:12:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8E13C897EF;
 Wed, 22 May 2019 13:49:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5198E80D;
 Wed, 22 May 2019 06:49:36 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94CFA3F575;
 Wed, 22 May 2019 06:49:30 -0700 (PDT)
Date: Wed, 22 May 2019 14:49:28 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
Message-ID: <20190522134925.GV28398@e103592.cambridge.arm.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
 <20190521184856.GC2922@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521184856.GC2922@ziepe.ca>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Wed, 22 May 2019 14:12:05 +0000
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Lee Smith <Lee.Smith@arm.com>, linux-kselftest@vger.kernel.org,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
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

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMDM6NDg6NTZQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIEZyaSwgTWF5IDE3LCAyMDE5IGF0IDAzOjQ5OjMxUE0gKzAxMDAsIENhdGFs
aW4gTWFyaW5hcyB3cm90ZToKPiAKPiA+IFRoZSB0YWdnZWQgcG9pbnRlcnMgKHdoZXRoZXIgaHdh
c2FuIG9yIE1URSkgc2hvdWxkIGlkZWFsbHkgYmUgYQo+ID4gdHJhbnNwYXJlbnQgZmVhdHVyZSBm
b3IgdGhlIGFwcGxpY2F0aW9uIHdyaXRlciBidXQgSSBkb24ndCB0aGluayB3ZSBjYW4KPiA+IHNv
bHZlIGl0IGVudGlyZWx5IGFuZCBtYWtlIGl0IHNlYW1sZXNzIGZvciB0aGUgbXVsdGl0dWRlIG9m
IGlvY3RscygpLgo+ID4gSSdkIHNheSB5b3Ugb25seSBvcHQgaW4gdG8gc3VjaCBmZWF0dXJlIGlm
IHlvdSBrbm93IHdoYXQgeW91IGFyZSBkb2luZwo+ID4gYW5kIHRoZSB1c2VyIGNvZGUgdGFrZXMg
Y2FyZSBvZiBzcGVjaWZpYyBjYXNlcyBsaWtlIGlvY3RsKCksIGhlbmNlIHRoZQo+ID4gcHJjdGwo
KSBwcm9wb3NhbCBldmVuIGZvciB0aGUgaHdhc2FuLgo+IAo+IEknbSBub3Qgc3VyZSBzdWNoIGEg
ZGlyZSB2aWV3IGlzIHdhcnJlbnRlZC4uIAo+IAo+IFRoZSBpb2N0bCBzaXR1YXRpb24gaXMgbm90
IHNvIGJhZCwgb3RoZXIgdGhhbiBhIGZldyBzcGVjaWFsIGNhc2VzLAo+IG1vc3QgZHJpdmVycyBq
dXN0IHRha2UgYSAndm9pZCBfX3VzZXIgKicgYW5kIHBhc3MgaXQgYXMgYW4gYXJndW1lbnQgdG8K
PiBzb21lIGZ1bmN0aW9uIHRoYXQgYWNjZXB0cyBhICd2b2lkIF9fdXNlciAqJy4gc3BhcnNlIGV0
IGFsIHZlcmlmeQo+IHRoaXMuIAo+IAo+IEFzIGxvbmcgYXMgdGhlIGNvcmUgZnVuY3Rpb25zIGRv
IHRoZSByaWdodCB0aGluZyB0aGUgZHJpdmVycyB3aWxsIGJlCj4gT0suCj4gCj4gVGhlIG9ubHkg
cGxhY2UgdGhpbmdzIGdldCBkaWN5IGlzIGlmIHNvbWVvbmUgY2FzdHMgdG8gdW5zaWduZWQgbG9u
Zwo+IChpZSBmb3Igdm1hIHdvcmspIGJ1dCBJIHRoaW5rIHRoYXQgcmVmbGVjdHMgdGhhdCBvdXIg
ZHJpdmVyIGZhY2luZwo+IEFQSXMgZm9yIFZNQXMgYXJlIGNvbXBhdGlibGUgd2l0aCBzdGF0aWMg
YW5hbHlzaXMgKGllIEkgaGF2ZSBubwo+IGVhcnRobHkgaWRlYSB3aHkgZ2V0X3VzZXJfcGFnZXMo
KSBhY2NlcHRzIGFuIHVuc2lnbmVkIGxvbmcpLCBub3QgdGhhdAo+IHRoaXMgaXMgdG9vIGhhcmQu
CgpJZiBtdWx0aXBsZSBwZW9wbGUgd2lsbCBjYXJlIGFib3V0IHRoaXMsIHBlcmhhcHMgd2Ugc2hv
dWxkIHRyeSB0bwphbm5vdGF0ZSB0eXBlcyBtb3JlIGV4cGxpY2l0bHkgaW4gU1lTQ0FMTF9ERUZJ
TkV4KCkgYW5kIEFCSSBkYXRhCnN0cnVjdHVyZXMuCgpGb3IgZXhhbXBsZSwgd2UgY291bGQgaGF2
ZSBhIGNvdXBsZSBvZiBtdXR1YWxseSBleGNsdXNpdmUgbW9kaWZpZXJzCgpUIF9fb2JqZWN0ICoK
VCBfX3ZhZGRyICogKG9yIFUgX192YWRkcikKCkluIHRoZSBmaXJzdCBjYXNlIHRoZSBwb2ludGVy
IHBvaW50cyB0byBhbiBvYmplY3QgKGluIHRoZSBDIHNlbnNlKQp0aGF0IHRoZSBjYWxsIG1heSBk
ZXJlZmVyZW5jZSBidXQgbm90IHVzZSBmb3IgYW55IG90aGVyIHB1cnBvc2UuCgpJbiB0aGUgbGF0
dGVyIGNhc2UgdGhlIHBvaW50ZXIgKG9yIG90aGVyIHR5cGUpIGlzIGEgdmlydHVhbCBhZGRyZXNz
CnRoYXQgdGhlIGNhbGwgZG9lcyBub3QgZGVyZWZlcmVuY2UgYnV0IG15IGRvIG90aGVyIHRoaW5n
cyB3aXRoLgoKQWxzbwoKVSBfX3JlYWxseShUKQoKdG8gdGVsbCBzdGF0aWMgYW5hbHlzZXJzIHRo
ZSByZWFsIHR5cGUgb2YgcG9pbnRlcnMgc211Z2dsZWQgdGhyb3VnaApVQVBJIGRpc2d1aXNlZCBh
cyBvdGhlciB0eXBlcyAoKmNvdWdoKiBLVk0sIGV0Yy4pCgpXZSBjb3VsZCBncmFkdWFsbHkgbWFr
ZSBzcGFyc2UgbW9yZSBzdHJpY3QgYWJvdXQgdGhlIHByZXNlbmNlIG9mCmFubm90YXRpb25zIGFu
ZCBhbGxvd2VkIGNvbnZlcnNpb25zLCBhZGQgZ2V0L3B1dF91c2VyKCkgdmFyaWFudHMKdGhhdCBk
ZW1hbmQgZXhwbGljaXQgYW5ub3RhdGlvbiwgZXRjLgoKZmluZF92bWEoKSB3b3VsZG4ndCB3b3Jr
IHdpdGggYSBfX29iamVjdCBwb2ludGVyLCBmb3IgZXhhbXBsZS4gIEEKZ2V0X3VzZXJfcGFnZXNf
Zm9yX2RlcmVmZXJlbmNlKCkgbWlnaHQgYmUgbmVlZGVkIGZvciBfX29iamVjdCBwb2ludGVycwoo
ZW1ib2R5aW5nIGEgcHJvbWlzZSBmcm9tIHRoZSBjYWxsZXIgdGhhdCBvbmx5IHRoZSBvYmplY3Qg
d2lsbCBiZQpkZXJlZmVyZW5jZWQgd2l0aGluIHRoZSBtYXBwZWQgcGFnZXMpLgoKVGhvdWdodHM/
CgpUaGlzIGtpbmQgb2YgdGhpbmcgd291bGQgbmVlZCB3aWRlc3ByZWFkIGJ1eS1pbiBpbiBvcmRl
ciB0byBiZSB2aWFibGUuCgpDaGVlcnMKLS0tRGF2ZQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
