Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E842A709
	for <lists+amd-gfx@lfdr.de>; Sat, 25 May 2019 22:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36206E17E;
	Sat, 25 May 2019 20:47:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 493D189C3F;
 Sat, 25 May 2019 09:58:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC81580D;
 Sat, 25 May 2019 02:58:03 -0700 (PDT)
Received: from mbp (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19D783F703;
 Sat, 25 May 2019 02:57:57 -0700 (PDT)
Date: Sat, 25 May 2019 10:57:55 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v15 05/17] arms64: untag user pointers passed to memory
 syscalls
Message-ID: <20190525095753.caehqipafdc5m3yp@mbp>
References: <cover.1557160186.git.andreyknvl@google.com>
 <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Sat, 25 May 2019 20:47:47 +0000
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

T24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDY6MzA6NTFQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiArU1lTQ0FMTF9ERUZJTkU1KGFybTY0X2dldF9tZW1wb2xpY3ksIGludCBfX3Vz
ZXIgKiwgcG9saWN5LAo+ICsJCXVuc2lnbmVkIGxvbmcgX191c2VyICosIG5tYXNrLCB1bnNpZ25l
ZCBsb25nLCBtYXhub2RlLAo+ICsJCXVuc2lnbmVkIGxvbmcsIGFkZHIsIHVuc2lnbmVkIGxvbmcs
IGZsYWdzKQo+ICt7Cj4gKwlhZGRyID0gdW50YWdnZWRfYWRkcihhZGRyKTsKPiArCXJldHVybiBr
c3lzX2dldF9tZW1wb2xpY3kocG9saWN5LCBubWFzaywgbWF4bm9kZSwgYWRkciwgZmxhZ3MpOwo+
ICt9ClsuLi5dCj4gK1NZU0NBTExfREVGSU5FNihhcm02NF9tYmluZCwgdW5zaWduZWQgbG9uZywg
c3RhcnQsIHVuc2lnbmVkIGxvbmcsIGxlbiwKPiArCQl1bnNpZ25lZCBsb25nLCBtb2RlLCBjb25z
dCB1bnNpZ25lZCBsb25nIF9fdXNlciAqLCBubWFzaywKPiArCQl1bnNpZ25lZCBsb25nLCBtYXhu
b2RlLCB1bnNpZ25lZCBpbnQsIGZsYWdzKQo+ICt7Cj4gKwlzdGFydCA9IHVudGFnZ2VkX2FkZHIo
c3RhcnQpOwo+ICsJcmV0dXJuIGtzeXNfbWJpbmQoc3RhcnQsIGxlbiwgbW9kZSwgbm1hc2ssIG1h
eG5vZGUsIGZsYWdzKTsKPiArfQoKVGhlIGtlcm5lbCBmYWlscyB0byBidWlsZCB3aXRoIENPTkZJ
R19OVU1BIGRpc2FibGVkIGJlY2F1c2UgdGhlIGFib3ZlCmFyZSBpbiBtbS9tZW1wb2xpY3kuYyB3
aGljaCBpcyBubyBsb25nZXIgY29tcGlsZWQgaW4uCgotLSAKQ2F0YWxpbgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
