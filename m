Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A29E0927F0
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 17:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179C06E1B1;
	Mon, 19 Aug 2019 15:06:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF1F6E115
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 13:16:55 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id d1so1219499pgp.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 06:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G3QrTp7p7joYbJCkRsXIJddWfOp/eioksMTpigV+wkM=;
 b=SsNauASZEQ2LkEq1I0lOgAIj/rxnQkYhkkjc9Oryw/qhEzZzz6ZzPJzs+vsLd4072Q
 kwNBmuVqG8xrHsE5Mgnt4FGipxSuO++nlVgkpUHoxnwe9tYDFtJmuQNF8KJNu7zMj+bH
 zXq0cSi5ZYiF6QY89nJyNpZjc9dptPXGTksc/1Q1V5RK/OpJNETnaEEecESfWi1giQ7G
 Jr1zWPpTAY+MmFHSwsnzRncfcOFX3gpSTCaXGrissArEOHrt/iBd21Oy5jTzoijgCyLU
 qfkiW6tMprQu9UKlmOQl4rHsbp3zSoDEPN8cqTn1P5P4w5KMurFXiKN2Rj3utQQT1q7N
 CVOg==
X-Gm-Message-State: APjAAAUWugbUk4BvNr+1OHny0eRleJA5VwnmWPCN9jpqA1CWLqDxhA+G
 o567dN8HQcy8Xw04Mvt1z/VZp56rPpahjfwqo7uvJQ==
X-Google-Smtp-Source: APXvYqyVpOFailHQYDN6SGrqGiLu77ISHhF0UzRLkKGS0q9bNLzKJCagc2Nkkti9u80AQyBrYjiyPqa9PxLeXB9+mf8=
X-Received: by 2002:aa7:9e0a:: with SMTP id y10mr23727599pfq.93.1566220614754; 
 Mon, 19 Aug 2019 06:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <00eb8ba84205c59cac01b1b47615116a461c302c.1566220355.git.andreyknvl@google.com>
In-Reply-To: <00eb8ba84205c59cac01b1b47615116a461c302c.1566220355.git.andreyknvl@google.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 19 Aug 2019 15:16:43 +0200
Message-ID: <CAAeHK+xBKrS0LZX+d3psaynznU4tQGfz4wQ9oFanxjjPv1ytVQ@mail.gmail.com>
Subject: Re: [PATCH ARM] selftests,
 arm64: fix uninitialized symbol in tags_test.c
To: Will Deacon <will.deacon@arm.com>
X-Mailman-Approved-At: Mon, 19 Aug 2019 15:06:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=G3QrTp7p7joYbJCkRsXIJddWfOp/eioksMTpigV+wkM=;
 b=M2vK+xZVjtXBYjUxUUk1iMNbxYwjUd+W6togCQiYPc7Vu+BGQx7l3hXcn4ECMLvDWt
 DlIAvUe8ekFSnxnofy3VvCNWLct8LZOpiNSM+v1WhYFyPJDwu5gZzaBjspAETr+32sje
 Xh1peTR5yYmEcUyhpwKV8rR/zI3wE7krkn5mWhAZXsBdSmKIExx6Aai/02AtaqBWuiMJ
 rwdLtwVmt2z/BiSdji1RT9OqjhuC+NoRsQcrlELRw7LuJbnkQsJhQDfS2T7BkdRszDtd
 SsGJHm5kXWMKbJ6caWbq9raXqyHYkwoMk/qLwvz6vTD2dWWbREUV34BsqN2ExAzlW+sj
 Ywjg==
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
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 Kostya Serebryany <kcc@google.com>, Khalid Aziz <khalid.aziz@oracle.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMzoxNCBQTSBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlr
bnZsQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gRml4IHRhZ2dlZF9wdHIgbm90IGJlaW5nIGluaXRp
YWxpemVkIHdoZW4gVEJJIGlzIG5vdCBlbmFibGVkLgo+Cj4gRGFuIENhcnBlbnRlciA8ZGFuLmNh
cnBlbnRlckBvcmFjbGUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFu
ZHJleWtudmxAZ29vZ2xlLmNvbT4KPiAtLS0KPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJt
NjQvdGFnc190ZXN0LmMgfCA4ICsrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvYXJtNjQvdGFnc190ZXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC90
YWdzX3Rlc3QuYwo+IGluZGV4IDIyYTFiMjY2ZTM3My4uNTcwMTE2MzQ2MGVmIDEwMDY0NAo+IC0t
LSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L3RhZ3NfdGVzdC5jCj4gKysrIGIvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvdGFnc190ZXN0LmMKPiBAQCAtMTQsMTUgKzE0LDE3
IEBACj4gIGludCBtYWluKHZvaWQpCj4gIHsKPiAgICAgICAgIHN0YXRpYyBpbnQgdGJpX2VuYWJs
ZWQgPSAwOwo+IC0gICAgICAgc3RydWN0IHV0c25hbWUgKnB0ciwgKnRhZ2dlZF9wdHI7Cj4gKyAg
ICAgICB1bnNpZ25lZCBsb25nIHRhZyA9IDA7Cj4gKyAgICAgICBzdHJ1Y3QgdXRzbmFtZSAqcHRy
Owo+ICAgICAgICAgaW50IGVycjsKPgo+ICAgICAgICAgaWYgKHByY3RsKFBSX1NFVF9UQUdHRURf
QUREUl9DVFJMLCBQUl9UQUdHRURfQUREUl9FTkFCTEUsIDAsIDAsIDApID09IDApCj4gICAgICAg
ICAgICAgICAgIHRiaV9lbmFibGVkID0gMTsKPiAgICAgICAgIHB0ciA9IChzdHJ1Y3QgdXRzbmFt
ZSAqKW1hbGxvYyhzaXplb2YoKnB0cikpOwo+ICAgICAgICAgaWYgKHRiaV9lbmFibGVkKQo+IC0g
ICAgICAgICAgICAgICB0YWdnZWRfcHRyID0gKHN0cnVjdCB1dHNuYW1lICopU0VUX1RBRyhwdHIs
IDB4NDIpOwo+IC0gICAgICAgZXJyID0gdW5hbWUodGFnZ2VkX3B0cik7Cj4gKyAgICAgICAgICAg
ICAgIHRhZyA9IDB4NDI7Cj4gKyAgICAgICBwdHIgPSAoc3RydWN0IHV0c25hbWUgKilTRVRfVEFH
KHB0ciwgdGFnKTsKPiArICAgICAgIGVyciA9IHVuYW1lKHB0cik7Cj4gICAgICAgICBmcmVlKHB0
cik7Cj4KPiAgICAgICAgIHJldHVybiBlcnI7Cj4gLS0KPiAyLjIzLjAucmMxLjE1My5nZGVlZDgw
MzMwZi1nb29nCj4KCkhpIFdpbGwsCgpUaGlzIGlzIHN1cHBvc2VkIHRvIGdvIG9uIHRvcCBvZiB0
aGUgVEJJIHJlbGF0ZWQgcGF0Y2hlcyB0aGF0IHlvdSBoYXZlCmFkZGVkIHRvIHRoZSBhcm0gdHJl
ZS4KClRoYW5rcyEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
