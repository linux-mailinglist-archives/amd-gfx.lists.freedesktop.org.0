Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8896EBF74B
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 19:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9776D6ED93;
	Thu, 26 Sep 2019 17:03:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDBE6ED93
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 17:03:28 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id p7so3612909wmp.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 10:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=USqjQ2hkzFHCGDniBVz2VSAd06P5hnFxlZoLd7QIyNk=;
 b=T+xQE+7dhA4UXT1z8FTvWyWAUu6VaAqNPUlp1zOWOSilr/2l1e4pl2JUATQDhzqsSy
 FB8Prj4L5wYqq92nTrJcUmnF2TCP0erxs0WNt5JuTOeJcv3Kly+sGkFnVYT88W7AK6ev
 xWUMzewahcNc3j2FQco8vVtOzIKhjkSHwHieUaN1Dnmz3gtUe3Tk1sPFgSAEBoOjHWPI
 97DqQIm5EAftgvO0lUDTJXObf/4DtlB4LaIo+INUBQeSTSJgGVM4zNfWyrCHAxN6dx41
 nVy38NQSiq9GgqYCPMBR1Cru/Lwo+3z5Syzig0sCnPN0ORsa4ZUT3xevioVmQQs3yxJO
 +BpA==
X-Gm-Message-State: APjAAAUpr5fjnaSYGZioGlLO2ou26Erzxb3MP9OetuYpNbam98b+UGPk
 Mjj5lbr2flYZKKYbVswhnXB9lpPGQFwhP9hTYwp0gA==
X-Google-Smtp-Source: APXvYqw8JYvgJjuKwkPm0fpWJwO7KgrlD13oTyiKtgBXuAAtvDhMmJNde2DmKEkoYwKAj1U5C9uGSCybSaBzdYJMHdQ=
X-Received: by 2002:a1c:3281:: with SMTP id y123mr3641038wmy.34.1569517407248; 
 Thu, 26 Sep 2019 10:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <63bd81a9-7166-73df-6605-83489fa7daf1@fedoraproject.org>
In-Reply-To: <63bd81a9-7166-73df-6605-83489fa7daf1@fedoraproject.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 26 Sep 2019 13:03:15 -0400
Message-ID: <CADnq5_NdHsap-mBwyhQNRHu_T=Vo_wPAEGjdHD1WxOdLW28-rw@mail.gmail.com>
Subject: Re: [Follow-up] Status of AMD Sensor Fusion HUB for Linux
To: Luya Tshimbalanga <luya@fedoraproject.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=USqjQ2hkzFHCGDniBVz2VSAd06P5hnFxlZoLd7QIyNk=;
 b=qZQcRELbus7Wo9k5Je+f2rdiEm2hT11dysELYmMTGE/uzllTiEGAmUdMMICECUFUs5
 W+9+veixollPuL3EuEx7OhKKfGAXjP4bBZTR6h28jXcEGc7OpqdUkR4wRVQQ0jOtg7Fk
 Dkwos16lu7SWXgmY8C2w+QGbaTE+lrueXJ7nI0l+jidsDykRV5KYEMvQNqs08CxZoIKa
 1kuUN1HChZ+Diqn0//+hAJsyMPga89WVb/6YF11ZMb9afFP1eVIRtjOOMZfJxGfeqHrp
 oz7eTW89ziwBeKx1EIyvHfcV7EmfcRvcQlJYUqsKrL1E8WiJtzyX1jw9jPIs36ZYu8j2
 uuMA==
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMzo1OSBBTSBMdXlhIFRzaGltYmFsYW5nYQo8bHV5YUBm
ZWRvcmFwcm9qZWN0Lm9yZz4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+IFdoYXQgaXMgdGhlIGN1cnJl
bnQgc3RhdHVzIG9mIHRoZSBkcml2ZXIgb3IgbW9kdWxlIGZvciBBTUQgU2Vuc29yIEZ1c2lvbgo+
IEhVQiBmb3IgbW9iaWxlIFJhdmVuIFJpZGdlIGZhbWlseT8gVG8gdGhpcyBkYXksIG1ham9yaXR5
IG9mIG1vYmlsZQo+IHBvd2VyZWQgZGV2aWNlIGVxdWlwcGVkIHdpdGggdGhhdCBBUFUgZmFtaWx5
IGxhY2tzIGd5cm9zY29waWMgZnVuY3Rpb24KPiBmb3IgdGhlIHNjcmVlbi4KPgoKVGhlIEZDSCB0
ZWFtIGhhcyBhbiBpbml0aWFsIGltcGxlbWVudGF0aW9uIGRvbmUuICBJSVJDLCB0aGV5IGFyZSBq
dXN0CmNsZWFuaW5nIHRoaW5ncyB1cCBhbmQgcmVzdHJ1Y3R1cmluZyBiYXNlZCBvbiBjb21tdW5p
dHkKcmVjb21tZW5kYXRpb25zLiAgSSB0aGluayB0aGUgcGF0Y2hlcyBzaG91bGQgYmUgYXZhaWxh
YmxlIHNvb24gaWYgdGhleQphcmUgbm90IGFscmVhZHkuCgpBbGV4Cgo+IFRoYW5rcyBpbiBhZHZh
bmNlLgo+Cj4gLS0KPiBMdXlhIFRzaGltYmFsYW5nYQo+IEZlZG9yYSBEZXNpZ24gVGVhbQo+IEZl
ZG9yYSBEZXNpZ24gU3VpdGUgbWFpbnRhaW5lcgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
