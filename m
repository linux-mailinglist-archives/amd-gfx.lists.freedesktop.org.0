Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0C5867E0
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 19:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09DD6E027;
	Thu,  8 Aug 2019 17:23:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313BD6E027
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 17:23:54 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r3so1968496wrt.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 08 Aug 2019 10:23:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U3AS9VJDCGtNpKE0Hvj4VbKBsXhOnRcsIAZdvQvC2aI=;
 b=LoUwhCz3kYnv4q4WboT0PK3bqqcXjLTudqiLMOme5jlXJmoBrWdjiECZNC7+6q7WPF
 ng1GFYVOJzzLts58O6BwXXAZULW/YgyqGrrkVsLK7tnTQgDPCXhMarmr/KhEOsncBf3V
 +9wed+21KrgOb5nj5B/8+OJB29pLZFi3tGas4eImcLnBB5KnCv3NgAJCjUwu7PyBoqEa
 P1sikvf+h8hh3gtCVd+oKO5zCH1MRFNcZxdyZYOSlMDD2/js41shtHhfZ9Kn19INZXjJ
 Rt6XNBO7/ZeADsHpr0U2FbGgceSkx9xNoyjOJHSoee3FFvjJFFfOyqVeOFxDxoJUWWIi
 LqZw==
X-Gm-Message-State: APjAAAUFDSrSyu0QRJlpn5klp7gbEK7/N9O2GOeNK+DZmPB989Ru2IMG
 ZvZwRQwZqTodvb5nc8bjvZHNX8af6YNzyzhcvtBHKg==
X-Google-Smtp-Source: APXvYqwR9LOGzT34P1V1IvQfbP+mbOyiE00TE8G74HdQBjD+CO/6o0JVchX1lpcWwVjYvM0i+voeoBNIS/8jGjh7cmY=
X-Received: by 2002:a5d:6b11:: with SMTP id v17mr18074795wrw.323.1565285032680; 
 Thu, 08 Aug 2019 10:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <BYAPR12MB27097A9CC4333FD798966B30F1D70@BYAPR12MB2709.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB27097A9CC4333FD798966B30F1D70@BYAPR12MB2709.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Aug 2019 13:23:39 -0400
Message-ID: <CADnq5_N5TrBKCH_S+=eDXxQQ-VwEvONn1aGyicSrL3B38BJhSA@mail.gmail.com>
Subject: Re: libdrm patch merge request
To: "Chen, Guchun" <Guchun.Chen@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=U3AS9VJDCGtNpKE0Hvj4VbKBsXhOnRcsIAZdvQvC2aI=;
 b=CbeNVxHIWi5YKXpKPv0OdOH2bL1cWZ1Bb3R20YN0PwZgPN1IwV+3qluO2DFqMghCQY
 etehVWclBBX776/Ormdj+fXvZ+zzYliiQfgrvMfbmmWE24ZAWLBUvYcAcaYi4zHxnBIW
 TKOi2Oc+M72iXTp/PcslCoktHpLQFbdHAUDfOSxlF2xnZKoCjfyxmx141oE8UUL74WSP
 zh06M8aN3ah+dLJ48lSjuQgf9ip5AGgeSRVfAM7WLpE4axW3rmeBnxQZoghxgovic/J+
 k+cv7LFMjCFCXutpX0V+HB3ZY81nC5gOyFNDLt9AR8albo3xpfiqUYud15nvyRCM39k0
 tLZQ==
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Li, Candice" <Candice.Li@amd.com>,
 "Li, Dennis" <Dennis.Li@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RG9uZSEKCkFsZXgKCk9uIFRodSwgQXVnIDgsIDIwMTkgYXQgNToxOCBBTSBDaGVuLCBHdWNodW4g
PEd1Y2h1bi5DaGVuQGFtZC5jb20+IHdyb3RlOgo+Cj4gSGkgQWxleCwKPgo+Cj4KPiBXb3VsZCB5
b3UgbWluZCBtZXJnaW5nIGF0dGFjaGVkIDMgcGF0Y2hlcyB0byBsaWJkcm0gbWFzdGVyIGJyYW5j
aD8KPgo+IFRoZXNlIGNoYW5nZXMgYXJlIGltcGxlbWVudGVkIGZvciBnZnggYW5kIHVtYyByYXMg
aW5qZWN0IHVuaXQgdGVzdCBieSBhbWRncHVfdGVzdC4KPgo+IFRoYW5rcyBhIGxvdC4KPgo+Cj4K
PiBSZWdhcmRzLAo+Cj4gR3VjaHVuCj4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
