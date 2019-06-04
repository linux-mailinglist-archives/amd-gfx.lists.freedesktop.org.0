Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE18D34925
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 15:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7629289885;
	Tue,  4 Jun 2019 13:42:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C768922E
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 11:45:36 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id g21so8258325plq.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 04 Jun 2019 04:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ROpXrP+r2OC9uJKtrd7VeU5I2GEkuLFi73TKRyEYr3w=;
 b=IkXTBjQ4i4LEml8AEsxWQzZWr7/mecGCmcdW7kKRAQMQ8qUTrnlrJbjplKqXyOJXMm
 XnRhBVXEWw8baakRolo5J17tk6E7YXrVsKHP9JfUQovlNKYt4L+q33tUOcY8p/hmqyRe
 cMgIcFHQQY2pibiqQcBw128GsfYkN/IKVPPa+fHGGKxOOrN1P4o0/tihW78FduV2/6Bx
 THCDN8AjtY1pq1R8/X90AjN1bHXMHi1y5q40MA6qSXozAtMJ0mu9kMvDyp6zZsQUVOox
 e5tXZ7KQcDF+crskZnUFv5SKtfCYMCR/MzdOPcl+Ngtise2Ntk1v54CMVS29cgYkSvNX
 J1aA==
X-Gm-Message-State: APjAAAWceLYSFaQv6tvO26Q0sjxB3VPJVLxrC2UM4aYh73SBNUUIp3BN
 +bVNqnHBgtiBY/zl1k3YISUIIkfVwwdHbNxyZBMaGA==
X-Google-Smtp-Source: APXvYqw/MEeiL2bhH+9bBygV1lo6Im71uAjcUSVWx84fFkrTwjlzF36BIb4PZCfj0/vMKrfmiVx/F/2QMSAp/3q5QEs=
X-Received: by 2002:a17:902:8609:: with SMTP id
 f9mr33680584plo.252.1559648735444; 
 Tue, 04 Jun 2019 04:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
 <097bc300a5c6554ca6fd1886421bb2e0adb03420.1559580831.git.andreyknvl@google.com>
 <8ff5b0ff-849a-1e0b-18da-ccb5be85dd2b@oracle.com>
 <CAAeHK+xX2538e674Pz25unkdFPCO_SH0pFwFu=8+DS7RzfYnLQ@mail.gmail.com>
 <f6711d31-e52c-473a-d7ad-b2d63131d7a5@oracle.com>
 <20190603172916.GA5390@infradead.org>
 <7a687a26-fc3e-2caa-1d6a-464f1f7e684c@oracle.com>
In-Reply-To: <7a687a26-fc3e-2caa-1d6a-464f1f7e684c@oracle.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Tue, 4 Jun 2019 13:45:24 +0200
Message-ID: <CAAeHK+wccK1upfOWxNbZBR0BUWT23VFUFEqRTEp3H+8hXN8yzw@mail.gmail.com>
Subject: Re: [PATCH v16 01/16] uaccess: add untagged_addr definition for other
 arches
To: Khalid Aziz <khalid.aziz@oracle.com>
X-Mailman-Approved-At: Tue, 04 Jun 2019 13:42:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ROpXrP+r2OC9uJKtrd7VeU5I2GEkuLFi73TKRyEYr3w=;
 b=YbXtk1gZpPouwSYE2Vhs1oY1Y4f37CPgCl4rhCDKDXOACPNCfLr9np6wKfbnqxvNqK
 net1HG8o5wBQb4vNApxrOerpg8MX7Frcm0nkoJCRedOp4gIlsU8B+szPQLnyAp7uDFz6
 18a5z5D1t2cCXPLwVyjN57+1xoFuuaOeWrZS3QYEL6m6NSRbpHdyTtJVRsjz8hDvO7ay
 x4MfN3T0GXyhVOPDl8Cb4swrSICIbrgdMT9k5w6B73MKVGcGVf0T8Ojj0gm6GQdck4bi
 ehe9TCYVm49T6ewlmRPV9pTGt0imE7M4Hg2EyyudgsziWrwS3zmaj416nN50DFpNVxSV
 8gRg==
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

