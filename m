Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8931395F
	for <lists+amd-gfx@lfdr.de>; Sat,  4 May 2019 12:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F500892D8;
	Sat,  4 May 2019 10:51:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E10892D8
 for <amd-gfx@lists.freedesktop.org>; Sat,  4 May 2019 10:51:23 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id r10so7309550ioc.8
 for <amd-gfx@lists.freedesktop.org>; Sat, 04 May 2019 03:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GVBj4dVEhIKY7iESU7rq+M4XOWcmefYRi5c8rO4Ucsg=;
 b=hZuh58sUg9JcNeFwB2BVb6r45hhuInyprQpihLJbMarsHDUfAfG+7o2PRaR2y9sxZd
 Zz25BiQANBNQMqKRF4sy086yylcR2O8KdRJcT785d0tnwtjyvVOZVbCEhj3NC44mcSHW
 g1btpL6z6Xijdg04OvpVxtqPOoU3oYbJz7fDRWaja6wCGarlXqM4BbyiYyW8blgOeNHn
 ffm8m6ge6GccEU7gYHvBtR8cMiTxoV35vAhkhfuqTWDyL9ffDyZ58erqQi1HE4L6HXUy
 nT5wb8wIZ/e4yn6I6qGLovC9SyEonXqq/D1H7TPOdeMEAIIN7gaokx4TYNNEi61/pyBI
 9zDg==
X-Gm-Message-State: APjAAAXbu5R5qgcOQm2TFbAHlHUhsppDwEzWavNMU1KbERDdRjlN/s7n
 KYLxun08AnVumR1R69fXekidgiXTKDWE0qGn8lM=
X-Google-Smtp-Source: APXvYqwS0vu0L/Bf4qfTWn4IcR9+VjBrwF9dWldhPFYIUxVt6Je7G2dJmEJfbHgbwaHh3gzMmRmykJX9reqrOrLzzGI=
X-Received: by 2002:a6b:da0a:: with SMTP id x10mr5161226iob.90.1556967082789; 
 Sat, 04 May 2019 03:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsMY=LvtCp0V8U8jbARXgapjQe4WP9ss-ui3fHsPQjevXg@mail.gmail.com>
 <98231ce0-f29c-df52-1ba3-c9f85a76bcac@gmail.com>
In-Reply-To: <98231ce0-f29c-df52-1ba3-c9f85a76bcac@gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Sat, 4 May 2019 15:51:11 +0500
Message-ID: <CABXGCsOXEWS5fUrQZQf0qdH6Wn=h5BC9cPaoQk8hYhvW-nm6AA@mail.gmail.com>
Subject: Re: How to dump gfx and waves after GPU reset happened?
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GVBj4dVEhIKY7iESU7rq+M4XOWcmefYRi5c8rO4Ucsg=;
 b=VHa7uATAUTF+hi0Vcpv18Xmuraa71OOiM5fbfnaYRi6UIzJzg1NqdBq0iWM+947tbf
 vRYcd+6noM0V3xzniXjHTYWClBtFb0AL5Qernu1idHhbMnNZfA9KywSdW4YoyiNE1wzO
 H8Pd6d7f9bQ8aY0Cf8DNIvtyDn8eNuAMXjdFVqzhf/TdHspnKmVH0sz+agNvjWj3uQD3
 L2nHltQFrT4GozlGgaRqe1lsWjPo4zyXd+Xh2usP/4whtyM9vk8WBn8/DCM/cpPVWRFh
 DmA+uVztMCdA+KkO80N8eKM06VL5yVNhA3tRu5bw4SfBB6zf/wBhJSvc4puY+zVy0ZZG
 Zrww==
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
Cc: Tom St Denis <tom.stdenis@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gU2F0LCA0IE1heSAyMDE5IGF0IDEyOjMzLCBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmlnLmxl
aWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBNaWtoYWlsLAo+Cj4gd2VsbCBz
aG9ydCBhbnN3ZXIgaXMgbm90IGF0IGFsbCA6KQo+Cj4gQWZ0ZXIgdGhlIEdQVSByZXNldCBoYXBw
ZW5lZCBhbGwgd2F2ZXMgc2hvdWxkIGJlIGdvbmUgYW5kIHRoZSBnZnggYmxvY2sKPiBpbiBhIGNs
ZWFuIHN0YXRlIGFnYWluLgo+Cj4gV2hhdCB5b3UgbmVlZCB0byBkbyBpcyB0byBkaXNhYmxlIGF1
dG9tYXRpYyByZXNldCBieSBzZXR0aW5nCj4gYW1kZ3B1LmxvY2t1cF90aW1lb3V0PS0xIG9uIHRo
ZSBrZXJuZWwgY29tbWFuZCBsaW5lIGFuZCB0aGVuIGluc3BlY3QgdGhlCj4gc3lzdGVtIG92ZXIg
c3NoLgo+CgpUaGlzIGlzIG5vdCBjb252ZW5pZW50LCBiZWNhdXNlOgotIHJlcXVpcmVzIGFuIGFk
ZGl0aW9uYWwgY29tcHV0ZXIuCi0gYWZ0ZXIgdGhlIEdQVSBmcmVlemVzLCB0aGUgY2hhbmNlcyBv
ZiBjb3JyZWN0bHkgcmVzdGFydGluZyB0aGUKY29tcHV0ZXIgdGVuZCB0byB6ZXJvLgpGb3IgbWUs
IGFzIGEgYnVnIGh1bnRlciwgaXQgd291bGQgYmUgbW9yZSBjb252ZW5pZW50IGlmIGFsbCB0aGUg
ZHVtcHMKd2VyZSBhdXRvbWF0aWNhbGx5IGRyb3BwZWQgYmVmb3JlIHJlc2V0dGluZyB0aGUgR1BV
IHRvIHNwZWNpZmllZApkaXJlY3RvcnkuCgpCdXQgdGhhbmtzIGFueXdheS4KSGVyZSBpcyBhIG5l
dyBidWcgcmVwb3J0OiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9p
ZD0xMTA2MDUKCi0tCkJlc3QgUmVnYXJkcywKTWlrZSBHYXZyaWxvdi4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
