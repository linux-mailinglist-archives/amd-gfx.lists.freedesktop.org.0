Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF7A36B89
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 07:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0898926A;
	Thu,  6 Jun 2019 05:26:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30A289354
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 05:26:23 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id 107so809505otj.8
 for <amd-gfx@lists.freedesktop.org>; Wed, 05 Jun 2019 22:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J4gRQkmX1QjVXb03667iOURZYk89lIRQq5WJ1nJ+6hs=;
 b=gcI3w+j8TxiZgZfNn5foI/CmzHyedTiSiW33t3piqFVW31na+0ZwknNXJJWh6fVJ9p
 81QUDB1pkQT8w3nmTauaO84LLPVRM3HY7NqV5h7yAWZatZneRGrK2BfvMP8zFLw46u7t
 8VuXwDW+twHJmL2w2D+ZkaTPl6lve6dbmw4RacGfDW0D7pRgmJ3TJBKc2IKOGGTTtQtL
 ycRpzlQESZC41IjTot58MHABb3KEqgqCILJh7wCJ7l68FZWhLZhTDO2Pxxzgf7hL2jiG
 vaEgVgkRDCIXrF4hxtEDKRzDx7YaG7NVUmpCqgdr/VvyliC2o3EyDuWC5Dv+snK36DlV
 63/A==
X-Gm-Message-State: APjAAAVEtoFduWLD0Lv1Yhjsg5+0ch7XaP+xIHTPTFDmiNV2FF7XNszp
 PCexMjbC8MiBfJSJkgdsNaR/16/x3FRo1YmY0hHblg==
X-Google-Smtp-Source: APXvYqwOQZVXVAFOVztHU0B4TsnpazD7cniY2gFW2PurhqbtXyFGKPq82VFcu+IKwJbq88h0/7hYZkUj4enr72LNL78=
X-Received: by 2002:a9d:6e8d:: with SMTP id a13mr11757295otr.303.1559798783186; 
 Wed, 05 Jun 2019 22:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190605191157.3134-1-alexander.deucher@amd.com>
 <CAPM=9twLRm41uHjsYn8KG-fsCrG=cdpQ8Jh1VJ1kBcFs2FFWYA@mail.gmail.com>
 <CADnq5_PdnFMjA4RqJgC6jo=Zc__t=z3deNYebbcvngc8UmV39Q@mail.gmail.com>
 <CAKMK7uEQ_HvT1LBrBj2PO92XSUMyh9A3Vtc+NTFAnEmjBGY66w@mail.gmail.com>