T24gTW9uLCBKdW4gMywgMjAxOSBhdCA4OjE3IFBNIEtoYWxpZCBBeml6IDxraGFsaWQuYXppekBv
cmFjbGUuY29tPiB3cm90ZToKPgo+IE9uIDYvMy8xOSAxMToyOSBBTSwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gPiBPbiBNb24sIEp1biAwMywgMjAxOSBhdCAxMToyNDozNUFNIC0wNjAwLCBL
aGFsaWQgQXppeiB3cm90ZToKPiA+PiBPbiA2LzMvMTkgMTE6MDYgQU0sIEFuZHJleSBLb25vdmFs
b3Ygd3JvdGU6Cj4gPj4+IE9uIE1vbiwgSnVuIDMsIDIwMTkgYXQgNzowNCBQTSBLaGFsaWQgQXpp
eiA8a2hhbGlkLmF6aXpAb3JhY2xlLmNvbT4gd3JvdGU6Cj4gPj4+PiBBbmRyZXksCj4gPj4+Pgo+
ID4+Pj4gVGhpcyBwYXRjaCBoYXMgbm93IGJlY29tZSBwYXJ0IG9mIHRoZSBvdGhlciBwYXRjaCBz
ZXJpZXMgQ2hyaXMgSGVsbHdpZwo+ID4+Pj4gaGFzIHNlbnQgb3V0IC0KPiA+Pj4+IDxodHRwczov
L2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTkwNjAxMDc0OTU5LjE0MDM2LTEtaGNoQGxzdC5kZS8+
LiBDYW4KPiA+Pj4+IHlvdSBjb29yZGluYXRlIHdpdGggdGhhdCBwYXRjaCBzZXJpZXM/Cj4gPj4+
Cj4gPj4+IEhpIQo+ID4+Pgo+ID4+PiBZZXMsIEkndmUgc2VlbiBpdC4gSG93IHNob3VsZCBJIGNv
b3JkaW5hdGU/IFJlYmFzZSB0aGlzIHNlcmllcyBvbiB0b3AKPiA+Pj4gb2YgdGhhdCBvbmU/Cj4g
Pj4KPiA+PiBUaGF0IHdvdWxkIGJlIG9uZSB3YXkgdG8gZG8gaXQuIEJldHRlciB5ZXQsIHNlcGFy
YXRlIHRoaXMgcGF0Y2ggZnJvbQo+ID4+IGJvdGggcGF0Y2ggc2VyaWVzLCBtYWtlIGl0IHN0YW5k
YWxvbmUgYW5kIHRoZW4gcmViYXNlIHRoZSB0d28gcGF0Y2gKPiA+PiBzZXJpZXMgb24gdG9wIG9m
IGl0Lgo+ID4KPiA+IEkgdGhpbmsgZWFzaWVzdCB3b3VsZCBiZSB0byBqdXN0IGFzayBMaW51cyBp
ZiBoZSBjb3VsZCBtYWtlIGFuIGV4Y2VwdGlvbgo+ID4gYW5kIGluY2x1ZGUgdGhpcyB0cml2aWFs
IHByZXAgcGF0Y2ggaW4gNS4yLXJjLgo+ID4KPgo+IEFuZHJleSwKPgo+IFdvdWxkIHlvdSBtaW5k
IHVwZGF0aW5nIHRoZSBjb21taXQgbG9nIHRvIG1ha2UgaXQgbm90IGFybTY0IHNwZWNpZmljIGFu
ZAo+IHNlbmRpbmcgdGhpcyBwYXRjaCBvdXQgYnkgaXRzZWxmLiBXZSBjYW4gdGhlbiBhc2sgTGlu
dXMgaWYgaGUgY2FuCj4gaW5jbHVkZSBqdXN0IHRoaXMgcGF0Y2ggaW4gdGhlIG5leHQgcmMuCgpT
dXJlISBKdXN0IHNlbnQgaXQgb3V0LgoKPgo+IFRoYW5rcywKPiBLaGFsaWQKPgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
