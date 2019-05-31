Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5854631297
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 18:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19EF4893B9;
	Fri, 31 May 2019 16:41:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9A69C89598;
 Fri, 31 May 2019 16:22:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72A16341;
 Fri, 31 May 2019 09:22:14 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 D9D693F59C; Fri, 31 May 2019 09:22:08 -0700 (PDT)
Date: Fri, 31 May 2019 17:22:06 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v15 17/17] selftests, arm64: add a selftest for passing
 tagged pointers to kernel
Message-ID: <20190531162206.GB3568@arrakis.emea.arm.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <e31d9364eb0c2eba8ce246a558422e811d82d21b.1557160186.git.andreyknvl@google.com>
 <20190522141612.GA28122@arrakis.emea.arm.com>
 <CAAeHK+wUerHQOV2PuaTwTxcCucZHZodLwg48228SB+ymxEqT2A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+wUerHQOV2PuaTwTxcCucZHZodLwg48228SB+ymxEqT2A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 31 May 2019 16:41:11 +0000
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
 Felix Kuehling <Felix.Kuehling@amd.com>,
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

T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgMDQ6MjE6NDhQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBPbiBXZWQsIE1heSAyMiwgMjAxOSBhdCA0OjE2IFBNIENhdGFsaW4gTWFyaW5h
cyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+IHdyb3RlOgo+ID4gT24gTW9uLCBNYXkgMDYsIDIw
MTkgYXQgMDY6MzE6MDNQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+ID4gVGhp
cyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGFybTY0IGtlcm5lbCBB
QkkgdG8gYWxsb3cgdG8KPiA+ID4gcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUg
dG9wIGJ5dGUgc2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyCj4gPiA+IHRoYW4gMHgwMCkgYXMg
c3lzY2FsbCBhcmd1bWVudHMuCj4gPiA+Cj4gPiA+IFRoaXMgcGF0Y2ggYWRkcyBhIHNpbXBsZSB0
ZXN0LCB0aGF0IGNhbGxzIHRoZSB1bmFtZSBzeXNjYWxsIHdpdGggYQo+ID4gPiB0YWdnZWQgdXNl
ciBwb2ludGVyIGFzIGFuIGFyZ3VtZW50LiBXaXRob3V0IHRoZSBrZXJuZWwgYWNjZXB0aW5nIHRh
Z2dlZAo+ID4gPiB1c2VyIHBvaW50ZXJzIHRoZSB0ZXN0IGZhaWxzIHdpdGggRUZBVUxULgo+ID4K
PiA+IFRoYXQncyBwcm9iYWJseSBzdWZmaWNpZW50IGZvciBhIHNpbXBsZSBleGFtcGxlLiBTb21l
dGhpbmcgd2UgY291bGQgYWRkCj4gPiB0byBEb2N1bWVudGF0aW9uIG1heWJlIGlzIGEgc21hbGwg
bGlicmFyeSB0aGF0IGNhbiBiZSBMRF9QUkVMT0FEJ2VkIHNvCj4gPiB0aGF0IHlvdSBjYW4gcnVu
IGEgbG90IG1vcmUgdGVzdHMgbGlrZSBMVFAuCj4gCj4gU2hvdWxkIEkgYWRkIHRoaXMgaW50byB0
aGlzIHNlcmllcywgb3Igc2hvdWxkIHRoaXMgZ28gaW50byBWaW5jZW56bydzIHBhdGNoc2V0PwoK
SWYgeW91IGNhbiB0d2VhayB0aGUgc2VsZnRlc3QgTWFrZWZpbGUgdG8gYnVpbGQgYSBsaWJyYXJ5
IGFuZCBmb3JjZSBpdAp3aXRoIExEX1BSRUxPQUQsIHlvdSBjYW4ga2VlcCBpdCB3aXRoIHRoaXMg
cGF0Y2guIEl0IHdvdWxkIGJlIGVhc2llciB0bwpleHRlbmQgdG8gb3RoZXIgc3lzY2FsbCB0ZXN0
cywgc2lnbmFsIGhhbmRsaW5nIGV0Yy4KCi0tIApDYXRhbGluCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
