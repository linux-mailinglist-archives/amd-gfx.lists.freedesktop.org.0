Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E197E2F3
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 21:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932666E78B;
	Thu,  1 Aug 2019 19:03:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242446E78B
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 19:03:53 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id v19so64167242wmj.5
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 12:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mochcDC4DcMmqvTs35S3aiANRiMZ05YbRGoohQ0E/yk=;
 b=EnBd6Kkxhp/qi8IYSMnlaZo1yNsqS6XgDLjLms9cFWk+GPqoqUC/wdPuvhQN7fhXe8
 yPiW+T2l9d+RZ4pcto4X5KTpbXFr3GNusAnPOJKi0PKf8WlsF9EX2teZO36PR8LhZNXN
 Ay1pj/aZTG9cEB1dV7pX4ja0mOX2Qa+BzOzyxNHDY2K3jYr1xhHxJMNDutuDodT+4Yny
 iQbKsyglacLrpPV+wDd63DCEvjtJxlMgNA8cuRjkVytsArgTJdBcRnZBz8B2qYlMwWXL
 zFS3oa/Tw3ezr/S6ENIrNWPjSw4yzyUNlG7KMCxJwhwYOgUm52nUeevL8PMzKyNmLj51
 AoOw==
X-Gm-Message-State: APjAAAW/o5KFloBS645jUTylNGu/cF117Qmp9oCpAezHcaCfbeYIde/7
 YTMPfePZUO2ueIQLUyQSWTmyWMeajXuIAGyTRpT6gA==
X-Google-Smtp-Source: APXvYqx0JgpiYM2oEryuxdbV6z2GpZVy3yFU9R9rJkHfYAV8GYLyx3ZY0GeR+jgf4yL20a8WVxsJRd32wEYtbkAwTVc=
X-Received: by 2002:a1c:9e90:: with SMTP id h138mr186713wme.67.1564686231525; 
 Thu, 01 Aug 2019 12:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190731201435.10776-1-mcoffin13@gmail.com>
 <MN2PR12MB334472B24E84DC3C2D94EF37E4DE0@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB334472B24E84DC3C2D94EF37E4DE0@MN2PR12MB3344.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 1 Aug 2019 15:03:39 -0400
Message-ID: <CADnq5_Od4-L3yEH6XZ+1rW6j=zFC1aWyMD+kzteoL1sBFuthFg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: Allow changing of fan_control in
 smu_v11_0
To: "Quan, Evan" <Evan.Quan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=mochcDC4DcMmqvTs35S3aiANRiMZ05YbRGoohQ0E/yk=;
 b=CJ48AXApEaHQr5KeL1viab6T4ok7F0IhByFhJLXA94teM37StKTQXkRTK2Qdoqgcc+
 g6GZxzeRy9t4k61Wdx8Kdh9PI6Yu7W3WfZm+Gim31HzKX7+a6th9H7x5NU9sNaifyTU4
 hLZAnBdXwW+io7lxd4oPVOJ+lZHSg0xBaL+395dHOwwwTEYRvUY6cM01RBwpkOdbseml
 lH1LU9XrZoMw8z0gOvBRd1qC0HL9fyrncRnyqen0u7FTeL0AYDdwnKZ5UCuFZJjj9Iw5
 hH2yEVMS/t0PqiVem9NPDOcetFTBqoMrCZL4rjOMnKJMbWW5j/8eGqmylJezdrGf+bw4
 dglA==
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
Cc: Matt Coffin <mcoffin13@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIFdlZCwgSnVsIDMxLCAyMDE5IGF0IDExOjE3IFBN
IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPiB3cm90ZToKPgo+IFRoYW5rcyBNYXR0LiBU
aGUgcGF0Y2ggaXMgcmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+Cj4K
PiBSZWdhcmRzLAo+IEV2YW4KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9t
OiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhh
bGYgT2YKPiA+IE1hdHQgQ29mZmluCj4gPiBTZW50OiBUaHVyc2RheSwgQXVndXN0IDAxLCAyMDE5
IDQ6MTUgQU0KPiA+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gQ2M6IE1h
dHQgQ29mZmluIDxtY29mZmluMTNAZ21haWwuY29tPgo+ID4gU3ViamVjdDogW1BBVENIXSBkcm0v
YW1kL3Bvd2VycGxheTogQWxsb3cgY2hhbmdpbmcgb2YgZmFuX2NvbnRyb2wgaW4KPiA+IHNtdV92
MTFfMAo+ID4KPiA+IFtXaHldCj4gPiBCZWZvcmUgdGhpcyBjaGFuZ2UsIHRoZSBmYW4gY29udHJv
bCBzdGF0ZSBvbiBzbXVfdjExIHdhcyBub3QgYWJsZSB0byBiZQo+ID4gY2hhbmdlZCBiZWNhdXNl
IHRoZSBjYXBhYmlsaXR5IGNoZWNrIGZvciBjaGVja2luZyBpZiB0aGUgZmFuIGNvbnRyb2wgY2Fw
YWJpbGl0eQo+ID4gZXhpc3RlZCB3YXMgaW52ZXJ0ZWQuCj4gPgo+ID4gW0hvd10KPiA+IFRoZSBj
YXBhYmlsaXR5IGNoZWNrIGZvciBmYW4gY29udHJvbCBpbiBzbXVfdjExXzBfYXV0b19mYW5fY29u
dHJvbCB3YXMKPiA+IGludmVydGVkLCB0byBjb3JyZWN0bHkgY2hlY2sgZm9yIHRoZSBhYnNlbmNl
LCBpbnN0ZWFkIG9mIHByZXNlbmNlIG9mIGZhbgo+ID4gY29udHJvbCBjYXBhYmlsaXRpZXMuCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogTWF0dCBDb2ZmaW4gPG1jb2ZmaW4xM0BnbWFpbC5jb20+Cj4g
PiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyB8IDIg
Ky0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8w
LmMKPiA+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKPiA+IGlu
ZGV4IDA1ODhkZDhjZDFiYS4uNDNmY2JkYmJhNjMwIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCj4gPiBAQCAtMTM2MSw3ICsxMzYxLDcgQEAgc211
X3YxMV8wX2F1dG9fZmFuX2NvbnRyb2woc3RydWN0IHNtdV9jb250ZXh0Cj4gPiAqc211LCBib29s
IGF1dG9fZmFuX2NvbnRyb2wpICB7Cj4gPiAgICAgICBpbnQgcmV0ID0gMDsKPiA+Cj4gPiAtICAg
ICBpZiAoc211X2ZlYXR1cmVfaXNfc3VwcG9ydGVkKHNtdSwKPiA+IFNNVV9GRUFUVVJFX0ZBTl9D
T05UUk9MX0JJVCkpCj4gPiArICAgICBpZiAoIXNtdV9mZWF0dXJlX2lzX3N1cHBvcnRlZChzbXUs
Cj4gPiBTTVVfRkVBVFVSRV9GQU5fQ09OVFJPTF9CSVQpKQo+ID4gICAgICAgICAgICAgICByZXR1
cm4gMDsKPiA+Cj4gPiAgICAgICByZXQgPSBzbXVfZmVhdHVyZV9zZXRfZW5hYmxlZChzbXUsCj4g
PiBTTVVfRkVBVFVSRV9GQU5fQ09OVFJPTF9CSVQsIGF1dG9fZmFuX2NvbnRyb2wpOwo+ID4gLS0K
PiA+IDIuMjIuMAo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+ID4gYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
