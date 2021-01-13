Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BC42F4665
	for <lists+amd-gfx@lfdr.de>; Wed, 13 Jan 2021 09:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CB36E150;
	Wed, 13 Jan 2021 08:24:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0ACC89F0A
 for <amd-gfx@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:04 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id t16so1077293wra.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZrAn4+wDZmlfBR1rfJlysK73SQhLsoiqGo2tEfZCQmE=;
 b=Fo+5d2Qnx2ZvhIHxnePiJy2uCwG4UXEV5E/LYfLTG9faOdpCrAgX53+BN3qhjYq5Sl
 QoB3qT4vetWNija2BRSuV6oX/i34XcXmWM2HoW4GhBALPhJufGAJaSO/FnyqH4aEy/rF
 Z6vNyDetyvcM+d/27rEbP8ELQC/u9o83z332ZErtvVLwkO7g5/X7jAz8l7nXnswWLXqp
 kwG01D5PsS4Ynw043ZtAJPxL/7NC2Gx5c6xgx2g6EeBCi9g8xTmIRf2aXnyu7nVU58Ah
 r3v+to2Wgki43+IoH5+CD4s30vkAjvnZ/otXZ9piwHvfebS3bvaFp8JDos+MxPC4R7eD
 NROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZrAn4+wDZmlfBR1rfJlysK73SQhLsoiqGo2tEfZCQmE=;
 b=AO+agn0NAbj4jLpUj+EKEvyF9UOWYJJSDxspFglHJIUty4N4L/CPSMhaVqRgNl0ml2
 2gRHUwnVaGvZuq/NhLH1IYjh3mETboe9hrra8mkDOJu1DFz+vCE+tb3JWhUoUhfiAx3M
 Iz7fS0dzmlNh+wo1aKqhAZ9HapL29N1bOc/X6Jd+XCoSb7RSqB4jQr8R9eh2adWW0QdA
 JTimC6rRLoYhWuRL7PTtdY7q52FJYYnxb8WLrIX86FCYsF/i7hPFb4wjmN+rNt8ozxSh
 nwJRQaeWgDU/76XxrX1X//Hl0ktQ1hvcpoHxFxw6jlPuqurr7I/2K0heQi9aCJv2rPmq
 bOww==
X-Gm-Message-State: AOAM532lDedHCDIG9fCIWuXMCyRQhU/H+gTgPlKvFEORFnJqUOkl1Iyy
 xhMfiHn61WFKVYNdMQH/6WmT9g==
X-Google-Smtp-Source: ABdhPJyy8/ZuVen3JuzvSrrWvtQxDzlo06ukQJLOMU/yOXtlOltivIzBh7Y5Cz6RQHwaKXLXvlrgKg==
X-Received: by 2002:a05:6000:1043:: with SMTP id
 c3mr1191861wrx.34.1610525283553; 
 Wed, 13 Jan 2021 00:08:03 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:02 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 06/30] drm/amd/display/dc/core/dc_resource: Staticify local
 functions
Date: Wed, 13 Jan 2021 08:07:28 +0000
Message-Id: <20210113080752.1003793-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:24:28 +0000
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmM6MTEy
MDo1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHNoaWZ0X2JvcmRlcl9s
ZWZ0X3RvX2RzdOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS8uLi9kaXNwbGF5L2RjL2NvcmUvZGNfcmVzb3VyY2UuYzoxMTMxOjY6IHdhcm5pbmc6
IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYcmVzdG9yZV9ib3JkZXJfbGVmdF9mcm9tX2Rz
dOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCgpDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5Lndl
bnRsYW5kQGFtZC5jb20+CkNjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KQ2M6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmln
IiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxp
bnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
U2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJjZS5jIHwgNiArKystLS0K
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfcmVzb3VyY2UuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMKaW5kZXgg
MDdjMjI1NTY0ODBiZS4uZDQyMzA5MmM0NWRjZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfcmVzb3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJjZS5jCkBAIC0xMTE3LDcgKzExMTcsNyBAQCBz
dGF0aWMgdm9pZCBjYWxjdWxhdGVfaW5pdHNfYW5kX2Fkal92cChzdHJ1Y3QgcGlwZV9jdHggKnBp
cGVfY3R4KQogICogV2UgYWxzbyBuZWVkIHRvIG1ha2Ugc3VyZSBwaXBlX2N0eC0+cGxhbmVfcmVz
LnNjbF9kYXRhLmhfYWN0aXZlIHVzZXMgdGhlCiAgKiBvcmlnaW5hbCBoX2JvcmRlcl9sZWZ0IHZh
bHVlIGluIGl0cyBjYWxjdWxhdGlvbi4KICAqLwotaW50IHNoaWZ0X2JvcmRlcl9sZWZ0X3RvX2Rz
dChzdHJ1Y3QgcGlwZV9jdHggKnBpcGVfY3R4KQorc3RhdGljIGludCBzaGlmdF9ib3JkZXJfbGVm
dF90b19kc3Qoc3RydWN0IHBpcGVfY3R4ICpwaXBlX2N0eCkKIHsKIAlpbnQgc3RvcmVfaF9ib3Jk
ZXJfbGVmdCA9IHBpcGVfY3R4LT5zdHJlYW0tPnRpbWluZy5oX2JvcmRlcl9sZWZ0OwogCkBAIC0x
MTI4LDggKzExMjgsOCBAQCBpbnQgc2hpZnRfYm9yZGVyX2xlZnRfdG9fZHN0KHN0cnVjdCBwaXBl
X2N0eCAqcGlwZV9jdHgpCiAJcmV0dXJuIHN0b3JlX2hfYm9yZGVyX2xlZnQ7CiB9CiAKLXZvaWQg
cmVzdG9yZV9ib3JkZXJfbGVmdF9mcm9tX2RzdChzdHJ1Y3QgcGlwZV9jdHggKnBpcGVfY3R4LAot
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBzdG9yZV9oX2JvcmRlcl9sZWZ0
KQorc3RhdGljIHZvaWQgcmVzdG9yZV9ib3JkZXJfbGVmdF9mcm9tX2RzdChzdHJ1Y3QgcGlwZV9j
dHggKnBpcGVfY3R4LAorCQkJCQkgaW50IHN0b3JlX2hfYm9yZGVyX2xlZnQpCiB7CiAJcGlwZV9j
dHgtPnN0cmVhbS0+ZHN0LnggLT0gc3RvcmVfaF9ib3JkZXJfbGVmdDsKIAlwaXBlX2N0eC0+c3Ry
ZWFtLT50aW1pbmcuaF9ib3JkZXJfbGVmdCA9IHN0b3JlX2hfYm9yZGVyX2xlZnQ7Ci0tIAoyLjI1
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
