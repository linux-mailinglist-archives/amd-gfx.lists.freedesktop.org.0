Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BD73B6DA
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jun 2019 16:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0185B891CA;
	Mon, 10 Jun 2019 14:08:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894CF8920C
 for <amd-gfx@lists.freedesktop.org>; Sat,  8 Jun 2019 03:58:07 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id u17so2228226pfn.7
 for <amd-gfx@lists.freedesktop.org>; Fri, 07 Jun 2019 20:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l14jgAawlsDS1VZ8WGmfB4MOY8oLSSKNbX7PpDlwP4w=;
 b=HDGyPThMcORJPMQG+N7hvibEvdst+rL2jjVGL5+yNFtAKDe/OqaOoIMzRLSPvKRqDZ
 tWedpE5ehU5V+LBE8bT6CmDxtiqsOXpWL/ukiORXPmgT67ZUpTilf4OJUsc/dTsIJ2Lv
 EXigB3AqEyt1bCtrpw5Y1nz0KSH0+yScwd2zzWRyKbs7A9s0CV1V+ehQVF96QAJql43t
 IwkFRNEMnh/EitIwWRRGYiYhWSFYBnpzW5Cr7JRW1+PV+y+PmiKHMwVBl+8sg4vgVQxn
 xRRxlnJdBg6sHzMX+Gy49cvd9NbsEoF/PXSarlCLqJ4fS9d2stDGa9y4p1WFaJf1Jngj
 S7yA==
X-Gm-Message-State: APjAAAX8O8QBaCrIjh0kHKwV6Wp6Bojln76uk01hBoMRAn5VQ1YOMLwG
 x/I6f9tHgBGX3ahwSb9tqJ4wjg==
X-Google-Smtp-Source: APXvYqxfp4HEsqQlOvNH04bl9SHArYk4hyQYoSWfdJS+DhwTyJyuL+IfwdxORVSQ19uSVN9pTMHd5w==
X-Received: by 2002:a63:1657:: with SMTP id 23mr5550367pgw.98.1559966287061;
 Fri, 07 Jun 2019 20:58:07 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l2sm246111pgs.33.2019.06.07.20.58.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 20:58:06 -0700 (PDT)
Date: Fri, 7 Jun 2019 20:58:05 -0700
From: Kees Cook <keescook@chromium.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v16 15/16] vfio/type1, arm64: untag user pointers in
 vaddr_get_pfn
Message-ID: <201906072058.BB57EFA@keescook>
References: <cover.1559580831.git.andreyknvl@google.com>
 <c529e1eeea7700beff197c4456da6a882ce2efb7.1559580831.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c529e1eeea7700beff197c4456da6a882ce2efb7.1559580831.git.andreyknvl@google.com>
X-Mailman-Approved-At: Mon, 10 Jun 2019 14:08:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=l14jgAawlsDS1VZ8WGmfB4MOY8oLSSKNbX7PpDlwP4w=;
 b=C5Gjab6oABNd7uWOUXVxMun2EBOiIN1zQFBFmz4oVz6alLd7w4ZDoA104BjgrPqBY8
 M11UcHeF2K3I4znphl64bBg5eiZ8uh03AO1nktwVISAdyYWU8VZro1t6U3J4ibUtkAgv
 yam4Xd5rREh0IexVfq4tELDc0YZWvN5ZcS9CQ=
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

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDY6NTU6MTdQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
YXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMg
KHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgw
MCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gdmFkZHJfZ2V0X3BmbigpIHVzZXMgcHJvdmlk
ZWQgdXNlciBwb2ludGVycyBmb3Igdm1hIGxvb2t1cHMsIHdoaWNoIGNhbgo+IG9ubHkgYnkgZG9u
ZSB3aXRoIHVudGFnZ2VkIHBvaW50ZXJzLgo+IAo+IFVudGFnIHVzZXIgcG9pbnRlcnMgaW4gdGhp
cyBmdW5jdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlr
bnZsQGdvb2dsZS5jb20+CgpSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1
bS5vcmc+CgotS2VlcwoKPiAtLS0KPiAgZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYyB8
IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jIGIvZHJpdmVycy92ZmlvL3ZmaW9faW9t
bXVfdHlwZTEuYwo+IGluZGV4IDNkZGMzNzVlNzA2My4uNTI4ZTM5YTFjMmRkIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMKPiArKysgYi9kcml2ZXJzL3ZmaW8v
dmZpb19pb21tdV90eXBlMS5jCj4gQEAgLTM4NCw2ICszODQsOCBAQCBzdGF0aWMgaW50IHZhZGRy
X2dldF9wZm4oc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgdmFkZHIsCj4gIAo+
ICAJZG93bl9yZWFkKCZtbS0+bW1hcF9zZW0pOwo+ICAKPiArCXZhZGRyID0gdW50YWdnZWRfYWRk
cih2YWRkcik7Cj4gKwo+ICAJdm1hID0gZmluZF92bWFfaW50ZXJzZWN0aW9uKG1tLCB2YWRkciwg
dmFkZHIgKyAxKTsKPiAgCj4gIAlpZiAodm1hICYmIHZtYS0+dm1fZmxhZ3MgJiBWTV9QRk5NQVAp
IHsKPiAtLSAKPiAyLjIyLjAucmMxLjMxMS5nNWQ3NTczYTE1MS1nb29nCj4gCgotLSAKS2VlcyBD
b29rCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
