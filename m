Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C8F698B8
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 18:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9CF898E4;
	Mon, 15 Jul 2019 16:00:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D354A898E8
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 16:00:16 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id r7so7625228pfl.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 09:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1pf3WGwA9D7m+i0fi13et95NxKX1fwC73+4IJDRPguM=;
 b=C6b5AoJ24JTUR11Rs9nEybF3oSfSw0V/qh8y+Md2fRE9kNf53oMb4jlVyR4eg69EAC
 dQWnnH/1Sqa47PDJe5AMyDmRbwoha2q5kxCNPa7Mqu7wgPDxNzF5TcjHMD7vclscpCrE
 nc70HF0jkq0O1ghucYM4n5accq25aRaF5Ekx9cZK1NjGxypF3e72PtHzPJJAj6i+FQRT
 EJHQXTsmQOYtRCT2MRVAb4AlQeG5/AOiQy83GcRZBLOxR7iso1F3fHrUV0SHZl+LzJc1
 y4TUcd9i5bXIl4sJQ2Akte6QMqnwn5uSsQ2sHV5DW0nVsxlh88cESNS37hlN/BcxFtLa
 ceFQ==
X-Gm-Message-State: APjAAAWPohplNtXIkwEtGK2xJvgm4eQWiigu14S++bdy831AL1SsXBqh
 xMC6KICdxOwaRvDJTL/VesQEfIIHGiO5NnQfB5jBdA==
X-Google-Smtp-Source: APXvYqxUxnVJIFmSjF/fduDJIdHHtTu2E7rs0M1v5DQsmsjwZzuX9klo19X53kLCG4pNPCe3wIEdLnHCwqNb7FnoP6U=
X-Received: by 2002:a17:90a:a116:: with SMTP id
 s22mr29852919pjp.47.1563206415768; 
 Mon, 15 Jul 2019 09:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561386715.git.andreyknvl@google.com>
 <41e0a911e4e4d533486a1468114e6878e21f9f84.1561386715.git.andreyknvl@google.com>
 <20190624175009.GM29120@arrakis.emea.arm.com>
In-Reply-To: <20190624175009.GM29120@arrakis.emea.arm.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 15 Jul 2019 18:00:04 +0200
Message-ID: <CAAeHK+x2TL057Fr0K7FZBTYgeEPVU3cC6scEeiSYk-Jkb3xgfg@mail.gmail.com>
Subject: Re: [PATCH v18 07/15] fs/namespace: untag user pointers in
 copy_mount_options
