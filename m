Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC4C1DD3A2
	for <lists+amd-gfx@lfdr.de>; Thu, 21 May 2020 19:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF266E950;
	Thu, 21 May 2020 17:00:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6153B6E950
 for <amd-gfx@lists.freedesktop.org>; Thu, 21 May 2020 17:00:58 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g12so6164972wrw.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 21 May 2020 10:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pp6cMeI8G6Bl1hh+aTvlfG3wjk74T8RnlGFlIuY4ti4=;
 b=CiMVatEPIfD0ssG6Yteo79INuRsUk1m6/FUSLW9PINoyZCKuMIk+VHxEBvEZTgWexa
 GO7TLaJREPhQbXAoyKKzB6TorNv+tfK2W+vqQcp97eTaJJmNLDEt+/ihBUeMtnTOmjMv
 aV8US34tzrboKAyOUW8PMSaYv7YhHlRZblYlQiiUHxqZy0z0X+nHN9YRKVwp55e1eWIl
 uVAzzu6ftI6pz0wZMmD7UHcT2WMcPTNV8QYseaLUiTQNX//8MLi0JVw8TePEQ3EkP4Qw
 CgAqcwqStruDfURPJ4lzUzJR4z1sZinPnjrFjeMI2sR6wBejyMPMnYM8MA7PMneKj7Q1
 CY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pp6cMeI8G6Bl1hh+aTvlfG3wjk74T8RnlGFlIuY4ti4=;
 b=Rn8/Ik04WaATcSW9MnwDRZ5/6D7IZm4tOD6hg/1cgwvu87WWR7Lo0EPNmsGM/4s4R7
 XhRxghoEHQCwKjWZWaZ9tBkZbBSv03b6YZj48uTMV+0qxD4JWHVaCj0Vy3eJEtulgsOb
 oTI726SzI80cSXHBNM8VaCjepbBPmoBHI4zAV3WkKcLaxUk9brQrpKXnjoHSsaxCYJtT
 bNDvTvHV94QV+YNyQb07tHRUkPkBfcFBs72UDYdbRDLtd8fmtXh6sNQD4cf7ju0+IjpU
 8hzPaAhoGjKVQ9PrW7Ma+k8HSTCR1gN72NFnxockqyswA1C1+5NqFyzG+uVqouMC2G1N
 iQDQ==
X-Gm-Message-State: AOAM530MfaA/cfOiWc1XzoQzcJbib7IGZUfkap5SMJoyFM/CvBW+ef45
 5uUtBiVspCBSs6yl2PEUekfh0qXhnHyQd7CUfnUv/E3S
X-Google-Smtp-Source: ABdhPJxol/WG7dmXW/Injl/7lvfLyxBGojNSq2iUn19/PiuBWpnenMTi6GpGlFQ4PK8OO0IQMNri/D7Qg09uso3CI9M=
X-Received: by 2002:adf:9264:: with SMTP id 91mr9129123wrj.362.1590080456829; 
 Thu, 21 May 2020 10:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <1590057794-14232-1-git-send-email-curry.gong@amd.com>
In-Reply-To: <1590057794-14232-1-git-send-email-curry.gong@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 21 May 2020 13:00:45 -0400
Message-ID: <CADnq5_PreL6Gdz50hU8Avt4Lp_0hhz4x=Cuwfa0UJ-mC6x4ZXg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerpay: Disable gfxoff when setting manual mode
 on picasso and raven
