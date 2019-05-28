Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 834742DE75
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 15:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFDB6E320;
	Wed, 29 May 2019 13:37:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0DAE06E24B;
 Tue, 28 May 2019 16:34:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D37F1341;
 Tue, 28 May 2019 09:34:08 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 2754A3F59C; Tue, 28 May 2019 09:34:03 -0700 (PDT)
Date: Tue, 28 May 2019 17:34:00 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dave Martin <Dave.Martin@arm.com>
Subject: Re: [PATCH v15 05/17] arms64: untag user pointers passed to memory
 syscalls
Message-ID: <20190528163400.GE32006@arrakis.emea.arm.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
 <20190527143719.GA59948@MBP.local>
 <20190528145411.GA709@e119886-lin.cambridge.arm.com>
 <20190528154057.GD32006@arrakis.emea.arm.com>
 <20190528155644.GD28398@e103592.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528155644.GD28398@e103592.cambridge.arm.com>
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Dmitry Vyukov <dvyukov@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@mellanox.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
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

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDQ6NTY6NDVQTSArMDEwMCwgRGF2ZSBQIE1hcnRpbiB3
cm90ZToKPiBPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCAwNDo0MDo1OFBNICswMTAwLCBDYXRhbGlu
IE1hcmluYXMgd3JvdGU6Cj4gCj4gWy4uLl0KPiAKPiA+IE15IHRob3VnaHRzIG9uIGFsbG93aW5n
IHRhZ3MgKHF1aWNrIGxvb2spOgo+ID4KPiA+IGJyayAtIG5vCj4gCj4gWy4uLl0KPiAKPiA+IG1s
b2NrLCBtbG9jazIsIG11bmxvY2sgLSB5ZXMKPiA+IG1tYXAgLSBubyAod2UgbWF5IGNoYW5nZSB0
aGlzIHdpdGggTVRFIGJ1dCBub3QgZm9yIFRCSSkKPiAKPiBbLi4uXQo+IAo+ID4gbXByb3RlY3Qg
LSB5ZXMKPiAKPiBJIGhhdmVuJ3QgZm9sbG93aW5nIHRoaXMgZGlzY3Vzc2lvbiBjbG9zZWx5Li4u
IHdoYXQncyB0aGUgcmF0aW9uYWxlIGZvcgo+IHRoZSBpbmNvbnNpc3RlbmNpZXMgaGVyZSAoZmVl
bCBmcmVlIHRvIHJlZmVyIG1lIGJhY2sgdG8gdGhlIGRpc2N1c3Npb24KPiBpZiBpdCdzIGVsc2V3
aGVyZSkuCgpfTXlfIHJhdGlvbmFsZSAoZmVlbCBmcmVlIHRvIGRpc2FncmVlKSBpcyB0aGF0IG1t
YXAoKSBieSBkZWZhdWx0IHdvdWxkCm5vdCByZXR1cm4gYSB0YWdnZWQgYWRkcmVzcyAoaWdub3Jp
bmcgTVRFIGZvciBub3cpLiBJZiBpdCBnZXRzIHBhc3NlZCBhCnRhZ2dlZCBhZGRyZXNzIG9yIGEg
InRhZ2dlZCBOVUxMIiAoZm9yIGxhY2sgb2YgYSBiZXR0ZXIgbmFtZSkgd2UgZG9uJ3QKaGF2ZSBj
bGVhciBzZW1hbnRpY3Mgb2Ygd2hldGhlciB0aGUgcmV0dXJuZWQgYWRkcmVzcyBzaG91bGQgYmUg
dGFnZ2VkIGluCnRoaXMgQUJJIHJlbGF4YXRpb24uIEknZCByYXRoZXIgcmVzZXJ2ZSB0aGlzIHNw
ZWNpZmljIGJlaGF2aW91ciBpZiB3ZQpvdmVybG9hZCB0aGUgbm9uLXplcm8gdGFnIG1lYW5pbmcg
b2YgbW1hcCgpIGZvciBNVEUuIFNpbWlsYXIgcmVhc29uaW5nCmZvciBtcmVtYXAoKSwgYXQgbGVh
c3Qgb24gdGhlIG5ld19hZGRyZXNzIGFyZ3VtZW50IChub3QgZW50aXJlbHkgc3VyZQphYm91dCBv
bGRfYWRkcmVzcykuCgptdW5tYXAoKSBzaG91bGQgcHJvYmFibHkgZm9sbG93IHRoZSBtbWFwKCkg
cnVsZXMuCgpBcyBmb3IgYnJrKCksIEkgZG9uJ3Qgc2VlIHdoeSB0aGUgdXNlciB3b3VsZCBuZWVk
IHRvIHBhc3MgYSB0YWdnZWQKYWRkcmVzcywgd2UgY2FuJ3QgYXNzb2NpYXRlIGFueSBtZWFuaW5n
IHRvIHRoaXMgdGFnLgoKRm9yIHRoZSByZXN0LCBzaW5jZSBpdCdzIGxpa2VseSBzdWNoIGFkZHJl
c3NlcyB3b3VsZCBoYXZlIGJlZW4gdGFnZ2VkIGJ5Cm1hbGxvYygpIGluIHVzZXIgc3BhY2UsIHdl
IHNob3VsZCBhbGxvdyB0YWdnZWQgcG9pbnRlcnMuCgotLSAKQ2F0YWxpbgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
