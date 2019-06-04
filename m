Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEF13492B
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 15:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62722898C7;
	Tue,  4 Jun 2019 13:42:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBEF989803
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 13:02:09 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id z19so13515248qtz.13
 for <amd-gfx@lists.freedesktop.org>; Tue, 04 Jun 2019 06:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ROjiC3s0siagx/fi+MGJXNVgc6kDjODdOY/lcLdmBIY=;
 b=nDbpi7UzzbUsvyj7Zo34vGjVk1pyUoqGQgJf+7MpPQMAPDvWlGhY1sWiTV04mB02Ba
 i7IqHAFsCVzZYF9iCe+EnjLQ91OnOJnVQdonFUW373IMY4JI1uKbci8wTdNtTYHTzw9E
 CAmRz498Aogfa3j1gdTp+N5XwOxMlrRjfOLnW9pZhKWGHhdT593x06EaDmUs/PXhe4mX
 DkQoeg2KRv84wokOrpk5zzSneve5qYflK+xIw2rTqFoLc1OJww752ZakQGNzS8iJ4XsR
 0dncK2yNplpgF6z6Xx6ugoQSHFnWWNNWrWR4+pcXSWnHKtxMZGleK5FllT4nbjsrpe+c
 n8pQ==
X-Gm-Message-State: APjAAAU+FqQSCEV1Ye+0rRHPXhP15dpW6NdkByyA/i3PyHO60jrqrsDJ
 Rn9hKyMj5JkoRUwEewbRt8q0Aw==
X-Google-Smtp-Source: APXvYqz5RimUEjNtxNzzaaY0SoKGmFHRAnKhf0PPTePbHdJhsA1MCZNciExOvF95WwVoO+r2X/Sqlw==
X-Received: by 2002:a0c:c94d:: with SMTP id v13mr706065qvj.211.1559653328976; 
 Tue, 04 Jun 2019 06:02:08 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id m5sm10984580qke.25.2019.06.04.06.02.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Jun 2019 06:02:08 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hY94p-0004U3-JD; Tue, 04 Jun 2019 10:02:07 -0300
Date: Tue, 4 Jun 2019 10:02:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v16 12/16] IB, arm64: untag user pointers in
 ib_uverbs_(re)reg_mr()
Message-ID: <20190604130207.GD15385@ziepe.ca>
References: <cover.1559580831.git.andreyknvl@google.com>
 <c829f93b19ad6af1b13be8935ce29baa8e58518f.1559580831.git.andreyknvl@google.com>
 <20190603174619.GC11474@ziepe.ca>
 <CAAeHK+xy-dx4dLDLLj9dRzRNSVG9H5nDPPnjpYF38qKZNNCh_g@mail.gmail.com>
 <20190604122714.GA15385@ziepe.ca>
 <CAAeHK+xyqwuJyviGhvU7L1wPZQF7Mf9g2vgKSsYmML3fV6NrXg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+xyqwuJyviGhvU7L1wPZQF7Mf9g2vgKSsYmML3fV6NrXg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 04 Jun 2019 13:42:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ROjiC3s0siagx/fi+MGJXNVgc6kDjODdOY/lcLdmBIY=;
 b=Yjg83FKmLcCoTK1qNZRWt/34Ia4Vlgl4OzEswRBoqTA1q96rWHjxDfVIh6O7xWTGYS
 eTwCJcntFH46Tx+/cfSa7gWeHuAwOuGBn+X1jMdn5S6DRrFvNPM6afZ9JtFGwDFoFWKd
 IItwYcOZFv/0waUdBmD+9vX5g+lauIFC8gWQwZqeWZqiLI8MWTWgKqH10ZguaFNyDwaJ
 a6BouIbR+z5GvWPUxO/910/OPmm0It1HqckTeip+hRX/UhVQAxatTT7lXUHm0zw2yFJW
 DkwJjMsTV0HME+BgheyUHlaQClPbcE8mHooI7fCmf534f4AYixHfdR0GOmoGClDBYuEf
 l/5g==
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
 Christoph Hellwig <hch@infradead.org>, Dmitry Vyukov <dvyukov@google.com>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
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

