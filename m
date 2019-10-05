Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B63FACC808
	for <lists+amd-gfx@lfdr.de>; Sat,  5 Oct 2019 07:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9F66E1C4;
	Sat,  5 Oct 2019 05:04:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1794F6E1C4
 for <amd-gfx@lists.freedesktop.org>; Sat,  5 Oct 2019 05:04:39 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y19so9393142wrd.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 04 Oct 2019 22:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LP/j31tK5U4owDtfNH9M2QS7AiJFk+7zxiHfxOH3owY=;
 b=OZtKbZKnrm0eVEtsKYAOtpRhrO5OxXB31FxhoEoZXABb5+k75B9zyGgnJ3c8BohO53
 gxTWIURkzzxQPgd2qQN6LSEbJq2z/TW3Q5C1nzXaIDiDcv4JZ3tFeBVCY/QCEq1WFk1x
 IZRKTLU8ABfCUXW3vg2A48+s/P1VeDj7p4hUoTSuolTzTa/IfcOJiu0G6cDN9b7oc/74
 8UTwaTfd5HLYOc/tQxMiY5xC7GBcZwnvieR9VQXX56DTJeuXaAigsxQWyvw+IumrleUx
 pWHzbpn1T8YwZfwUnDt3WDQiQcri2lA4FKMm4B7kzQA9qposw+bEibyJ7dxqQ6lJAiLm
 uzoQ==
X-Gm-Message-State: APjAAAUVKshR0FY0nwImPSy44b6jiROlXHbLQyjKbStMN9TeMPuWbbFh
 +6Xw2CyFrPL8DRoK73cRc4AZ5v9vt4R06ogU8oo=
X-Google-Smtp-Source: APXvYqxK7aa+Md/eSbnAFY50dLo4i7GsbsXsLzlVSMXAmojvjTdQ0u/JZahTGQxjARQzEpfycR8GNIJDNflD+cs+2FU=
X-Received: by 2002:a5d:6052:: with SMTP id j18mr4009944wrt.40.1570251877604; 
 Fri, 04 Oct 2019 22:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20191003233902.1982-1-luben.tuikov@amd.com>
 <f4f4bdef-577a-7402-e467-7003be73687a@gmail.com>
 <911f3f03-3484-f03f-ee89-c6ad6e9ff68f@amd.com>
In-Reply-To: <911f3f03-3484-f03f-ee89-c6ad6e9ff68f@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sat, 5 Oct 2019 01:04:24 -0400
Message-ID: <CADnq5_PODmkjPnvdO4JaRDRgS4r+nR4UEJy-YZ7=ZpjNWzGrRQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Use the ALIGN() macro
To: "Tuikov, Luben" <Luben.Tuikov@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LP/j31tK5U4owDtfNH9M2QS7AiJFk+7zxiHfxOH3owY=;
 b=tamqsGuRHFSCwE/4HZrTACn+ss/uV5mksWuXnQQC/0e6U4LuMRMiGK6lNg9ucaH+jc
 3CIOh0YxhMXvLbrcmQ0NNwjBiUmZwyvQ6ZBYyClrO5C3G3Zh70ueLu5D0FRFlz5p1HpC
 r/o8FildQjJG42iwPaWVMTMrI964nD2X2qAz2RGQiK64PXNAfUXdLPHsRjzRXjjEjlKG
 dLZcthRT/SCJ7OWpA0RLetgHNm+F5AqRKTTs/FN1/c8ahvMJoPrU3RijReU8E+uqlnGc
 /1ns69sn0zTPzpgon8oBQ+X98AKV8UOyMr3VsTVgyolTGY8eGd4F2H+Y0WqTZ2krMxtg
 +Tug==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgNCwgMjAxOSBhdCA3OjI5IFBNIFR1aWtvdiwgTHViZW4gPEx1YmVuLlR1aWtv
