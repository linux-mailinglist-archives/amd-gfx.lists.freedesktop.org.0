Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B3532A00
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Jun 2019 09:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0444889C03;
	Mon,  3 Jun 2019 07:46:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B683789364
 for <amd-gfx@lists.freedesktop.org>; Sun,  2 Jun 2019 05:06:13 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id z3so6326973pgp.8
 for <amd-gfx@lists.freedesktop.org>; Sat, 01 Jun 2019 22:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8FrEn8Oc47oyqvsIyUn+ei84DckXK5ddHX1nKUOQVF0=;
 b=HhtA+WTacOpS5whbmahfxssPW+1Kt0OprVZsebRjbQtCZUD+avvcAdrl0N/40sODtl
 yDRtYJ5j8MAbr5Sk2MuuxPVrpGnYEyJuYR4/Pmwuu9xMVgY0MeO6NH4pSzDvoMRxpzIv
 Y9F05w5nO3Dkf+D+czSkuOHSFWOE1mEGfjZp+dCjUwwyXJp09bwXq+bLVhCaoI+yIMcK
 CcwIL3kqYvofK+0yk0iO4YQZ1kAOfv0CPcp+y3s0PT4hk01Xg/gTMz23ltlvRyPhiwzk
 NSmWeoVan/LL48y//ouPjp0P8Q5Nqt1YEhZzT4tG3kia9it0jzgLxmMBZawqgTgtafqU
 9Zdw==
X-Gm-Message-State: APjAAAUd6VBvL0mNkL35ETqR/4aZDdFnOiYYodmuhrbXVADzU4dNGTto
 0Vyr/vaWTphS0lcJB6NxrIdb+w==
X-Google-Smtp-Source: APXvYqww51z53Fj+SFur89FkVZvsAjQrEhIV13t8870aGnrYJ2f32X4e6lxRmTKOa2Pc17jm0i7ppA==
X-Received: by 2002:a65:520b:: with SMTP id o11mr20347226pgp.184.1559451973138; 
 Sat, 01 Jun 2019 22:06:13 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id x28sm12472404pfo.78.2019.06.01.22.06.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 01 Jun 2019 22:06:12 -0700 (PDT)
Date: Sat, 1 Jun 2019 22:06:10 -0700
From: Kees Cook <keescook@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
Message-ID: <201906012156.55E2C45@keescook>
References: <201905211633.6C0BF0C2@keescook>
 <20190522101110.m2stmpaj7seezveq@mbp>
 <CAJgzZoosKBwqXRyA6fb8QQSZXFqfHqe9qO9je5TogHhzuoGXJQ@mail.gmail.com>
 <20190522163527.rnnc6t4tll7tk5zw@mbp>
 <201905221316.865581CF@keescook>
 <20190523144449.waam2mkyzhjpqpur@mbp>
 <201905230917.DEE7A75EF0@keescook>
 <20190523174345.6sv3kcipkvlwfmox@mbp>
 <201905231327.77CA8D0A36@keescook>
 <20190528170244.GF32006@arrakis.emea.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528170244.GF32006@arrakis.emea.arm.com>
