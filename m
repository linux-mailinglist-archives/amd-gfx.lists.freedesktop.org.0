Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA2823DFF
	for <lists+amd-gfx@lfdr.de>; Mon, 20 May 2019 19:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0AB8922F;
	Mon, 20 May 2019 17:04:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-it1-x129.google.com (mail-it1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19308916D
 for <amd-gfx@lists.freedesktop.org>; Mon, 20 May 2019 00:09:11 +0000 (UTC)
Received: by mail-it1-x129.google.com with SMTP id a190so20171284ite.4
 for <amd-gfx@lists.freedesktop.org>; Sun, 19 May 2019 17:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=t3tJqyh5gUFB2t4n8wHwk7GvgduDRPjtMADXd+L5CHg=;
 b=WCa3wnkEZty/w7d5AyBFTpSHC5eoF5Osk0yBxM91lRU/0m2RJqcBjbxaut4aHbAb91
 7xlHPpCocjZALM8bMsLd4tDexUSlf0+898hKsFCJ/yBSadQXni4ExOg+hf14PkDbd71k
 kcvxAdsg7PHp24HsWd2lk+0YDMrp/OIAp8DssLxRnZ9N9xa40XzNbJsT7D0+/eoxuBi7
 YBzfU4SFxuh7tWdzDFbBEMDWNVjWfgfs6u//cu+Clwf+FHUe48Tcm0PLzYrIx4aTjWy6
 /4jJ4b1ZherhOmYISMSqJJtIArbH0hA5tXhBleQU5523N+G3Od8gPbPSuyPDOp8UFbT5
 wlgA==
X-Gm-Message-State: APjAAAUP6lyGlRRMMrykew8JObG/SxcLhmqQmxOHcuxd5ILtW+zb9zRq
 fo5FUAVLkI1AAU+o1ZJPnp/frhSe5zdQ+ian5AFTLBzd59A=
X-Google-Smtp-Source: APXvYqxP9UhAuIYDmxo4d3EwDNgEoU2vaywPrg24NmP7qlCUwbAAD+JkH6WWRtQqlod1ALuO44GkIgbbDOcBgQbJPU0=
X-Received: by 2002:a24:6e92:: with SMTP id w140mr27121824itc.53.1558310950767; 
 Sun, 19 May 2019 17:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAG=7Bt8UFiqqfwODc-e+2tN18x3LMYz9AoBmq9ukWsY-b4TaqA@mail.gmail.com>
 <CADnq5_NsVLJ1tYyQ_e1QPrLg7M6mf1nuR18BOsA+3YJp-LCONQ@mail.gmail.com>
 <CAG=7Bt_ScazVsdOBsszBnHW81Zr_78diU=XvTff9yTeDgGeo8Q@mail.gmail.com>
 <CAG=7Bt8VEgsiqaMDYtU31ut1pU+h6_rEaqnfh2tyR7SuEpUQ8g@mail.gmail.com>
 <CAG=7Bt9NM+9umAZBb74h8dFLevqTk_xesy0TKdLUFMuyDnw_TQ@mail.gmail.com>
In-Reply-To: <CAG=7Bt9NM+9umAZBb74h8dFLevqTk_xesy0TKdLUFMuyDnw_TQ@mail.gmail.com>
From: Braiam <braiamp@gmail.com>
Date: Sun, 19 May 2019 20:08:59 -0400
Message-ID: <CAG=7Bt9nCoO8YKWPWzAQHGCUWJxkW28wEuQrV7igPa6UE++wuA@mail.gmail.com>
Subject: Re: How to get useful information other than "the whole system locks
 up"?
To: amd-gfx list <amd-gfx@lists.freedesktop.org>
X-Mailman-Approved-At: Mon, 20 May 2019 17:04:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=t3tJqyh5gUFB2t4n8wHwk7GvgduDRPjtMADXd+L5CHg=;
 b=IbH8wJWbpZU9U79E8xegvW00e6MTk0dyKagM2nUVVcuJSF2o+18y29QjaxRgfE0b1r
 T17oyzwBWW/6ADO/otbOQJwhcLW4zX70vewWFcPtlFZSHcYOqn3Y6MJtQLof0GuDgr5k
 brFcmCOznYJba3QSJt2Qgwckbc8B5mJA7CIlodsFyG7QKT5a3o2BFECzUtV8RcD4ax4B
 UG9C8SOEt2+u8ENGtXXAAjhO5pNbiM5d5LudRKOHGNqlLy6PJt5GAAXxKXBGEQMBrfze
 qVLQJ7Txe7muL6imJOqkSRNjIOYx7/DXlHHfMIShilSpsaEBz5eXfqeQscoSvfCP1qVZ
 IqSA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RGVjaWRlZCB0byBzaW1wbHkgY29udGFjdCB0aGUgbWFudWZhY3R1cmVyIGFuZCBhc2sgdGhlbSBm
b3IgdGhlIGxhdGVzdAp2QklPUy4gVGhvdWdoIGl0IGRpZG4ndCBjcmFzaCB0aGUgZGF5cyBiZWZv
cmUgY2hhbmdpbmcgdGhlIGJpb3MsIGl0Cmhhc24ndCBjcmFzaGVkIHRoZSBkYXlzIGxhdGVyLiBQ
bHVzIHBvaW50cyBzaW5jZSBvcGVuY2wgYWxzbyBzZWVtcyB0bwpiZSB3b3JraW5nIGZpbmUgbm93
LCByYXRoZXIgdGhhbiBtYWtpbmcgdGhlIGNhcmQgY3Jhc2ggdG9vIChvcgpyZWZ1c2luZyB0byB3
b3JrIGFsdG9nZXRoZXIpLiBTZWVtcyB0aGF0IG9uZSBvZiB0aGUgdGhpbmdzIHRvIHRha2UKaW50
byBhY2NvdW50IGZvciBjcmFzaGluZyBjYXJkcyBpcyBpZiB0aGUgYmlvcyBpcyBtb2RpZmllZC4K
CgoKLS0gCkJyYWlhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