dkBhbWQuY29tPiB3cm90ZToKPgo+IE9uIDIwMTktMTAtMDQgMzoxNiBhLm0uLCBDaHJpc3RpYW4g
S8O2bmlnIHdyb3RlOgo+ID4gQW0gMDQuMTAuMTkgdW0gMDE6Mzkgc2NocmllYiBUdWlrb3YsIEx1
YmVuOgo+ID4+IFVzZSB0aGUgQUxJR04oKSBtYWNybyB0byBzZXQgIm51bV9kdyIgdG8gYQo+ID4+
IG11bHRpcGxlIG9mIDgsIGkuZS4gbG93ZXIgMyBiaXRzIGNsZWFyZWQuCj4gPj4KPiA+PiBTaWdu
ZWQtb2ZmLWJ5OiBMdWJlbiBUdWlrb3YgPGx1YmVuLnR1aWtvdkBhbWQuY29tPgo+ID4KPiA+IFJl
dmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4K
PiBIaSBDaHJpc3RpYW4sCj4KPiBObyBBQ0s/Cj4KPiBJJ3ZlIGJlZW4gcnVubmluZyB0aGlzIHZl
cnNpb24gb2YgdGhlIGRyaXZlciBhbmQgbm8gcHJvYmxlbXMuCj4KCllvdSBjYW4gZ28gYWhlYWQg
YW5kIGNvbW1pdC4gIFlvdSBoYXZlIGEgcmV2aWV3ZWQtYnkuCgpBbGV4Cgo+IFJlZ2FyZHMsCj4g
THViZW4KPgo+ID4KPiA+PiAtLS0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYyB8IDExICsrLS0tLS0tLS0tCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV90dG0uYwo+ID4+IGluZGV4IDY4YzU0MWUxMTE4OS4uNzNjNjI4YmM2YTViIDEw
MDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+
ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+ID4+IEBA
IC0xOTIzLDEwICsxOTIzLDcgQEAgc3RhdGljIGludCBhbWRncHVfbWFwX2J1ZmZlcihzdHJ1Y3Qg
dHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ID4+ICAgICAgKmFkZHIgKz0gKHU2NCl3aW5kb3cgKiBB
TURHUFVfR1RUX01BWF9UUkFOU0ZFUl9TSVpFICoKPiA+PiAgICAgICAgICAgICAgQU1ER1BVX0dQ
VV9QQUdFX1NJWkU7Cj4gPj4KPiA+PiAtICAgIG51bV9kdyA9IGFkZXYtPm1tYW4uYnVmZmVyX2Z1
bmNzLT5jb3B5X251bV9kdzsKPiA+PiAtICAgIHdoaWxlIChudW1fZHcgJiAweDcpCj4gPj4gLSAg
ICAgICAgICAgIG51bV9kdysrOwo+ID4+IC0KPiA+PiArICAgIG51bV9kdyA9IEFMSUdOKGFkZXYt
Pm1tYW4uYnVmZmVyX2Z1bmNzLT5jb3B5X251bV9kdywgOCk7Cj4gPj4gICAgICBudW1fYnl0ZXMg
PSBudW1fcGFnZXMgKiA4Owo+ID4+Cj4gPj4gICAgICByID0gYW1kZ3B1X2pvYl9hbGxvY193aXRo
X2liKGFkZXYsIG51bV9kdyAqIDQgKyBudW1fYnl0ZXMsICZqb2IpOwo+ID4+IEBAIC0xOTg2LDEx
ICsxOTgzLDcgQEAgaW50IGFtZGdwdV9jb3B5X2J1ZmZlcihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJp
bmcsIHVpbnQ2NF90IHNyY19vZmZzZXQsCj4gPj4KPiA+PiAgICAgIG1heF9ieXRlcyA9IGFkZXYt
Pm1tYW4uYnVmZmVyX2Z1bmNzLT5jb3B5X21heF9ieXRlczsKPiA+PiAgICAgIG51bV9sb29wcyA9
IERJVl9ST1VORF9VUChieXRlX2NvdW50LCBtYXhfYnl0ZXMpOwo+ID4+IC0gICAgbnVtX2R3ID0g
bnVtX2xvb3BzICogYWRldi0+bW1hbi5idWZmZXJfZnVuY3MtPmNvcHlfbnVtX2R3Owo+ID4+IC0K
PiA+PiAtICAgIC8qIGZvciBJQiBwYWRkaW5nICovCj4gPj4gLSAgICB3aGlsZSAobnVtX2R3ICYg
MHg3KQo+ID4+IC0gICAgICAgICAgICBudW1fZHcrKzsKPiA+PiArICAgIG51bV9kdyA9IEFMSUdO
KG51bV9sb29wcyAqIGFkZXYtPm1tYW4uYnVmZmVyX2Z1bmNzLT5jb3B5X251bV9kdywgOCk7Cj4g
Pj4KPiA+PiAgICAgIHIgPSBhbWRncHVfam9iX2FsbG9jX3dpdGhfaWIoYWRldiwgbnVtX2R3ICog
NCwgJmpvYik7Cj4gPj4gICAgICBpZiAocikKPiA+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
