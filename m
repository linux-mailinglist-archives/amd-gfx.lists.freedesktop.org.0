Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFF1141342
	for <lists+amd-gfx@lfdr.de>; Fri, 17 Jan 2020 22:41:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5639A6F938;
	Fri, 17 Jan 2020 21:41:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12E56F938
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 Jan 2020 21:41:53 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a5so8815182wmb.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 Jan 2020 13:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rmvsvrCnTZs4sToyFG5ptQS82BG8s4xsmtCdQmDq4TI=;
 b=NccvBRtZPdHmf+b+yrRq8CtfNXQl0Gc215e0UQ9dPAIN08oH0cMpbnAdBwjUZJwWiu
 2n0r+CDB1BeDJsW7N+NtwJ59thpkZLlitDDpGBtaDHmKYunv/W/s9TB0ALBbnXCsP1Rt
 OT3xqhPiBS+Xp2PYO5atIHbx6x9a7ZD3O+EsKid5eBVc5etU/GhyxxI5bD/8BJrT9pxt
 +knX5/28pRX+iXxaMz3KE4FDrIzShYdJoZ2ar0f1Xy81tOWk6cH753WSaize1uS2MjT3
 P0BWZn/x9r+zaiy2Chw0RH/7VtuJnHgK+yewG2mB1kwA8115CiZ+o5m7LlZnZtLjbm/f
 dXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rmvsvrCnTZs4sToyFG5ptQS82BG8s4xsmtCdQmDq4TI=;
 b=tzATEdyS7tAB74tsLgLCyh5n4KfsmFBnxEhOo5gfn3EqliCllPOaFAA4bsvkI/Ux4d
 fkb7Rn/qgcRfH1Z5Fo0XgxXcaYwkNDoFZgkUXuN9XjJbTasoqzEGaUgPSiCedxSfAvaI
 YoCQ9VP1Uh4eFDUNfm91ShdqXpQegIRw5bjzrHkfFWyiQ1NZ1fbMO6f64CF4ZGfsLbJg
 adsR7hC0jHZ603kEmIff0Lt4BT674NpFGjM/xgx3pafQiG6bl3azCgg0udLseUatnFNQ
 +NNFQ24gjAGzAakwLMEj9PQ1VFXXmQBBMRAnYc3rWU7SZ6q/tFxyrQ3GsOjFzxUzUs4F
 NpIw==
X-Gm-Message-State: APjAAAWNatq58q7DRDuixtQb4DKNhggw8vMrPHYGW6DM7oHK3HPqPjU5
 PLIgu3NRk5iSioCbJYJO6LplrfhDQBJOsNUe6jo=
X-Google-Smtp-Source: APXvYqx4QFlGbiL4+GfGONGxQyOG2OwgIYuiu56v+YF4NIuTWBMLc12FXrc8li8hOuNMCM2JGWk+MEVNRUArR7QQkh0=
X-Received: by 2002:a1c:f009:: with SMTP id a9mr6586563wmb.73.1579297312345;
 Fri, 17 Jan 2020 13:41:52 -0800 (PST)
MIME-Version: 1.0
References: <CANDnon=0S6yCCz17jUXKJ9eR_URpF2Mg9Rty4awmcDeKb0kF1w@mail.gmail.com>
In-Reply-To: <CANDnon=0S6yCCz17jUXKJ9eR_URpF2Mg9Rty4awmcDeKb0kF1w@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Jan 2020 16:41:41 -0500
Message-ID: <CADnq5_O6rmRcLCX7VMiT210pXZL5ZVw8vo6raronda9Y4p=_tw@mail.gmail.com>
Subject: Re: Radeon rx 590 Fatboy on Linux still don't work
To: =?UTF-8?Q?Martin_B=C3=A5ngens?= <marbangens@gmail.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gMTcsIDIwMjAgYXQgMTI6NDggUE0gTWFydGluIELDpW5nZW5zIDxtYXJiYW5n
ZW5zQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBJIHN0aWxsIGhhdmUgcHJvYmxlbXMgd2l0aCBteSB2
aWRlbyBjYXJkLiBJIGRvbid0IHRoaW5rIHRoaXMgaXMgYWJvdXQgdGhyb3R0bGluZyBiZWF1cyBJ
IG9ubHkgc2VlIHRoZSBwcm9ibGVtIHdpdGggc3BlY2lmaWMgZ2FtZXMuIExpa2UgYWxsIGdhbWVz
IGFmdGVyIDIwMTAgYW5kIG1vc3QgZ2FtZXMgYWZ0ZXIgMjAwNS4gSSBkb24ndCBrbm93IHdoYXQg
aW5mb3JtYXRpb24gdG8gZ2l2ZSB5b3UgZGV2ZWxvcGVycy4gSSBoYXZlIHRpbWUgdG8gZG8gYW55
dGhpbmcganVzdCB0ZWxsIG1lIGlmIHlvdSBuZWVkIG1lIHRvIHRlc3Qgc29tZXRoaW5nLgo+Cj4g
d2hlbiBJIHBsYXkgZm9yIGV4YW1wbGUgQmFsY2sgTWVzYSBYZW4gb24gc3RlYW0gYWZ0ZXIgYWJv
dXQgNS0xMCBtaW4geG9yZyB3aWxsIGNyYXNoIGFuZCBzb21ldGltZXMgdGhlIExpbnV4IGtlcm5l
bCB0b28KPgo+IEkgaGF2ZSBhdHRhY2hlZCBhIHBpY3R1cmUgc2hvdyB3aGF0IHRoZSBzY3JlZW4g
bG9va3MgbGlrZSBhbmQgYSBkbWVzZyBsb2cgSSByZWNvcmRlZCByaWdodCBhZnRlciBYb3JnIGNy
YXNoZWQKCkxvb2tzIGxpa2UgYSBHUFUgaGFuZy4gIEknZCBzdWdnZXN0IGZpbGluZyBhIGJ1Zwoo
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9hbWQvaXNzdWVzKSBhbmQgaW5jbHVk
aW5nIHlvdXIKZnVsbCBkbWVzZyBvdXRwdXQgYW5kIHhvcmcgbG9nIChpZiB1c2luZyBYKSBhbmQg
YWxzbyB3aGF0IHZlcnNpb24gb2YKbWVzYSB5b3UgYXJlIHVzaW5nLgoKQWxleApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
