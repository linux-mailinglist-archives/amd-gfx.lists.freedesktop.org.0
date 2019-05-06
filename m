Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C1B14F51
	for <lists+amd-gfx@lfdr.de>; Mon,  6 May 2019 17:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF4589A1A;
	Mon,  6 May 2019 15:09:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CB08976D
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 May 2019 14:15:32 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id cb4so2524046plb.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 May 2019 07:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OW9r981uG4q4mCEE3eviMpvcgNrP8ztSBy/V22TuEyU=;
 b=m04KR3mcrs3VlADIoin8JlbKpbZ0/6/xkmw85hhBrE7NYxT9K5ECaMgxkInbNwAKba
 RAL15sqPlvxgDUZWVgQZI/LArfS2kXFZ53b4g99jhdll3R8oyC1pqaS4aL+XYP35H8dI
 8FxxL0NzlWuVyudrZvw+GDlEuRIt3fU9SJB5x9yNk8pq3BmOWbfX8lBlKgwL1q4xfDC+
 U5R4xq4gIiSGch47BG0/FXIfFn0Dj+XkmaxP8R4OfZT64X0f7uZ/yvZk0vTGTiRAOEgC
 hJTZGlzIZTnfTbLdE3WkjoM2RC0bJp5pGkNOHsY7GEOlZ58dbfF8e8r7P9Bpvt0vJhBw
 MhgA==
X-Gm-Message-State: APjAAAV6s77PlSMSf/vr9xA98wj244UXOo7MINNuh4+p3aNadNWY1n4l
 z7hGjOxwOZ5v0vrT+vubAY2uZBMWuDiuJ1MCNPo0VXWbrrw=
X-Google-Smtp-Source: APXvYqyWDp8mHq4mu+m9PaBcR4hr0UfLsUgs2S/OxvEKrdiWi6A7iqRf42KWhYp4nRTNFO6VlU1AYWwzebl0ku93GlI=
X-Received: by 2002:a17:902:7783:: with SMTP id
 o3mr32385898pll.159.1557152131315; 
 Mon, 06 May 2019 07:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
 <7d3b28689d47c0fa1b80628f248dbf78548da25f.1556630205.git.andreyknvl@google.com>
 <20190503165646.GK55449@arrakis.emea.arm.com>
In-Reply-To: <20190503165646.GK55449@arrakis.emea.arm.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 6 May 2019 16:15:20 +0200
Message-ID: <CAAeHK+yya4OR7GfSJPc59+trq3fS9Qh_1WK2hB1aoHdR0C_t8Q@mail.gmail.com>
Subject: Re: [PATCH v14 10/17] fs,
 arm64: untag user pointers in fs/userfaultfd.c
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mailman-Approved-At: Mon, 06 May 2019 15:09:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=OW9r981uG4q4mCEE3eviMpvcgNrP8ztSBy/V22TuEyU=;
 b=RwIwMiF88+Wz2lyiiiRFLD0DtzmtPhSYctT7DECXSVGGsMCqqEywraKb1VVIDK0D+6
 e05K/iAAJcE9yRHQNbEvq9ePWUxNo3jMQ16tSsOGtmWiuiuGjYTIKZn3RWyGJN1L7rxH
 JWCib8njn+v5Gl74GjdEjnavoToExJWkPKuLN2usGUeeVQU1cj6afqv3AP+Szx9d1YbR
 /iYb1mW4rEJXqf/1doCy1zenFphH/aiHoOYrBoxPgEK3EUfKzOGpHL63KMDfpfhEfnGD
 SAWo20WeW5Qs/kAhFHEaSxMs4rZb4+Da05bz1k2JR3ScMW8GRukA/aJ+BvUhLbhKhimD
 bg2g==
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
Cc: Mark Rutland <mark.rutland@arm.com>, Koenig@google.com, kvm@vger.kernel.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Chintan Pandya <cpandya@codeaurora.org>, Felix <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>, Deucher@google.com,
 Alex Williamson <alex.williamson@redhat.com>,
 Dmitry Vyukov <dvyukov@google.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kuehling@google.com, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMywgMjAxOSBhdCA2OjU2IFBNIENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5t
