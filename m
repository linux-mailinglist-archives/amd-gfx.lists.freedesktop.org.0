Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F775D75B
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBAD76E04B;
	Tue,  2 Jul 2019 20:29:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688BF6E04A
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:06 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id x47so20127672qtk.11
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4yNfGIPtncRz+0akLZmVr1xO39ZRrtjXHvY/GUvsTrQ=;
 b=LBGqa2FMxJMUaKF/2T+yE4q5qSNgI9DIlT1UIkJO2HCxcm5Av6dR5XzQ5rS34GE6X1
 Z+yPxOcVW9zFM46kmwOClboBIJeH9B4MVhxcRxgH9htjtNPzUnmg2cQSV0rYO1DT9oKC
 JLBMNeSLrWW04UbbfHaOwmpj28sjKk6VO74GYdIuwn+6xtrd50QuZkcDHMpGHkXm44Vi
 8VWe5drMDU996lpK41LSMgbhV6Pc3sq0Byrf8qax7K8XFLD4Y86aY1QJpHbZGgK0yBaZ
 qK5xjWQjg9yCwR2qq3tdB1hcvh7oy1fIFWPBQcpQPaBF5qARqXDaH+XKAlJhrrIECt58
 3GFw==
X-Gm-Message-State: APjAAAW/BOCUtpW7Fn8q/ifB9Vu+u1+2S35DC974ZZA3J57ZxPuIixxQ
 xOCSQ7I51b9vSusFgsqdP4q0XLMYHSY=
X-Google-Smtp-Source: APXvYqwBhBcydiigl8IyFOyhtDsBlH7fEw2QtkhJQfhwhj7QPJts90oMdV0lU0k7ACqShhHPeDCGDg==
X-Received: by 2002:a0c:d1f0:: with SMTP id k45mr28709162qvh.69.1562099345342; 
 Tue, 02 Jul 2019 13:29:05 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:04 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 11/53] drm/amdgpu/sdma5: add sdma5_0 golden settings for navi14
