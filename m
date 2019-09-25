Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 334A8BE633
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 22:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72C76F958;
	Wed, 25 Sep 2019 20:12:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E446F929
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 20:12:45 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id b24so100587wmj.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 13:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A1rmaj5bmdRV8lVmZSxl9G6cyiSU1sgy/uSr4O2zBu0=;
 b=kdOD5DSmb4Kv7mXSaCacVmYDTJWVppWfMtzy2ktM/nKndV4ZdDKoExNRW3kWQzohXX
 nga+CNP0+hLYzYATQxHwUb/B+CKdE8J1lroHS7ZhclWMGiDJ1Tp64ccuIB6Ytb8KUOGq
 WevM+VCGw3V2vowzw07nEkQTd9n6RjwJUxvMmfh9om6W5l9jCGb0ch9oRdqYu/5OSgeo
 dLfbqiExhpoG1zFPbE/51D8N8eyd0qr8JLxbS7HMkTMncS9yionU1/VdxfwJ7CF6ALOa
 w+gMyXW2GwUS7qXVNh2EpdSCIuGYPlIBIkW34S+s9PsqeojMyRpVHpIOlotAlZGPPahl
 H4YQ==
X-Gm-Message-State: APjAAAU/5mWXr2qIouHLaS1PGDpWy2ixnp16qlmxKBHMRy3yn4IPSmof
 MTDEm9ZcCMu4/O8uI46vlKr/ywlQNQzm24dsirg=
X-Google-Smtp-Source: APXvYqy6eVLVbpqYsgRc3xoiikboyY9otDpXS26JZfHF1yCHijcZqzdvSls1KXVPvob4r/GEK13Nv09oyZGrtsAz1Gs=
X-Received: by 2002:a05:600c:54a:: with SMTP id k10mr5097wmc.127.1569442363697; 
 Wed, 25 Sep 2019 13:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <1569363225-18469-1-git-send-email-shaoyun.liu@amd.com>
 <2b7c9fe9-0849-d3a5-99b4-3203c1b82de2@amd.com>
 <DM6PR12MB3241269E6B5007951F0B59BEF4870@DM6PR12MB3241.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB3241269E6B5007951F0B59BEF4870@DM6PR12MB3241.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 25 Sep 2019 16:12:31 -0400
