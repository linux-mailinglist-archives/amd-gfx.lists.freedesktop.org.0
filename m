Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E09EFD4288
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 16:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBE76EC48;
	Fri, 11 Oct 2019 14:15:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A736EC4A
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 14:15:57 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z9so12114886wrl.11
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 07:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xF2H1TKgLVHffOZVE4BSWwq6Wo8KB9P2i/LT/zBTmaM=;
 b=r4xakCxyZoi6t7x+yulYO9JWRGoN6NOrbEk4X6xPrE6kp4tYTh1RbUckvq7DSqkFvv
 y/55f4fSUri4atIUPwTvY8MDY8A2sRgI3fRIwBuVTNbkRQ0wIi9/tarT3BNbML879RkM
 9vkMGG856ftb/HA6H+aLi4Ew5WzDgswHSWin2abQPK+cV9hJ70DVfWjqkmVpfVaaA3Wg
 BJ14HXK+h+m4a6zZSIIT5rsUWS1m5C8aVT9OXEJwN8btm3E2geZYNkhcD3DhMJ/Cs7/N
 NMGR0XzM1eLgA9dCeK+xQ3oM4/d5TOhRaDx7f1anEPUUsZEXLcdWaFhF7EzJSbIyH55T
 6dDQ==
X-Gm-Message-State: APjAAAUK43ZMUNbdcR/MlrGc/MpSi+FnZ+u+koWNOPP2nhKEDZTTGqP6
 Qw22FPxXvd0XdBMRrb9GYkyfStnZrqFFYHRdqZnbyw==
X-Google-Smtp-Source: APXvYqwIv7EIR8kfeo2adCOT3QnAsdYIVja/5KG0oBI/gIMztC1reNk7LhIYQIMWL8inGA+FaUxslyu8WIa3XyIpdx4=
X-Received: by 2002:adf:ee8a:: with SMTP id b10mr13368208wro.40.1570803355888; 
 Fri, 11 Oct 2019 07:15:55 -0700 (PDT)
MIME-Version: 1.0
References: <1570792228-11189-1-git-send-email-le.ma@amd.com>
 <1570792228-11189-4-git-send-email-le.ma@amd.com>
In-Reply-To: <1570792228-11189-4-git-send-email-le.ma@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 11 Oct 2019 10:15:42 -0400
Message-ID: <CADnq5_NXT_g8GS9S4w6=4DQdYUPVhN9=6ndj0hxTXbx1qmkugg@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/amd/powerplay: add BACO platformCaps for VEGA20
To: Le Ma <le.ma@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=xF2H1TKgLVHffOZVE4BSWwq6Wo8KB9P2i/LT/zBTmaM=;
 b=SxrKfYBDPXrzyK8zqr5C6VaonCA9dHzamhjUP1HlCG3LW4DGDLvv/GLjSQjQJ1fF7s
 a0fuP3NsmcflI10EgkFEuKTRY49BUWDdS/++wz6QkWlSn/B30i1ch4fsUNuSO9myopfx
 e1dIUbZ9nKyZ0/4qT1XEEdk+KgLsa/BIMoug+K/GRLe00C8rfr2gDGXQMl4Q06h9MBkV
 oAqPcsLy/Venfxcsd3DwzFI6fqnal+5/+7q/hLhFTV5mcoAmZ8nw1yum899LWnpV0vsG
 as2cW3WSn+LsnEABcxuyV/NO4vnocgCQ72Agaha9aKHusZCsfUZqcRaoTDmBF0SdqTBm
 4Jwg==
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
bWQuY29tPgoKT24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgNzoxMCBBTSBMZSBNYSA8bGUubWFAYW1k
LmNvbT4gd3JvdGU6Cj4KPiBCQUNPIHJlc2V0IGlzIG5lZWRlZCBmb3IgUkFTIHJlY292ZXJ5Lgo+
Cj4gQ2hhbmdlLUlkOiBJODIwN2ZjMzE0NzQ0NDY4Yzg5YmE0YTAzMGNiMmJiMTViMDgyYWFjNwo+
IFNpZ25lZC1vZmYtYnk6IExlIE1hIDxsZS5tYUBhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMjBfaHdtZ3IuYyB8IDMgKysrCj4gIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMjBfaHdtZ3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jCj4gaW5kZXggNjYyOWM0NzUuLjNkM2M2
NDcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVn
YTIwX2h3bWdyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92
ZWdhMjBfaHdtZ3IuYwo+IEBAIC0xODMsNiArMTgzLDkgQEAgc3RhdGljIGludCB2ZWdhMjBfc2V0
X2ZlYXR1cmVzX3BsYXRmb3JtX2NhcHMoc3RydWN0IHBwX2h3bWdyICpod21ncikKPiAgICAgICAg
ICAgICAgICAgICAgICAgICBQSE1fUGxhdGZvcm1DYXBzX1RhYmxlbGVzc0hhcmR3YXJlSW50ZXJm
YWNlKTsKPgo+ICAgICAgICAgcGhtX2NhcF9zZXQoaHdtZ3ItPnBsYXRmb3JtX2Rlc2NyaXB0b3Iu
cGxhdGZvcm1DYXBzLAo+ICsgICAgICAgICAgICAgICAgICAgICAgIFBITV9QbGF0Zm9ybUNhcHNf
QkFDTyk7Cj4gKwo+ICsgICAgICAgcGhtX2NhcF9zZXQoaHdtZ3ItPnBsYXRmb3JtX2Rlc2NyaXB0
b3IucGxhdGZvcm1DYXBzLAo+ICAgICAgICAgICAgICAgICAgICAgICAgIFBITV9QbGF0Zm9ybUNh
cHNfRW5hYmxlU01VN1RoZXJtYWxNYW5hZ2VtZW50KTsKPgo+ICAgICAgICAgaWYgKGFkZXYtPnBn
X2ZsYWdzICYgQU1EX1BHX1NVUFBPUlRfVVZEKQo+IC0tCj4gMi43LjQKPgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxp
c3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
