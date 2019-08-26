Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2479D65E
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 21:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E8D89DE6;
	Mon, 26 Aug 2019 19:24:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164B389DE6
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 19:24:45 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id v15so618750wml.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 12:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RDOPfe7Lbfd5e2Qy77pVBxLlyxnoam1+jsQt5/w2wLQ=;
 b=TSJjlMioOQYcdxjFY7V3dCYWFbi1h5QeJCfnfStcb53LytiqxqXMt7cofuffowE5wh
 LFz6+qxMhfdK+x1urL9QzOFP2tF7A1XBs1YbuviEnjLraqJRPh81hMIATiI/+m0DbX5J
 O1ZqN3jzAbcchX78o52YQDXTy8tcNQSbJ+maoX5U3UdaQjknjFe8HJaOxlLqDQzV55xN
 JUzAy9ype374U30zROuBAtgxe78mQOr23pWrwdi4zaHr26w+u2WJqfwmvuCYk0sj13Ju
 cCU8xRu5OHWCu/kjZDO8/QhQIEakwBkXFqKn3TCXQowkkGqOWMhmej1taVhgla6OkArG
 XuQw==
X-Gm-Message-State: APjAAAXKMztJGPquEldp7IAv3hZSB45ZAuNjQo+4o0kY12IhNpmHR2OQ
 gs7IS63j0jzFPTOAxD4v3fCHL+oN3Z8NIMblyN0=
X-Google-Smtp-Source: APXvYqyEdZ0mM21iW1ihioGmboufy5darIwoGbqw4KsUaq14ats0dHCpckF6hfsYs/m5kkV++qZRxlC2milXzm8maio=
X-Received: by 2002:a1c:c1cd:: with SMTP id
 r196mr24647660wmf.127.1566847483552; 
 Mon, 26 Aug 2019 12:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190826111323.79a7e87f@endymion>
In-Reply-To: <20190826111323.79a7e87f@endymion>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 26 Aug 2019 15:24:31 -0400
Message-ID: <CADnq5_NurPA+o0KNkhnhAEW5hpmZQssN4Ma_moKAexKPDo3c=A@mail.gmail.com>
Subject: Re: vddgfx reported as N/A
To: Jean Delvare <jdelvare@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=RDOPfe7Lbfd5e2Qy77pVBxLlyxnoam1+jsQt5/w2wLQ=;
 b=fh004jAsIr0kWrBJXfU8z07xJtci94xshMIgNojO49Mgqd/YP3gR/Y3c2aUlWBp3Xn
 F4sbd6Hv6DSBcCjuVbhEYcNaM1jLb0RoxJHOcbIwqwMvBPVDULlt7RfbFfvmFAanFvfd
 4nt5negfjMH9ZZfLCjQjKuZ9MrJi3NVz02QxbB7X6NghQ8pMvygqJhxAcsk7mk7LVqEl
 28my1HCxSReiGBSAdcSwdJE//wpnWa3DadEMOMYjEsJMTF7HkJ8Ba6z63u36K0JEMxpb
 T7273dqVSiQb9nDKqwd87DXGPuXwCji3QuAfHqui5axyHI8E4indYq3ev3Tq05TU70BN
 QKlA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgOToxMSBBTSBKZWFuIERlbHZhcmUgPGpkZWx2YXJlQHN1
c2UuZGU+IHdyb3RlOgo+Cj4gSGkgYWxsLAo+Cj4gSSBhbSBpbnZlc3RpZ2F0aW5nIHdoeSAic2Vu
c29ycyIgcmVwb3J0cyBhbWRncHUncyB2ZGRnZnggYXMgTi9BIG9uIG15Cj4gUmFkZW9uIFI1IDI0
MC4gRGlnZ2luZyB0aHJvdWdoIHRoZSBjb2RlIEkgZm91bmQgdGhhdAo+IHNpX2RwbV9yZWFkX3Nl
bnNvcigpIGlzIGJlaW5nIGNhbGxlZCB3aXRoIGlkeCA9IEFNREdQVV9QUF9TRU5TT1JfVkRER0ZY
Cj4gd2hpY2ggaXMgKm5vdCogaW1wbGVtZW50ZWQgYnkgdGhpcyBmdW5jdGlvbi4gU28gaXQncyBu
ZXZlciBnb2luZyB0bwo+IHJlcG9ydCBhbnkgdmFsdWUuCj4KPiBUaGUgc2l0dWF0aW9uIGlzIHRo
ZSBzYW1lIGZvciBrdl9kcG1fcmVhZF9zZW5zb3IoKSB3aGljaCBhbHNvIGRvZXNuJ3QKPiBzdXBw
b3J0IGlkeCA9IEFNREdQVV9QUF9TRU5TT1JfVkRER0ZYLiBpZHggPSBBTURHUFVfUFBfU0VOU09S
X0dQVV9QT1dFUgo+IGlzIGFsc28gbm90IHN1cHBvcnRlZCBieSBlaXRoZXIgZnVuY3Rpb24gd2hp
bGUgaXQgaXMgYmVpbmcgY2FsbGVkCj4gKHJlc3VsdGluZyBpbiBwb3dlcjEgYmVpbmcgcmVwb3J0
ZWQgYXMgTi9BIHRvbykuCj4KPiBNeSBxdWVzdGlvbiBpcyB3aGV0aGVyIHRoaXMgaXMgc29tZXRo
aW5nIHRoYXQgY2FuIGJlIGltcGxlbWVudGVkIG9yIG5vdD8KCkl0J3MgY2VydGFpbmx5IHBvc3Np
YmxlLCBidXQgdGhlc2UgY2hpcHMgYXJlIHNvIG9sZCwgd2UnZCBwcm9iYWJseSBiZQpoYXJkIHBy
ZXNzZWQgdG8gZmluZCB0aGUgcmVsZXZhbnQgcmVnaXN0ZXIvZmlybXdhcmUgaW50ZXJmYWNlIHRv
IHF1ZXJ5CnRoaXMgaW5mb3JtYXRpb24gYXQgdGhpcyBwb2ludC4KCj4KPiBJZiBpdCBjYW4ndCBi
ZSBpbXBsZW1lbnRlZCBiZWNhdXNlIHRoZSBoYXJkd2FyZSBkb2VzIG5vdCBoYXZlIHRoZXNlCj4g
c2Vuc29ycyB0aGVuIEkgd291bGQgcHJlZmVyIGlmIHRoZSBhdHRyaWJ1dGVzIGFyZSBub3QgY3Jl
YXRlZCBhdCBhbGwgc28KPiBhcyB0byBub3QgY2x1dHRlciB0aGUgb3V0cHV0IG9mICJzZW5zb3Jz
Ii4KClByb2JhYmx5IGJlc3QgdG8gYWRkIHRoZXNlIGNhc2VzIHRvIGh3bW9uX2F0dHJpYnV0ZXNf
dmlzaWJsZSgpIGluIGFtZGdwdV9wbS5jLgoKQWxleAoKPgo+IFRoYW5rcywKPiAtLQo+IEplYW4g
RGVsdmFyZQo+IFNVU0UgTDMgU3VwcG9ydAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
