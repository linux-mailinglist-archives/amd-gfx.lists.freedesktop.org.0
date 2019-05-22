Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3829A26587
	for <lists+amd-gfx@lfdr.de>; Wed, 22 May 2019 16:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359F889913;
	Wed, 22 May 2019 14:16:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2796689913;
 Wed, 22 May 2019 14:16:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E408280D;
 Wed, 22 May 2019 07:16:20 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 57C233F718; Wed, 22 May 2019 07:16:15 -0700 (PDT)
Date: Wed, 22 May 2019 15:16:12 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v15 17/17] selftests, arm64: add a selftest for passing
 tagged pointers to kernel
Message-ID: <20190522141612.GA28122@arrakis.emea.arm.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <e31d9364eb0c2eba8ce246a558422e811d82d21b.1557160186.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e31d9364eb0c2eba8ce246a558422e811d82d21b.1557160186.git.andreyknvl@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 22 May 2019 14:16:42 +0000
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

T24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDY6MzE6MDNQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
YXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMg
KHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgw
MCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gVGhpcyBwYXRjaCBhZGRzIGEgc2ltcGxlIHRl
c3QsIHRoYXQgY2FsbHMgdGhlIHVuYW1lIHN5c2NhbGwgd2l0aCBhCj4gdGFnZ2VkIHVzZXIgcG9p
bnRlciBhcyBhbiBhcmd1bWVudC4gV2l0aG91dCB0aGUga2VybmVsIGFjY2VwdGluZyB0YWdnZWQK
PiB1c2VyIHBvaW50ZXJzIHRoZSB0ZXN0IGZhaWxzIHdpdGggRUZBVUxULgoKVGhhdCdzIHByb2Jh
Ymx5IHN1ZmZpY2llbnQgZm9yIGEgc2ltcGxlIGV4YW1wbGUuIFNvbWV0aGluZyB3ZSBjb3VsZCBh
ZGQKdG8gRG9jdW1lbnRhdGlvbiBtYXliZSBpcyBhIHNtYWxsIGxpYnJhcnkgdGhhdCBjYW4gYmUg
TERfUFJFTE9BRCdlZCBzbwp0aGF0IHlvdSBjYW4gcnVuIGEgbG90IG1vcmUgdGVzdHMgbGlrZSBM
VFAuCgpXZSBjb3VsZCBhZGQgdGhpcyB0byBzZWxmdGVzdHMgYnV0IEkgdGhpbmsgaXQncyB0b28g
Z2xpYmMgc3BlY2lmaWMuCgotLS0tLS0tLS0tLS0tLS0tLS0tLTg8LS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiNpbmNsdWRlIDxzdGRsaWIuaD4KCiNkZWZpbmUgVEFHX1NISUZU
CSg1NikKI2RlZmluZSBUQUdfTUFTSwkoMHhmZlVMIDw8IFRBR19TSElGVCkKCnZvaWQgKl9fbGli
Y19tYWxsb2Moc2l6ZV90IHNpemUpOwp2b2lkIF9fbGliY19mcmVlKHZvaWQgKnB0cik7CnZvaWQg
Kl9fbGliY19yZWFsbG9jKHZvaWQgKnB0ciwgc2l6ZV90IHNpemUpOwp2b2lkICpfX2xpYmNfY2Fs
bG9jKHNpemVfdCBubWVtYiwgc2l6ZV90IHNpemUpOwoKc3RhdGljIHZvaWQgKnRhZ19wdHIodm9p
ZCAqcHRyKQp7Cgl1bnNpZ25lZCBsb25nIHRhZyA9IHJhbmQoKSAmIDB4ZmY7CglpZiAoIXB0cikK
CQlyZXR1cm4gcHRyOwoJcmV0dXJuICh2b2lkICopKCh1bnNpZ25lZCBsb25nKXB0ciB8ICh0YWcg
PDwgVEFHX1NISUZUKSk7Cn0KCnN0YXRpYyB2b2lkICp1bnRhZ19wdHIodm9pZCAqcHRyKQp7Cgly
ZXR1cm4gKHZvaWQgKikoKHVuc2lnbmVkIGxvbmcpcHRyICYgflRBR19NQVNLKTsKfQoKdm9pZCAq
bWFsbG9jKHNpemVfdCBzaXplKQp7CglyZXR1cm4gdGFnX3B0cihfX2xpYmNfbWFsbG9jKHNpemUp
KTsKfQoKdm9pZCBmcmVlKHZvaWQgKnB0cikKewoJX19saWJjX2ZyZWUodW50YWdfcHRyKHB0cikp
Owp9Cgp2b2lkICpyZWFsbG9jKHZvaWQgKnB0ciwgc2l6ZV90IHNpemUpCnsKCXJldHVybiB0YWdf
cHRyKF9fbGliY19yZWFsbG9jKHVudGFnX3B0cihwdHIpLCBzaXplKSk7Cn0KCnZvaWQgKmNhbGxv
YyhzaXplX3Qgbm1lbWIsIHNpemVfdCBzaXplKQp7CglyZXR1cm4gdGFnX3B0cihfX2xpYmNfY2Fs
bG9jKG5tZW1iLCBzaXplKSk7Cn0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
