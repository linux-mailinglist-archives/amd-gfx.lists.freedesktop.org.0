Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A93E77E1DA
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 20:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FBCD6E359;
	Thu,  1 Aug 2019 18:01:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 327776E593;
 Thu,  1 Aug 2019 12:11:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3A191570;
 Thu,  1 Aug 2019 05:11:47 -0700 (PDT)
Received: from [10.1.194.48] (e123572-lin.cambridge.arm.com [10.1.194.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A4393F575;
 Thu,  1 Aug 2019 05:11:42 -0700 (PDT)
Subject: Re: [PATCH v19 00/15] arm64: untag user pointers passed to the kernel
To: Dave Hansen <dave.hansen@intel.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1563904656.git.andreyknvl@google.com>
 <8c618cc9-ae68-9769-c5bb-67f1295abc4e@intel.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Message-ID: <13b4cf53-3ecb-f7e7-b504-d77af15d77aa@arm.com>
Date: Thu, 1 Aug 2019 13:11:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8c618cc9-ae68-9769-c5bb-67f1295abc4e@intel.com>
Content-Language: en-GB
X-Mailman-Approved-At: Thu, 01 Aug 2019 18:00:57 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Kostya Serebryany <kcc@google.com>, Khalid Aziz <khalid.aziz@oracle.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMzEvMDcvMjAxOSAxNzo1MCwgRGF2ZSBIYW5zZW4gd3JvdGU6Cj4gT24gNy8yMy8xOSAxMDo1
OCBBTSwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPj4gVGhlIG1tYXAgYW5kIG1yZW1hcCAob25s
eSBuZXdfYWRkcikgc3lzY2FsbHMgZG8gbm90IGN1cnJlbnRseSBhY2NlcHQKPj4gdGFnZ2VkIGFk
ZHJlc3Nlcy4gQXJjaGl0ZWN0dXJlcyBtYXkgaW50ZXJwcmV0IHRoZSB0YWcgYXMgYSBiYWNrZ3Jv
dW5kCj4+IGNvbG91ciBmb3IgdGhlIGNvcnJlc3BvbmRpbmcgdm1hLgo+IFdoYXQgdGhlIGhlY2sg
aXMgYSAiYmFja2dyb3VuZCBjb2xvdXIiPyA6KQoKR29vZCBwb2ludCwgdGhpcyBpcyBzb21lIGph
cmdvbiB0aGF0IHdlIHN0YXJ0ZWQgdXNpbmcgZm9yIE1URSwgdGhlIGlkZWEgYmVpbmcgdGhhdCAK
dGhlIGtlcm5lbCBjb3VsZCBzZXQgYSB0YWcgdmFsdWUgKHNwZWNpZmllZCBkdXJpbmcgbW1hcCgp
KSBhcyAiYmFja2dyb3VuZCBjb2xvdXIiIGZvciAKYW5vbnltb3VzIHBhZ2VzIGFsbG9jYXRlZCBp
biB0aGF0IHJhbmdlLgoKQW55d2F5LCB0aGlzIHBhdGNoIHNlcmllcyBpcyBub3QgYWJvdXQgTVRF
LiBBbmRyZXksIGZvciB2MjAgKGlmIGFueSksIEkgdGhpbmsgaXQncyAKYmVzdCB0byBkcm9wIHRo
aXMgbGFzdCBzZW50ZW5jZSB0byBhdm9pZCBhbnkgY29uZnVzaW9uLgoKS2V2aW4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