X-Mailman-Approved-At: Mon, 03 Jun 2019 07:46:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8FrEn8Oc47oyqvsIyUn+ei84DckXK5ddHX1nKUOQVF0=;
 b=I+l433GU6rh5Vh+cXRg2sWftONjf5E0xtYRJR0maMC3On194A0XuFQ8es0fmdrLaO4
 QMulbFvcAdi+pOn8HpskX0ufgW7qoStMxwwMGtpoIzBLU8ImYfubQhLJZlu5J4RYe6TO
 Yim8ter4osHiihcYza518LDlKNV+048cHSWMc=
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
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
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
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDY6MDI6NDVQTSArMDEwMCwgQ2F0YWxpbiBNYXJpbmFz
IHdyb3RlOgo+IE9uIFRodSwgTWF5IDIzLCAyMDE5IGF0IDAyOjMxOjE2UE0gLTA3MDAsIEtlZXMg
Q29vayB3cm90ZToKPiA+IHN5emthbGxlciBhbHJlYWR5IGF0dGVtcHRzIHRvIHJhbmRvbWx5IGlu
amVjdCBub24tY2Fub25pY2FsIGFuZAo+ID4gMHhGRkZGLi4uLkZGRkYgYWRkcmVzc2VzIGZvciB1
c2VyIHBvaW50ZXJzIGluIHN5c2NhbGxzIGluIGFuIGVmZm9ydCB0bwo+ID4gZmluZCBidWdzIGxp
a2UgQ1ZFLTIwMTctNTEyMyB3aGVyZSB3YWl0aWQoKSB2aWEgdW5jaGVja2VkIHB1dF91c2VyKCkg
d2FzCj4gPiBhYmxlIHRvIHdyaXRlIGRpcmVjdGx5IHRvIGtlcm5lbCBtZW1vcnlbMV0uCj4gPiAK
PiA+IEl0IHNlZW1zIHRoYXQgdXNpbmcgVEJJIGJ5IGRlZmF1bHQgYW5kIG5vdCBhbGxvd2luZyBh
IHN3aXRjaCBiYWNrIHRvCj4gPiAibm9ybWFsIiBBQkkgd2l0aG91dCBhIHJlYm9vdCBhY3R1YWxs
eSBtZWFucyB0aGF0IHVzZXJzcGFjZSBjYW5ub3QgaW5qZWN0Cj4gPiBrZXJuZWwgcG9pbnRlcnMg
aW50byBzeXNjYWxscyBhbnkgbW9yZSwgc2luY2UgdGhleSdsbCBnZXQgdW5pdmVyc2FsbHkKPiA+
IHN0cmlwcGVkIG5vdy4gSXMgbXkgdW5kZXJzdGFuZGluZyBjb3JyZWN0LCBoZXJlPyBpLmUuIGV4
cGxvaXRpbmcKPiA+IENWRS0yMDE3LTUxMjMgd291bGQgYmUgaW1wb3NzaWJsZSB1bmRlciBUQkk/
Cj4gPiAKPiA+IElmIHNvLCB0aGVuIEkgdGhpbmsgd2Ugc2hvdWxkIGNvbW1pdCB0byB0aGUgVEJJ
IEFCSSBhbmQgaGF2ZSBhIGJvb3QKPiA+IGZsYWcgdG8gZGlzYWJsZSBpdCwgYnV0IE5PVCBoYXZl
IGEgcHJvY2VzcyBmbGFnLCBhcyB0aGF0IHdvdWxkIGFsbG93Cj4gPiBhdHRhY2tlcnMgdG8gYnlw
YXNzIHRoZSBtYXNraW5nLiBUaGUgb25seSBmbGFnIHNob3VsZCBiZSAiVEJJIG9yIE1URSIuCj4g
PiAKPiA+IElmIHNvLCBjYW4gSSBnZXQgdG9wIGJ5dGUgbWFza2luZyBmb3Igb3RoZXIgYXJjaGl0
ZWN0dXJlcyB0b28/IExpa2UsCj4gPiBqdXN0IHRvIHN0cmlwIGhpZ2ggYml0cyBvZmYgdXNlcnNw
YWNlIGFkZHJlc3Nlcz8gOykKPiAKPiBKdXN0IGZvciBmdW4sIGhhY2svYXR0ZW1wdCBhdCB5b3Vy
IGlkZWEgd2hpY2ggc2hvdWxkIG5vdCBpbnRlcmZlcmUgd2l0aAo+IFRCSS4gT25seSBicmllZmx5
IHRlc3RlZCBvbiBhcm02NCAoYW5kIHRoZSBzMzkwIF9fVFlQRV9JU19QVFIgbWFjcm8gaXMKPiBw
cmV0dHkgd2VpcmQgOykpOgoKT01HLCB0aGlzIGlzIGFtYXppbmcgYW5kIGJvbmtlcnMuIEkgbG92
ZSBpdC4KCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS04PC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+IGRpZmYgLS1naXQgYS9hcmNoL3MzOTAvaW5jbHVkZS9hc20vY29tcGF0
LmggYi9hcmNoL3MzOTAvaW5jbHVkZS9hc20vY29tcGF0LmgKPiBpbmRleCA2M2I0NmUzMGIyYzMu
LjMzODQ1NWE3NGVmZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3MzOTAvaW5jbHVkZS9hc20vY29tcGF0
LmgKPiArKysgYi9hcmNoL3MzOTAvaW5jbHVkZS9hc20vY29tcGF0LmgKPiBAQCAtMTEsOSArMTEs
NiBAQAo+ICAKPiAgI2luY2x1ZGUgPGFzbS1nZW5lcmljL2NvbXBhdC5oPgo+ICAKPiAtI2RlZmlu
ZSBfX1RZUEVfSVNfUFRSKHQpICghX19idWlsdGluX3R5cGVzX2NvbXBhdGlibGVfcCggXAo+IC0J
CQkJdHlwZW9mKDA/KF9fZm9yY2UgdCkwOjBVTEwpLCB1NjQpKQo+IC0KPiAgI2RlZmluZSBfX1ND
X0RFTE9VU0UodCx2KSAoeyBcCj4gIAlCVUlMRF9CVUdfT04oc2l6ZW9mKHQpID4gNCAmJiAhX19U
WVBFX0lTX1BUUih0KSk7IFwKPiAgCShfX2ZvcmNlIHQpKF9fVFlQRV9JU19QVFIodCkgPyAoKHYp
ICYgMHg3ZmZmZmZmZikgOiAodikpOyBcCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvc3lz
Y2FsbHMuaCBiL2luY2x1ZGUvbGludXgvc3lzY2FsbHMuaAo+IGluZGV4IGUyODcwZmUxYmU1Yi4u
YjFiOWZlODUwMmRhIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvc3lzY2FsbHMuaAo+ICsr
KyBiL2luY2x1ZGUvbGludXgvc3lzY2FsbHMuaAo+IEBAIC0xMTksOCArMTE5LDE1IEBAIHN0cnVj
dCBpb191cmluZ19wYXJhbXM7Cj4gICNkZWZpbmUgX19UWVBFX0lTX0wodCkJKF9fVFlQRV9BUyh0
LCAwTCkpCj4gICNkZWZpbmUgX19UWVBFX0lTX1VMKHQpCShfX1RZUEVfQVModCwgMFVMKSkKPiAg
I2RlZmluZSBfX1RZUEVfSVNfTEwodCkgKF9fVFlQRV9BUyh0LCAwTEwpIHx8IF9fVFlQRV9BUyh0
LCAwVUxMKSkKPiArI2RlZmluZSBfX1RZUEVfSVNfUFRSKHQpICghX19idWlsdGluX3R5cGVzX2Nv
bXBhdGlibGVfcCh0eXBlb2YoMCA/IChfX2ZvcmNlIHQpMCA6IDBVTEwpLCB1NjQpKQo+ICAjZGVm
aW5lIF9fU0NfTE9ORyh0LCBhKSBfX3R5cGVvZihfX2J1aWx0aW5fY2hvb3NlX2V4cHIoX19UWVBF
X0lTX0xMKHQpLCAwTEwsIDBMKSkgYQo+ICsjaWZkZWYgQ09ORklHXzY0QklUCj4gKyNkZWZpbmUg
X19TQ19DQVNUKHQsIGEpCShfX1RZUEVfSVNfUFRSKHQpIFwKPiArCQkJCT8gKF9fZm9yY2UgdCkg
KChfX3U2NClhICYgfigxVUwgPDwgNTUpKSBcCj4gKwkJCQk6IChfX2ZvcmNlIHQpIGEpCj4gKyNl
bHNlCj4gICNkZWZpbmUgX19TQ19DQVNUKHQsIGEpCShfX2ZvcmNlIHQpIGEKPiArI2VuZGlmCj4g
ICNkZWZpbmUgX19TQ19BUkdTKHQsIGEpCWEKPiAgI2RlZmluZSBfX1NDX1RFU1QodCwgYSkgKHZv
aWQpQlVJTERfQlVHX09OX1pFUk8oIV9fVFlQRV9JU19MTCh0KSAmJiBzaXplb2YodCkgPiBzaXpl
b2YobG9uZykpCgpJJ20gbGF1Z2hpbmcsIEknbSBjcnlpbmcuIE5vdyBJIGhhdmUgdG8gZ28gbG9v
ayBhdCB0aGUgZGlzYXNzZW1ibHkgdG8Kc2VlIGhvdyB0aGlzIGFjdHVhbGx5IGxvb2tzLiAoSSBt
ZWFuLCBpdCBfZG9lc18gc29sdmUgbXkgc3BlY2lmaWMgY2FzZQpvZiB0aGUgd2FpdGlkKCkgZmxh
dywgYnV0IHdvdWxkbid0IGhlbHAgd2l0aCBwb2ludGVycyBkZWVwZXIgaW4gc3RydWN0cywKZXRj
LCB0aG91Z2ggVEJJIGRvZXMsIEkgdGhpbmsgc3RpbGwgaGVscCB3aXRoIHRoYXQuIEkgaGF2ZSB0
byBjYXRjaCBiYWNrCnVwIG9uIHRoZSB0aHJlYWQuLi4pIEFueXdheSwgaWYgaXQncyBub3QgdG9v
IGV4cGVuc2l2ZSBpdCdkIGJsb2NrCnJlYWNoYWJpbGl0eSBmb3IgdGhvc2Uga2luZHMgb2YgZmxh
d3MuCgpJIHdvbmRlciB3aGF0IG15IGNoYW5jZXMgYXJlIG9mIGFjdHVhbGx5IGdldHRpbmcgdGhp
cyBsYW5kZWQ/IDopCihUaG91Z2gsIEkgZ3Vlc3MgSSBuZWVkIHRvIGZpbmQgYSAiVkEgd2lkdGgi
IG1hY3JvIGluc3RlYWQgb2YgYSByYXcgNTUuKQoKVGhhbmtzIGZvciB0aGlua2luZyBvZiBfX1ND
X0NBU1QoKSBhbmQgX19UWVBFX0lTX1BUUigpIHRvZ2V0aGVyLiBSZWFsbHkKbWFkZSBteSBkYXku
IDopCgotLSAKS2VlcyBDb29rCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
