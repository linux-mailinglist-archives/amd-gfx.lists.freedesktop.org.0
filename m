Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 254D273255
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 16:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911C06E5C6;
	Wed, 24 Jul 2019 14:56:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5783C6E5AA
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 14:17:01 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id b13so21040221pfo.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 07:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iVEa+BrbD+ybsnA2U1ljAFs3yPdamhmoGuSiTUjWPJ4=;
 b=uSLkgwTBxRCpFoOK/v2iu5RcpPfGt6WTXa0lHo+qOHQmijudh/lkmtcrnnH002aij1
 RLaa5D05qa4twkucUcY1u/heSH5wBn/yL/3WZ/nsc8rvegUcakhXutavj6FU5uenJ4Kj
 hWdWUcGuM/WkSGnlfSFfa17TJ9FlLWx4CmLzuChn1ttSf8dNznEr3dO30WZkJIlWawRw
 M7McSlAJmMFU9f0MRK2wTNDo9lGOW8vQDPlg8+O00+3FiQKHQ5NzvhveX8FOOtmnWpy7
 K+ItEgJYAakZT5xxXV2NmV3xER3YKDZIQd4DzJqeemCWkTpFIUnrWwH4oEw1/mxcdNfi
 hVKQ==
X-Gm-Message-State: APjAAAUmhJ1wEXwoTT6mMa3hzJJXwE6JXZxRF9rYM567XayWApt/FGec
 ESN1v/IQjRAzXtnE6ura8BVCIQy1PYvpBNj6wB1F8w==
X-Google-Smtp-Source: APXvYqz2dMxGxnq2kAfIP49TpeG4FcaV+yTvRZ4CcUcR9QT0oeQ2GoQPtuki1B+xbKFnrASZfeBQUkyN7t1WRbfNCv8=
X-Received: by 2002:aa7:86c6:: with SMTP id h6mr11779914pfo.51.1563977820600; 
 Wed, 24 Jul 2019 07:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com>
 <CAAeHK+yc0D_nd7nTRsY4=qcSx+eQR0VLut3uXMf4NEiE-VpeCw@mail.gmail.com>
 <20190724140212.qzvbcx5j2gi5lcoj@willie-the-truck>
In-Reply-To: <20190724140212.qzvbcx5j2gi5lcoj@willie-the-truck>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Wed, 24 Jul 2019 16:16:49 +0200
Message-ID: <CAAeHK+xXzdQHpVXL7f1T2Ef2P7GwFmDMSaBH4VG8fT3=c_OnjQ@mail.gmail.com>
Subject: Re: [PATCH v19 00/15] arm64: untag user pointers passed to the kernel
To: Will Deacon <will@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>
X-Mailman-Approved-At: Wed, 24 Jul 2019 14:56:57 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=iVEa+BrbD+ybsnA2U1ljAFs3yPdamhmoGuSiTUjWPJ4=;
 b=DWU4WjGAtgl8VCFFOjc8wXQ0g23uMAUtJpd38Z3oaJgwn4NfatixOvhmdpOdL+fxhG
 e0wlc3X1shT5Iq30jjbbWGUReEBT4OBXlYiiQUhWx2Q7uiFMfOEneT8NH6f9J2qp0V5H
 uul5tf2SvUAF38K7907CwJA6dKexcEorDJsv/KoSqA3HSUAO6tsOMxjz0hFsJBWrp9kB
 d53dWGlSvFswyl6j+n5LUh4qGYRvo3+KwFNfAV8S+2jUqD0GvKKHxnABV1FWZ1+b1OBh
 oB2T3ZDN/Zfw5qlFjUWW5qYsM2z/YZXngByjiqcmIeT7gWGze9CMbYqnOAvNwjkoL4TA
 mEew==
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
 Christian Koenig <Christian.Koenig@amd.com>,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, Kostya Serebryany <kcc@google.com>,
 Khalid Aziz <khalid.aziz@oracle.com>, Lee Smith <Lee.Smith@arm.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgNDowMiBQTSBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IEhpIEFuZHJleSwKPgo+IE9uIFR1ZSwgSnVsIDIzLCAyMDE5IGF0IDA4