T24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDI6NDU6MzJQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBPbiBUdWUsIEp1biA0LCAyMDE5IGF0IDI6MjcgUE0gSmFzb24gR3VudGhvcnBl
IDxqZ2dAemllcGUuY2E+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgSnVuIDA0LCAyMDE5IGF0IDAy
OjE4OjE5UE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiA+IE9uIE1vbiwgSnVu
IDMsIDIwMTkgYXQgNzo0NiBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4gd3JvdGU6
Cj4gPiA+ID4KPiA+ID4gPiBPbiBNb24sIEp1biAwMywgMjAxOSBhdCAwNjo1NToxNFBNICswMjAw
LCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+ID4gPiA+ID4gVGhpcyBwYXRjaCBpcyBhIHBhcnQg
b2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGFybTY0IGtlcm5lbCBBQkkgdG8gYWxsb3cgdG8KPiA+
ID4gPiA+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMgKHdpdGggdGhlIHRvcCBieXRlIHNldCB0
byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+ID4gPiA+ID4gdGhhbiAweDAwKSBhcyBzeXNjYWxsIGFy
Z3VtZW50cy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBpYl91dmVyYnNfKHJlKXJlZ19tcigpIHVzZSBw
cm92aWRlZCB1c2VyIHBvaW50ZXJzIGZvciB2bWEgbG9va3VwcyAodGhyb3VnaAo+ID4gPiA+ID4g
ZS5nLiBtbHg0X2dldF91bWVtX21yKCkpLCB3aGljaCBjYW4gb25seSBieSBkb25lIHdpdGggdW50
YWdnZWQgcG9pbnRlcnMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gVW50YWcgdXNlciBwb2ludGVycyBp
biB0aGVzZSBmdW5jdGlvbnMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQW5k
cmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgo+ID4gPiA+ID4gIGRyaXZlcnMv
aW5maW5pYmFuZC9jb3JlL3V2ZXJic19jbWQuYyB8IDQgKysrKwo+ID4gPiA+ID4gIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+ID4gPiA+Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdXZlcmJzX2NtZC5jIGIvZHJpdmVycy9pbmZpbmliYW5k
L2NvcmUvdXZlcmJzX2NtZC5jCj4gPiA+ID4gPiBpbmRleCA1YTNhMTc4MGNlZWEuLmY4OGVlNzMz
ZTYxNyAxMDA2NDQKPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3V2ZXJi
c19jbWQuYwo+ID4gPiA+ID4gQEAgLTcwOSw2ICs3MDksOCBAQCBzdGF0aWMgaW50IGliX3V2ZXJi
c19yZWdfbXIoc3RydWN0IHV2ZXJic19hdHRyX2J1bmRsZSAqYXR0cnMpCj4gPiA+ID4gPiAgICAg
ICBpZiAocmV0KQo+ID4gPiA+ID4gICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gPiA+ID4K
PiA+ID4gPiA+ICsgICAgIGNtZC5zdGFydCA9IHVudGFnZ2VkX2FkZHIoY21kLnN0YXJ0KTsKPiA+
ID4gPiA+ICsKPiA+ID4gPiA+ICAgICAgIGlmICgoY21kLnN0YXJ0ICYgflBBR0VfTUFTSykgIT0g
KGNtZC5oY2FfdmEgJiB+UEFHRV9NQVNLKSkKPiA+ID4gPiA+ICAgICAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7Cj4gPiA+ID4KPiA+ID4gPiBJIGZlZWwgbGlrZSB3ZSBzaG91bGRuJ3QgdGhhdmUg
dG8gZG8gdGhpcyBoZXJlLCBzdXJlbHkgdGhlIGNtZC5zdGFydAo+ID4gPiA+IHNob3VsZCBmbG93
IHVubW9kaWZpZWQgdG8gZ2V0X3VzZXJfcGFnZXMsIGFuZCBndXAgc2hvdWxkIHVudGFnIGl0Pwo+
ID4gPiA+Cj4gPiA+ID4gaWUsIHRoaXMgc29ydCBvZiBkaXJlY3Rpb24gZm9yIHRoZSBJQiBjb2Rl
ICh0aGlzIHdvdWxkIGJlIGEgZ2lhbnQKPiA+ID4gPiBwYXRjaCwgc28gSSBkaWRuJ3QgaGF2ZSB0
aW1lIHRvIHdyaXRlIGl0IGFsbCwgYnV0IEkgdGhpbmsgaXQgaXMgbXVjaAo+ID4gPiA+IHNhbmVy
KToKPiA+ID4KPiA+ID4gSGkgSmFzb24sCj4gPiA+Cj4gPiA+IGliX3V2ZXJic19yZWdfbXIoKSBw
YXNzZXMgY21kLnN0YXJ0IHRvIG1seDRfZ2V0X3VtZW1fbXIoKSwgd2hpY2ggY2FsbHMKPiA+ID4g
ZmluZF92bWEoKSwgd2hpY2ggb25seSBhY2NlcHRzIHVudGFnZ2VkIGFkZHJlc3Nlcy4gQ291bGQg
eW91IGV4cGxhaW4KPiA+ID4gaG93IHlvdXIgcGF0Y2ggaGVscHM/Cj4gPgo+ID4gVGhhdCBtbHg0
IGlzIGp1c3QgYSAnd2VpcmQgZHVjaycsIGl0IGlzIG5vdCB0aGUgbm9ybWFsIGZsb3csIGFuZCBJ
Cj4gPiBkb24ndCB0aGluayB0aGUgY29yZSBjb2RlIHNob3VsZCBiZSBtYWtpbmcgc3BlY2lhbCBj
b25zaWRlcmF0aW9uIGZvcgo+ID4gaXQuCj4gCj4gSG93IGRvIHlvdSB0aGluayB3ZSBzaG91bGQg
ZG8gdW50YWdnaW5nIChvciBzb21ldGhpbmcgZWxzZSkgdG8gZGVhbAo+IHdpdGggdGhpcyAnd2Vp
cmQgZHVjaycgY2FzZT8KCm1seDQgc2hvdWxkIGhhbmRsZSBpdCBhcm91bmQgdGhlIGNhbGwgdG8g
ZmluZF92bWEgbGlrZSBvdGhlciBwYXRjaGVzCmRvLCBpZGVhbGx5IGFzIHBhcnQgb2YgdGhlIGNh
c3QgZnJvbSBhIHZvaWQgX191c2VyICogdG8gdGhlIHVuc2lnbmVkCmxvbmcgdGhhdCBmaW5kX3Zt
YSBuZWVkcwoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