YXJpbmFzQGFybS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMDM6MjU6
MDZQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+IFRoaXMgcGF0Y2ggaXMgYSBw
YXJ0IG9mIGEgc2VyaWVzIHRoYXQgZXh0ZW5kcyBhcm02NCBrZXJuZWwgQUJJIHRvIGFsbG93IHRv
Cj4gPiBwYXNzIHRhZ2dlZCB1c2VyIHBvaW50ZXJzICh3aXRoIHRoZSB0b3AgYnl0ZSBzZXQgdG8g
c29tZXRoaW5nIGVsc2Ugb3RoZXIKPiA+IHRoYW4gMHgwMCkgYXMgc3lzY2FsbCBhcmd1bWVudHMu
Cj4gPgo+ID4gdXNlcmZhdWx0ZmRfcmVnaXN0ZXIoKSBhbmQgdXNlcmZhdWx0ZmRfdW5yZWdpc3Rl
cigpIHVzZSBwcm92aWRlZCB1c2VyCj4gPiBwb2ludGVycyBmb3Igdm1hIGxvb2t1cHMsIHdoaWNo
IGNhbiBvbmx5IGJ5IGRvbmUgd2l0aCB1bnRhZ2dlZCBwb2ludGVycy4KPiA+Cj4gPiBVbnRhZyB1
c2VyIHBvaW50ZXJzIGluIHRoZXNlIGZ1bmN0aW9ucy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBB
bmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Cj4gPiAtLS0KPiA+ICBmcy91
c2VyZmF1bHRmZC5jIHwgNSArKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvdXNlcmZhdWx0ZmQuYyBiL2ZzL3VzZXJmYXVsdGZk
LmMKPiA+IGluZGV4IGY1ZGUxZTcyNjM1Ni4uZmRlZTBkYjBlODQ3IDEwMDY0NAo+ID4gLS0tIGEv
ZnMvdXNlcmZhdWx0ZmQuYwo+ID4gKysrIGIvZnMvdXNlcmZhdWx0ZmQuYwo+ID4gQEAgLTEzMjUs
NiArMTMyNSw5IEBAIHN0YXRpYyBpbnQgdXNlcmZhdWx0ZmRfcmVnaXN0ZXIoc3RydWN0IHVzZXJm
YXVsdGZkX2N0eCAqY3R4LAo+ID4gICAgICAgICAgICAgICBnb3RvIG91dDsKPiA+ICAgICAgIH0K
PiA+Cj4gPiArICAgICB1ZmZkaW9fcmVnaXN0ZXIucmFuZ2Uuc3RhcnQgPQo+ID4gKyAgICAgICAg
ICAgICB1bnRhZ2dlZF9hZGRyKHVmZmRpb19yZWdpc3Rlci5yYW5nZS5zdGFydCk7Cj4gPiArCj4g
PiAgICAgICByZXQgPSB2YWxpZGF0ZV9yYW5nZShtbSwgdWZmZGlvX3JlZ2lzdGVyLnJhbmdlLnN0
YXJ0LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgdWZmZGlvX3JlZ2lzdGVyLnJhbmdl
Lmxlbik7Cj4gPiAgICAgICBpZiAocmV0KQo+ID4gQEAgLTE1MTQsNiArMTUxNyw4IEBAIHN0YXRp
YyBpbnQgdXNlcmZhdWx0ZmRfdW5yZWdpc3RlcihzdHJ1Y3QgdXNlcmZhdWx0ZmRfY3R4ICpjdHgs
Cj4gPiAgICAgICBpZiAoY29weV9mcm9tX3VzZXIoJnVmZmRpb191bnJlZ2lzdGVyLCBidWYsIHNp
emVvZih1ZmZkaW9fdW5yZWdpc3RlcikpKQo+ID4gICAgICAgICAgICAgICBnb3RvIG91dDsKPiA+
Cj4gPiArICAgICB1ZmZkaW9fdW5yZWdpc3Rlci5zdGFydCA9IHVudGFnZ2VkX2FkZHIodWZmZGlv
X3VucmVnaXN0ZXIuc3RhcnQpOwo+ID4gKwo+ID4gICAgICAgcmV0ID0gdmFsaWRhdGVfcmFuZ2Uo
bW0sIHVmZmRpb191bnJlZ2lzdGVyLnN0YXJ0LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdWZmZGlvX3VucmVnaXN0ZXIubGVuKTsKPiA+ICAgICAgIGlmIChyZXQpCj4KPiBXb3VsZG4n
dCBpdCBiZSBlYXNpZXIgdG8gZG8gdGhpcyBpbiB2YWxpZGF0ZV9yYW5nZSgpPyBUaGVyZSBhcmUg
YSBmZXcKPiBtb3JlIGNhbGxzIGluIHRoaXMgZmlsZSwgdGhvdWdoIEkgZGlkbid0IGNoZWNrIHdo
ZXRoZXIgYSB0YWdnZWQgYWRkcmVzcwo+IHdvdWxkIGNhdXNlIGlzc3Vlcy4KClllcywgSSB0aGlu
ayBpdCBtYWtlcyBtb3JlIHNlbnNlLCB3aWxsIGRvIGluIHYxNSwgdGhhbmtzIQoKPgo+IC0tCj4g
Q2F0YWxpbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
