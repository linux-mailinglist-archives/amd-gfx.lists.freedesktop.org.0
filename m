Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 976D86BF1C
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jul 2019 17:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A62D6E1E2;
	Wed, 17 Jul 2019 15:29:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52FC6E11A
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 11:47:03 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id az7so11839679plb.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 04:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XH7pgHFzkwihJR5psn/ZNzGH7d1Hcpwg4ypt2aGmLUk=;
 b=CDERvXwo/TQraJWi0EPcB5aPikPq1kdZ2M4yRrCi/FQUKudWltujTbdonRSlbosSde
 7HDfOIIKrfLOX/fudjij4epnRwTQwlBvwX3uXtcMQRPu3IbGHszVoud2HSE4QRnLQqyo
 9IeonCUAJNTtx28lYymTpeJ08dnADybDrZml15+0nx5LS+6m36+UmOz7us3IuAZdU3RS
 lXOCxRzTbg4Jml1Y+tkwoNaZBbZqfH4+tOsEoPZLg/MwoYkTkRICOIFg9jHf6i4lNKhP
 wBbf+6OuboFN5YibjsQN0Fu8RH1YG8uVFxJeKNMIWuMSTBDMb9DXfrHhILoBIYSg9bAZ
 kE2Q==
X-Gm-Message-State: APjAAAVeeNwKNaDzIyrLsAgsOVdDqIIlEBrTBKwKiNe8T+qeHVt0lPyG
 LspbpkP7TM0F3Zm43k/w8BS76afqSQmHITGHawVe3g==
X-Google-Smtp-Source: APXvYqz8S3jyPxed+oPtsIDmi9g4NsD5ItlfcVysZ7+qze2pU/edo+3e3aBEztJRj4XnLTpHjY2eNg/431rKCehxHqk=
X-Received: by 2002:a17:902:8689:: with SMTP id
 g9mr39736837plo.252.1563364023206; 
 Wed, 17 Jul 2019 04:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561386715.git.andreyknvl@google.com>
 <d8e3b9a819e98d6527e506027b173b128a148d3c.1561386715.git.andreyknvl@google.com>
 <20190624175120.GN29120@arrakis.emea.arm.com>
 <20190717110910.GA12017@rapoport-lnx>
In-Reply-To: <20190717110910.GA12017@rapoport-lnx>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Wed, 17 Jul 2019 13:46:52 +0200
Message-ID: <CAAeHK+yB=d_oXOVZ2TuVe2UkBAx-GM_f+mu88JeVWqPO95xVHQ@mail.gmail.com>
Subject: Re: [PATCH v18 08/15] userfaultfd: untag user pointers
To: Mike Rapoport <rppt@linux.ibm.com>
X-Mailman-Approved-At: Wed, 17 Jul 2019 15:29:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=XH7pgHFzkwihJR5psn/ZNzGH7d1Hcpwg4ypt2aGmLUk=;
 b=q9rg5oP+7QfRryee4CQfI+zTuO8vcNkAU+Zb8S/XX5gbQKX1OYbsUUbB3B8KK9hFmU
 UHgvh4Mz+Kyv0D5E5zvwH3nJNYoE2P1kzcK2Rg1yMoExsViP4+PURLjfYPF2WZhrd0MF
 a+zGI8yxCxdvE8nZGITXCK8/RaYQDCnkR7z8XELwz+GgVBZndcqvcfCaF4ihTHl0HyVo
 bFY7Esho++ViErb2avPSuS/M58xcsz7oUebcD6xLNGIpCphqGpuQ31GuhoMHpSqGmldC
 ZKZZNvAff0cBNn4NnOvQXzgW64bJR2BOmy7dIGzstZ5vq+Xgsj3OiBdAV2LIo/WRsiLm
 aMOQ==
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
 Al Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>,
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

