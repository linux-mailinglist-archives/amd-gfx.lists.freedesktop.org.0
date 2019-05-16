Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65563206CD
	for <lists+amd-gfx@lfdr.de>; Thu, 16 May 2019 14:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE1589319;
	Thu, 16 May 2019 12:22:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2C389319
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 12:22:47 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id n25so2888692wmk.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 05:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ijgo8eeMgxn7s0Ztzhg93USYgeGQnTuof29JIvoQL+A=;
 b=VNBuEtGAhDGDg/8Xc7/FV1oQd33swC0IWYtTGjcFczvO9zanqsG6rBZVb3pE/BvYjI
 TKtpBgWJjbSDVN+n3cMwpoHnfozTTOoS2sbj1IoeHMJ6mTnKrJzJ1XZRrTqQdRHd3gHN
 /qTvXPFb0le82zbbsgCnVXxZqAFph3q75RL94YDrbO3dgY9otNWkq+TLdUaNU3Prf7fr
 XnbRY74TIW7kGEKSSjfmslaQGk3v2W1X6iOlIZXg36LN03IO0FrzDWbIM8C6lFifTjuI
 Y8PX5VjoDmGylCIZhv7HCVHYxwkupZzVFvB9uLvHF3VpHRIQG+iwoVU6xcPctQKkz44d
 6v4w==
X-Gm-Message-State: APjAAAU0UkJkBkwAk0iZnrbJjMy6nvYBb3iXjSKm+em+OpwTNEz+0zKH
 m1KGauQOVQ3tLhOAYSkR0H/fBotaf44L3HFj2oniOg==
X-Google-Smtp-Source: APXvYqyfnPhlAfbqaKbkgNUjLy/SwPlP9vhbIbSMeFUCgcWtbaZt4AFNL/50IlYHh2kH5l8iWvASpVxl2oDxNLeW9hE=
X-Received: by 2002:a1c:200a:: with SMTP id g10mr9811405wmg.121.1558009365797; 
 Thu, 16 May 2019 05:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190515202413.6522-1-Bhawanpreet.Lakha@amd.com>
 <20190515202413.6522-2-Bhawanpreet.Lakha@amd.com>
In-Reply-To: <20190515202413.6522-2-Bhawanpreet.Lakha@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 May 2019 08:22:33 -0400
Message-ID: <CADnq5_PSHzz5yDG0C1GE79LbnNsA5Wtk-=xYdC0A0TdOSdMbzw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/amdgpu: Fix maybe-uninitialized warning in
 df_v3_6_pmc_start
To: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ijgo8eeMgxn7s0Ztzhg93USYgeGQnTuof29JIvoQL+A=;
 b=qGTHjVPvLf+ZmjmZemAwVE7sj+300PVHCIBYavhl7PYs5RCv3aGjSUAUZot5Hqnce1
 dTC71w6gM4yPUNNwAdWB+2B8jS25+yVfn9wN8U5UGzPzqkHHI2/9kR2ljC2i05zOOaFj
 JMUHAMMy0gBUhSBovIlmjZ+8ipBSzYC5buTZqsUF+ymlRhpwztp7iIEyUyNC0sJy9/Aj
 1X2OKf3p/H/nB87ZjoFqm3MxWfJq+1pLeGs3ZJrd1RW1I+gLaaKWDv32k6Bb72ZgW8VG
 wCmVmMam+J+vQ3rMm9zbl26FySmNdCRkNsUnOinJo3saHR3GluV4pEEURKvCiB5Tiuiw
 WrjQ==
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

U2VyaWVzIGlzOgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgoKT24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgNDoyNCBQTSBCaGF3YW5wcmVldCBMYWto
YQo8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIGZpeGVzIHRoZSB3
YXJuaW5nIGJlbG93Cj4KPiBlcnJvcjog4oCYcmV04oCZIG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6
ZWQgaW4gdGhpcyBmdW5jdGlvbiBbLVdlcnJvcj1tYXliZS11bmluaXRpYWxpemVkXQo+ICAgaW50
IHhnbWlfdHhfbGluaywgcmV0Owo+ICAgICAgICAgICAgICAgICAgICAgXn5+Cj4gU2lnbmVkLW9m
Zi1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYyB8IDIgKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZGZfdjNfNi5jCj4gaW5kZXggMjAxYzAwNDExNzIwLi5hODQ0MjUwOGVlYTUgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jCj4gQEAgLTQ1OSw3ICs0NTksNyBA
QCBzdGF0aWMgaW50IGRmX3YzXzZfc3RvcF94Z21pX2xpbmtfY250cihzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwKPiAgc3RhdGljIGludCBkZl92M182X3BtY19zdGFydChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwgdWludDY0X3QgY29uZmlnLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaW50IGlzX2VuYWJsZSkKPiAgewo+IC0gICAgICAgaW50IHhnbWlfdHhfbGluaywgcmV0
Owo+ICsgICAgICAgaW50IHhnbWlfdHhfbGluaywgcmV0ID0gMDsKPgo+ICAgICAgICAgc3dpdGNo
IChhZGV2LT5hc2ljX3R5cGUpIHsKPiAgICAgICAgIGNhc2UgQ0hJUF9WRUdBMjA6Cj4gLS0KPiAy
LjE3LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
