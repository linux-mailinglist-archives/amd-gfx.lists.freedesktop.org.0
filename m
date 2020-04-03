Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E89C19DBD7
	for <lists+amd-gfx@lfdr.de>; Fri,  3 Apr 2020 18:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB5D6E15F;
	Fri,  3 Apr 2020 16:39:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C526E15F
 for <amd-gfx@lists.freedesktop.org>; Fri,  3 Apr 2020 16:39:01 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id l23so7915861otf.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 03 Apr 2020 09:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UZYWD1ZsX+gJl61EogG2lRd8K9twFHpGvwiYgK2kQPU=;
 b=bqHrShBIP/CxAMEMkEuX2RXMNuIS9+IIYrmpxDaPc1wLd2hoFJxZkQ3zOZJsitrcCg
 +rkSPNZDE/kOrjsgdeD/tVb8YkZ8AH2xopOOe1EIKuXi3dqNaTJt8pvHtDqe5cdtcU8M
 KcZHbkj0nNK5OUEwh2At0Q9R+JIjwm38mu5t4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UZYWD1ZsX+gJl61EogG2lRd8K9twFHpGvwiYgK2kQPU=;
 b=dabUd8GRKf5a1IR1qounEW2w9rWZBQJVW1iXlnHilsmKKGkIVPjDQO2C97BhBwckGO
 ehhrKq5ANpaCfBHgAh50TOnWiqs3y2vigBo4M/dpat8DTLeRgtABBW8EJRISAWptV/wX
 wQGwL7E1ZojioTtHB6a8d9LJlsPyXJ54sDPRDFpfInSuCpPFt3qt34HPOIgrzkG3SDJe
 A+Shho7FvlmdEiiHrekPqiznazrT1FNNrb5ssydeAsyKnrZN1FXz94vkDal6Gcno1/r9
 2ZzXkX0twFnvtcI9UF62j8azXx0uv+F+BwO18ZJzTaWtfWIjAm/4r0UZ4YCG12JU1XPE
 uv5Q==
X-Gm-Message-State: AGi0PubAc5GHKzP86jCmbmhDtFn2Zie6LBAZXZ1yJH+Ci0k6o7ujyua6
 Ny+YgqkR5HP0eS+SMJ+h66tcTBrgaEFIEAq1Lggo6Q==
X-Google-Smtp-Source: APiQypIy3Mo5CIPN/93CjHwiWGajBNWkCam78qn8gr+V8n3sh79fszBS11BXrdZt4I0DzPILqHrZdlViuPZcMMP9kHY=
X-Received: by 2002:a9d:6e8f:: with SMTP id a15mr7485747otr.188.1585931941059; 
 Fri, 03 Apr 2020 09:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <9bef42f5-2f6e-a102-917d-7c55f2bf83d4@daenzer.net>
In-Reply-To: <9bef42f5-2f6e-a102-917d-7c55f2bf83d4@daenzer.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 3 Apr 2020 18:38:49 +0200
Message-ID: <CAKMK7uHxtvd4=POpBEPNfimjpz6Q7AO4P_XWsgd0fiLN8G1bUA@mail.gmail.com>
Subject: Re: amdgpu dropping load callback triggers WARN_ON in
 __drm_mode_object_add
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMywgMjAyMCBhdCA2OjMwIFBNIE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFl
bnplci5uZXQ+IHdyb3RlOgo+Cj4KPiBJJ20gZ2V0dGluZyB0aGUgYXR0YWNoZWQgV0FSTklORyBz
cGxhdHMgc2luY2UgYW1kZ3B1IGRyb3BwZWQgaXRzIGxvYWQKPiBjYWxsYmFjay4gVGhleSdyZSBm
cm9tCj4KPiAgICAgICAgIFdBUk5fT04oIWRldi0+ZHJpdmVyLT5sb2FkICYmIGRldi0+cmVnaXN0
ZXJlZCAmJiAhb2JqX2ZyZWVfY2IpOwo+Cj4gaW4gX19kcm1fbW9kZV9vYmplY3RfYWRkLgo+Cj4g
SSdtIG5vdCBzdXJlIGhvdyB0byBhZGRyZXNzIHRoaXMsIHNpbmNlIG9ial9mcmVlX2NiIGlzIGFs
d2F5cyBOVUxMIGhlcmUsCj4gYW5kIEkgZG9uJ3QgdGhpbmsgTVNUIGNvbm5lY3RvcnMgZ2V0dGlu
ZyBhZGRlZCBhZnRlciBkZXYtPnJlZ2lzdGVyZWQgaXMKPiBzZXQgY2FuIGJlIGF2b2lkZWQ/CgpJ
IG5lZWQgdGhlIGZ1bGwgc3BsYXQsIG90aGVyd2lzZSBjYW4ndCB0ZWxsIHlvdSB3aGF0J3MgZ29p
bmcgd3JvbmcuClRoZXJlJ3MgMiBjYXNlczoKCi0gaG90cGx1Z2dhYmxlIHN0dWZmLCB3aGljaCBo
YXMgdGhlIG9ial9mcmVlX2NiIHNldC4gRXNzZW50aWFsbHkgTVNUIGNvbm5lY3RvcnMuCgotIG5v
dC1ob3RwbHVnZ2FibGUgc3R1ZmYsIHdoaWNoIGlzIGV2ZXJ5dGhpbmcgZWxzZS4gVGhleSBkb24n
dCBoYXZlCm9ial9mcmVlX2NiIHNldC4gSXQncyBhIGRyaXZlciBidWcgdG8gcmVnaXN0ZXIgdGhv
c2UgYWZ0ZXIgdGhlIG92ZXJhbGwKZHJtX2RldmljZSBoYXMgYWxyZWFkeSBiZWVuIHJlZ2lzdGVy
ZWQgYW5kIHB1Ymxpc2hlZCB0byB1c2Vyc3BhY2UuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIK
U29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4
IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4Cg==
