Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F1151985
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 19:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C33589D77;
	Mon, 24 Jun 2019 17:27:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29FC89C48
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 15:02:46 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id f21so7277409pgi.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 08:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wtUCrmBvvtcTuAx+h8NVUvwzdIMNqCWWz94+pOdbySM=;
 b=BEahbKsxDTwhr1w8OKcQFav9c3gkLw7/3H69LvuBejicI+w8fbpLqET1mKI8WZWxgI
 o+NOwBarDcbaBaef9/KFEPcuGy7N4E00+zpv6edRRsi50peHJKfqjauKe383swYtprxz
 ts5kH6wFWCEmAfRBDXVQhbtR4Gom64CgUJj2a2pek2jVYdo/waHE1ps3s++qnmsDBbHH
 ThDyjAhWv61cIRcGS9vWg13QVIGTLuHa43hoKIEVzJP8zLqpbiwRKLJTVTJiy6QyeQEH
 5rRdbmsR4ufvzGdGNLndCLRDlPEIH8qeO48exP9kILvV1sS07DS5x4IjHrasilTwtHzP
 UzpQ==
X-Gm-Message-State: APjAAAVc39abh2QvKeIjb/3PgiQM1cYBtrvwxGwh6gAUlrq87Z71raIH
 tvyGZ5ZwCvApxtsT+e3oFBqqPQ==
X-Google-Smtp-Source: APXvYqy4hQCrjSrRM7hi0X8gFT7Wh+JsuaL6AoOZPMb6KqSaIYh6bUPxpgpfjIoTWPj+3t8Nf6ik+g==
X-Received: by 2002:a63:1d5:: with SMTP id 204mr34459271pgb.207.1561388566306; 
 Mon, 24 Jun 2019 08:02:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j1sm13025385pfe.101.2019.06.24.08.02.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Jun 2019 08:02:45 -0700 (PDT)
Date: Mon, 24 Jun 2019 08:02:44 -0700
From: Kees Cook <keescook@chromium.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v18 10/15] drm/radeon: untag user pointers in
 radeon_gem_userptr_ioctl
Message-ID: <201906240802.23FD5401@keescook>
References: <cover.1561386715.git.andreyknvl@google.com>
 <61d800c35a4f391218fbca6f05ec458557d8d097.1561386715.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61d800c35a4f391218fbca6f05ec458557d8d097.1561386715.git.andreyknvl@google.com>
X-Mailman-Approved-At: Mon, 24 Jun 2019 17:27:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wtUCrmBvvtcTuAx+h8NVUvwzdIMNqCWWz94+pOdbySM=;
 b=e43eFy4uvro/u8g8OpaaLl6Rs0FW7SVQaUyRp7V2h5UXAJx5vDQq+s1gB9TZQuKsNt
 b4xMpJfn+9rwJ2wcampbkbNuD3kDE/KEYUEeVoAoarpxyF2ozWjPuoNnonjrArQW0IHL
 YwvsDeGKK9G/YnAhcFhuSat9a+4MSjjnix9W4=
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Khalid Aziz <khalid.aziz@oracle.com>, linux-kselftest@vger.kernel.org,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
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

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMDQ6MzI6NTVQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
a2VybmVsIEFCSSB0byBhbGxvdyB0byBwYXNzCj4gdGFnZ2VkIHVzZXIgcG9pbnRlcnMgKHdpdGgg
dGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlciB0aGFuCj4gMHgwMCkgYXMg
c3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gSW4gcmFkZW9uX2dlbV91c2VycHRyX2lvY3RsKCkgYW4g
TU1VIG5vdGlmaWVyIGlzIHNldCB1cCB3aXRoIGEgKHRhZ2dlZCkKPiB1c2Vyc3BhY2UgcG9pbnRl
ci4gVGhlIHVudGFnZ2VkIGFkZHJlc3Mgc2hvdWxkIGJlIHVzZWQgc28gdGhhdCBNTVUKPiBub3Rp
ZmllcnMgZm9yIHRoZSB1bnRhZ2dlZCBhZGRyZXNzIGdldCBjb3JyZWN0bHkgbWF0Y2hlZCB1cCB3
aXRoIHRoZSByaWdodAo+IEJPLiBUaGlzIGZ1bmNhdGlvbiBhbHNvIGNhbGxzIHJhZGVvbl90dG1f
dHRfcGluX3VzZXJwdHIoKSwgd2hpY2ggdXNlcwo+IHByb3ZpZGVkIHVzZXIgcG9pbnRlcnMgZm9y
IHZtYSBsb29rdXBzLCB3aGljaCBjYW4gb25seSBieSBkb25lIHdpdGgKPiB1bnRhZ2dlZCBwb2lu
dGVycy4KPiAKPiBUaGlzIHBhdGNoIHVudGFncyB1c2VyIHBvaW50ZXJzIGluIHJhZGVvbl9nZW1f
dXNlcnB0cl9pb2N0bCgpLgo+IAo+IFN1Z2dlc3RlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4
Lkt1ZWhsaW5nQGFtZC5jb20+Cj4gQWNrZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVo
bGluZ0BhbWQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtu
dmxAZ29vZ2xlLmNvbT4KClJldmlld2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVt
Lm9yZz4KCi1LZWVzCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9nZW0u
YyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9nZW0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX2dlbS5jCj4gaW5kZXggNDQ2MTdkZWM4MTgzLi45MGViNzhmYjVlYjIg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZ2VtLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9nZW0uYwo+IEBAIC0yOTEsNiArMjkxLDgg
QEAgaW50IHJhZGVvbl9nZW1fdXNlcnB0cl9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2
b2lkICpkYXRhLAo+ICAJdWludDMyX3QgaGFuZGxlOwo+ICAJaW50IHI7Cj4gIAo+ICsJYXJncy0+
YWRkciA9IHVudGFnZ2VkX2FkZHIoYXJncy0+YWRkcik7Cj4gKwo+ICAJaWYgKG9mZnNldF9pbl9w
YWdlKGFyZ3MtPmFkZHIgfCBhcmdzLT5zaXplKSkKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgCj4g
LS0gCj4gMi4yMi4wLjQxMC5nZDhmZGJlMjFiNS1nb29nCj4gCgotLSAKS2VlcyBDb29rCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
