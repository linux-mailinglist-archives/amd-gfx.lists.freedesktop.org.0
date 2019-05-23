Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F13A628B67
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2019 22:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F5289F97;
	Thu, 23 May 2019 20:15:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 71C6889F6E;
 Thu, 23 May 2019 20:11:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A48EA78;
 Thu, 23 May 2019 13:11:19 -0700 (PDT)
Received: from mbp (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBB143F690;
 Thu, 23 May 2019 13:11:12 -0700 (PDT)
Date: Thu, 23 May 2019 21:11:05 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Khalid Aziz <khalid.aziz@oracle.com>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
Message-ID: <20190523201105.oifkksus4rzcwqt4@mbp>
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
 <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp>
 <201905211633.6C0BF0C2@keescook>
 <6049844a-65f5-f513-5b58-7141588fef2b@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6049844a-65f5-f513-5b58-7141588fef2b@oracle.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Thu, 23 May 2019 20:15:13 +0000
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
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgenii Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@mellanox.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Elliott Hughes <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgS2hhbGlkLAoKT24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMTE6NTE6NDBBTSAtMDYwMCwgS2hh
bGlkIEF6aXogd3JvdGU6Cj4gT24gNS8yMS8xOSA2OjA0IFBNLCBLZWVzIENvb2sgd3JvdGU6Cj4g
PiBBcyBhbiBhc2lkZTogSSB0aGluayBTcGFyYyBBREkgc3VwcG9ydCBpbiBMaW51eCBhY3R1YWxs
eSBzaWRlLXN0ZXBwZWQKPiA+IHRoaXNbMV0gKGkuZS4gY2hvc2UgInNvbHV0aW9uIDEiKTogIkFs
bCBhZGRyZXNzZXMgcGFzc2VkIHRvIGtlcm5lbCBtdXN0Cj4gPiBiZSBub24tQURJIHRhZ2dlZCBh
ZGRyZXNzZXMuIiAoQW5kIHNhZGx5LCAiS2VybmVsIGRvZXMgbm90IGVuYWJsZSBBREkKPiA+IGZv
ciBrZXJuZWwgY29kZS4iKSBJIHRoaW5rIHRoaXMgd2FzIGEgbWlzdGFrZSB3ZSBzaG91bGQgbm90
IHJlcGVhdCBmb3IKPiA+IGFybTY0ICh3ZSBkbyBzZWVtIHRvIGJlIGF0IGxlYXN0IGluIGFncmVl
bWVudCBhYm91dCB0aGlzLCBJIHRoaW5rKS4KPiA+IAo+ID4gWzFdIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3BhdGNod29yay9wYXRjaC82NTQ0ODEvCj4gCj4gVGhhdCBpcyBhIHZlcnkgZWFybHkg
dmVyc2lvbiBvZiB0aGUgc3BhcmMgQURJIHBhdGNoLiBTdXBwb3J0IGZvciB0YWdnZWQKPiBhZGRy
ZXNzZXMgaW4gc3lzY2FsbHMgd2FzIGFkZGVkIGluIGxhdGVyIHZlcnNpb25zIGFuZCBpcyBpbiB0
aGUgcGF0Y2gKPiB0aGF0IGlzIGluIHRoZSBrZXJuZWwuCgpJIHRyaWVkIHRvIGZpZ3VyZSBvdXQg
YnV0IEknbSBub3QgZmFtaWxpYXIgd2l0aCB0aGUgc3BhcmMgcG9ydC4gSG93IGRpZAp5b3Ugc29s
dmUgdGhlIHRhZ2dlZCBhZGRyZXNzIGdvaW5nIGludG8gdmFyaW91cyBzeXNjYWxsIGltcGxlbWVu
dGF0aW9ucwppbiB0aGUga2VybmVsIChlLmcuIHN5c193cml0ZSk/IElzIHRoZSB0YWcgcmVtb3Zl
ZCBvbiBrZXJuZWwgZW50cnkgb3IgaXQKZW5kcyB1cCBkZWVwZXIgaW4gdGhlIGNvcmUgY29kZT8K
ClRoYW5rcy4KCi0tIApDYXRhbGluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
