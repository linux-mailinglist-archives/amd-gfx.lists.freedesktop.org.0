Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC50C1DBC83
	for <lists+amd-gfx@lfdr.de>; Wed, 20 May 2020 20:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2591689D2F;
	Wed, 20 May 2020 18:17:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF8A89D2F;
 Wed, 20 May 2020 18:17:52 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l18so4146622wrn.6;
 Wed, 20 May 2020 11:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Libttd99iUbokL4eNXNIr0x2nDmN388HD4Hj/6QN9+4=;
 b=qi/PWOKJaIsV+WRD8SAXbG8aQ8LQoyalUhA7Olpw/yRxHn4SbftcXoU4fr2OMo7zJA
 vrkYL2XHObkcLrY85WkFDgXIk1nh5qDkv7ZamU+QJu90n6pEs1hVHKT1gQi3FFRvdKfW
 67XN+uDYqJc05j3k7p8Gg16XxAbTxxWAXKCKQ/6QY2Tmictw9rYlyH3CGFpBhwHuKgW+
 b26KpDvM2qw7+UIcSnngaB+9p/xHHIXZLsprK/c5LPACHlsU3f+keWjSWa3Mv75+g6PQ
 4ehaxW9Cr+XaVRxc2LPIJ2GDjfcj3Icfnml4Q0+TtM2+C0Y6IpP/L3HQOeRjJSDRhiVJ
 qB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Libttd99iUbokL4eNXNIr0x2nDmN388HD4Hj/6QN9+4=;
 b=FA7xt1IYRd28Q/4jzhDtBPrT/oEToyhAsLuAsY6brCkfXlCWb3WaiejrI4Usq1zTaZ
 iFXaOI61n3MpQxSyEi0ECsfh3qlWiCwk4UAQ5+kYTuQuoRlRvRnayg80rMYqASazyVeS
 ZwU7dFepyV8KwNTQrc5wNtuyGHrTwTYlr24Tdh6lhKKKrPdi7xkPXmYNCevHFw1jAcQS
 HLs9TxNmh317lcKmdhvl/jzJaf0xRM0D438xw7Sq9DvyJgGgQCn7btHOtclfps+56NqW
 QcycCq/LAxjpFsu983ML/w0awcp0Ragz6MhNz/Vj/bqlHeNOyZL0+UAQuY8jJRDof2Ml
 nZgA==
X-Gm-Message-State: AOAM532dbLUHRHROretdnwODy0aDtsvxYseFK+U4h01kmF2PxXaZdc3N
 GlcLkN78+So7WkUmkVp/rUemVAvfkkOGi5kV0KE=
X-Google-Smtp-Source: ABdhPJyoS1RFthA0f7b37gtjz2j4Mj2ZP62ahHIpEt7wQO2Vtigm5C5y3TshlxfB86MYYsKGW7XjW3KeZDyTg0zud0w=
X-Received: by 2002:adf:fa91:: with SMTP id h17mr5086725wrr.111.1589998671412; 
 Wed, 20 May 2020 11:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200519225545.GA2066@embeddedor>
 <1065d63e-7959-e4b4-af4e-70607ba92296@amd.com>