To: Al Viro <viro@zeniv.linux.org.uk>
X-Mailman-Approved-At: Mon, 15 Jul 2019 16:00:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1pf3WGwA9D7m+i0fi13et95NxKX1fwC73+4IJDRPguM=;
 b=CUwZ43K9ybSDvf08eErRqtarzGQdiyDymnpU0KIK2JQh0T9Sup32mLmqjhs/VSqLrM
 MYwEWnD1tZLcOi15wredI/8U9xLO31vPqZvI1nsgvE8QGayvfGS4zJ8DFpd8xTqTB2Uu
 X0XI38pv45yv7xUlijhdFuvP2joPIHdZCt3wPU6yGKh7zI1+RsRJeph15u1MMAsHXsmU
 N/CNSsdTxOBDr+vJzIQZq74ITN4H5tRoqeyXjfz14O98vHdJyS9nZdunI9ZY16WRAzUr
 aDjqrcEfrIeCTuDiF5a0mq44jqMLnJJxVYJo2ivJup10466XLsZAPQUB28/H/OHw+0N1
 yN/g==
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
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

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgNzo1MCBQTSBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4u
bWFyaW5hc0Bhcm0uY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVuIDI0LCAyMDE5IGF0IDA0OjMy
OjUyUE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBUaGlzIHBhdGNoIGlzIGEg
cGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMga2VybmVsIEFCSSB0byBhbGxvdyB0byBwYXNz
Cj4gPiB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUgc2V0IHRvIHNvbWV0
aGluZyBlbHNlIG90aGVyIHRoYW4KPiA+IDB4MDApIGFzIHN5c2NhbGwgYXJndW1lbnRzLgo+ID4K
PiA+IEluIGNvcHlfbW91bnRfb3B0aW9ucyBhIHVzZXIgYWRkcmVzcyBpcyBiZWluZyBzdWJ0cmFj
dGVkIGZyb20gVEFTS19TSVpFLgo+ID4gSWYgdGhlIGFkZHJlc3MgaXMgbG93ZXIgdGhhbiBUQVNL
X1NJWkUsIHRoZSBzaXplIGlzIGNhbGN1bGF0ZWQgdG8gbm90Cj4gPiBhbGxvdyB0aGUgZXhhY3Rf
Y29weV9mcm9tX3VzZXIoKSBjYWxsIHRvIGNyb3NzIFRBU0tfU0laRSBib3VuZGFyeS4KPiA+IEhv
d2V2ZXIgaWYgdGhlIGFkZHJlc3MgaXMgdGFnZ2VkLCB0aGVuIHRoZSBzaXplIHdpbGwgYmUgY2Fs
Y3VsYXRlZAo+ID4gaW5jb3JyZWN0bHkuCj4gPgo+ID4gVW50YWcgdGhlIGFkZHJlc3MgYmVmb3Jl
IHN1YnRyYWN0aW5nLgo+ID4KPiA+IFJldmlld2VkLWJ5OiBLaGFsaWQgQXppeiA8a2hhbGlkLmF6
aXpAb3JhY2xlLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBWaW5jZW56byBGcmFzY2lubyA8dmluY2Vu
em8uZnJhc2Npbm9AYXJtLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29r
QGNocm9taXVtLm9yZz4KPiA+IFJldmlld2VkLWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4u
bWFyaW5hc0Bhcm0uY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5k
cmV5a252bEBnb29nbGUuY29tPgo+ID4gLS0tCj4gPiAgZnMvbmFtZXNwYWNlLmMgfCAyICstCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2ZzL25hbWVzcGFjZS5jIGIvZnMvbmFtZXNwYWNlLmMKPiA+IGluZGV4IDc2
NjBjMjc0OWM5Ni4uZWM3OGY3MjIzOTE3IDEwMDY0NAo+ID4gLS0tIGEvZnMvbmFtZXNwYWNlLmMK
PiA+ICsrKyBiL2ZzL25hbWVzcGFjZS5jCj4gPiBAQCAtMjk5NCw3ICsyOTk0LDcgQEAgdm9pZCAq
Y29weV9tb3VudF9vcHRpb25zKGNvbnN0IHZvaWQgX191c2VyICogZGF0YSkKPiA+ICAgICAgICAq
IHRoZSByZW1haW5kZXIgb2YgdGhlIHBhZ2UuCj4gPiAgICAgICAgKi8KPiA+ICAgICAgIC8qIGNv
cHlfZnJvbV91c2VyIGNhbm5vdCBjcm9zcyBUQVNLX1NJWkUgISAqLwo+ID4gLSAgICAgc2l6ZSA9
IFRBU0tfU0laRSAtICh1bnNpZ25lZCBsb25nKWRhdGE7Cj4gPiArICAgICBzaXplID0gVEFTS19T
SVpFIC0gKHVuc2lnbmVkIGxvbmcpdW50YWdnZWRfYWRkcihkYXRhKTsKPiA+ICAgICAgIGlmIChz
aXplID4gUEFHRV9TSVpFKQo+ID4gICAgICAgICAgICAgICBzaXplID0gUEFHRV9TSVpFOwo+Cj4g
SSB0aGluayB0aGlzIHBhdGNoIG5lZWRzIGFuIGFjayBmcm9tIEFsIFZpcm8gKGNjJ2VkKS4KPgo+
IC0tCj4gQ2F0YWxpbgoKSGkgQWwsCgpDb3VsZCB5b3UgdGFrZSBhIGxvb2sgYW5kIGdpdmUgeW91
ciBhY2tlZC1ieT8KClRoYW5rcyEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
