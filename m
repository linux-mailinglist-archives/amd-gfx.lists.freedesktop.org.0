Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EED383B6C8
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jun 2019 16:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1777889182;
	Mon, 10 Jun 2019 14:08:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9DC89208
 for <amd-gfx@lists.freedesktop.org>; Sat,  8 Jun 2019 03:49:07 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id 81so2209347pfy.13
 for <amd-gfx@lists.freedesktop.org>; Fri, 07 Jun 2019 20:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5iFtOAxSpyEwrNGKsnJSAuPHnmB6sZsxY7o3VcURDbs=;
 b=ElZQgeZviLLaBjh2U7yvc5Fj78XsAs/z+BIdHmKL3mXDMYkBWbtLopOHq7CMnDKXyi
 28NfuqpKiAIndNwB0hjECWnY+fe6E3uKbgUs2fjkXAWk2DUTXtnF9kOvOnqS4Dmd7Sro
 7z5vIsT7Y9zoB8tq6I/PjnvsabTg2rk6569OcwgtXRYxLXXNB73aw4eiTFpNm+BNvFfN
 uwYijijq9CA1sHAShpenDvdsFLpdiGCoXptTVeJyDzAJSh+12CLOBv0K1W+8Rxi/o2aN
 VB9LlYaGs364592K0CWmHJfq3HzhMkBRlCP6Azpuuam/futK7HiRJtynRMGJPnnTb5Nx
 C5DQ==
X-Gm-Message-State: APjAAAUU1Zoj42Y/rhWHsgSaOtgnGQpuDf/e2/HqZv/UhMDhwVC42L0U
 F/a5bSODkPHqaKkCJKiFhIbh0Q==
X-Google-Smtp-Source: APXvYqyjpXWbpUp/M/TNwB1KLrsvdqCimHBytjvPEw0jUB6ar1HA2nI5YlI2gocy+KHTqRtIofNEIA==
X-Received: by 2002:a63:5247:: with SMTP id s7mr5637363pgl.29.1559965746908;
 Fri, 07 Jun 2019 20:49:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id y12sm3218417pgi.10.2019.06.07.20.49.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 20:49:06 -0700 (PDT)
Date: Fri, 7 Jun 2019 20:49:05 -0700
From: Kees Cook <keescook@chromium.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v16 04/16] mm: untag user pointers in do_pages_move
Message-ID: <201906072049.C71D545@keescook>
References: <cover.1559580831.git.andreyknvl@google.com>
 <e410843d00a4ecd7e525a7a949e605ffc6c394c4.1559580831.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e410843d00a4ecd7e525a7a949e605ffc6c394c4.1559580831.git.andreyknvl@google.com>
X-Mailman-Approved-At: Mon, 10 Jun 2019 14:08:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5iFtOAxSpyEwrNGKsnJSAuPHnmB6sZsxY7o3VcURDbs=;
 b=H67pCnfy+inYwtx7CHiN5h4f1U/pgcnleLkOrUnW4+QdjbqfAr9cQdSkm3W08ImQFl
 MKpSL+Xxt/SE/t0ZUnbh42ewav3Rgd/mWolnnSDbYBR+Ld/cLmR9BtGJ7sEbWVa+oHPR
 1hTMHtgCUOMHLDYeeHgvIO8Lm0UyCIchcEask=
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

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDY6NTU6MDZQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
YXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMg
KHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgw
MCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gZG9fcGFnZXNfbW92ZSgpIGlzIHVzZWQgaW4g
dGhlIGltcGxlbWVudGF0aW9uIG9mIHRoZSBtb3ZlX3BhZ2VzIHN5c2NhbGwuCj4gCj4gVW50YWcg
dXNlciBwb2ludGVycyBpbiB0aGlzIGZ1bmN0aW9uLgo+IAo+IFJldmlld2VkLWJ5OiBDYXRhbGlu
IE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
eSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4KClJldmlld2VkLWJ5OiBLZWVzIENv
b2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KCi1LZWVzCgo+IC0tLQo+ICBtbS9taWdyYXRlLmMg
fCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBh
L21tL21pZ3JhdGUuYyBiL21tL21pZ3JhdGUuYwo+IGluZGV4IGYyZWNjMjg1NWExMi4uMzkzMGJi
NmZhNjU2IDEwMDY0NAo+IC0tLSBhL21tL21pZ3JhdGUuYwo+ICsrKyBiL21tL21pZ3JhdGUuYwo+
IEBAIC0xNjE3LDYgKzE2MTcsNyBAQCBzdGF0aWMgaW50IGRvX3BhZ2VzX21vdmUoc3RydWN0IG1t
X3N0cnVjdCAqbW0sIG5vZGVtYXNrX3QgdGFza19ub2RlcywKPiAgCQlpZiAoZ2V0X3VzZXIobm9k
ZSwgbm9kZXMgKyBpKSkKPiAgCQkJZ290byBvdXRfZmx1c2g7Cj4gIAkJYWRkciA9ICh1bnNpZ25l
ZCBsb25nKXA7Cj4gKwkJYWRkciA9IHVudGFnZ2VkX2FkZHIoYWRkcik7Cj4gIAo+ICAJCWVyciA9
IC1FTk9ERVY7Cj4gIAkJaWYgKG5vZGUgPCAwIHx8IG5vZGUgPj0gTUFYX05VTU5PREVTKQo+IC0t
IAo+IDIuMjIuMC5yYzEuMzExLmc1ZDc1NzNhMTUxLWdvb2cKPiAKCi0tIApLZWVzIENvb2sKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
