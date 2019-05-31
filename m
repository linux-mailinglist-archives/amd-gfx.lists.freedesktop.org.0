Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6DA310B1
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 16:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794848959D;
	Fri, 31 May 2019 14:56:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A68289503
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 14:29:22 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id s24so3953818plr.8
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 07:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=evy368hWiI+gBYUbtpZ/Z/NwaFGt0gP/Ku0Se7jRDIs=;
 b=PYshz0Ry4QUfoOuFysw47EHY7/gqdrha5pgxiU8QB9u2vWvawB863L9XaHQYlzqwi1
 G2gQJBCdAaijtMF7goQrQkAReD1vs6v+WNxbEK6HVsuDNxJUhIDtTSMSbF9l66CV1YIB
 ah/Fzcu7RvVRLV+NS43hfJhP+y5eU4FTnUC3CH2K/F4JIEqgeYt8CfRcek9ufAK0XxiN
 +ikoKZN/+tzX51M4cSCf+aLyt7d1fvkMOqwdrB0XlX7Dr85UENnpZ2lEYxp1KHAUTXEJ
 v3wgBJHvoq7OJEYs7HFnkgNb2HcqtvLfta+XzcMe+Qc6dedpdo+U6nx/yfvbnU+qWhqv
 JZ6g==
X-Gm-Message-State: APjAAAWSBDISCamqiS1f7eaxrrFk4ngL8IK63WOb0gUXGTYQGwEQ6wQp
 aNDE5oVeas0hBk9glPusFHiwig/PF4ZEw8L9fq89bg==
X-Google-Smtp-Source: APXvYqzZNq7ZmlghEU+anyWYnwjjhfBSO821IIVYI0unmJhzupp13rZUJ7jf2s8ZHPUTRKkSRgHsOXgkfcRcIwbO8eo=
X-Received: by 2002:a17:902:8609:: with SMTP id
 f9mr9244481plo.252.1559312961740; 
 Fri, 31 May 2019 07:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190517144931.GA56186@arrakis.emea.arm.com>
 <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp> <201905211633.6C0BF0C2@keescook>
 <6049844a-65f5-f513-5b58-7141588fef2b@oracle.com>
 <20190523201105.oifkksus4rzcwqt4@mbp>
 <ffe58af3-7c70-d559-69f6-1f6ebcb0fec6@oracle.com>
 <20190524101139.36yre4af22bkvatx@mbp>
 <c6dd53d8-142b-3d8d-6a40-d21c5ee9d272@oracle.com>
 <CAAeHK+yAUsZWhp6xPAbWewX5Nbw+-G3svUyPmhXu5MVeEDKYvA@mail.gmail.com>
 <20190530171540.GD35418@arrakis.emea.arm.com>
In-Reply-To: <20190530171540.GD35418@arrakis.emea.arm.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Fri, 31 May 2019 16:29:10 +0200
Message-ID: <CAAeHK+y34+SNz3Vf+_378bOxrPaj_3GaLCeC2Y2rHAczuaSz1A@mail.gmail.com>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mailman-Approved-At: Fri, 31 May 2019 14:56:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=evy368hWiI+gBYUbtpZ/Z/NwaFGt0gP/Ku0Se7jRDIs=;
 b=sQG2/gyFbhvQgnnYVMoq8Kda68VVztjS6NpVGpn+TJ/0x1CnUPLFGI7CfwhDx4Acpv
 +b2SfJPlJiXKHOPX0vraeScgQBz7b7Nl6PyJKu6e145lCoysI0y6J5myuuCSNlucfPw4
 OziFqAsvBRMmxzPBSxXT6y9ZOWT1qftFo2UhubNHkIM+xAKIuSxRN1IDkqLlB5D+IEDh
 9Lbkk942zOUUnqGLz1d6wvbTAZV2QEf8AYds1RPyvHK7XFYBgL+gUTiPMyMH1+mL85z0
 rHLvvgL9h/d8SCsWwDzjC1mOEMEITHFigTDJGZoVkvgiZ6th+Bg/aZrVlKENNn6Dl+G9
 3qvw==
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

