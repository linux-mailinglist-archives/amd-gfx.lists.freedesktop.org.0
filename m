Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F4926575
	for <lists+amd-gfx@lfdr.de>; Wed, 22 May 2019 16:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8051289AB2;
	Wed, 22 May 2019 14:12:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3EFD08825B;
 Wed, 22 May 2019 10:41:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10655341;
 Wed, 22 May 2019 03:41:12 -0700 (PDT)
Received: from mbp (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F3C13F575;
 Wed, 22 May 2019 03:41:06 -0700 (PDT)
Date: Wed, 22 May 2019 11:41:03 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v15 03/17] lib, arm64: untag user pointers in strn*_user
Message-ID: <20190522104103.r5any4us4zz7gwvg@mbp>
References: <cover.1557160186.git.andreyknvl@google.com>
 <861418ff7ed7253356cb8267de5ee2d4bd84196d.1557160186.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <861418ff7ed7253356cb8267de5ee2d4bd84196d.1557160186.git.andreyknvl@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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

T24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDY6MzA6NDlQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
YXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMg
KHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgw
MCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gc3RybmNweV9mcm9tX3VzZXIgYW5kIHN0cm5s
ZW5fdXNlciBhY2NlcHQgdXNlciBhZGRyZXNzZXMgYXMgYXJndW1lbnRzLCBhbmQKPiBkbyBub3Qg
Z28gdGhyb3VnaCB0aGUgc2FtZSBwYXRoIGFzIGNvcHlfZnJvbV91c2VyIGFuZCBvdGhlcnMsIHNv
IGhlcmUgd2UKPiBuZWVkIHRvIGhhbmRsZSB0aGUgY2FzZSBvZiB0YWdnZWQgdXNlciBhZGRyZXNz
ZXMgc2VwYXJhdGVseS4KPiAKPiBVbnRhZyB1c2VyIHBvaW50ZXJzIHBhc3NlZCB0byB0aGVzZSBm
dW5jdGlvbnMuCj4gCj4gTm90ZSwgdGhhdCB0aGlzIHBhdGNoIG9ubHkgdGVtcG9yYXJpbHkgdW50
YWdzIHRoZSBwb2ludGVycyB0byBwZXJmb3JtCj4gdmFsaWRpdHkgY2hlY2tzLCBidXQgdGhlbiB1
c2VzIHRoZW0gYXMgaXMgdG8gcGVyZm9ybSB1c2VyIG1lbW9yeSBhY2Nlc3Nlcy4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+CgpKdXN0
IHRvIGtlZXAgdHJhY2sgb2Ygd2hlcmUgSSBhbSB3aXRoIHRoZSByZXZpZXdzIHdoaWxlIHRoZSBB
QkkKZGlzY3Vzc2lvbiBjb250aW51ZXM6CgpSZXZpZXdlZC1ieTogQ2F0YWxpbiBNYXJpbmFzIDxj
YXRhbGluLm1hcmluYXNAYXJtLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