Message-ID: <CADnq5_PQV9mPSkzY98GoQU29Sm1ooY2MHhenko2j9_=HFNdYig@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Add NAVI12 support from kfd side
To: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=A1rmaj5bmdRV8lVmZSxl9G6cyiSU1sgy/uSr4O2zBu0=;
 b=d75pQDZydsAUy/Uyah/pajJdkU8K6a14rMs9WcGttl14L8gngN5rFSyXwEcFXJWvGS
 icbI52RlEmZxzWB41GJeEVSX8fE6+HMZMa1RiDOlj1WZjE7iSj8nMLZVhFMz5bK9B4MP
 TfnzhkLZiJmCRye24uYsUWK9iFiYAWFZT8HN/lJOlsNCJQj0BlNMFjV2VA2RVslQCRuX
 zguDfqz4zaDCgYZt6Co7wTh4Bd8zqM4Jn10T/MKAGsR36UuDUll1iLKSW6OV9vOu6lvq
 JDpZFGfgWaunEb7++kBAz4+/dPW6DN+nztQ+ONOiFTtOLc/r6GaWuNSoD32kpmy34MMi
 7Ixg==
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SSB0aGluayBpdCB3b3VsZCBiZSBjbGVhbmVyIHRvIGFkZCBuYXZpMTIgdG8gYWxsIG9mIHRoZSBy
ZWxldmFudApjYXNlcy4gIFdlIHNob3VsZCBkb3VibGUgY2hlY2sgd2hhdCB3ZSBkaWQgZm9yIG5h
dmkxNCBhcyB3ZWxsLgoKQWxleAoKT24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgNDowOSBQTSBMaXUs
IFNoYW95dW4gPFNoYW95dW4uTGl1QGFtZC5jb20+IHdyb3RlOgo+Cj4gSSBzZW50IG91dCBhbm90
aGVyIGNoYW5nZSB0aGF0IHNldCB0aGUgIGFzaWNfZmFtaWx5IGFzIENISVBfTkFWSTEwIHNpbmNl
IGZyb20gS0ZEIHNpZGUgdGhlcmUgaXMgbm8gZGlmZmVyZW5jZSBmb3IgbmF2aTEwIGFuZCAgbmF2
aTEyLgo+Cj4gUmVnYXJkcwo+IFNoYW95dW4ubGl1Cj4KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQo+IEZyb206IEt1ZWhsaW5nLCBGZWxpeCA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPiBT
ZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAyNSwgMjAxOSAxMToyMyBBTQo+IFRvOiBMaXUsIFNo
YW95dW4gPFNoYW95dW4uTGl1QGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9hbWRncHU6IEFkZCBOQVZJMTIgc3VwcG9ydCBm
cm9tIGtmZCBzaWRlCj4KPiBZb3UnbGwgYWxzbyBuZWVkIHRvIGFkZCAiY2FzZSBDSElQX05BVkkx
MjoiIGluIGEgYnVuY2ggb2YgcGxhY2VzLiBHcmVwIGZvciAiQ0hJUF9OQVZJMTAiIGFuZCB5b3Un
bGwgZmluZCB0aGVtIGFsbCBwcmV0dHkgcXVpY2tseS4KPgo+IFJlZ2FyZHMsCj4gICAgRmVsaXgK
Pgo+IE9uIDIwMTktMDktMjQgNjoxMyBwLm0uLCBMaXUsIFNoYW95dW4gd3JvdGU6Cj4gPiBBZGQg
ZGV2aWNlIGluZm8gZm9yIGJvdGggbmF2aTEyIFBGIGFuZCBWRgo+ID4KPiA+IENoYW5nZS1JZDog
SWZiNDAzNWU2NWMxMmQxNTNmYzMwZTU5M2ZlMTA5ZjljN2UwNTQxZjQKPiA+IFNpZ25lZC1vZmYt
Ynk6IHNoYW95dW5sIDxzaGFveXVuLmxpdUBhbWQuY29tPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyB8IDE5ICsrKysrKysrKysrKysrKysrKysK
PiA+ICAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jCj4gPiBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYwo+ID4gaW5kZXggZjMyOWI4Mi4uZWRmYmFl
NWMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNl
LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYwo+ID4g
QEAgLTM4Nyw2ICszODcsMjQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBrZmRfZGV2aWNlX2luZm8g
bmF2aTEwX2RldmljZV9pbmZvID0gewo+ID4gICAgICAgLm51bV9zZG1hX3F1ZXVlc19wZXJfZW5n
aW5lID0gOCwKPiA+ICAgfTsKPiA+Cj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBrZmRfZGV2aWNl
X2luZm8gbmF2aTEyX2RldmljZV9pbmZvID0gewo+ID4gKyAgICAgLmFzaWNfZmFtaWx5ID0gQ0hJ
UF9OQVZJMTIsCj4gPiArICAgICAuYXNpY19uYW1lID0gIm5hdmkxMiIsCj4gPiArICAgICAubWF4
X3Bhc2lkX2JpdHMgPSAxNiwKPiA+ICsgICAgIC5tYXhfbm9fb2ZfaHFkICA9IDI0LAo+ID4gKyAg
ICAgLmRvb3JiZWxsX3NpemUgID0gOCwKPiA+ICsgICAgIC5paF9yaW5nX2VudHJ5X3NpemUgPSA4
ICogc2l6ZW9mKHVpbnQzMl90KSwKPiA+ICsgICAgIC5ldmVudF9pbnRlcnJ1cHRfY2xhc3MgPSAm
ZXZlbnRfaW50ZXJydXB0X2NsYXNzX3Y5LAo+ID4gKyAgICAgLm51bV9vZl93YXRjaF9wb2ludHMg
PSA0LAo+ID4gKyAgICAgLm1xZF9zaXplX2FsaWduZWQgPSBNUURfU0laRV9BTElHTkVELAo+ID4g
KyAgICAgLm5lZWRzX2lvbW11X2RldmljZSA9IGZhbHNlLAo+ID4gKyAgICAgLnN1cHBvcnRzX2N3
c3IgPSB0cnVlLAo+ID4gKyAgICAgLm5lZWRzX3BjaV9hdG9taWNzID0gZmFsc2UsCj4gPiArICAg
ICAubnVtX3NkbWFfZW5naW5lcyA9IDIsCj4gPiArICAgICAubnVtX3hnbWlfc2RtYV9lbmdpbmVz
ID0gMCwKPiA+ICsgICAgIC5udW1fc2RtYV9xdWV1ZXNfcGVyX2VuZ2luZSA9IDgsCj4gPiArfTsK
PiA+ICsKPiA+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBrZmRfZGV2aWNlX2luZm8gbmF2aTE0X2Rl
dmljZV9pbmZvID0gewo+ID4gICAgICAgLmFzaWNfZmFtaWx5ID0gQ0hJUF9OQVZJMTQsCj4gPiAg
ICAgICAuYXNpY19uYW1lID0gIm5hdmkxNCIsCj4gPiBAQCAtNDI1LDYgKzQ0Myw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qga2ZkX2RldmljZV9pbmZvICprZmRfc3VwcG9ydGVkX2RldmljZXNbXVsy
XSA9IHsKPiA+ICAgICAgIFtDSElQX1JFTk9JUl0gPSB7JnJlbm9pcl9kZXZpY2VfaW5mbywgTlVM
TH0sCj4gPiAgICAgICBbQ0hJUF9BUkNUVVJVU10gPSB7JmFyY3R1cnVzX2RldmljZV9pbmZvLCAm
YXJjdHVydXNfZGV2aWNlX2luZm99LAo+ID4gICAgICAgW0NISVBfTkFWSTEwXSA9IHsmbmF2aTEw
X2RldmljZV9pbmZvLCBOVUxMfSwKPiA+ICsgICAgIFtDSElQX05BVkkxMl0gPSB7Jm5hdmkxMl9k
ZXZpY2VfaW5mbywgJm5hdmkxMl9kZXZpY2VfaW5mb30sCj4gPiAgICAgICBbQ0hJUF9OQVZJMTRd
ID0geyZuYXZpMTRfZGV2aWNlX2luZm8sIE5VTEx9LAo+ID4gICB9Owo+ID4KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBs
aXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