In-Reply-To: <CAKMK7uEQ_HvT1LBrBj2PO92XSUMyh9A3Vtc+NTFAnEmjBGY66w@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 6 Jun 2019 07:26:12 +0200
Message-ID: <CAKMK7uGQjsv=VqaKCGEB6JF5cDpiAtrNeUBtxA+Nu7Aye9=fWQ@mail.gmail.com>
Subject: Re: [pull] amdgpu, ttm drm-next-5.3
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=J4gRQkmX1QjVXb03667iOURZYk89lIRQq5WJ1nJ+6hs=;
 b=eTwXQjkmHAvpjw8iUmSD8keT5j5CqLrzKwzFKasfxuIf1V5GiZEgLafwT7pXyBLpX/
 WTQDYsC+BkKeeU7Lgms1D3vwlqGE5t6DlOHOAs8FTPnZ4EfCM1zA7sIg/O0i+0+mR4Wt
 kSgEKRPatf2iEM3v+gDUkOJ2PJ9kxnBsJINAA=
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gNiwgMjAxOSBhdCA3OjI1IEFNIERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdW4gNiwgMjAxOSBhdCA1OjA1IEFNIEFs
ZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQs
IEp1biA1LCAyMDE5IGF0IDEwOjM0IFBNIERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4g
d3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFRodSwgNiBKdW4gMjAxOSBhdCAwNToxMiwgQWxleCBEZXVj
aGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gSGkgRGF2
ZSwgRGFuaWVsLAo+ID4gPiA+Cj4gPiA+ID4gTW9yZSBuZXcgc3R1ZmYgZm9yIDUuMzoKPiA+ID4g
Pgo+ID4gPiA+IGFtZGdwdToKPiA+ID4gPiAtIFJldmVydCB0aW1lbGluZSBzdXBwb3J0IHVudGls
IEtIUiBpcyByZWFkeQo+ID4gPiA+IC0gVmFyaW91cyBkcml2ZXIgcmVsb2FkIGZpeGVzCj4gPiA+
ID4gLSBSZWZhY3RvciBjbG9jayBoYW5kbGluZyBpbiBEQwo+ID4gPiA+IC0gQXV4IGZpeGVzIGZv
ciBEQwo+ID4gPiA+IC0gQmFuZHdpZHRoIGNhbGN1bGF0aW9uIHVwZGF0ZXMgZm9yIERDCj4gPiA+
ID4gLSBGaXggZG9jdW1lbnRhdGlvbiBkdWUgdG8gZmlsZSByZW5hbWUKPiA+ID4gPiAtIFJBUyBm
aXgKPiA+ID4gPiAtIEZpeCByYWNlIGluIGxhdGVfaW5pdAo+ID4gPiA+Cj4gPiA+ID4gdHRtOgo+
ID4gPiA+IC0gQWxsb3cgZm9yIGJldHRlciBmb3J3YXJkIHByb2dyZXNzIHdoZW4gdGhlcmUgaXMg
aGVhdnkgbWVtb3J5IGNvbnRlbnRpb24KPiA+ID4KPiA+ID4gZGltOiAxMzdhN2RhOTI1NTcgKCJS
ZXZlcnQgImRybS9hbWRncHU6IGFkZCBEUklWRVJfU1lOQ09CSl9USU1FTElORSB0bwo+ID4gPiBh
bWRncHUiIik6IG1hbmRhdG9yeSByZXZpZXcgbWlzc2luZy4KPiA+ID4gZGltOiBjZjI1YjY0NDQz
NzYgKCJncHU6IGFtZGdwdTogZml4IGJyb2tlbiBhbWRncHVfZG1hX2J1Zi5jCj4gPiA+IHJlZmVy
ZW5jZXMiKTogU0hBMSBpbiBmaXhlcyBsaW5lIG5vdCBmb3VuZDoKPiA+ID4gZGltOiAgICAgOTg4
MDc2Y2Q4YzVjICgiZHJtL2FtZGdwdTogcmVuYW1lIGFtZGdwdV9wcmltZS5bY2hdIGludG8KPiA+
ID4gYW1kZ3B1X2RtYV9idWYuW2NoXSIpCj4gPiA+Cj4gPiA+IFRoZSBmaXJzdCBJJ20gbm90IHdv
cnJpZWQgYWJvdXQsIGJ1dCB0aGUgZml4ZXMgbGluZSBzaG91bGQgYmUgZml4ZWQKPiA+ID4gYmVm
b3JlIEkgY2FuIHB1bGwgdGhpcy4KPiA+ID4gMmZiZDZmOTRhY2NkYmIyMjNhY2NjYWRhNjg5NDBi
NTBiMGM2NjhkOSBpcyB0aGUgdXBzdHJlYW0gY29tbWl0IGluIG15IHRyZWUuCj4gPgo+ID4gV2Vp
cmQuICBkaW0gZGlkbid0IGNvbXBsYWluIHdoZW4gSSByYW4gaXQuICBJIGd1ZXNzIHRoZSBvbGQg
Y29tbWl0Cj4gPiBoYXBwZW5lZCB0byBiZSBpbiBteSByZXBvLiAgSSdsbCBmaXggaXQgdXAuCj4K
PiBJIHNob3VsZCBjaGVjayBhbHNvIHRoYXQgaXQncyBhbiBhbmNlc3RvciBjb21taXQsIG5vdCBq
dXN0IHRoYXQgaXQncwoKcy9JL0l0LywgbWVhbndoaWxlIGRpbSBtYWtlcyBzdXJlIHRoaXMgaXMg
dGhlIGNhc2UuIFR5cGluZyBtYWlscwpiZWZvcmUgY29mZmVlIDotKQoKaHR0cHM6Ly9naXRsYWIu
ZnJlZWRlc2t0b3Aub3JnL2RybS9tYWludGFpbmVyLXRvb2xzL2Jsb2IvbWFzdGVyL2RpbSNMODMx
CgpJcyB0aGUgY2hlY2suCi1EYW5pZWwKCj4gaW4gdGhlIHJlcG8gKGJ1dCB0aGF0J3MgYSBmZXcg
Y29uZGl0aW9ucyBsYXRlciBvbiwgZm9yIERhdmUgaXQKPiBvYnZpb3VzbHkgZmFpbGVkIGVhcmxp
ZXIpLiBTaW5jZSBpdCdzIGEgYnJhbmNoIG5vdCBhIHRhZyBJIGNhbid0IHB1bGwKPiB0aGUgb2xk
IHZlcnNpb24gYW55bW9yZSBhbmQgdGFrZSBhIGxvb2sgYW5kIGZpZ3VyZSBvdXQgd2hhdCBtaWdo
dCBiZQo+IHRoZSByZWFzb24sIGJ1dCB0aGlzIHNob3VsZCBoYXZlIHdvcmtlZC4KPiAtRGFuaWVs
Cj4gLS0KPiBEYW5pZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0
aW9uCj4gKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaAoKCgotLSAK
RGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgw
KSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