OjAzOjI5UE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBPbiBUdWUsIEp1bCAy
MywgMjAxOSBhdCA3OjU5IFBNIEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNv
bT4gd3JvdGU6Cj4gPiA+Cj4gPiA+ID09PSBPdmVydmlldwo+ID4gPgo+ID4gPiBhcm02NCBoYXMg
YSBmZWF0dXJlIGNhbGxlZCBUb3AgQnl0ZSBJZ25vcmUsIHdoaWNoIGFsbG93cyB0byBlbWJlZCBw
b2ludGVyCj4gPiA+IHRhZ3MgaW50byB0aGUgdG9wIGJ5dGUgb2YgZWFjaCBwb2ludGVyLiBVc2Vy
c3BhY2UgcHJvZ3JhbXMgKHN1Y2ggYXMKPiA+ID4gSFdBU2FuLCBhIG1lbW9yeSBkZWJ1Z2dpbmcg
dG9vbCBbMV0pIG1pZ2h0IHVzZSB0aGlzIGZlYXR1cmUgYW5kIHBhc3MKPiA+ID4gdGFnZ2VkIHVz
ZXIgcG9pbnRlcnMgdG8gdGhlIGtlcm5lbCB0aHJvdWdoIHN5c2NhbGxzIG9yIG90aGVyIGludGVy
ZmFjZXMuCj4gPiA+Cj4gPiA+IFJpZ2h0IG5vdyB0aGUga2VybmVsIGlzIGFscmVhZHkgYWJsZSB0
byBoYW5kbGUgdXNlciBmYXVsdHMgd2l0aCB0YWdnZWQKPiA+ID4gcG9pbnRlcnMsIGR1ZSB0byB0
aGVzZSBwYXRjaGVzOgo+ID4gPgo+ID4gPiAxLiA4MWNkZGQ2NSAoImFybTY0OiB0cmFwczogZml4
IHVzZXJzcGFjZSBjYWNoZSBtYWludGVuYW5jZSBlbXVsYXRpb24gb24gYQo+ID4gPiAgICAgICAg
ICAgICAgdGFnZ2VkIHBvaW50ZXIiKQo+ID4gPiAyLiA3ZGNkOWRkOCAoImFybTY0OiBod19icmVh
a3BvaW50OiBmaXggd2F0Y2hwb2ludCBtYXRjaGluZyBmb3IgdGFnZ2VkCj4gPiA+ICAgICAgICAg
ICAgICAgcG9pbnRlcnMiKQo+ID4gPiAzLiAyNzZlOTMyNyAoImFybTY0OiBlbnRyeTogaW1wcm92
ZSBkYXRhIGFib3J0IGhhbmRsaW5nIG9mIHRhZ2dlZAo+ID4gPiAgICAgICAgICAgICAgIHBvaW50
ZXJzIikKPiA+ID4KPiA+ID4gVGhpcyBwYXRjaHNldCBleHRlbmRzIHRhZ2dlZCBwb2ludGVyIHN1
cHBvcnQgdG8gc3lzY2FsbCBhcmd1bWVudHMuCj4KPiBbLi4uXQo+Cj4gPiBEbyB5b3UgdGhpbmsg
dGhpcyBpcyByZWFkeSB0byBiZSBtZXJnZWQ/Cj4gPgo+ID4gU2hvdWxkIHRoaXMgZ28gdGhyb3Vn
aCB0aGUgbW0gb3IgdGhlIGFybSB0cmVlPwo+Cj4gSSB3b3VsZCBjZXJ0YWlubHkgcHJlZmVyIHRv
IHRha2UgYXQgbGVhc3QgdGhlIGFybTY0IGJpdHMgdmlhIHRoZSBhcm02NCB0cmVlCj4gKGkuZS4g
cGF0Y2hlcyAxLCAyIGFuZCAxNSkuIFdlIGFsc28gbmVlZCBhIERvY3VtZW50YXRpb24gcGF0Y2gg
ZGVzY3JpYmluZwo+IHRoZSBuZXcgQUJJLgoKU291bmRzIGdvb2QhIFNob3VsZCBJIHBvc3QgdGhv
c2UgcGF0Y2hlcyB0b2dldGhlciB3aXRoIHRoZQpEb2N1bWVudGF0aW9uIHBhdGNoZXMgZnJvbSBW
aW5jZW56byBhcyBhIHNlcGFyYXRlIHBhdGNoc2V0PwoKVmluY2Vuem8sIGNvdWxkIHlvdSBzaGFy
ZSB0aGUgbGFzdCB2ZXJzaW9uIG9mIHRoZSBEb2N1bWVudGF0aW9uIHBhdGNoZXM/CgpUaGFua3Mh
Cgo+Cj4gV2lsbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
