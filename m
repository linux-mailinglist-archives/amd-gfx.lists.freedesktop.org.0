Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15024579D8
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Jun 2019 05:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADCD6E58B;
	Thu, 27 Jun 2019 03:08:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4896E586;
 Thu, 27 Jun 2019 03:08:52 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id r9so711239ljg.5;
 Wed, 26 Jun 2019 20:08:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=fwFOZJmNRMFMG8DBhNpxx2sQgzMnzFNTmQmosth+Ozw=;
 b=IRAQb1v+TxnRDGaEK/nTl+w4D1L6dUO8wsnOSxeqwr9bX5dluE8UwfR5jBuRYRyZmI
 2xnogBQxa5/uzJVqvOeomGGlEGChgVpV8FiTJLqZS9o59p5XmxtzuYPqF/5lPZe/0/Yb
 hZNzx2K2OMR4X8bsTv+gatM49+8NLBcgVdqAp+xQBkt38j4RFDFPkxqvk1gbwWzTXs8E
 Bf+rCZ+Y8+M21fX1Syt6e3ID+9DHZ0trIAXnAY+FfgOAgXdkrqopJkjthTWPFKYrWenf
 JeoxRu5bEtkkEGDu1SrsMvHst9W6wY3mBA4bv2l5a/m6mWSMXzgsslL/eUFNt0uAYFqj
 IASA==
X-Gm-Message-State: APjAAAUy/teemHPxuIntv/v+90DZZVN60uiaQdN6E5B7QYO96E0d2x54
 nPWQqyuWj1m/d/z/HuPR+l2GXQIejn7cmWGZgxQtaQ==
X-Google-Smtp-Source: APXvYqyHA5pAr6SVnPOfRDMZsmTzgERdVlbfeoWKC1Z2IE1s48PE/Vpgbq5Mb34C27TXnofy60ycciauGVDzaa3yf5k=
X-Received: by 2002:a2e:9758:: with SMTP id f24mr974830ljj.58.1561604930571;
 Wed, 26 Jun 2019 20:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190625195520.3817-1-alexander.deucher@amd.com>
 <CAPM=9tyzn4G1gkvmtNRAhSfrui3MvzMX1OT8hf1Gv4+S06Qh4Q@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 27 Jun 2019 13:08:39 +1000
Message-ID: <CAPM=9ty7qenLONc=K3MR3rQivshCGiwpHVM3WX45K0_ViMB48A@mail.gmail.com>
Subject: Re: [pull] amdgpu, radeon, amdkfd drm-next-5.3
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=fwFOZJmNRMFMG8DBhNpxx2sQgzMnzFNTmQmosth+Ozw=;
 b=F504iwes8xdaU69ETGdjMxGQPhs76nE+qpoCJlQMnGI3EJmx8/VHJWnAXdyaJJZjOR
 UGZvCMOU5hVLB6Qv1OtgWiMZjwTI939oqhuSsAU1DmsjN2euNwaPmmJ46uWTtLP2vkir
 CamemepqO6OlnUwI4U6bWSlixos6YiwXq08mh55NqtyN0LqJBBDBqxDbbTBKDqUrnpFm
 qMXHNlNdpUThQtCvvFgu3Fl6p8RKcJBbh15r6yCfaveg4Cf9gtYELNnxmFTKEokeeTh8
 gBZ1lZWK5hOY3qWk77LdIDl+ENYUVFAC7hMf4B4LhgQaLoE7/VQwiks7Qfb053UXwdLU
 YOKA==
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCAyNyBKdW4gMjAxOSBhdCAxMzowNywgRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwu
Y29tPiB3cm90ZToKPgo+IFRoYW5rcywKPgo+IEkndmUgcHVsbGVkIHRoaXMsIGJ1dCBpdCBpbnRy
b2R1Y2VkIG9uZSB3YXJuaW5nCj4KPiAvaG9tZS9haXJsaWVkL2RldmVsL2tlcm5lbC9kaW0vc3Jj
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmM6IEluIGZ1bmN0aW9uIOKAmHZj
bl92Ml8wX3N0YXJ0X2RwZ19tb2Rl4oCZOgo+IC9ob21lL2FpcmxpZWQvZGV2ZWwva2VybmVsL2Rp
bS9zcmMvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYzoxMDEzOjE1OiB3YXJu
aW5nOiBjYXN0IGZyb20gcG9pbnRlciB0byBpbnRlZ2VyIG9mIGRpZmZlcmVudCBzaXplIFstV3Bv
aW50ZXItdG8taW50LWNhc3RdCj4gICAgICh1aW50MzJfdCkoKHVpbnQ2NF90KWFkZXYtPnZjbi5k
cGdfc3JhbV9jdXJyX2FkZHIgLQo+ICAgICAgICAgICAgICAgIF4KPiAvaG9tZS9haXJsaWVkL2Rl
dmVsL2tlcm5lbC9kaW0vc3JjL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmM6
MTAxNDo0OiB3YXJuaW5nOiBjYXN0IGZyb20gcG9pbnRlciB0byBpbnRlZ2VyIG9mIGRpZmZlcmVu
dCBzaXplIFstV3BvaW50ZXItdG8taW50LWNhc3RdCj4gICAgICh1aW50NjRfdClhZGV2LT52Y24u
ZHBnX3NyYW1fY3B1X2FkZHIpKTsKPiAgICAgXgo+CgpvbiBhcm0zMiBidWlpbGQuCgpEYXZlLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