Date: Tue,  2 Jul 2019 15:28:02 -0500
Message-Id: <20190702202844.17001-12-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4yNfGIPtncRz+0akLZmVr1xO39ZRrtjXHvY/GUvsTrQ=;
 b=SA6feBwzZ2ZzB2CVNLXxXd7HIm2ucJdcd0g9DspsZ482q4eeOlJp6a0boaFglQVEGP
 NswI1jvfNWa54rHhuqjYbA5ryavtNRIPK5qUoHBe/GwHx5hsk1lDt3bh0DtCp6uOYoHc
 Y9VbpudLCqR3IFfJRpDvUTPgJnwa/mtYOpm/e9TR+YvULCxa2v1mc4NcuENWfJuLqc1f
 LyaHxtjET8Ubk2eKXBX5GYS+ioGYdZJYqUXiDUW0UrVzP6i00FDf68fvsza9YFkEOfa3
 b5DVQW5izT5o2wPNz1odpYT3kJAGmm2klRyDCz2am+7Uk1wo2QpFRtCleOYOyJkdJAyE
 5bPA==
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
Cc: Snow Zhang <Snow.Zhang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCkFkZCBzZXR0aW5ncyBm
b3IgbmF2aTE0LgoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1k
LmNvbT4KUmV2aWV3ZWQtYnk6IFNub3cgWmhhbmcgPFNub3cuWmhhbmdAYW1kLmNvbT4KU2lnbmVk
LW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jIHwgNiArKysrLS0KIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9zZG1hX3Y1XzAuYwppbmRleCBjYWYzNGRkM2M1NzMuLjllZjM2ZWIzZWNmZCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMKQEAgLTYyLDcgKzYyLDYgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBzb2MxNV9yZWdfZ29sZGVuIGdvbGRlbl9zZXR0aW5nc19zZG1hXzVb
XSA9IHsKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVNETUEwX1JMQzBfUkJfV1BU
Ul9QT0xMX0NOVEwsIDB4ZmZmZmZmZjcsIDB4MDA0MDMwMDApLAogCVNPQzE1X1JFR19HT0xERU5f
VkFMVUUoR0MsIDAsIG1tU0RNQTBfUkxDMV9SQl9XUFRSX1BPTExfQ05UTCwgMHhmZmZmZmZmNywg
MHgwMDQwMzAwMCksCiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1TRE1BMF9STEMy
X1JCX1dQVFJfUE9MTF9DTlRMLCAweGZmZmZmZmY3LCAweDAwNDAzMDAwKSwKLQlTT0MxNV9SRUdf
R09MREVOX1ZBTFVFKEdDLCAwLCBtbVNETUEwX1JMQzNfUkJfV1BUUl9QT0xMX0NOVEwsIDB4MDAw
MGZmZjAsIDB4MDA0MDMwMDApLAogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tU0RN
QTBfUkxDNF9SQl9XUFRSX1BPTExfQ05UTCwgMHhmZmZmZmZmNywgMHgwMDQwMzAwMCksCiAJU09D
MTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1TRE1BMF9STEM1X1JCX1dQVFJfUE9MTF9DTlRM
LCAweGZmZmZmZmY3LCAweDAwNDAzMDAwKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAw
LCBtbVNETUEwX1JMQzZfUkJfV1BUUl9QT0xMX0NOVEwsIDB4ZmZmZmZmZjcsIDB4MDA0MDMwMDAp
LApAQCAtNzQsNyArNzMsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNvYzE1X3JlZ19nb2xkZW4g
Z29sZGVuX3NldHRpbmdzX3NkbWFfNVtdID0gewogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0Ms
IDAsIG1tU0RNQTFfUkxDMF9SQl9XUFRSX1BPTExfQ05UTCwgMHhmZmZmZmZmNywgMHgwMDQwMzAw
MCksCiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1TRE1BMV9STEMxX1JCX1dQVFJf
UE9MTF9DTlRMLCAweGZmZmZmZmY3LCAweDAwNDAzMDAwKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZB
TFVFKEdDLCAwLCBtbVNETUExX1JMQzJfUkJfV1BUUl9QT0xMX0NOVEwsIDB4ZmZmZmZmZjcsIDB4
MDA0MDMwMDApLAotCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tU0RNQTFfUkxDM19S
Ql9XUFRSX1BPTExfQ05UTCwgMHgwMDAwZmZmMCwgMHgwMDQwMzAwMCksCiAJU09DMTVfUkVHX0dP
TERFTl9WQUxVRShHQywgMCwgbW1TRE1BMV9STEM0X1JCX1dQVFJfUE9MTF9DTlRMLCAweGZmZmZm
ZmY3LCAweDAwNDAzMDAwKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVNETUEx
X1JMQzVfUkJfV1BUUl9QT0xMX0NOVEwsIDB4ZmZmZmZmZjcsIDB4MDA0MDMwMDApLAogCVNPQzE1
X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tU0RNQTFfUkxDNl9SQl9XUFRSX1BPTExfQ05UTCwg
MHhmZmZmZmZmNywgMHgwMDQwMzAwMCksCkBAIC04Myw5ICs4MSwxMyBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IHNvYzE1X3JlZ19nb2xkZW4gZ29sZGVuX3NldHRpbmdzX3NkbWFfNVtdID0gewogfTsK
IAogc3RhdGljIGNvbnN0IHN0cnVjdCBzb2MxNV9yZWdfZ29sZGVuIGdvbGRlbl9zZXR0aW5nc19z
ZG1hX252MTBbXSA9IHsKKwlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVNETUEwX1JM
QzNfUkJfV1BUUl9QT0xMX0NOVEwsIDB4MDAwMGZmZjAsIDB4MDA0MDMwMDApLAorCVNPQzE1X1JF
R19HT0xERU5fVkFMVUUoR0MsIDAsIG1tU0RNQTFfUkxDM19SQl9XUFRSX1BPTExfQ05UTCwgMHgw
MDAwZmZmMCwgMHgwMDQwMzAwMCksCiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHNvYzE1X3Jl
Z19nb2xkZW4gZ29sZGVuX3NldHRpbmdzX3NkbWFfbnYxNFtdID0geworCVNPQzE1X1JFR19HT0xE
RU5fVkFMVUUoR0MsIDAsIG1tU0RNQTBfUkxDM19SQl9XUFRSX1BPTExfQ05UTCwgMHhmZmZmZmZm
NywgMHgwMDQwMzAwMCksCisJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1TRE1BMV9S
TEMzX1JCX1dQVFJfUE9MTF9DTlRMLCAweGZmZmZmZmY3LCAweDAwNDAzMDAwKSwKIH07CiAKIHN0
YXRpYyB1MzIgc2RtYV92NV8wX2dldF9yZWdfb2Zmc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LCB1MzIgaW5zdGFuY2UsIHUzMiBpbnRlcm5hbF9vZmZzZXQpCi0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