T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgNzoxNSBQTSBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4u
bWFyaW5hc0Bhcm0uY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWF5IDI4LCAyMDE5IGF0IDA0OjE0
OjQ1UE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBUaGFua3MgZm9yIGEgbG90
IG9mIHZhbHVhYmxlIGlucHV0ISBJJ3ZlIHJlYWQgdGhyb3VnaCBhbGwgdGhlIHJlcGxpZXMKPiA+
IGFuZCBnb3Qgc29tZXdoYXQgbG9zdC4gV2hhdCBhcmUgdGhlIGNoYW5nZXMgSSBuZWVkIHRvIGRv
IHRvIHRoaXMKPiA+IHNlcmllcz8KPiA+Cj4gPiAxLiBTaG91bGQgSSBtb3ZlIHVudGFnZ2luZyBm
b3IgbWVtb3J5IHN5c2NhbGxzIGJhY2sgdG8gdGhlIGdlbmVyaWMKPiA+IGNvZGUgc28gb3RoZXIg
YXJjaGVzIHdvdWxkIG1ha2UgdXNlIG9mIGl0IGFzIHdlbGwsIG9yIHNob3VsZCBJIGtlZXAKPiA+
IHRoZSBhcm02NCBzcGVjaWZpYyBtZW1vcnkgc3lzY2FsbHMgd3JhcHBlcnMgYW5kIGFkZHJlc3Mg
dGhlIGNvbW1lbnRzCj4gPiBvbiB0aGF0IHBhdGNoPwo+Cj4gS2VlcCB0aGVtIGdlbmVyaWMgYWdh
aW4gYnV0IG1ha2Ugc3VyZSB3ZSBnZXQgYWdyZWVtZW50IHdpdGggS2hhbGlkIG9uCj4gdGhlIGFj
dHVhbCBBQkkgaW1wbGljYXRpb25zIGZvciBzcGFyYy4KCk9LLCB3aWxsIGRvLiBJIGZpbmQgaXQg
aGFyZCB0byB1bmRlcnN0YW5kIHdoYXQgdGhlIEFCSSBpbXBsaWNhdGlvbnMKYXJlLiBJJ2xsIHBv
c3QgdGhlIG5leHQgdmVyc2lvbiB3aXRob3V0IHVudGFnZ2luZyBpbiBicmssIG1tYXAsCm11bm1h
cCwgbXJlbWFwIChmb3IgbmV3X2FkZHJlc3MpLCBtbWFwX3Bnb2ZmLCByZW1hcF9maWxlX3BhZ2Vz
LCBzaG1hdAphbmQgc2htZHQuCgo+Cj4gPiAyLiBTaG91bGQgSSBtYWtlIHVudGFnZ2luZyBvcHQt
aW4gYW5kIGNvbnRyb2xsZWQgYnkgYSBjb21tYW5kIGxpbmUgYXJndW1lbnQ/Cj4KPiBPcHQtaW4s
IHllcywgYnV0IHBlciB0YXNrIHJhdGhlciB0aGFuIGtlcm5lbCBjb21tYW5kIGxpbmUgb3B0aW9u
Lgo+IHByY3RsKCkgaXMgYSBwb3NzaWJpbGl0eSBvZiBvcHRpbmcgaW4uCgpPSy4gU2hvdWxkIEkg
c3RvcmUgYSBmbGFnIHNvbWV3aGVyZSBpbiB0YXNrX3N0cnVjdD8gU2hvdWxkIGl0IGJlCmluaGVy
aXRhYmxlIG9uIGNsb25lPwoKPgo+ID4gMy4gU2hvdWxkIEkgImFkZCBEb2N1bWVudGF0aW9uL2Nv
cmUtYXBpL3VzZXItYWRkcmVzc2VzLnJzdCB0byBkZXNjcmliZQo+ID4gcHJvcGVyIGNhcmUgYW5k
IGhhbmRsaW5nIG9mIHVzZXIgc3BhY2UgcG9pbnRlcnMgd2l0aCB1bnRhZ2dlZF9hZGRyKCksCj4g
PiB3aXRoIGV4YW1wbGVzIGJhc2VkIG9uIGFsbCB0aGUgY2FzZXMgc2VlbiBzbyBmYXIgaW4gdGhp
cyBzZXJpZXMiPwo+ID4gV2hpY2ggZXhhbXBsZXMgc3BlY2lmaWNhbGx5IHNob3VsZCBpdCBjb3Zl
cj8KPgo+IEkgdGhpbmsgd2UgY2FuIGxlYXZlIDMgZm9yIG5vdyBhcyBub3QgdG9vIHVyZ2VudC4g
V2hhdCBJJ2QgbGlrZSBpcyBmb3IKPiBWaW5jZW56bydzIFRCSSB1c2VyIEFCSSBkb2N1bWVudCB0
byBnbyBpbnRvIGEgbW9yZSBjb21tb24gcGxhY2Ugc2luY2Ugd2UKPiBjYW4gZXhwYW5kIGl0IHRv
IGNvdmVyIGJvdGggc3BhcmMgYW5kIGFybTY0LiBXZSdkIG5lZWQgYW4gYXJtNjQtc3BlY2lmaWMK
PiBkb2MgYXMgd2VsbCBmb3IgdGhpbmdzIGxpa2UgcHJjdGwoKSBhbmQgbGF0ZXIgTVRFIHRoYXQg
c3BhcmMgbWF5IHN1cHBvcnQKPiBkaWZmZXJlbnRseS4KCk9LLgoKPgo+IC0tCj4gQ2F0YWxpbgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
