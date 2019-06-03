Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3482B33E5D
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 07:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6198957D;
	Tue,  4 Jun 2019 05:23:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE29892AC;
 Mon,  3 Jun 2019 17:29:21 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hXqlo-00025Q-9C; Mon, 03 Jun 2019 17:29:16 +0000
Date: Mon, 3 Jun 2019 10:29:16 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Khalid Aziz <khalid.aziz@oracle.com>
Subject: Re: [PATCH v16 01/16] uaccess: add untagged_addr definition for
 other arches
Message-ID: <20190603172916.GA5390@infradead.org>
References: <cover.1559580831.git.andreyknvl@google.com>
 <097bc300a5c6554ca6fd1886421bb2e0adb03420.1559580831.git.andreyknvl@google.com>
 <8ff5b0ff-849a-1e0b-18da-ccb5be85dd2b@oracle.com>
 <CAAeHK+xX2538e674Pz25unkdFPCO_SH0pFwFu=8+DS7RzfYnLQ@mail.gmail.com>
 <f6711d31-e52c-473a-d7ad-b2d63131d7a5@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f6711d31-e52c-473a-d7ad-b2d63131d7a5@oracle.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Tue, 04 Jun 2019 05:23:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E3YMznrQvI4XYCbxYdGQLQYRxZ6se0IICAJQI35QmUc=; b=rBmKAzm6VMFiVqBuypdPrNnHG
 9qR/xC1YUSUo4q1ihLjn3I1k3Z3Zt6ifT4BOE9d8JuD+KANIIdW4jN8PXiVc/rtwsBx2jUqqiusN9
 XZiJCQFveWwYCiDODxQrw3kCKKimNiQpVcsgEcblb0zsMWY+TexrkRomHsn0JqXwETKx9ELJfGj9q
 jOQlw3G/UlUJUPhW/UmsBMxDxE09/TlTcCGWjEEy2oiu1YHyvKMt+HBSMRmxLaLtbJMUdKbvkie5m
 R6xIoJDLFjnWEVIxBVl5q2n4wLYhS96OJs3nOLbuM/ziN5On8QOyJ8ynpVakg7HFTHIHdWMjvK7eX
 tMuk6CEhg==;
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
 Andrey Konovalov <andreyknvl@google.com>,
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

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMTE6MjQ6MzVBTSAtMDYwMCwgS2hhbGlkIEF6aXogd3Jv
dGU6Cj4gT24gNi8zLzE5IDExOjA2IEFNLCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+ID4gT24g
TW9uLCBKdW4gMywgMjAxOSBhdCA3OjA0IFBNIEtoYWxpZCBBeml6IDxraGFsaWQuYXppekBvcmFj
bGUuY29tPiB3cm90ZToKPiA+PiBBbmRyZXksCj4gPj4KPiA+PiBUaGlzIHBhdGNoIGhhcyBub3cg
YmVjb21lIHBhcnQgb2YgdGhlIG90aGVyIHBhdGNoIHNlcmllcyBDaHJpcyBIZWxsd2lnCj4gPj4g
aGFzIHNlbnQgb3V0IC0KPiA+PiA8aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDE5MDYw
MTA3NDk1OS4xNDAzNi0xLWhjaEBsc3QuZGUvPi4gQ2FuCj4gPj4geW91IGNvb3JkaW5hdGUgd2l0
aCB0aGF0IHBhdGNoIHNlcmllcz8KPiA+IAo+ID4gSGkhCj4gPiAKPiA+IFllcywgSSd2ZSBzZWVu
IGl0LiBIb3cgc2hvdWxkIEkgY29vcmRpbmF0ZT8gUmViYXNlIHRoaXMgc2VyaWVzIG9uIHRvcAo+
ID4gb2YgdGhhdCBvbmU/Cj4gCj4gVGhhdCB3b3VsZCBiZSBvbmUgd2F5IHRvIGRvIGl0LiBCZXR0
ZXIgeWV0LCBzZXBhcmF0ZSB0aGlzIHBhdGNoIGZyb20KPiBib3RoIHBhdGNoIHNlcmllcywgbWFr
ZSBpdCBzdGFuZGFsb25lIGFuZCB0aGVuIHJlYmFzZSB0aGUgdHdvIHBhdGNoCj4gc2VyaWVzIG9u
IHRvcCBvZiBpdC4KCkkgdGhpbmsgZWFzaWVzdCB3b3VsZCBiZSB0byBqdXN0IGFzayBMaW51cyBp
ZiBoZSBjb3VsZCBtYWtlIGFuIGV4Y2VwdGlvbgphbmQgaW5jbHVkZSB0aGlzIHRyaXZpYWwgcHJl
cCBwYXRjaCBpbiA1LjItcmMuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