In-Reply-To: <1065d63e-7959-e4b4-af4e-70607ba92296@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 20 May 2020 14:17:40 -0400
Message-ID: <CADnq5_MNhmTS_1R+jcngCeDsp1x6U=eVPAGNyE8bEQTg2uzf9w@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/smu10: Replace one-element array and use
 struct_size() helper
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCk9uIFdlZCwgTWF5IDIwLCAyMDIwIGF0IDM6NDIgQU0g
Q2hyaXN0aWFuIEvDtm5pZwo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFt
IDIwLjA1LjIwIHVtIDAwOjU1IHNjaHJpZWIgR3VzdGF2byBBLiBSLiBTaWx2YToKPiA+IFRoZSBj
dXJyZW50IGNvZGViYXNlIG1ha2VzIHVzZSBvZiBvbmUtZWxlbWVudCBhcnJheXMgaW4gdGhlIGZv
bGxvd2luZwo+ID4gZm9ybToKPiA+Cj4gPiBzdHJ1Y3Qgc29tZXRoaW5nIHsKPiA+ICAgICAgaW50
IGxlbmd0aDsKPiA+ICAgICAgdTggZGF0YVsxXTsKPiA+IH07Cj4gPgo+ID4gc3RydWN0IHNvbWV0
aGluZyAqaW5zdGFuY2U7Cj4gPgo+ID4gaW5zdGFuY2UgPSBrbWFsbG9jKHNpemVvZigqaW5zdGFu
Y2UpICsgc2l6ZSwgR0ZQX0tFUk5FTCk7Cj4gPiBpbnN0YW5jZS0+bGVuZ3RoID0gc2l6ZTsKPiA+
IG1lbWNweShpbnN0YW5jZS0+ZGF0YSwgc291cmNlLCBzaXplKTsKPiA+Cj4gPiBidXQgdGhlIHBy
ZWZlcnJlZCBtZWNoYW5pc20gdG8gZGVjbGFyZSB2YXJpYWJsZS1sZW5ndGggdHlwZXMgc3VjaCBh
cwo+ID4gdGhlc2Ugb25lcyBpcyBhIGZsZXhpYmxlIGFycmF5IG1lbWJlclsxXVsyXSwgaW50cm9k
dWNlZCBpbiBDOTk6Cj4gPgo+ID4gc3RydWN0IGZvbyB7Cj4gPiAgICAgICAgICBpbnQgc3R1ZmY7
Cj4gPiAgICAgICAgICBzdHJ1Y3QgYm9vIGFycmF5W107Cj4gPiB9Owo+ID4KPiA+IEJ5IG1ha2lu
ZyB1c2Ugb2YgdGhlIG1lY2hhbmlzbSBhYm92ZSwgd2Ugd2lsbCBnZXQgYSBjb21waWxlciB3YXJu
aW5nCj4gPiBpbiBjYXNlIHRoZSBmbGV4aWJsZSBhcnJheSBkb2VzIG5vdCBvY2N1ciBsYXN0IGlu
IHRoZSBzdHJ1Y3R1cmUsIHdoaWNoCj4gPiB3aWxsIGhlbHAgdXMgcHJldmVudCBzb21lIGtpbmQg
b2YgdW5kZWZpbmVkIGJlaGF2aW9yIGJ1Z3MgZnJvbSBiZWluZwo+ID4gaW5hZHZlcnRlbnRseSBp
bnRyb2R1Y2VkWzNdIHRvIHRoZSBjb2RlYmFzZSBmcm9tIG5vdyBvbi4gU28sIHJlcGxhY2UKPiA+
IHRoZSBvbmUtZWxlbWVudCBhcnJheSB3aXRoIGEgZmxleGlibGUtYXJyYXkgbWVtYmVyLgo+ID4K
PiA+IEFsc28sIG1ha2UgdXNlIG9mIHRoZSBuZXcgc3RydWN0X3NpemUoKSBoZWxwZXIgdG8gcHJv
cGVybHkgY2FsY3VsYXRlIHRoZQo+ID4gc2l6ZSBvZiBzdHJ1Y3Qgc211MTBfdm9sdGFnZV9kZXBl
bmRlbmN5X3RhYmxlLgo+ID4KPiA+IFRoaXMgaXNzdWUgd2FzIGZvdW5kIHdpdGggdGhlIGhlbHAg
b2YgQ29jY2luZWxsZSBhbmQsIGF1ZGl0ZWQgYW5kIGZpeGVkCj4gPiBfbWFudWFsbHlfLgo+ID4K
PiA+IFsxXSBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91
cmw9aHR0cHMlM0ElMkYlMkZnY2MuZ251Lm9yZyUyRm9ubGluZWRvY3MlMkZnY2MlMkZaZXJvLUxl
bmd0aC5odG1sJmFtcDtkYXRhPTAyJTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3
QzhhNDAwYmRiODg5MjRhMWQ5NTE1MDhkN2ZjNDcxOTY2JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFh
ODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzI1NTI1NDYyMjAzOTI2OCZhbXA7c2RhdGE9SUxPUFBu
MTdjJTJCM295TExkaCUyQmdIMmIlMkI4UmRoV3VURkd4cnVSRDdHVUhPbyUzRCZhbXA7cmVzZXJ2
ZWQ9MAo+ID4gWzJdIGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5j
b20vP3VybD1odHRwcyUzQSUyRiUyRmdpdGh1Yi5jb20lMkZLU1BQJTJGbGludXglMkZpc3N1ZXMl
MkYyMSZhbXA7ZGF0YT0wMiU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0M4YTQw
MGJkYjg4OTI0YTFkOTUxNTA4ZDdmYzQ3MTk2NiU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5
NGUxODNkJTdDMCU3QzAlN0M2MzcyNTUyNTQ2MjIwMzkyNjgmYW1wO3NkYXRhPWxDcjVPdGlqNTVT
bnEyN0JEcDRSbXRXNGhOaE9TJTJCbTR2U1VPT0F6MDdYQSUzRCZhbXA7cmVzZXJ2ZWQ9MAo+ID4g
WzNdIGNvbW1pdCA3NjQ5NzczMjkzMmYgKCJjeGdiMy9sMnQ6IEZpeCB1bmRlZmluZWQgYmVoYXZp
b3VyIikKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZv
YXJzQGtlcm5lbC5vcmc+Cj4KPiBBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPgo+Cj4gTWF5IEkgc3VnZ2VzdCB0aGF0IHdlIGFkZCBhIHNlY3Rpb24g
aG93IHRvIGNvcnJlY3RseSBkbyB0aGlzIHRvCj4gRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2NvZGlu
Zy1zdHlsZS5yc3Qgb3Igc2ltaWxhciBkb2N1bWVudD8KPgo+IEkndmUgc2VlbiBhIGJ1bmNoIG9m
IGRpZmZlcmVudCBhcHByb2FjaGVzIGFuZCBzb21lIGV2ZW4gZG9lc24ndCB3b3JrCj4gd2l0aCBz
b21lIGdjYyB2ZXJzaW9ucyBhbmQgcmVzdWx0IGluIGEgYnJva2VuIGJpbmFyeS4KPgo+IFRoYW5r
cywKPiBDaHJpc3RpYW4uCj4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9od21nci9zbXUxMF9od21nci5jIHwgNiArKy0tLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211MTBfaHdtZ3IuaCB8IDIgKy0KPiA+ICAgMiBmaWxlcyBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3NtdTEwX2h3bWdyLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXUxMF9od21nci5jCj4gPiBpbmRl
eCAyNDZiYjlhYzU1N2Q4Li5jOWNmZTkwYTI5NDcxIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211MTBfaHdtZ3IuYwo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211MTBfaHdtZ3IuYwo+ID4gQEAgLTQxMCwx
MiArNDEwLDEwIEBAIHN0YXRpYyBpbnQgc211MTBfZ2V0X2Nsb2NrX3ZvbHRhZ2VfZGVwZW5kZW5j
eV90YWJsZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAo+ID4gICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBzbXUxMF92b2x0YWdlX2RlcGVuZGVuY3lfdGFibGUgKipwcHRhYmxlLAo+ID4gICAg
ICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IG51bV9lbnRyeSwgY29uc3QgRHBtQ2xvY2tfdCAq
cGNsa19kZXBlbmRlbmN5X3RhYmxlKQo+ID4gICB7Cj4gPiAtICAgICB1aW50MzJfdCB0YWJsZV9z
aXplLCBpOwo+ID4gKyAgICAgdWludDMyX3QgaTsKPiA+ICAgICAgIHN0cnVjdCBzbXUxMF92b2x0
YWdlX2RlcGVuZGVuY3lfdGFibGUgKnB0YWJsZTsKPiA+Cj4gPiAtICAgICB0YWJsZV9zaXplID0g
c2l6ZW9mKHVpbnQzMl90KSArIHNpemVvZihzdHJ1Y3Qgc211MTBfdm9sdGFnZV9kZXBlbmRlbmN5
X3RhYmxlKSAqIG51bV9lbnRyeTsKPiA+IC0gICAgIHB0YWJsZSA9IGt6YWxsb2ModGFibGVfc2l6
ZSwgR0ZQX0tFUk5FTCk7Cj4gPiAtCj4gPiArICAgICBwdGFibGUgPSBremFsbG9jKHN0cnVjdF9z
aXplKHB0YWJsZSwgZW50cmllcywgbnVtX2VudHJ5KSwgR0ZQX0tFUk5FTCk7Cj4gPiAgICAgICBp
ZiAoTlVMTCA9PSBwdGFibGUpCj4gPiAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXUx
MF9od21nci5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211MTBfaHdt
Z3IuaAo+ID4gaW5kZXggMWZiMjk2YTk5NmYzYS4uMGY5NjlkZTEwZmFiYyAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3NtdTEwX2h3bWdyLmgKPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3NtdTEwX2h3bWdyLmgK
PiA+IEBAIC0xOTIsNyArMTkyLDcgQEAgc3RydWN0IHNtdTEwX2Nsb2NrX3ZvbHRhZ2VfZGVwZW5k
ZW5jeV9yZWNvcmQgewo+ID4KPiA+ICAgc3RydWN0IHNtdTEwX3ZvbHRhZ2VfZGVwZW5kZW5jeV90
YWJsZSB7Cj4gPiAgICAgICB1aW50MzJfdCBjb3VudDsKPiA+IC0gICAgIHN0cnVjdCBzbXUxMF9j
bG9ja192b2x0YWdlX2RlcGVuZGVuY3lfcmVjb3JkIGVudHJpZXNbMV07Cj4gPiArICAgICBzdHJ1
Y3Qgc211MTBfY2xvY2tfdm9sdGFnZV9kZXBlbmRlbmN5X3JlY29yZCBlbnRyaWVzW107Cj4gPiAg
IH07Cj4gPgo+ID4gICBzdHJ1Y3Qgc211MTBfY2xvY2tfdm9sdGFnZV9pbmZvcm1hdGlvbiB7Cj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1n
ZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
