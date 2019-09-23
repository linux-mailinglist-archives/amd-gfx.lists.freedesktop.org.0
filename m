Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E83BBE29
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 23:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5573B88FAD;
	Mon, 23 Sep 2019 21:54:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7851E88FAD
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 21:54:26 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id b24so10843496wmj.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 14:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MFjwKs6S0BT5G+W+NL6jtIVxKxo4qQrYlHyR4iHKA/Q=;
 b=jTtBFOgX3KKFoSTOzNP9+pM9UiL8SqVX/4Cin9tBJPqcNbg1L2/hobL2xoXDenZV+u
 l0ik89yfxZQ9w1vMTUvBLjGkjc/jNL6Gnqid2Dxb4XSV5CGNggnu9489OSoiW3BFs4mO
 K7d/TQP+swH1rqZ5fMQhP6ayoPhaH2idupAfDKVetVEbwncBg0fgE1ncLD3hJn/5R5oN
 abnmLE6JfeXAxvc0ejsa0liLYDwRNHzn1N+u/zsQcOkIve9O8Yko9WuA08urBpFAOvKG
 ASHAiS00kmrwMYPIse0XrJzEak35p96Ruy3b2ghxvu0/80g/KdVUndz+yNk0jy/aL27B
 Z1/Q==
X-Gm-Message-State: APjAAAUUkd6RhvHrS1KaPZGZTeTdzc1v+BpywWw65nRDyhNE0CGYG8W8
 VWT+Sv66eIe5RyhPeu9FaUWnZJHXEkfCkEbGZ34=
X-Google-Smtp-Source: APXvYqwwKGdBb4c0zbr5fiwZb7ePI4GDKRyQlS003jQlK/2njPujn1d1/OZpZPTkN7N+M3WwqcgUsunADgMEjKnHAVo=
X-Received: by 2002:a05:600c:54a:: with SMTP id
 k10mr1278494wmc.127.1569275664934; 
 Mon, 23 Sep 2019 14:54:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190923205804.12300-1-alexander.deucher@amd.com>
 <9ad314e5-1a6f-f17f-ac1c-ec33aed2912e@amd.com>
In-Reply-To: <9ad314e5-1a6f-f17f-ac1c-ec33aed2912e@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 23 Sep 2019 17:54:11 -0400
Message-ID: <CADnq5_NK57bqucbjp9Dn73kKPnhAqEvVHO68vZOvatOZ4pwCyw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/display: include slab.h in dcn21_resource.c
To: Harry Wentland <hwentlan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=MFjwKs6S0BT5G+W+NL6jtIVxKxo4qQrYlHyR4iHKA/Q=;
 b=pXy4RduS8ZY5dZx7IUEB8P8Rs44VP14ANhG7EDTO0KeWa8BiUNfQDsUUyzb1P3o+cR
 hxBhSkHea+hRjkflqAQKg/GT+/FigX0PoSkROkL3c4d7JWsFzok1R8WfEAF2JCCeVCdH
 SWjd+RY5aCc/Iplqjn6TPisvFVDRrxJ3Wx+rFSpW7SnzL3uDAwZcwxIK2GgZmXE8Ms1o
 sy7hnjDh4phREpyVOBObivB/osH6xs8bJXJdBlVTfmNoH8X0JJYW0OPtXu6oZhe4qYgu
 uJjAfh0nByR5I4iF4mdpQ7Lf6EHCIS3wrw6MXVD9v8IUGeNZzqekfjGnkgZNLGgu0MYp
 p/IQ==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgNToxNCBQTSBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5A
YW1kLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMDE5LTA5LTIzIDQ6NTggcC5tLiwgQWxleCBEZXVjaGVy
IHdyb3RlOgo+ID4gSXQncyBhcHBhcmVudGx5IG5lZWRlZCBpbiBzb21lIGNvbmZpZ3VyYXRpb25z
Lgo+Cj4gQ3VyaW91cyB3aGljaCBjb25maWcgZmFpbHMgYW5kIHdoYXQgY29tcGlsZXIgZXJyb3Jz
IHdlIGdldC4uLiBTb3VuZHMKPiBsaWtlIG91ciBpbmNsdWRlcyBhcmUgbWVzc2VkIHVwIHNvbWV3
aGVyZS4KCk5vdCBzdXJlIGV4YWN0bHk6Cmh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzkvMjAv
OTk4CgpBbGV4Cgo+Cj4gSGFycnkKPgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jIHwgMiArKwo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UuYwo+ID4gaW5kZXggM2Nh
NTEzOWYxMjczLi5kZTE4MjE4NWZlMWYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UuYwo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNlLmMKPiA+IEBAIC0yMyw2
ICsyMyw4IEBACj4gPiAgICoKPiA+ICAgKi8KPiA+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3NsYWIu
aD4KPiA+ICsKPiA+ICAjaW5jbHVkZSAiZG1fc2VydmljZXMuaCIKPiA+ICAjaW5jbHVkZSAiZGMu
aCIKPiA+Cj4gPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
