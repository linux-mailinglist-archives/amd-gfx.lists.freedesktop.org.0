Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D6931296
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 18:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F4189338;
	Fri, 31 May 2019 16:41:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA5A896E7
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 16:24:19 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id e6so3058264pgd.9
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 09:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h/x2RsdaGEeomdfj9zckwm1ZuXHc7ti1LUsxVKWauDI=;
 b=kme3+2y2V6U5TcKOgZA8SeEAUjXfA/WVuVuDn6WwYV6PQaxYUjpeYQV7oVPrapqZyL
 WcPJ79GauvjSaq66fwFgHF0rXOHtPxg0k0IwI1pL3auxqhyvUsQk/8kSeKDIsUTgmtSj
 s1AP/Xguf9HZvB3R2hU4sSP3h+c7JVIeMBi+TcpIeOe1SHHBTmfafeoX6XDlbCruSN9d
 WnyGKbbttoGVTjKMCI3t8OyeMENOl1eNPYvXlTm6OPjDvV9MitD5haEcGBm7pLuaQUJB
 EcJ/kZcBEiEbwfDxZTY6jex3gjOmNjef6xgLa1MFi24Cpbgl6vks9slwISO05/2disKq
 S60w==
X-Gm-Message-State: APjAAAWnxo6WXAW7n5diFvE9syK3LZUEDa8OqH4hlTc1Jn2sdDuYWnMm
 M5kdb4FqAEoHsf84BYQxzi8Ee8Kft0oHmwFb3VkC4w==
X-Google-Smtp-Source: APXvYqxuY1CYuxd04Kewq/lINHwhx4xTvJLFZIhJ6+qsHKD7HtPQ0W1vOSTfUsi9VyOoypjJcb2qINRGGNrlijbQeNg=
X-Received: by 2002:a62:2c17:: with SMTP id s23mr11223321pfs.51.1559319859023; 
 Fri, 31 May 2019 09:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190521182932.sm4vxweuwo5ermyd@mbp>
 <201905211633.6C0BF0C2@keescook>
 <6049844a-65f5-f513-5b58-7141588fef2b@oracle.com>
 <20190523201105.oifkksus4rzcwqt4@mbp>
 <ffe58af3-7c70-d559-69f6-1f6ebcb0fec6@oracle.com>
 <20190524101139.36yre4af22bkvatx@mbp>
 <c6dd53d8-142b-3d8d-6a40-d21c5ee9d272@oracle.com>
 <CAAeHK+yAUsZWhp6xPAbWewX5Nbw+-G3svUyPmhXu5MVeEDKYvA@mail.gmail.com>
 <20190530171540.GD35418@arrakis.emea.arm.com>
 <CAAeHK+y34+SNz3Vf+_378bOxrPaj_3GaLCeC2Y2rHAczuaSz1A@mail.gmail.com>
 <20190531161954.GA3568@arrakis.emea.arm.com>
