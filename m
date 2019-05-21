Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC277248E4
	for <lists+amd-gfx@lfdr.de>; Tue, 21 May 2019 09:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E44F89211;
	Tue, 21 May 2019 07:23:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5465989211
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 May 2019 07:23:27 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id j49so15365452otc.13
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 May 2019 00:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DPQL8bz6Ge/eFLfJPuBWgxB/nSLqSz43ISfLIGw+Rn0=;
 b=eDUVqz9lkWKMPvW88G/ABsTcjLlUCv42UtrbwF+ZJiccnD+fvEJxYHCD59NLEIBuFH
 QN543/7OO2BlF/MR+NrCL8xitfmAre601XoyECLNuHQ6dMW4nL8FYM6G2lemFWY/3gNi
 uH9eVYqS7FFoKM3XXLmDi5qJmhBSDhGPcZQ7jk15WJtUUfmqWvXb4sqGXyLx9SXCkirm
 Axlrzk1W/pxNCfxD4lrXwOpzGbew1tSP7kQ3nH9M/2jfv3JAcSbN8PVubhQiJfSMAbk6
 1ytGedeCWVrBrV8w9UEuv2V5/D4fiu0nqayb8KyNVNyocSPqL0eogCO1wGI2ayoPusQQ
 E9XA==
X-Gm-Message-State: APjAAAVTo8ylgp4UynHFwSh5l7uJUeub9E37DyvFQ3Rmhs5YHpHC8jKK
 x86ZHxdSZylGIhr560IyK1GS4rBq8c5+Nq31nEq3Sg==
X-Google-Smtp-Source: APXvYqwRwB1P5Gup3HP1MIlCSYyVyfn4YovUvZH/z6o7Bagy2HaHKKRr1LGuNbzUCTI0WsNWPs4SnLqkO/CCNIdY6Bk=
X-Received: by 2002:a9d:7395:: with SMTP id j21mr2061299otk.204.1558423406551; 
 Tue, 21 May 2019 00:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <1558082760-4915-1-git-send-email-xiaolinkui@kylinos.cn>
 <SN6PR12MB2800A7AEC22121C8704CBB09870B0@SN6PR12MB2800.namprd12.prod.outlook.com>
 <20190520162807.GE21222@phenom.ffwll.local>
 <SN6PR12MB28007ED8F5C6838F2C25A9D587060@SN6PR12MB2800.namprd12.prod.outlook.com>
 <CADnq5_O=PAK3qZJ-kHUX9jQDkmEYOX+iOhOX7gNaaXp+tC7nUg@mail.gmail.com>