T24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMTowOSBQTSBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4
LmlibS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMDY6NTE6MjFQTSAr
MDEwMCwgQ2F0YWxpbiBNYXJpbmFzIHdyb3RlOgo+ID4gT24gTW9uLCBKdW4gMjQsIDIwMTkgYXQg
MDQ6MzI6NTNQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+ID4gVGhpcyBwYXRj
aCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGtlcm5lbCBBQkkgdG8gYWxsb3cg
dG8gcGFzcwo+ID4gPiB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUgc2V0
IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyIHRoYW4KPiA+ID4gMHgwMCkgYXMgc3lzY2FsbCBhcmd1
bWVudHMuCj4gPiA+Cj4gPiA+IHVzZXJmYXVsdGZkIGNvZGUgdXNlIHByb3ZpZGVkIHVzZXIgcG9p
bnRlcnMgZm9yIHZtYSBsb29rdXBzLCB3aGljaCBjYW4KPiA+ID4gb25seSBieSBkb25lIHdpdGgg
dW50YWdnZWQgcG9pbnRlcnMuCj4gPiA+Cj4gPiA+IFVudGFnIHVzZXIgcG9pbnRlcnMgaW4gdmFs
aWRhdGVfcmFuZ2UoKS4KPiA+ID4KPiA+ID4gUmV2aWV3ZWQtYnk6IFZpbmNlbnpvIEZyYXNjaW5v
IDx2aW5jZW56by5mcmFzY2lub0Bhcm0uY29tPgo+ID4gPiBSZXZpZXdlZC1ieTogQ2F0YWxpbiBN
YXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KPiA+ID4gUmV2aWV3ZWQtYnk6IEtlZXMg
Q29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkg
S29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZnMvdXNl
cmZhdWx0ZmQuYyB8IDIyICsrKysrKysrKysrKy0tLS0tLS0tLS0KPiA+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBTYW1lIGhlcmUs
IGl0IG5lZWRzIGFuIGFjayBmcm9tIEFsIFZpcm8uCj4KPiBUaGUgdXNlcmZhdWx0IHBhdGNoZXMg
dXN1YWxseSBnbyB2aWEgLW1tIHRyZWUsIG5vdCBzdXJlIGlmIEFsIGxvb2tzIGF0IHRoZW0gOikK
CkFoLCBPSywgSSBndWVzcyB0aGFuIEFuZHJldyB3aWxsIHRha2UgYSBsb29rIGF0IHRoZW0gd2hl
biBtZXJnaW5nLgoKPgo+IEZXSVcsIHlvdSBjYW4gYWRkCj4KPiBSZXZpZXdlZC1ieTogTWlrZSBS
YXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKSSB3aWxsLCB0aGFua3MhCgo+Cj4gPiA+IGRp
ZmYgLS1naXQgYS9mcy91c2VyZmF1bHRmZC5jIGIvZnMvdXNlcmZhdWx0ZmQuYwo+ID4gPiBpbmRl
eCBhZTBiOGI1ZjY5ZTYuLmMyYmUzNmExNjhjYSAxMDA2NDQKPiA+ID4gLS0tIGEvZnMvdXNlcmZh
dWx0ZmQuYwo+ID4gPiArKysgYi9mcy91c2VyZmF1bHRmZC5jCj4gPiA+IEBAIC0xMjYxLDIxICsx
MjYxLDIzIEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCB3YWtlX3VzZXJmYXVsdChzdHJ1
Y3QgdXNlcmZhdWx0ZmRfY3R4ICpjdHgsCj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICBzdGF0aWMgX19h
bHdheXNfaW5saW5lIGludCB2YWxpZGF0ZV9yYW5nZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPiA+
ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX3U2NCBzdGFydCwgX191
NjQgbGVuKQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fdTY0
ICpzdGFydCwgX191NjQgbGVuKQo+ID4gPiAgewo+ID4gPiAgICAgX191NjQgdGFza19zaXplID0g
bW0tPnRhc2tfc2l6ZTsKPiA+ID4KPiA+ID4gLSAgIGlmIChzdGFydCAmIH5QQUdFX01BU0spCj4g
PiA+ICsgICAqc3RhcnQgPSB1bnRhZ2dlZF9hZGRyKCpzdGFydCk7Cj4gPiA+ICsKPiA+ID4gKyAg
IGlmICgqc3RhcnQgJiB+UEFHRV9NQVNLKQo+ID4gPiAgICAgICAgICAgICByZXR1cm4gLUVJTlZB
TDsKPiA+ID4gICAgIGlmIChsZW4gJiB+UEFHRV9NQVNLKQo+ID4gPiAgICAgICAgICAgICByZXR1
cm4gLUVJTlZBTDsKPiA+ID4gICAgIGlmICghbGVuKQo+ID4gPiAgICAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsKPiA+ID4gLSAgIGlmIChzdGFydCA8IG1tYXBfbWluX2FkZHIpCj4gPiA+ICsgICBp
ZiAoKnN0YXJ0IDwgbW1hcF9taW5fYWRkcikKPiA+ID4gICAgICAgICAgICAgcmV0dXJuIC1FSU5W
QUw7Cj4gPiA+IC0gICBpZiAoc3RhcnQgPj0gdGFza19zaXplKQo+ID4gPiArICAgaWYgKCpzdGFy
dCA+PSB0YXNrX3NpemUpCj4gPiA+ICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gPiAt
ICAgaWYgKGxlbiA+IHRhc2tfc2l6ZSAtIHN0YXJ0KQo+ID4gPiArICAgaWYgKGxlbiA+IHRhc2tf
c2l6ZSAtICpzdGFydCkKPiA+ID4gICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiA+ICAg
ICByZXR1cm4gMDsKPiA+ID4gIH0KPiA+ID4gQEAgLTEzMjUsNyArMTMyNyw3IEBAIHN0YXRpYyBp
bnQgdXNlcmZhdWx0ZmRfcmVnaXN0ZXIoc3RydWN0IHVzZXJmYXVsdGZkX2N0eCAqY3R4LAo+ID4g
PiAgICAgICAgICAgICBnb3RvIG91dDsKPiA+ID4gICAgIH0KPiA+ID4KPiA+ID4gLSAgIHJldCA9
IHZhbGlkYXRlX3JhbmdlKG1tLCB1ZmZkaW9fcmVnaXN0ZXIucmFuZ2Uuc3RhcnQsCj4gPiA+ICsg
ICByZXQgPSB2YWxpZGF0ZV9yYW5nZShtbSwgJnVmZmRpb19yZWdpc3Rlci5yYW5nZS5zdGFydCwK
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIHVmZmRpb19yZWdpc3Rlci5yYW5nZS5sZW4p
Owo+ID4gPiAgICAgaWYgKHJldCkKPiA+ID4gICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiA+IEBA
IC0xNTE0LDcgKzE1MTYsNyBAQCBzdGF0aWMgaW50IHVzZXJmYXVsdGZkX3VucmVnaXN0ZXIoc3Ry
dWN0IHVzZXJmYXVsdGZkX2N0eCAqY3R4LAo+ID4gPiAgICAgaWYgKGNvcHlfZnJvbV91c2VyKCZ1
ZmZkaW9fdW5yZWdpc3RlciwgYnVmLCBzaXplb2YodWZmZGlvX3VucmVnaXN0ZXIpKSkKPiA+ID4g
ICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiA+Cj4gPiA+IC0gICByZXQgPSB2YWxpZGF0ZV9yYW5n
ZShtbSwgdWZmZGlvX3VucmVnaXN0ZXIuc3RhcnQsCj4gPiA+ICsgICByZXQgPSB2YWxpZGF0ZV9y
YW5nZShtbSwgJnVmZmRpb191bnJlZ2lzdGVyLnN0YXJ0LAo+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgdWZmZGlvX3VucmVnaXN0ZXIubGVuKTsKPiA+ID4gICAgIGlmIChyZXQpCj4gPiA+
ICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4gPiBAQCAtMTY2NSw3ICsxNjY3LDcgQEAgc3RhdGlj
IGludCB1c2VyZmF1bHRmZF93YWtlKHN0cnVjdCB1c2VyZmF1bHRmZF9jdHggKmN0eCwKPiA+ID4g
ICAgIGlmIChjb3B5X2Zyb21fdXNlcigmdWZmZGlvX3dha2UsIGJ1Ziwgc2l6ZW9mKHVmZmRpb193
YWtlKSkpCj4gPiA+ICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4gPgo+ID4gPiAtICAgcmV0ID0g
dmFsaWRhdGVfcmFuZ2UoY3R4LT5tbSwgdWZmZGlvX3dha2Uuc3RhcnQsIHVmZmRpb193YWtlLmxl
bik7Cj4gPiA+ICsgICByZXQgPSB2YWxpZGF0ZV9yYW5nZShjdHgtPm1tLCAmdWZmZGlvX3dha2Uu
c3RhcnQsIHVmZmRpb193YWtlLmxlbik7Cj4gPiA+ICAgICBpZiAocmV0KQo+ID4gPiAgICAgICAg
ICAgICBnb3RvIG91dDsKPiA+ID4KPiA+ID4gQEAgLTE3MDUsNyArMTcwNyw3IEBAIHN0YXRpYyBp
bnQgdXNlcmZhdWx0ZmRfY29weShzdHJ1Y3QgdXNlcmZhdWx0ZmRfY3R4ICpjdHgsCj4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHVmZmRpb19jb3B5KS1zaXplb2YoX19zNjQpKSkK
PiA+ID4gICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiA+Cj4gPiA+IC0gICByZXQgPSB2YWxpZGF0
ZV9yYW5nZShjdHgtPm1tLCB1ZmZkaW9fY29weS5kc3QsIHVmZmRpb19jb3B5Lmxlbik7Cj4gPiA+
ICsgICByZXQgPSB2YWxpZGF0ZV9yYW5nZShjdHgtPm1tLCAmdWZmZGlvX2NvcHkuZHN0LCB1ZmZk
aW9fY29weS5sZW4pOwo+ID4gPiAgICAgaWYgKHJldCkKPiA+ID4gICAgICAgICAgICAgZ290byBv
dXQ7Cj4gPiA+ICAgICAvKgo+ID4gPiBAQCAtMTc2MSw3ICsxNzYzLDcgQEAgc3RhdGljIGludCB1
c2VyZmF1bHRmZF96ZXJvcGFnZShzdHJ1Y3QgdXNlcmZhdWx0ZmRfY3R4ICpjdHgsCj4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHVmZmRpb196ZXJvcGFnZSktc2l6ZW9mKF9fczY0
KSkpCj4gPiA+ICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4gPgo+ID4gPiAtICAgcmV0ID0gdmFs
aWRhdGVfcmFuZ2UoY3R4LT5tbSwgdWZmZGlvX3plcm9wYWdlLnJhbmdlLnN0YXJ0LAo+ID4gPiAr
ICAgcmV0ID0gdmFsaWRhdGVfcmFuZ2UoY3R4LT5tbSwgJnVmZmRpb196ZXJvcGFnZS5yYW5nZS5z
dGFydCwKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIHVmZmRpb196ZXJvcGFnZS5yYW5n
ZS5sZW4pOwo+ID4gPiAgICAgaWYgKHJldCkKPiA+ID4gICAgICAgICAgICAgZ290byBvdXQ7Cj4g
PiA+IC0tCj4gPiA+IDIuMjIuMC40MTAuZ2Q4ZmRiZTIxYjUtZ29vZwo+Cj4gLS0KPiBTaW5jZXJl
bHkgeW91cnMsCj4gTWlrZS4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
