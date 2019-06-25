Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56830521D6
	for <lists+amd-gfx@lfdr.de>; Tue, 25 Jun 2019 06:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9956B89E2B;
	Tue, 25 Jun 2019 04:16:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666A089E2B
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 Jun 2019 04:16:09 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id v18so14741695ljh.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 21:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hB3lXA2mw1u7xhV+HnD/GeVFmej+CkGJ1pUo37qS1Cg=;
 b=phg/dN6RkV+Iy3z/WUrhYvrdASxoEc7prNFgZQUx9ni2fm06nJ3UAEcTuak7BGi3Vc
 xuytpKZAJ7wpnXaPC+eCbsZ88xjg4tZtJbTBIVqq6nSO9PB/Dk0RpF7mskkZ/lDN2h2i
 pWADnYIQUYxfHw4g6tP9GFqVQKZ0QIYdaPHF2WO1O+TQ4kMD3Nlzd1bJBhrH2mV9iV+g
 kgPjao288F5M1LViz7RFd9m5o6m1mdv1nFXdTog7EQ+FZbUIDW2GBiTm5IQPAb3Jl5jM
 I/QkYFyY9mquXFed96loi3tEqijlGdep6TCFaQbGufsq4ZN3WdK9g1RgpiAPl81DRpIq
 exCg==
X-Gm-Message-State: APjAAAXHma4H5e3bvFtLpRl/ONaZxrbyjfDu8EF+gynU+Mjgb2Ga9pxW
 U9r8P/0g3wMm6VmgbANv9CCJPlIvwxk0zlenNuKGBw==
X-Google-Smtp-Source: APXvYqwdYL5YJ5X6W4/w2AP2ZWzHD19eHJXZZNyleRpgpERWuzYoeJkM7j3w1uE4twiXIQAX5y2ExCq4ZvunxlkFSl4=
X-Received: by 2002:a2e:9758:: with SMTP id f24mr31350868ljj.58.1561436167683; 
 Mon, 24 Jun 2019 21:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
 <20190606205501.16505-9-Bhawanpreet.Lakha@amd.com>
In-Reply-To: <20190606205501.16505-9-Bhawanpreet.Lakha@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 25 Jun 2019 14:15:56 +1000
Message-ID: <CAPM=9tw86HPHdDN9dAGLtL5RbRyxH69DmWq_0sH5C30xXnx7_w@mail.gmail.com>
Subject: Re: [PATCH 08/24] drm/amd/display: add audio related regs
To: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=hB3lXA2mw1u7xhV+HnD/GeVFmej+CkGJ1pUo37qS1Cg=;
 b=LM2Yo2Q0ULZfg66sTFR9J/qctZZjYeisjhb1axMnBzVB4AnZ27bqGhvfQJXj+s1odO
 1IW7toKPwr6hem59iE8ZRBkjWCvFylVn/MZtdZ5Z7KSp/YBOAsQ72QkOyqMNEazNAh8a
 JTnIlV2AOqqzq/fd+ptdZ3/6JSLPXQFbu5SYbz3OzIxrvE6xPkQj+TH5WcCuRnP9aeas
 B4rAUqKQTrU4gvZVU0imEIc80/4ntOWccLnd9bMW1dnkoDDUnDTLJ5tHbIGBZsI+b6V6
 WYr5jY6x9OJ9DUctO27iFXjZzjRtXii16XLZg+vnTUwo3T7HdaI7JoFBbC3tBsYRjpkP
 JcSg==
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
Cc: Charlene Liu <charlene.liu@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCA3IEp1biAyMDE5IGF0IDA2OjU1LCBCaGF3YW5wcmVldCBMYWtoYQo8Qmhhd2FucHJl
ZXQuTGFraGFAYW1kLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBDaGFybGVuZSBMaXUgPGNoYXJsZW5l
LmxpdUBhbWQuY29tPgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hhcmxlbmUgTGl1IDxjaGFybGVuZS5s
aXVAYW1kLmNvbT4KPiBSZXZpZXdlZC1ieTogQ2hyaXMgUGFyayA8Q2hyaXMuUGFya0BhbWQuY29t
Pgo+IEFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYXVkaW8u
YyB8IDQgKy0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdWRp
by5oIHwgNyArKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY2UvZGNlX2F1ZGlvLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2Rj
ZV9hdWRpby5jCj4gaW5kZXggN2Y2ZDcyNDY4NmYxLi5kNDNkNWQ5MjRjMTkgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYXVkaW8uYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1ZGlvLmMKPiBAQCAtMjIs
NyArMjIsNyBAQAo+ICAgKiBBdXRob3JzOiBBTUQKPiAgICoKPiAgICovCj4gLQo+ICsjaW5jbHVk
ZSAiLi4vZGMuaCIKCklzIHRoaXMgaW5jbHVkZSBuZWVkZWQ/IGp1c3Qgc2VlbXMgd2llcmQgdG8g
aGF2ZSBhZGRlZCBpdCB3aXRoIG5vIG1lbnRpb24uCgpEYXZlLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
