Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A264272E
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 15:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDBC8957B;
	Wed, 12 Jun 2019 13:12:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F71F89263
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 11:14:42 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id go2so6491859plb.9
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 04:14:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ICAcqmNM80YqXGU9u0yKcUq/onm/SsQo2SDs/l3f+hY=;
 b=eIvla79vxdibsMQ6j0DzrM47A4TE7tB+N8cSGiw+MykaeHdcjoW0IGYULgTi/pI2lf
 YFf+vWFHAauKnGdEwdqplDpgUuSEdkSWQSGsM5JR4+IH+ER1ZBocvDWsCcxjCLwRzwPh
 /R1WjZfyziS9fxDneaW0VVjN7F+oADiFQUDAIpgF7IU0VZqd8txzawqREvxyNr0WfwaV
 +Fl7rlHyrJpN1RPtGsFDfujBTCgSUbpKqZ07yav+93pEbZk6ipA4bBCETVjxNNUx3AS5
 mUddLymjo3EiZET3P5V1x3mSaIrQJKdIF7e33SRquWqMA1vAMmMSjRs7SeTg5dfQVkic
 hkEQ==
X-Gm-Message-State: APjAAAUwknW5tAKAt5ePhpirFmJnhRgFX/ITaNpExDfR9ukmR6dgMs7y
 iK9cjEoyvu3YlD/RchHopk7R+WCZihZWP+/urMqhDg==
X-Google-Smtp-Source: APXvYqygEZ27HGfNqszCpdSgojAf7S6ru14/DaT8Or0Syv3FL9sWDfZ+9LXBU0/5Hxbzx8tkSmaHaZjTcL+f/jghf7s=
X-Received: by 2002:a17:902:8609:: with SMTP id
 f9mr75570344plo.252.1560338081704; 
 Wed, 12 Jun 2019 04:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
 <9e1b5998a28f82b16076fc85ab4f88af5381cf74.1559580831.git.andreyknvl@google.com>
 <20190611150122.GB63588@arrakis.emea.arm.com>
 <CAAeHK+wZrVXxAnDXBjoUy8JK9iG553G2Bp8uPWQ0u1u5gts0vQ@mail.gmail.com>
 <20190611175037.pflr6q6ob67zjj25@mbp>
In-Reply-To: <20190611175037.pflr6q6ob67zjj25@mbp>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Wed, 12 Jun 2019 13:14:30 +0200
Message-ID: <CAAeHK+x4sHKfQx31uQ9zSO48oRs3XLATfymY=vgEHQ1FLNmeig@mail.gmail.com>
Subject: Re: [PATCH v16 16/16] selftests, arm64: add a selftest for passing
 tagged pointers to kernel
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mailman-Approved-At: Wed, 12 Jun 2019 13:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ICAcqmNM80YqXGU9u0yKcUq/onm/SsQo2SDs/l3f+hY=;
 b=QkhZMvI8xgho9eMFZ7w6J/3duhWcdGLEkVVUAU2qSaxNfXU+GXLc+PdiUdCpUn61iY
 0xCUxQ9wiA1Jj7ZnvEwSzmljdVe71a10tK0t/VIk6vJ6KuoIESh9plrNP00oJ9EUV9CE
 7ZXKJL/NmCDrLh5D1fRV3U/5XcSqnaFIYrJ7IhnmnWDC1y2ZQhZMwMFDrVZ4wkPjj2PR
 KjnNxVxOeNHsZ1yb6hgnM2H6TbZTzWPz9Cffq6e0f9rEpBuiI2bynmdfsgpQFhae4y5r
 LLRsk0MnIrY8OwbkGOOGkhYBEu+P7mFEBBswTcH9Mhn9r0qq9AEF/SsRyiNTxER5NtY3
 eTUQ==
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
 Khalid Aziz <khalid.aziz@oracle.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
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
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgNzo1MCBQTSBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4u
bWFyaW5hc0Bhcm0uY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVuIDExLCAyMDE5IGF0IDA3OjE4
OjA0UE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBPbiBUdWUsIEp1biAxMSwg
MjAxOSBhdCA1OjAxIFBNIENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+
IHdyb3RlOgo+ID4gPiBzdGF0aWMgdm9pZCAqdGFnX3B0cih2b2lkICpwdHIpCj4gPiA+IHsKPiA+
ID4gICAgICAgICBzdGF0aWMgaW50IHRhZ2dlZF9hZGRyX2VyciA9IDE7Cj4gPiA+ICAgICAgICAg
dW5zaWduZWQgbG9uZyB0YWcgPSAwOwo+ID4gPgo+ID4gPiAgICAgICAgIGlmICh0YWdnZWRfYWRk
cl9lcnIgPT0gMSkKPiA+ID4gICAgICAgICAgICAgICAgIHRhZ2dlZF9hZGRyX2VyciA9IHByY3Rs
KFBSX1NFVF9UQUdHRURfQUREUl9DVFJMLAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgUFJfVEFHR0VEX0FERFJfRU5BQkxFLCAwLCAwLCAwKTsKPiA+Cj4gPiBJ
IHRoaW5rIHRoaXMgcmVxdWlyZXMgYXRvbWljcy4gbWFsbG9jKCkgY2FuIGJlIGNhbGxlZCBmcm9t
IG11bHRpcGxlIHRocmVhZHMuCj4KPiBJdCdzIHNsaWdodGx5IHJhY3kgYnV0IEkgYXNzdW1lIGlu
IGEgcmVhbCBsaWJjIGl0IGNhbiBiZSBpbml0aWFsaXNlZAo+IGVhcmxpZXIgdGhhbiB0aGUgaG9v
ayBjYWxscyB3aGlsZSBzdGlsbCBpbiBzaW5nbGUtdGhyZWFkZWQgbW9kZSAoSSBoYWQKPiBhIHF1
aWNrIGF0dGVtcHQgd2l0aCBfX2F0dHJpYnV0ZV9fKChjb25zdHJ1Y3RvcikpIGJ1dCBkaWRuJ3Qg
Z2V0IGZhcikuCj4KPiBFdmVuIHdpdGggdGhlIHJhY2UsIHVuZGVyIG5vcm1hbCBjaXJjdW1zdGFu
Y2VzIGNhbGxpbmcgdGhlIHByY3RsKCkgdHdpY2UKPiBpcyBub3QgYSBwcm9ibGVtLiBJIHRoaW5r
IHRoZSByaXNrIGhlcmUgaXMgdGhhdCBzb21lb25lIGRpc2FibGVzIHRoZSBBQkkKPiB2aWEgc3lz
Y3RsIGFuZCB0aGUgQUJJIGlzIGVuYWJsZWQgZm9yIHNvbWUgb2YgdGhlIHRocmVhZHMgb25seS4K
Ck9LLCBJJ2xsIGtlZXAgdGhlIGNvZGUgcmFjeSwgYnV0IGFkZCBhIGNvbW1lbnQgcG9pbnRpbmcg
aXQgb3V0LiBUaGFua3MhCgo+Cj4gLS0KPiBDYXRhbGluCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