In-Reply-To: <20190531161954.GA3568@arrakis.emea.arm.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Fri, 31 May 2019 18:24:06 +0200
Message-ID: <CAAeHK+zRDD7ZPPUA9cpwHOdgTRrJLWAby8Wg9oPgmhqMpHwvFw@mail.gmail.com>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mailman-Approved-At: Fri, 31 May 2019 16:41:11 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=h/x2RsdaGEeomdfj9zckwm1ZuXHc7ti1LUsxVKWauDI=;
 b=WkbNgEwAtHoOpsgf2n/OOj9tvUzmqxkk0wFQPqMbZDhKXrycKmph8DKGky42GC+koN
 LJDEln958wkwnmRH28ZEap3NrGgf1V1D0g9IZCcP3z1+J4jMqALHLTOUy5KwiFNCWFFp
 J5Vof1T/5pKxOH0N8kkgt3VneNxkghx7TLiVO3NO5Dfw0XE9zLDEnv4oejnEpiTXZOeJ
 tDxDbRBsv0ZCYRogl5V2uwQD8iTi3aUBJXQrVEho7perE1vFrdRi0BvQ0ve9Pq7qowuL
 FRZuY21tQBRvNHvnsPyF6is+8mWCTar820ssvKvNtiwoTjNWK3ZyaVAaR6TMz/HMowZi
 esrQ==
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgenii Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@mellanox.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Elliott Hughes <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgNjoyMCBQTSBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4u
bWFyaW5hc0Bhcm0uY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgTWF5IDMxLCAyMDE5IGF0IDA0OjI5
OjEwUE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBPbiBUaHUsIE1heSAzMCwg
MjAxOSBhdCA3OjE1IFBNIENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+
IHdyb3RlOgo+ID4gPiBPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCAwNDoxNDo0NVBNICswMjAwLCBB
bmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+ID4gPiA+IFRoYW5rcyBmb3IgYSBsb3Qgb2YgdmFsdWFi
bGUgaW5wdXQhIEkndmUgcmVhZCB0aHJvdWdoIGFsbCB0aGUgcmVwbGllcwo+ID4gPiA+IGFuZCBn
b3Qgc29tZXdoYXQgbG9zdC4gV2hhdCBhcmUgdGhlIGNoYW5nZXMgSSBuZWVkIHRvIGRvIHRvIHRo
aXMKPiA+ID4gPiBzZXJpZXM/Cj4gPiA+ID4KPiA+ID4gPiAxLiBTaG91bGQgSSBtb3ZlIHVudGFn
Z2luZyBmb3IgbWVtb3J5IHN5c2NhbGxzIGJhY2sgdG8gdGhlIGdlbmVyaWMKPiA+ID4gPiBjb2Rl
IHNvIG90aGVyIGFyY2hlcyB3b3VsZCBtYWtlIHVzZSBvZiBpdCBhcyB3ZWxsLCBvciBzaG91bGQg
SSBrZWVwCj4gPiA+ID4gdGhlIGFybTY0IHNwZWNpZmljIG1lbW9yeSBzeXNjYWxscyB3cmFwcGVy
cyBhbmQgYWRkcmVzcyB0aGUgY29tbWVudHMKPiA+ID4gPiBvbiB0aGF0IHBhdGNoPwo+ID4gPgo+
ID4gPiBLZWVwIHRoZW0gZ2VuZXJpYyBhZ2FpbiBidXQgbWFrZSBzdXJlIHdlIGdldCBhZ3JlZW1l
bnQgd2l0aCBLaGFsaWQgb24KPiA+ID4gdGhlIGFjdHVhbCBBQkkgaW1wbGljYXRpb25zIGZvciBz
cGFyYy4KPiA+Cj4gPiBPSywgd2lsbCBkby4gSSBmaW5kIGl0IGhhcmQgdG8gdW5kZXJzdGFuZCB3
aGF0IHRoZSBBQkkgaW1wbGljYXRpb25zCj4gPiBhcmUuIEknbGwgcG9zdCB0aGUgbmV4dCB2ZXJz
aW9uIHdpdGhvdXQgdW50YWdnaW5nIGluIGJyaywgbW1hcCwKPiA+IG11bm1hcCwgbXJlbWFwIChm
b3IgbmV3X2FkZHJlc3MpLCBtbWFwX3Bnb2ZmLCByZW1hcF9maWxlX3BhZ2VzLCBzaG1hdAo+ID4g
YW5kIHNobWR0Lgo+Cj4gSXQncyBtb3JlIGFib3V0IG5vdCByZWxheGluZyB0aGUgQUJJIHRvIGFj
Y2VwdCBub24temVybyB0b3AtYnl0ZSB1bmxlc3MKPiB3ZSBoYXZlIGEgdXNlLWNhc2UgZm9yIGl0
LiBGb3IgbW1hcCgpIGV0Yy4sIEkgZG9uJ3QgdGhpbmsgdGhhdCdzIG5lZWRlZAo+IGJ1dCBpZiB5
b3UgdGhpbmsgb3RoZXJ3aXNlLCBwbGVhc2UgcmFpc2UgaXQuCj4KPiA+ID4gPiAyLiBTaG91bGQg
SSBtYWtlIHVudGFnZ2luZyBvcHQtaW4gYW5kIGNvbnRyb2xsZWQgYnkgYSBjb21tYW5kIGxpbmUg
YXJndW1lbnQ/Cj4gPiA+Cj4gPiA+IE9wdC1pbiwgeWVzLCBidXQgcGVyIHRhc2sgcmF0aGVyIHRo
YW4ga2VybmVsIGNvbW1hbmQgbGluZSBvcHRpb24uCj4gPiA+IHByY3RsKCkgaXMgYSBwb3NzaWJp
bGl0eSBvZiBvcHRpbmcgaW4uCj4gPgo+ID4gT0suIFNob3VsZCBJIHN0b3JlIGEgZmxhZyBzb21l
d2hlcmUgaW4gdGFza19zdHJ1Y3Q/IFNob3VsZCBpdCBiZQo+ID4gaW5oZXJpdGFibGUgb24gY2xv
bmU/Cj4KPiBBIFRJRiBmbGFnIHdvdWxkIGRvIGJ1dCBJJ2Qgc2F5IGxlYXZlIGl0IG91dCBmb3Ig
bm93IChkZWZhdWx0IG9wdGVkIGluKQo+IHVudGlsIHdlIGZpZ3VyZSBvdXQgdGhlIGJlc3Qgd2F5
IHRvIGRvIHRoaXMgKGNhbiBiZSBhIHBhdGNoIG9uIHRvcCBvZgo+IHRoaXMgc2VyaWVzKS4KCllv
dSBtZWFuIGxlYXZlIHRoZSB3aG9sZSBvcHQtaW4vcHJjdGwgcGFydCBvdXQ/IFNvIHRoZSBvbmx5
IGNoYW5nZQp3b3VsZCBiZSB0byBtb3ZlIHVudGFnZ2luZyBmb3IgbWVtb3J5IHN5c2NhbGxzIGlu
dG8gZ2VuZXJpYyBjb2RlPwoKPgo+IFRoYW5rcy4KPgo+IC0tCj4gQ2F0YWxpbgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