To: chen gong <curry.gong@amd.com>
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjEsIDIwMjAgYXQgNjo0MyBBTSBjaGVuIGdvbmcgPGN1cnJ5LmdvbmdAYW1k
LmNvbT4gd3JvdGU6Cj4KPiBbUHJvYmxlbSBkZXNjcmlwdGlvbl0KPiAxLiBCb290IHVwIHBpY2Fz
c28gcGxhdGZvcm0sIGxhdW5jaGVzIGRlc2t0b3AsIERvbid0IGRvIGFueXRoaW5nIChBUFUgZW50
ZXIgaW50byAiZ2Z4b2ZmIiBzdGF0ZSkKPiAyLiBSZW1vdGUgbG9naW4gdG8gcGxhdGZvcm0gdXNp
bmcgU1NILCB0aGVuIHR5cGUgdGhlIGNvbW1hbmQgbGluZToKPiAgICAgICAgIHN1ZG8gc3UgLWMg
ImVjaG8gbWFudWFsID4gL3N5cy9jbGFzcy9kcm0vY2FyZDAvZGV2aWNlL3Bvd2VyX2RwbV9mb3Jj
ZV9wZXJmb3JtYW5jZV9sZXZlbCIKPiAgICAgICAgIHN1ZG8gc3UgLWMgImVjaG8gMiA+IC9zeXMv
Y2xhc3MvZHJtL2NhcmQwL2RldmljZS9wcF9kcG1fc2NsayIgKGZpeCBTQ0xLIHRvIDE0MDBNSHop
Cj4gMy4gTW92ZSB0aGUgbW91c2UgYXJvdW5kIGluIFdpbmRvdwo+IDQuIFBoZW5vbWVub24gOiAg
VGhlIHNjcmVlbiBmcm96ZW4KPgo+IFRlc3RlciB3aWxsIHN3aXRjaCBzY2xrIGxldmVsIGR1cmlu
ZyBnbG1hcmsyIHJ1biB0aW1lLgo+IEFQVSB3aWxsIGVudGVyICJnZnhvZmYiIHN0YXRlIGludGVy
bWl0dGVudGx5IGR1cmluZyBnbG1hcmsyIHJ1biB0aW1lLgo+IFRoZSBzeXN0ZW0gZ290IGhhbmdl
ZCBpZiBmaXggR0ZYQ0xLIHRvIDE0MDBNSHogd2hlbiBBUFUgaXMgaW4gImdmeG9mZiIKPiBzdGF0
ZS4KPgo+IFtEZWJ1Z10KPiAxLiBGaXggU0NMSyB0byBYIE1Iego+ICAgICAgICAgMTQwMDogc2Ny
ZWVuIGZyb3plbiwgc2NyZWVuIGJsYWNrLCB0aGVuIE9TIHdpbGwgcmVib290Lgo+ICAgICAgICAg
MTMwMDogc2NyZWVuIGZyb3plbi4KPiAgICAgICAgIDEyMDA6IHNjcmVlbiBmcm96ZW4sIHNjcmVl
biBibGFjay4KPiAgICAgICAgIDExMDA6IHNjcmVlbiBmcm96ZW4sIHNjcmVlbiBibGFjaywgdGhl
biBPUyB3aWxsIHJlYm9vdC4KPiAgICAgICAgIDEwMDA6IHNjcmVlbiBmcm96ZW4sIHNjcmVlbiBi
bGFjay4KPiAgICAgICAgIDkwMDogIHNjcmVlbiBmcm96ZW4sIHNjcmVlbiBibGFjaywgdGhlbiBP
UyB3aWxsIHJlYm9vdC4KPiAgICAgICAgIDgwMDogIFNpdHVhdGlvbiBOb21hbCwgaXNzdWUgZGlz
YXBwZWFyLgo+ICAgICAgICAgNzAwOiAgU2l0dWF0aW9uIE5vbWFsLCBpc3N1ZSBkaXNhcHBlYXIu
Cj4gMi4gU0JJT1Mgc2V0dGluZzogQU1EIENCUyAtLT4gU01VIERlYnVnIE9wdGlvbnMgLS0+U01V
IERlYnVnIC0tPiAiR0ZYIERMRE8gUHNtIE1hcmdpbiBDb250cm9sIjoKPiAgICAgICAgIDUwIDog
U2l0dWF0aW9uIE5vbWFsLCBpc3N1ZSBkaXNhcHBlYXIuCj4gICAgICAgICA0NSA6IFNpdHVhdGlv
biBOb21hbCwgaXNzdWUgZGlzYXBwZWFyLgo+ICAgICAgICAgNDAgOiBTaXR1YXRpb24gTm9tYWws
IGlzc3VlIGRpc2FwcGVhci4KPiAgICAgICAgIDM1IDogU2l0dWF0aW9uIE5vbWFsLCBpc3N1ZSBk
aXNhcHBlYXIuCj4gICAgICAgICAzMCA6IHNjcmVlbiBibGFjay4KPiAgICAgICAgIDI1IDogc2Ny
ZWVuIGZyb3plbiwgdGhlbiBibHVycmVkIHNjcmVlbi4KPiAgICAgICAgIDIwIDogc2NyZWVuIGZy
b3plbi4KPiAgICAgICAgIDE1IDogc2NyZWVuIGJsYWNrLgo+ICAgICAgICAgMTAgOiBzY3JlZW4g
ZnJvemVuLgo+ICAgICAgICAgNSAgOiBzY3JlZW4gZnJvemVuLCB0aGVuIGJsdXJyZWQgc2NyZWVu
Lgo+IDMuIERpc2FibGUgR0ZYT0ZGIGZlYXR1cmUKPiAgICAgICAgIFNpdHVhdGlvbiBOb21hbCwg
aXNzdWUgZGlzYXBwZWFyLgo+Cj4gW1doeV0KPiBUaHJvdWdoIGEgcGVyaW9kIG9mIHRpbWUgZGVi
dWdnaW5nIHdpdGggU3lzIEVuZyB0ZWFtIGFuZCBTTVUgdGVhbSwgU3lzCj4gRW5nIHRlYW0gc2Fp
ZCB0aGlzIGlzIHZvbHRhZ2UvZnJlcXVlbmN5IG1hcmdpbmFsIGlzc3VlIG5vdCBhIEYvVyBvciBI
L1cKPiBidWcuIFRoaXMgZXhwZXJpbWVudCBwcm92ZXMgdGhhdCBkZWZhdWx0IHRhcmdldFBzbSBb
Zm9yIGY9MTQwME1Iel0gaXMKPiBub3Qgc3VmZmljaWVudCB3aGVuIEdGWE9GRiBpcyBlbmFibGVk
IG9uIFBpY2Fzc28uCj4KPiBTTVUgdGVhbSB0aGluayBpdCBpcyBhbiBvZGQgdGVzdCBjb25kaXRp
b25zIHRvIGZvcmNlIHNjbGs9IjE0MDBNSHoiIHdoZW4KPiBHUFUgaXMgaW4gImdmeG9mZiIgc3Rh
dGXvvIx0aGVuIHdha2UgdXAgdGhlIEdGWC4gU0NMSyBzaG91bGQgYmUgaW4gdGhlCj4gImxvd2Vz
dCBmcmVxdWVuY3kiIHdoZW4gZ2Z4b2ZmLgo+Cj4gW0hvd10KPiBEaXNhYmxlIGdmeG9mZiB3aGVu
IHNldHRpbmcgbWFudWFsIG1vZGUuCj4gRW5hYmxlIGdmeG9mZiB3aGVuIHNldHRpbmcgb3RoZXIg
bW9kZShleGl0aW5nIG1hbnVhbCBtb2RlKSBhZ2Fpbi4KPgo+IEJ5IHRoZSB3YXksIGZyb20gdGhl
IHVzZXIgcG9pbnQgb2Ygdmlldywgbm93IHRoYXQgdXNlciBzd2l0Y2ggdG8gbWFudWFsCj4gbW9k
ZSBhbmQgZm9yY2UgU0NMSyBGcmVxdWVuY3ksIGhlIGRvbid0IHdhbnQgU0NMSyBiZSBjb250cm9s
bGVkIGJ5Cj4gd29ya2xvYWQuSXQgYmVjb21lcyBtZWFuaW5nbGVzcyB0byAic3dpdGNoIHRvIG1h
bnVhbCBtb2RlIiBpZiBBUFUgZW50ZXIgImdmeG9mZiIKPiBkdWUgdG8gbGFjayBvZiB3b3JrbG9h
ZCBhdCB0aGlzIHBvaW50Lgo+Cj4gVGlwczogU2FtZSBpc3N1ZSBvYnNlcnZlZCBvbiBSYXZlbi4K
Pgo+IFNpZ25lZC1vZmYtYnk6IGNoZW4gZ29uZyA8Y3VycnkuZ29uZ0BhbWQuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYyB8IDkgKysrKysrKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9wbS5jCj4gaW5kZXggMTdiYzdmNS4uZDQ1Mzk0YyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jCj4gQEAgLTM3MSw2ICszNzEsMTUgQEAgc3RhdGlj
IHNzaXplX3QgYW1kZ3B1X3NldF9wb3dlcl9kcG1fZm9yY2VfcGVyZm9ybWFuY2VfbGV2ZWwoc3Ry
dWN0IGRldmljZSAqZGV2LAo+ICAgICAgICAgICAgICAgICByZXR1cm4gY291bnQ7Cj4gICAgICAg
ICB9Cj4KPiArICAgICAgIGlmKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1JBVkVOKXsKCm1pc3Np
bmcgc3BhY2VzIGFyb3VuZCAoKS4gIEkuZS4sIHNob3VsZCBiZToKKyAgICAgICBpZiAoYWRldi0+
YXNpY190eXBlID09IENISVBfUkFWRU4pIHsKCj4gKyAgICAgICAgICAgICAgIGlmIChhZGV2LT5y
ZXZfaWQgPCA4KXsKCk1pc3Npbmcgc3BhY2UgYWZ0ZXIgKS4gIEkuZS4sIHNob3VsZCBiZToKKyAg
ICAgICAgICAgICAgIGlmIChhZGV2LT5yZXZfaWQgPCA4KSB7CgpXaXRoIHRob3NlIGZpeGVkLCBw
YXRjaCBpczoKUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KCj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKGN1cnJlbnRfbGV2ZWwgIT0gQU1E
X0RQTV9GT1JDRURfTEVWRUxfTUFOVUFMICYmIGxldmVsID09IEFNRF9EUE1fRk9SQ0VEX0xFVkVM
X01BTlVBTCkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFtZGdwdV9nZnhfb2Zm
X2N0cmwoYWRldiwgZmFsc2UpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGVsc2UgaWYgKGN1
cnJlbnRfbGV2ZWwgPT0gQU1EX0RQTV9GT1JDRURfTEVWRUxfTUFOVUFMICYmIGxldmVsICE9IEFN
RF9EUE1fRk9SQ0VEX0xFVkVMX01BTlVBTCkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGFtZGdwdV9nZnhfb2ZmX2N0cmwoYWRldiwgdHJ1ZSk7Cj4gKyAgICAgICAgICAgICAgIH0K
PiArICAgICAgIH0KPiArCj4gICAgICAgICAvKiBwcm9maWxlX2V4aXQgc2V0dGluZyBpcyB2YWxp
ZCBvbmx5IHdoZW4gY3VycmVudCBtb2RlIGlzIGluIHByb2ZpbGUgbW9kZSAqLwo+ICAgICAgICAg
aWYgKCEoY3VycmVudF9sZXZlbCAmIChBTURfRFBNX0ZPUkNFRF9MRVZFTF9QUk9GSUxFX1NUQU5E
QVJEIHwKPiAgICAgICAgICAgICBBTURfRFBNX0ZPUkNFRF9MRVZFTF9QUk9GSUxFX01JTl9TQ0xL
IHwKPiAtLQo+IDIuNy40Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
