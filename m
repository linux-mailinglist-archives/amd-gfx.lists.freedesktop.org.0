Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF93064BC1
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jul 2019 19:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3920D6E119;
	Wed, 10 Jul 2019 17:56:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C194F6E119
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 17:56:02 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z1so3373382wru.13
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 10:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wZiHGpZBddPPW65TROsfKsZ2so72Uuh0rLOl5mH5PCY=;
 b=I4DQg8ORxu5WAtZykV22fMRJWX5PGjWCaN69qS7WhvrQlBVaNDWwLLfHzmj0BuPIBW
 li9JavswVibWv16GXDaUh4bDsC+fWoZBVffmmmUo8MwVlFzdgkrofNtI7/6bYfuhyzNk
 bj/K0k+3fxA4RXWe1/0mLrAxjNbSTAdMGUaadEmIvS6hjHohq8RD/HFMRnQrizNz924w
 TzQCIwU8zIrr+Y4My+y5xTtFFWfQ3XUzs29YlSmwL9PzKLgS4oSquT9k4HO5FOZcoC48
 ukEEQZ9Zbuxx3gJs+CaoRoAAVU4e1Q/zSXBN6O7e12uyCXJ7Pgwg7wSrP7OxISPo8xxJ
 UBrQ==
X-Gm-Message-State: APjAAAWaUkw7h3oT4Uj4f4C42yJ9/FFZwf3KlJLjm/MWrhAxrV7ReA9R
 nII2IudmVLKGXbmt7oyxO7ZTjPEK0XQ3WMNVVg8zGg==
X-Google-Smtp-Source: APXvYqzoHZ7vF3fzaZAHEGemVN4BgICgxiqqJMTTkL7wEcFBC1w0yt4NEYoS0lpkP1rIHemrRhMuqX+37a/8xLANFw4=
X-Received: by 2002:a5d:6b11:: with SMTP id v17mr31765839wrw.323.1562781361378; 
 Wed, 10 Jul 2019 10:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190709054111.11433-1-evan.quan@amd.com>
 <BN6PR12MB180934CC91BC9A2A3C393AC2F7F10@BN6PR12MB1809.namprd12.prod.outlook.com>
 <BN8PR12MB33290CA144CF8883E42E8E0FE4F00@BN8PR12MB3329.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB33290CA144CF8883E42E8E0FE4F00@BN8PR12MB3329.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 10 Jul 2019 13:55:49 -0400
Message-ID: <CADnq5_Nyfgk3S3otM3tQ5NjwSu4FvBNrH4SUnRFGsDRQ0gsW+g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: increase the SMU msg response waiting
 time
To: "Quan, Evan" <Evan.Quan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wZiHGpZBddPPW65TROsfKsZ2so72Uuh0rLOl5mH5PCY=;
 b=uFltQTNht9kxt2a0jINsuRbkeb2/RtzvxfmWiHWEXCoRGTEjpeXaa8MJRiK36qMSTj
 CIhdfGVnMIRiTjTPlO7pd2dbuR+t4o98wsSsCz4tWY9Uzw9EZZX6HCEXKUkZaxsNT6nm
 U5evkIH5pJC0Oy3BJwE39F8umyDWEecwt41PvhAWmh4rI3nOYVTeMOy8EmUk9XZzO1D3
 PULYmNVcAExgwf1s9jAjxI+K+XVszL9obAjRg5vpTolVcLmXkkVSbLqWT3RTP+yWe7fz
 3X34zaO9w1nMS4DZmd9KPaDQI+fhiypKdOuT1JccKQk3ZXqc6gSwzBxeMgT6eoITT+67
 Jlgw==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Grodzovsky,
 Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Wu,
 Xiaowei" <Xiaowei.Wu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgOSwgMjAxOSBhdCA5OjE3IFBNIFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQu
Y29tPiB3cm90ZToKPgo+IEhpIEFsZXgsCj4KPgo+Cj4gVGhlcmUgYXJlIGFjdHVhbGx5IHR3byBN
QVhfVVNFQ19USU1FT1VUIHJlbGF0ZWQgbWFjcm9zLgo+Cj4gQU1EX01BWF9VU0VDX1RJTUVPVVQg
aXMgdXNlZCBmb3IgU01VIGFuZCBBTURHUFVfTUFYX1VTRUNfVElNRU9VVCBpcyB1c2VkIHdpZGVs
eSBpbiBvdGhlciBwYXJ0cy4KPgo+IE1heWJlIHlvdSBtaXN0cmVhdGVkIGl0IGFzICBBTURHUFVf
TUFYX1VTRUNfVElNRU9VVC4gSSB3YXMgY29uZnVzZWQgYnkgdGhlbSB0b28uCj4KPgo+Cj4gZHJp
dmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FtZF9zaGFyZWQuaDoyOTojZGVmaW5lIEFNRF9NQVhf
VVNFQ19USU1FT1VUICAgICAgICAgICAgICAgIDIwMDAwMCAgLyogMjAwIG1zICovCj4KPiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaDoxNzk6I2RlZmluZSBBTURHUFVfTUFYX1VT
RUNfVElNRU9VVCAgICAgICAgICAgICAgICAgMTAwMDAwICAvKiAxMDAgbXMgKi8KPgo+Cj4KPiBJ
4oCZbSBjb25zaWRlcmluZyB0byBzb3J0IHRoZXNlIHRpbWVvdXQgc2V0dGluZ3MgdXAgbGF0ZXIu
IE1heWJlIHRvIGNvbWJpbmUgdGhlbSBhcyBvbmUgb3IgZ2l2ZSB0aGVtIGRpZmZlcmVudGlhdGVk
IG5hbWVzLgo+Cj4KCkluZGVlZC4gIEkgd2FzIG1peGluZyB0aGVtIHVwLiAgV2Ugc2hvdWxkIGNs
YXJpZnkgdGhvc2UuICBQYXRjaCBpczoKQWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KCj4KPiBSZWdhcmRzLAo+Cj4gRXZhbgo+Cj4gRnJvbTogRGV1Y2hl
ciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPgo+IFNlbnQ6IFR1ZXNkYXks
IEp1bHkgMDksIDIwMTkgODo0MSBQTQo+IFRvOiBRdWFuLCBFdmFuIDxFdmFuLlF1YW5AYW1kLmNv
bT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IEdyb2R6b3Zza3ksIEFuZHJl
eSA8QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNvbT47IFd1LCBYaWFvd2VpIDxYaWFvd2VpLld1QGFt
ZC5jb20+Cj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZC9wb3dlcnBsYXk6IGluY3JlYXNl
IHRoZSBTTVUgbXNnIHJlc3BvbnNlIHdhaXRpbmcgdGltZQo+Cj4KPgo+IElmIHRoaXMgaXMganVz
dCBmb3IgdGhlIFNNVSwgbWF5YmUgaXQgd291bGQgYmUgYmV0dGVyIHRvIGFkZCBhIHNlcGFyYXRl
IHRpbWVvdXQgZm9yIHRoZSBTTVUgc2luY2UgdGhpcyB3aWxsIGluY3JlYXNlIHRoZSB0aW1lb3V0
IGZvciBsb3RzIG9mIHRoaW5ncywgdW5sZXNzIHdlIG5lZWQgYW4gb3ZlcmFsbCB0aW1lb3V0IGlu
Y3JlYXNlIGZvciBtb2RlMSByZXNldC4KPgo+Cj4KPiBBbGV4Cj4KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+Cj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gb24gYmVoYWxmIG9mIEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5j
b20+Cj4gU2VudDogVHVlc2RheSwgSnVseSA5LCAyMDE5IDE6NDEgQU0KPiBUbzogYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogRGV1Y2hlciwgQWxleGFuZGVyOyBHcm9kem92c2t5
LCBBbmRyZXk7IFF1YW4sIEV2YW47IFd1LCBYaWFvd2VpCj4gU3ViamVjdDogW1BBVENIXSBkcm0v
YW1kL3Bvd2VycGxheTogaW5jcmVhc2UgdGhlIFNNVSBtc2cgcmVzcG9uc2Ugd2FpdGluZyB0aW1l
Cj4KPgo+Cj4gSW5jcmVhc2UgdGhlIHdhaXRpbmcgdGltZSB0byAxcyBmcm9tIDIwMG1zLiBUaGlz
IGlzIGV4cGVjdGVkCj4gdG8gZml4IHNvbWUgbW9kZTEgcmVzZXQgZmFpbHVyZXMuCj4KPiBDaGFu
Z2UtSWQ6IEk0YzExOTk2NjI4Y2Q0MGQ1NTljNmVkZWE5N2QwOTJmMzk3MTIyZDc4Cj4gU2lnbmVk
LW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL2FtZC9pbmNsdWRlL2FtZF9zaGFyZWQuaCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9pbmNsdWRlL2FtZF9zaGFyZWQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5j
bHVkZS9hbWRfc2hhcmVkLmgKPiBpbmRleCA0NDdiYzRkLi43NzljOWU3IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hbWRfc2hhcmVkLmgKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2luY2x1ZGUvYW1kX3NoYXJlZC5oCj4gQEAgLTI4LDcgKzI4LDcgQEAKPiAg
I2VuZGlmCj4KPgo+IC0jZGVmaW5lIEFNRF9NQVhfVVNFQ19USU1FT1VUICAgICAgICAgICAyMDAw
MDAgIC8qIDIwMCBtcyAqLwo+ICsjZGVmaW5lIEFNRF9NQVhfVVNFQ19USU1FT1VUICAgICAgICAg
ICAxMDAwMDAwICAvKiAxMDAwIG1zICovCj4KPiAgLyoKPiAgICogQ2hpcCBmbGFncwo+IC0tCj4g
Mi43LjQKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQt
Z2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
