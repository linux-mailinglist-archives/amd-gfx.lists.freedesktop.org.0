Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 436A4DB824
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 22:12:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46656EAB7;
	Thu, 17 Oct 2019 20:11:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1314C6E0AD
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 20:11:57 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id o18so3731652wrv.13
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 13:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y4geD0bhIQxI8p7eThZFxpky4zmLV4wn8PYeHVdVhhs=;
 b=AqwD0xbVzgrrR5js1ou24ZoalJL7mDcwp1b24nCUAfrjt5rz4YRypE0qx377HDqCv2
 XJu1avnoPvTvRaJETc5tWM4RqBg08ZtARHBth4tIV8awFDtFs1ClMlJ4md7nE88YdwHV
 bzn/rwB+XePi28y+Ldnr+/zmGn5lQwa91t/Gh9zfOdeMs5taYiReXgMuXGluXM0ICU7V
 kYDzKQllhroRW2eARmgZs8wdSw31YRm3XPeG+05zdHdXSJNTeGHakHJQx46Pfi4qPt8L
 f6sJWmYKIWbI7OZBp8OuGu9JPGc7iF+N2+J302FImu7978LWa4HGtM0Li5nbr/CDPXQ3
 KWGQ==
X-Gm-Message-State: APjAAAWUvtTPLoFklMPSc37MXCGAN0HJonNHtGSn1zdbJSum0KzF+mHo
 2gIO0/md29/jVUficuQaOa8bv9tHmLx18DZnDik=
X-Google-Smtp-Source: APXvYqwSqQwVv7nVFXVxt+yYkuvzyXOuRhyOzobmPfofBI2wvbIlSgXq+tlJqWWCmeFfv1B+Xdu9b0Z0o6h6STPJ2ug=
X-Received: by 2002:a5d:6785:: with SMTP id v5mr1820109wru.174.1571343115561; 
 Thu, 17 Oct 2019 13:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAHL+j0_2ir=8hHDoyqizweOUSV6XfqC-UCD15WuJ9vvptNLr0g@mail.gmail.com>
 <CADnq5_N0r8O2vQapGaary0L-OfdTdz-ezcMJK90+Gy2sPujYcw@mail.gmail.com>
 <CAHL+j08qsu1pSOZPLB9-XWw9ZmT2OamaWPBJV4T3Vzx_C8cD7g@mail.gmail.com>
 <67658520-b3f4-d2f9-7247-dd434ab5c30b@amd.com>
 <CAHL+j0-Nm+6VFXi_w4iciNdG40zubpqvh1RXs3MFfXJK2mFr0Q@mail.gmail.com>
In-Reply-To: <CAHL+j0-Nm+6VFXi_w4iciNdG40zubpqvh1RXs3MFfXJK2mFr0Q@mail.gmail.com>
From: Sylvain Munaut <246tnt@gmail.com>
Date: Thu, 17 Oct 2019 22:12:15 +0200
Message-ID: <CAHL+j0_=r1XBOzwiQmbZTVoRsZ5=Du3pAPd_n7pia81FegdHhw@mail.gmail.com>
Subject: Re: Spontaneous reboots when using RX 560
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=y4geD0bhIQxI8p7eThZFxpky4zmLV4wn8PYeHVdVhhs=;
 b=rxCoIMd1RCMOfhnbtDnvVk9SPjMiqM4P3NKXH2boLBatGY5B8oIQfT5ulfKj46HF58
 ZW5CrsLBFUdkoQCD6U2Xj24Jr0N4/7djReEvnJv22+dqu0hOraoeaCKu+AsuZr0bCLap
 /Fn7Up5UCvYSsL88MeGsG+Sej5cbLL3Ci0ls0029o8Ys08qquCXgjTzDXMGG2AMkev5+
 y1PPtmmyLbYMz4VIJXZrTq2KVC3kadOiaEjSG7nWwb24pZt2JZ7B3uz9Ds4T2fDJAgSN
 XEZCH0oV9Zmj+N7F/8VkF+wtF2bHsGsH4E27jmAvWvWn+76cOuOMB7Tilxvz8KZp9D8Z
 3qBQ==
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
Cc: Alex Deucher <alexdeucher@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U28gYSBiaXQgbW9yZSB0ZXN0aW5nLgoKSSB3YXMgdXNpbmcgYSBiaXQgb2YgInVudXN1YWwiIGNv
bmZpZyBJIGd1ZXNzLCBoYXZpbmcgMiBHUFVzIGFuZCBzb21lCm90aGVyIHBjaWUgY2FyZHMgKDEw
RywgLi4pLgpTbyBJIHNpbXBsaWZpZWQgYW5kIHdlbnQgdG8gdGhlIG1vc3Qgc3RhbmRhcmQgdGhp
bmcgSSBjb3VsZCB0aGluayBvZiwKX2p1c3RfIHRoZSBSWCA1NjAgY2FyZCBwbHVnZ2VkIGludG8g
dGhlIG1haW4gUENJZSAxNnggc2xvdCBkaXJlY3RseQpjb25uZWN0ZWQgdG8gdGhlIENQVS4KCkFu
ZCBleGFjdCBzYW1lIHJlc3VsdHMsIG5vIGNoYW5nZSBpbiBiZWhhdmlvci4KClNvIG9uIG9uZSBo
YW5kIEknbSBoYXBweSB0aGF0IHRoZSBvdGhlciBjYXJkcyBhbmQgaGF2aW5nIHRoZSBBTUQgR1BV
CmluIHRoZSBzZWNvbmQgc2xvdCBpc24ndCB0aGUgaXNzdWUgKGJlY2F1c2UgSSByZWFsbHkgbmVl
ZCB0aGF0IGNvbmZpZwp0aGF0IHdheSksIGJ1dCBvbiB0aGUgb3RoZXIsIEknbSBubyBjbG9zZXIg
dG8gZmluZGluZyB0aGUgaXNzdWUgOi8KCkNoZWVycywKCiAgICAgU3lsdmFpbiBNdW5hdXQKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