In-Reply-To: <CADnq5_O=PAK3qZJ-kHUX9jQDkmEYOX+iOhOX7gNaaXp+tC7nUg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 21 May 2019 09:23:14 +0200
Message-ID: <CAKMK7uHS837L9Ze_K5q-AsFgOtAMD+n_i_Y404BX-_CwJeP08Q@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: use struct_size() in kmalloc()
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DPQL8bz6Ge/eFLfJPuBWgxB/nSLqSz43ISfLIGw+Rn0=;
 b=RttiH3G67ThRjHMOpk4pcVI/VMZPc5TF2PsMtvOI1PMokcZqYS7EectW/z54H7FqiF
 ovukQ8zGr07qzNzAkQ482SUGOCpjq8+PKUV7PJmRe2njXqsuR3SkafzFpr77LyQTCbZD
 k3FpSMJ2zRic7PUIm4ogcRJ3+3tTAO/e1CK/w=
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
Cc: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 xiaolinkui <xiaolinkui@kylinos.cn>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgNDozMyBBTSBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVy
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIE1heSAyMCwgMjAxOSBhdCA3OjE5IFBNIFBh
biwgWGluaHVpIDxYaW5odWkuUGFuQGFtZC5jb20+IHdyb3RlOgo+ID4KPiA+IERhbmllbCwgd2hh
dCB5b3UgYXJlIHRhbGtpbmcgYWJvdXQgaXMgdG90YWxseSB3cm9uZy4KPiA+IDEpIEFGQUlLLCBv
bmx5IG9uZSB6ZXJvLXNpemUgYXJyYXkgY2FuIGJlIGluIHRoZSBlbmQgb2YgYSBzdHJ1Y3QuCj4g
PiAyKSB0d28gc3RydWN0X3NpemUgd2lsbCBhZGQgdXAgc3RydWN0IGl0c2VsZiB0d2ljZS4gdGhl
IHN1bSBpcyB3cm9uZyB0aGVuLgo+ID4KPiA+IE5vIG9mZmVuc2UuIEkgY2FuJ3QgaGVscCBmZWVs
aW5nIGx1Y2t5IHRoYXQgeW91IGFyZSBpbiBpbnRlbC4KPgo+IFhpbmh1aSwKPgo+IFBsZWFzZSBr
ZWVwIHRoaW5ncyBjaXZpbC4gIFRoZXJlIGlzIG5vIG5lZWQgZm9yIGNvbW1lbnRzIGxpa2UgdGhp
cy4KClllYWgsIHRoaXMgd2FzIG92ZXIgdGhlIGxpbmUsIHRoYW5rcyBBbGV4IGZvciBhbHJlYWR5
IHRha2luZyBjYXJlIG9mCnRoaXMuIFBsZWFzZSBub3RlIHRoYXQgZmQubyBtYWlsaW5nIGxpc3Rz
IG9wZXJhdGUgdW5kZXIgYSBDb0M6CgpodHRwczovL3d3dy5mcmVlZGVza3RvcC5vcmcvd2lraS9D
b2RlT2ZDb25kdWN0LwoKV3J0IHRoZSB0ZWNobmljYWwgY29tbWVudDogSSBrbm93IHRoYXQgeW91
IGNhbiBvbmx5IGRvIG9uZSB2YXJpYWJsZQpzaXplZCBhcnJheSwgYW5kIGl0IG11c3QgYmUgYXQg
dGhlIGVuZC4gQnV0IHlvdSBjYW4gcHV0IG11bHRpcGxlCnN0cnVjdHVyZXMgYWxsIHdpdGhpbiB0
aGUgc2FtZSBhbGxvY2F0aW9uLiBXaGljaCBpcyB3aGF0IEkgdGhvdWdodCB5b3UKd2FudGVkIHRv
IGRvLiBBbmQgbXkgc2tldGNoIHdvdWxkIGFsbG93IHlvdSB0byBkbyB0aGF0IGV2ZW4gaWYgeW91
CmhhdmUgbXVsdGlwbGUgdmFyaWFibGUgbGVuZ3RoIHN0cnVjdHVyZXMgeW91IHdhbnQgdG8gYWxs
b2NhdGUuIFRoZXJlJ3MKcGxlbnR5IGV4YW1wbGVzIG9mIHRoaXMgKGJ1dCBvcGVuLWNvZGVkIG9u
ZXMpIGluIHRoZSBrZXJuZWwuCgpFeGNlcHQgaW4gcmVhbGx5IGhvdCBwYXRocyBJIHBlcnNvbmFs
bHkgdGhpbmsgdGhhdCB0aGF0IGtpbmQgb2YKdHJpY2tlcnkgaXNuJ3Qgd29ydGggaXQuCgpDaGVl
cnMsIERhbmllbAoKPgo+IEFsZXgKPgo+ID4KPiA+Cj4gPiDlj5Hku7bkuro6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+IOS7o+ihqCBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+Cj4gPiDlj5HpgIHml7bpl7Q6IDIwMTnlubQ15pyIMjHml6UgMDoyOAo+ID4g5pS2
5Lu25Lq6OiBQYW4sIFhpbmh1aQo+ID4g5oqE6YCBOiBEZXVjaGVyLCBBbGV4YW5kZXI7IEtvZW5p
ZywgQ2hyaXN0aWFuOyBaaG91LCBEYXZpZChDaHVuTWluZyk7IGFpcmxpZWRAbGludXguaWU7IGRh
bmllbEBmZndsbC5jaDsgUXVhbiwgRXZhbjsgeGlhb2xpbmt1aTsgYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmcKPiA+IOS4u+mimDogUmU6IFtQQVRDSF0gZ3B1OiBkcm06IHVzZSBz
dHJ1Y3Rfc2l6ZSgpIGluIGttYWxsb2MoKQo+ID4KPiA+IFtDQVVUSU9OOiBFeHRlcm5hbCBFbWFp
bF0KPiA+Cj4gPiBPbiBGcmksIE1heSAxNywgMjAxOSBhdCAwNDo0NDozMFBNICswMDAwLCBQYW4s
IFhpbmh1aSB3cm90ZToKPiA+ID4gSSBhbSBnb2luZyB0byBwdXQgbW9yZSBtZW1iZXJzIHdoaWNo
IGFyZSBhbHNvIGFycmF5IGFmdGVyIHRoaXMgc3RydWN0LAo+ID4gPiBub3Qgb25seSBvYmpbXS4g
IExvb2tzIGxpa2UgdGhpcyBzdHJ1Y3Rfc2l6ZSBkaWQgbm90IGhlbHAgb24gbXVsdGlwbGUKPiA+
ID4gYXJyYXkgY2FzZS4gVGhhbmtzIGFueXdheS4gIF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gPgo+ID4gWW91IGNhbiB0aGVuIGFkZCB0aGVtIHVwLCBlLmcuIGttYWxsb2Moc3Ry
dWN0X3NpemUoKStzdHJ1Y3Rfc2l6ZSgpLAo+ID4gR0ZQX0tFUk5FTCksIHNvIHRoaXMgcGF0Y2gg
aGVyZSBzdGlsbCBsb29rcyBsaWtlIGEgZ29vZCBpZGVhLgo+ID4KPiA+IFJldmlld2VkLWJ5OiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+ID4KPiA+IENoZWVycywgRGFu
aWVsCj4gPgo+ID4gPiBGcm9tOiB4aWFvbGlua3VpIDx4aWFvbGlua3VpQGt5bGlub3MuY24+Cj4g
PiA+IFNlbnQ6IEZyaWRheSwgTWF5IDE3LCAyMDE5IDQ6NDY6MDAgUE0KPiA+ID4gVG86IERldWNo
ZXIsIEFsZXhhbmRlcjsgS29lbmlnLCBDaHJpc3RpYW47IFpob3UsIERhdmlkKENodW5NaW5nKTsg
YWlybGllZEBsaW51eC5pZTsgZGFuaWVsQGZmd2xsLmNoOyBQYW4sIFhpbmh1aTsgUXVhbiwgRXZh
bgo+ID4gPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHhpYW9saW5r
dWlAa3lsaW5vcy5jbgo+ID4gPiBTdWJqZWN0OiBbUEFUQ0hdIGdwdTogZHJtOiB1c2Ugc3RydWN0
X3NpemUoKSBpbiBrbWFsbG9jKCkKPiA+ID4KPiA+ID4gW0NBVVRJT046IEV4dGVybmFsIEVtYWls
XQo+ID4gPgo+ID4gPiBVc2Ugc3RydWN0X3NpemUoKSBoZWxwZXIgdG8ga2VlcCBjb2RlIHNpbXBs
ZS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogeGlhb2xpbmt1aSA8eGlhb2xpbmt1aUBreWxp
bm9zLmNuPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuYyB8IDMgKy0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIg
ZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cmFzLmMKPiA+ID4gaW5kZXggMjJiZDIxZS4uNDcxN2E2NCAxMDA2NDQKPiA+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCj4gPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+ID4gPiBAQCAtMTM3NSw4ICsxMzc1LDcg
QEAgaW50IGFtZGdwdV9yYXNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiA+ID4g
ICAgICAgICBpZiAoY29uKQo+ID4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiA+Cj4g
PiA+IC0gICAgICAgY29uID0ga21hbGxvYyhzaXplb2Yoc3RydWN0IGFtZGdwdV9yYXMpICsKPiA+
ID4gLSAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHN0cnVjdCByYXNfbWFuYWdlcikgKiBB
TURHUFVfUkFTX0JMT0NLX0NPVU5ULAo+ID4gPiArICAgICAgIGNvbiA9IGttYWxsb2Moc3RydWN0
X3NpemUoY29uLCBvYmpzLCBBTURHUFVfUkFTX0JMT0NLX0NPVU5UKSwKPiA+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgR0ZQX0tFUk5FTHxfX0dGUF9aRVJPKTsKPiA+ID4gICAgICAgICBpZiAo
IWNvbikKPiA+ID4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4gPiAtLQo+ID4g
PiAyLjcuNAo+ID4gPgo+ID4gPgo+ID4gPgo+ID4KPiA+IC0tCj4gPiBEYW5pZWwgVmV0dGVyCj4g
PiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiA+IGh0dHA6Ly9ibG9nLmZm
d2xsLmNoCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+ID4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiA+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZngKCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBv
cmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
